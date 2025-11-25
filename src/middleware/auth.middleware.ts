import { Request, Response, NextFunction } from 'express';
import { auth } from '../config/firebase.config';
import pool from '../config/database';

export const verifyFirebaseToken = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    // Get token from Authorization header
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      res.status(401).json({
        success: false,
        message: 'No token provided. Please include Authorization header with Bearer token.'
      });
      return;
    }

    // Extract token
    const token = authHeader.split('Bearer ')[1];

    if (!token) {
      res.status(401).json({
        success: false,
        message: 'Invalid token format.'
      });
      return;
    }

    // Verify token with Firebase Admin
    const decodedToken = await auth.verifyIdToken(token);

    // Sync user to database
    await syncUserToDatabase(decodedToken);

    // Attach user info to request object
    req.user = decodedToken;

    // Continue to next middleware/route handler
    next();
  } catch (error: any) {
    console.error('Authentication error:', error);

    // Handle specific Firebase auth errors
    if (error.code === 'auth/id-token-expired') {
      res.status(401).json({
        success: false,
        message: 'Token expired. Please login again.'
      });
      return;
    }

    if (error.code === 'auth/argument-error') {
      res.status(401).json({
        success: false,
        message: 'Invalid token format.'
      });
      return;
    }

    res.status(401).json({
      success: false,
      message: 'Authentication failed.',
      error: error.message
    });
  }
};

// Helper function to sync user to database
async function syncUserToDatabase(decodedToken: any): Promise<void> {
  const client = await pool.connect();
  
  try {
    const { uid, email, name, picture } = decodedToken;

    // Check if user exists
    const checkQuery = 'SELECT id FROM users WHERE firebase_uid = $1';
    const checkResult = await client.query(checkQuery, [uid]);

    if (checkResult.rows.length === 0) {
      // Get or create default user role
      let roleId;
      const roleResult = await client.query(
        "SELECT id FROM roles WHERE name = 'user' LIMIT 1"
      );

      if (roleResult.rows.length === 0) {
        // Create default user role if it doesn't exist
        const newRole = await client.query(
          "INSERT INTO roles (id, name, description) VALUES (gen_random_uuid(), 'user', 'Regular user') RETURNING id"
        );
        roleId = newRole.rows[0].id;
      } else {
        roleId = roleResult.rows[0].id;
      }

      // Create new user with role_id
      const insertQuery = `
        INSERT INTO users (id, firebase_uid, role_id, email, display_name, avatar_url, coin, join_date)
        VALUES (gen_random_uuid(), $1, $2, $3, $4, $5, $6, NOW())
      `;
      
      const displayName = name || email?.split('@')[0] || 'User';
      
      await client.query(insertQuery, [
        uid,
        roleId,
        email || null,
        displayName,
        picture || null,
        0 // Default coin value
      ]);
      
      console.log(`✅ New user created: ${email || uid}`);
    } else {
      // Update existing user info
      const updateQuery = `
        UPDATE users 
        SET email = $1, display_name = $2, avatar_url = $3
        WHERE firebase_uid = $4
      `;
      
      const displayName = name || email?.split('@')[0] || 'User';
      
      await client.query(updateQuery, [
        email || null,
        displayName,
        picture || null,
        uid
      ]);
      
      console.log(`✅ User updated: ${email || uid}`);
    }
  } catch (error) {
    console.error('❌ Error syncing user to database:', error);
    // Don't throw error - allow request to continue even if DB sync fails
  } finally {
    client.release(); // Always release the client back to the pool
  }
}

// Optional authentication - doesn't fail if no token provided
export const optionalAuth = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      // No token provided, continue without user info
      next();
      return;
    }

    const token = authHeader.split('Bearer ')[1];

    if (token) {
      try {
        const decodedToken = await auth.verifyIdToken(token);
        await syncUserToDatabase(decodedToken);
        req.user = decodedToken;
      } catch (error) {
        // Invalid token, but continue anyway
        console.log('Optional auth: Invalid token, continuing without user');
      }
    }

    next();
  } catch (error) {
    // Any error in optional auth should not block the request
    next();
  }
};

// Require admin role
export const requireAdmin = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    if (!req.user) {
      res.status(401).json({
        success: false,
        message: 'Authentication required.'
      });
      return;
    }

    // Check if user has admin custom claim
    if (!req.user.admin) {
      res.status(403).json({
        success: false,
        message: 'Admin access required.'
      });
      return;
    }

    next();
  } catch (error: any) {
    res.status(403).json({
      success: false,
      message: 'Authorization failed.',
      error: error.message
    });
  }
};

export default verifyFirebaseToken;