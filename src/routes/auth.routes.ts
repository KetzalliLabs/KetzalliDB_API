import { Router } from 'express';
import {
  register,
  login,
  getCurrentUser,
  verifyToken,
  createUser,
  setUserClaims,
  deleteUser,
  getUserStats,
  recordSignView,
  recordExerciseCompletion,
  recordDailyQuiz,
  updateProgress,
} from '../controllers/auth.controller';
import { verifyFirebaseToken, requireAdmin } from '../middleware/auth.middleware';

const router = Router();

// Public authentication routes
router.post('/register', register);
router.post('/login', login);

// Protected routes (authentication required)
router.get('/me', verifyFirebaseToken, getCurrentUser);
router.get('/me/stats', verifyFirebaseToken, getUserStats);
router.post('/verify', verifyFirebaseToken, verifyToken);

// Event endpoints for user activity
router.post('/me/signs/:signId/view', verifyFirebaseToken, recordSignView);
router.post('/me/exercises/:exerciseId/complete', verifyFirebaseToken, recordExerciseCompletion);
router.post('/me/daily-quiz', verifyFirebaseToken, recordDailyQuiz);
router.post('/me/progress', verifyFirebaseToken, updateProgress);

// Admin routes
router.post('/users', verifyFirebaseToken, requireAdmin, createUser);
router.post('/users/claims', verifyFirebaseToken, requireAdmin, setUserClaims);
router.delete('/users/:uid', verifyFirebaseToken, requireAdmin, deleteUser);

export default router;
