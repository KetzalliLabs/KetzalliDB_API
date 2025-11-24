import { Request, Response } from 'express';
import { auth } from '../config/firebase.config';
import pool from '../config/database';

/**
 * Get current authenticated user info
 */
export const getCurrentUser = async (req: Request, res: Response): Promise<void> => {
  try {
    if (!req.user) {
      res.status(401).json({
        success: false,
        message: 'User not authenticated'
      });
      return;
    }

    // Get user record from Firebase
    const userRecord = await auth.getUser(req.user.uid);

    // Also try to fetch internal stats for this user (if exists)
    let internalUser = null;
    try {
      const userRes = await pool.query('SELECT * FROM users WHERE firebase_uid = $1 LIMIT 1', [userRecord.uid]);
      if (userRes.rows.length) internalUser = userRes.rows[0];
    } catch (e) {
      console.warn('Could not query internal users table for stats:', (e as Error).message);
    }

    const stats = internalUser ? await fetchUserStats(internalUser.id) : null;

    res.json({
      success: true,
      data: {
        uid: userRecord.uid,
        email: userRecord.email,
        displayName: userRecord.displayName,
        photoURL: userRecord.photoURL,
        emailVerified: userRecord.emailVerified,
        disabled: userRecord.disabled,
        metadata: {
          creationTime: userRecord.metadata.creationTime,
          lastSignInTime: userRecord.metadata.lastSignInTime
        },
        customClaims: userRecord.customClaims || {},
        internal: internalUser ? { id: internalUser.id, email: internalUser.email, display_name: internalUser.display_name, avatar_url: internalUser.avatar_url } : null,
        stats
      }
    });
  } catch (error: any) {
    console.error('Error fetching user:', error);
    res.status(500).json({
      success: false,
      message: 'Error fetching user information',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

/**
 * Record a view of a sign by the authenticated user.
 * Route: POST /api/auth/me/signs/:signId/view
 */
export async function recordSignView(req: Request, res: Response): Promise<void> {
  const firebaseUid = (req as any).user?.uid;
  const { signId } = req.params;

  if (!firebaseUid) {
    res.status(401).json({ success: false, message: 'Unauthorized' });
    return;
  }
  if (!signId) {
    res.status(400).json({ success: false, message: 'Missing signId' });
    return;
  }

  const client = await pool.connect();
  try {
    await client.query('BEGIN');

    // get user id
    const userRow = await client.query('SELECT id FROM users WHERE firebase_uid = $1 LIMIT 1', [firebaseUid]);
    if (userRow.rowCount === 0) {
      await client.query('ROLLBACK');
      res.status(404).json({ success: false, message: 'User record not found' });
      return;
    }
    const userId = userRow.rows[0].id;

    // Try to insert a new view row. If it already exists, update viewed_at separately.
    const insertRes = await client.query(
      `INSERT INTO user_sign_views (user_id, sign_id, viewed_at)
       VALUES ($1, $2, NOW())
       ON CONFLICT (user_id, sign_id) DO NOTHING
       RETURNING *`,
      [userId, signId]
    );

    if ((insertRes.rowCount ?? 0) > 0) {
      // new view inserted — increment aggregated stat 'signs_viewed'
      const statRow = await client.query(`SELECT id FROM stats WHERE name = 'signs_viewed' LIMIT 1`);
      if (statRow.rowCount) {
        const statId = statRow.rows[0].id;
        await client.query(
          `INSERT INTO user_stats (user_id, stat_id, current_value, last_update)
           VALUES ($1, $2, 1, NOW())
           ON CONFLICT (user_id, stat_id) DO UPDATE
           SET current_value = user_stats.current_value + 1, last_update = NOW()`,
          [userId, statId]
        );
      }
    } else {
      // existed already — just refresh timestamp
      await client.query('UPDATE user_sign_views SET viewed_at = NOW() WHERE user_id = $1 AND sign_id = $2', [userId, signId]);
    }

    await client.query('COMMIT');
    res.status(200).json({ success: true, message: 'Sign view recorded' });
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Error recording sign view:', error);
    res.status(500).json({ success: false, message: 'Failed to record sign view', error: (error instanceof Error) ? error.message : String(error) });
  } finally {
    client.release();
  }
}

/**
 * Record an exercise completion / attempt by the authenticated user.
 * Route: POST /api/auth/me/exercises/:exerciseId/complete
 * Body: { isCorrect?: boolean, selectedSignId?: string, timeTaken?: number, score?: number }
 */
export async function recordExerciseCompletion(req: Request, res: Response): Promise<void> {
  const firebaseUid = (req as any).user?.uid;
  const { exerciseId } = req.params;
  const { isCorrect = false, selectedSignId = null, timeTaken = null, score = null } = req.body || {};

  if (!firebaseUid) {
    res.status(401).json({ success: false, message: 'Unauthorized' });
    return;
  }
  if (!exerciseId) {
    res.status(400).json({ success: false, message: 'Missing exerciseId' });
    return;
  }

  const client = await pool.connect();
  try {
    await client.query('BEGIN');

    // get user id
    const userRow = await client.query('SELECT id FROM users WHERE firebase_uid = $1 LIMIT 1', [firebaseUid]);
    if (userRow.rowCount === 0) {
      await client.query('ROLLBACK');
      res.status(404).json({ success: false, message: 'User record not found' });
      return;
    }
    const userId = userRow.rows[0].id;

    // upsert into user_exercise_history (record completion time)
    await client.query(
      `INSERT INTO user_exercise_history (user_id, exercise_id, completed_at)
       VALUES ($1, $2, NOW())
       ON CONFLICT (user_id, exercise_id) DO UPDATE SET completed_at = EXCLUDED.completed_at`,
      [userId, exerciseId]
    );

    // insert attempt (generate uuid on DB side). attempts schema uses `selected_option`.
    await client.query(
      `INSERT INTO attempts (id, user_id, exercise_id, selected_option, is_correct, created_at)
       VALUES (gen_random_uuid(), $1, $2, $3, $4, NOW())`,
      [userId, exerciseId, selectedSignId, isCorrect]
    );

    // update aggregated stats: increment exercises_completed, optionally give exp/coins for correct answers
    const statsRes = await client.query(
      `SELECT id, name FROM stats WHERE name IN ('exercises_completed','exp','coins')`
    );
    const statMap: Record<string, number> = {};
    for (const r of statsRes.rows) statMap[r.name] = r.id;

    // increment exercises_completed
    if (statMap['exercises_completed']) {
      await client.query(
        `INSERT INTO user_stats (user_id, stat_id, current_value, last_update)
         VALUES ($1, $2, 1, NOW())
         ON CONFLICT (user_id, stat_id) DO UPDATE
         SET current_value = user_stats.current_value + 1, last_update = NOW()`,
        [userId, statMap['exercises_completed']]
      );
    }

    // if correct, reward exp and coins (example values; adjust as needed)
    if (isCorrect) {
      if (statMap['exp']) {
        const expGain = 10;
        await client.query(
          `INSERT INTO user_stats (user_id, stat_id, current_value, last_update)
           VALUES ($1, $2, $3, NOW())
           ON CONFLICT (user_id, stat_id) DO UPDATE
           SET current_value = user_stats.current_value + $3, last_update = NOW()`,
          [userId, statMap['exp'], expGain]
        );
      }
      if (statMap['coins']) {
        const coinGain = 5;
        await client.query(
          `INSERT INTO user_stats (user_id, stat_id, current_value, last_update)
           VALUES ($1, $2, $3, NOW())
           ON CONFLICT (user_id, stat_id) DO UPDATE
           SET current_value = user_stats.current_value + $3, last_update = NOW()`,
          [userId, statMap['coins'], coinGain]
        );
      }
    }

    await client.query('COMMIT');
    res.status(200).json({ success: true, message: 'Exercise completion recorded' });
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Error recording exercise completion:', error);
    res.status(500).json({ success: false, message: 'Failed to record exercise completion', error: (error instanceof Error) ? error.message : String(error) });
  } finally {
    client.release();
  }
}

/**
 * Record or update the daily quiz result for the authenticated user.
 * Route: POST /api/auth/me/daily-quiz
 * Body: { date?: string (YYYY-MM-DD), numQuestions?: number, correctCount?: number, score?: number, completed?: boolean }
 */
export async function recordDailyQuiz(req: Request, res: Response): Promise<void> {
  const firebaseUid = (req as any).user?.uid;
  const { date = null, numQuestions = null, correctCount = null, score = null, completed = true } = req.body || {};

  if (!firebaseUid) {
    res.status(401).json({ success: false, message: 'Unauthorized' });
    return;
  }

  const client = await pool.connect();
  try {
    await client.query('BEGIN');

    // get user id
    const userRow = await client.query('SELECT id FROM users WHERE firebase_uid = $1 LIMIT 1', [firebaseUid]);
    if (userRow.rowCount === 0) {
      await client.query('ROLLBACK');
      res.status(404).json({ success: false, message: 'User record not found' });
      return;
    }
    const userId = userRow.rows[0].id;

    const quizDate = date ? date : (new Date()).toISOString().slice(0, 10); // YYYY-MM-DD

    // upsert daily_quiz_history
    await client.query(
      `INSERT INTO daily_quiz_history (user_id, date, score, completed)
       VALUES ($1, $2, $3, $4)
       ON CONFLICT (user_id, date) DO UPDATE
         SET score = EXCLUDED.score, completed = EXCLUDED.completed`,
      [userId, quizDate, score, completed]
    );

    // optional: update streaks or stats (e.g. increment daily_quizzes_completed)
    const statRow = await client.query(`SELECT id FROM stats WHERE name = 'daily_quizzes_completed' LIMIT 1`);
    if (statRow.rowCount) {
      const statId = statRow.rows[0].id;
      await client.query(
        `INSERT INTO user_stats (user_id, stat_id, current_value, last_update)
         VALUES ($1, $2, 1, NOW())
         ON CONFLICT (user_id, stat_id) DO UPDATE
         SET current_value = user_stats.current_value + 1, last_update = NOW()`,
        [userId, statId]
      );
    }

    await client.query('COMMIT');
    res.status(200).json({ success: true, message: 'Daily quiz recorded' });
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Error recording daily quiz:', error);
    res.status(500).json({ success: false, message: 'Failed to record daily quiz', error: (error instanceof Error) ? error.message : String(error) });
  } finally {
    client.release();
  }
}

/**
 * Verify token endpoint (for testing)
 */
export const verifyToken = async (req: Request, res: Response): Promise<void> => {
  try {
    if (!req.user) {
      res.status(401).json({
        success: false,
        message: 'Token verification failed'
      });
      return;
    }

    res.json({
      success: true,
      message: 'Token is valid',
      data: {
        uid: req.user.uid,
        email: req.user.email,
        email_verified: req.user.email_verified
      }
    });
  } catch (error: any) {
    res.status(500).json({
      success: false,
      message: 'Error verifying token',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

/**
 * Create a new user (Admin only)
 */
export const createUser = async (req: Request, res: Response): Promise<void> => {
  try {
    const { email, password, displayName, photoURL } = req.body;

    if (!email || !password) {
      res.status(400).json({
        success: false,
        message: 'Email and password are required'
      });
      return;
    }

    const userRecord = await auth.createUser({
      email,
      password,
      displayName,
      photoURL,
      emailVerified: false
    });

    res.status(201).json({
      success: true,
      message: 'User created successfully',
      data: {
        uid: userRecord.uid,
        email: userRecord.email,
        displayName: userRecord.displayName
      }
    });
  } catch (error: any) {
    console.error('Error creating user:', error);
    
    if (error.code === 'auth/email-already-exists') {
      res.status(409).json({
        success: false,
        message: 'Email already exists'
      });
      return;
    }

    res.status(500).json({
      success: false,
      message: 'Error creating user',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

/**
 * Set custom user claims (Admin only)
 */
export const setUserClaims = async (req: Request, res: Response): Promise<void> => {
  try {
    const { uid, claims } = req.body;

    if (!uid || !claims) {
      res.status(400).json({
        success: false,
        message: 'UID and claims are required'
      });
      return;
    }

    await auth.setCustomUserClaims(uid, claims);

    res.json({
      success: true,
      message: 'Custom claims set successfully',
      data: { uid, claims }
    });
  } catch (error: any) {
    console.error('Error setting custom claims:', error);
    res.status(500).json({
      success: false,
      message: 'Error setting custom claims',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

/**
 * Delete user (Admin only)
 */
export const deleteUser = async (req: Request, res: Response): Promise<void> => {
  try {
    const { uid } = req.params;

    if (!uid) {
      res.status(400).json({
        success: false,
        message: 'UID is required'
      });
      return;
    }

    await auth.deleteUser(uid);

    res.json({
      success: true,
      message: 'User deleted successfully',
      data: { uid }
    });
  } catch (error: any) {
    console.error('Error deleting user:', error);
    res.status(500).json({
      success: false,
      message: 'Error deleting user',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

/**
 * Get consolidated statistics for the current authenticated user
 */
export const getUserStats = async (req: Request, res: Response): Promise<void> => {
  try {
    if (!req.user) {
      res.status(401).json({ success: false, message: 'User not authenticated' });
      return;
    }

    // map firebase uid to internal user and return consolidated stats using helper
    const userRes = await pool.query('SELECT * FROM users WHERE firebase_uid = $1 LIMIT 1', [req.user.uid]);
    if (userRes.rows.length === 0) {
      res.status(404).json({ success: false, message: 'User record not found' });
      return;
    }

    const user = userRes.rows[0];
    const stats = await fetchUserStats(user.id);

    res.json({ success: true, data: { user: { id: user.id, firebase_uid: user.firebase_uid, display_name: user.display_name, email: user.email, avatar_url: user.avatar_url }, ...stats } });
  } catch (error: any) {
    console.error('Error fetching user stats:', error);
    res.status(500).json({ success: false, message: 'Error fetching user statistics', error: process.env.NODE_ENV === 'development' ? error.message : undefined });
  }
};

/**
 * Helper to fetch aggregated stats and histories for an internal user id
 */
const fetchUserStats = async (userId: string) => {
  const [progressRes, streakRes, medalsRes, userStatsRes, attemptsRes, dailyQuizRes, historyRes, signViewsRes] = await Promise.all([
    pool.query('SELECT category_id, score, status, updated_at FROM progress WHERE user_id = $1', [userId]),
    pool.query('SELECT current_days, best_days, last_check FROM streaks WHERE user_id = $1', [userId]),
    pool.query('SELECT um.id, m.id as medal_id, m.name, m.description, m.icon_url, um.achieved_at FROM user_medals um JOIN medals m ON m.id = um.medal_id WHERE um.user_id = $1', [userId]),
    pool.query('SELECT us.stat_id, s.name, s.description, us.current_value, us.max_value, us.last_update FROM user_stats us JOIN stats s ON s.id = us.stat_id WHERE us.user_id = $1', [userId]),
    pool.query('SELECT COUNT(*)::int as total_attempts, COALESCE(SUM(CASE WHEN is_correct THEN 1 ELSE 0 END),0)::int as correct_attempts FROM attempts WHERE user_id = $1', [userId]),
    pool.query('SELECT date, score, completed FROM daily_quiz_history WHERE user_id = $1 ORDER BY date DESC LIMIT 30', [userId]),
    pool.query('SELECT exercise_id, completed_at FROM user_exercise_history WHERE user_id = $1 ORDER BY completed_at DESC LIMIT 50', [userId]),
    pool.query('SELECT sign_id, viewed_at FROM user_sign_views WHERE user_id = $1 ORDER BY viewed_at DESC LIMIT 200', [userId])
  ]);

  const totalAttempts = attemptsRes.rows[0]?.total_attempts ?? 0;
  const correctAttempts = attemptsRes.rows[0]?.correct_attempts ?? 0;
  const accuracy = totalAttempts > 0 ? Math.round((correctAttempts / totalAttempts) * 10000) / 100 : 0;

  return {
    progress: progressRes.rows,
    streak: streakRes.rows[0] || null,
    medals: medalsRes.rows,
    stats: userStatsRes.rows,
    attempts: { total: totalAttempts, correct: correctAttempts, accuracy_percentage: accuracy },
    daily_quiz_history: dailyQuizRes.rows,
    exercise_history: historyRes.rows,
    sign_views: signViewsRes.rows
  };
};
