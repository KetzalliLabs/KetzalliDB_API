import { Request, Response } from 'express';
import { auth } from '../config/firebase.config';
import pool from '../config/database';

/**
 * Register a new user - Save to database after Firebase authentication
 */
export const register = async (req: Request, res: Response): Promise<void> => {
  try {
    const { firebase_uid, email, display_name } = req.body;

    if (!firebase_uid || !email) {
      res.status(400).json({
        success: false,
        message: 'Firebase UID and email are required'
      });
      return;
    }

    // Verify the Firebase user exists
    try {
      await auth.getUser(firebase_uid);
    } catch (error) {
      res.status(400).json({
        success: false,
        message: 'Invalid Firebase UID'
      });
      return;
    }

    // Check if user already exists in our database
    const existingUser = await pool.query(
      'SELECT * FROM users WHERE firebase_uid = $1',
      [firebase_uid]
    );

    if (existingUser.rows.length > 0) {
      res.status(409).json({
        success: false,
        message: 'User already registered'
      });
      return;
    }

    // Get default user role
    const roleResult = await pool.query(
      "SELECT id FROM roles WHERE name = 'user' LIMIT 1"
    );

    let roleId;
    if (roleResult.rows.length === 0) {
      // Create default user role if it doesn't exist
      const newRole = await pool.query(
        "INSERT INTO roles (id, name, description) VALUES (gen_random_uuid(), 'user', 'Regular user') RETURNING id"
      );
      roleId = newRole.rows[0].id;
    } else {
      roleId = roleResult.rows[0].id;
    }

    // Insert user into database
    const query = `
      INSERT INTO users (id, firebase_uid, role_id, display_name, email, coin, join_date)
      VALUES (gen_random_uuid(), $1, $2, $3, $4, 0, NOW())
      RETURNING id, firebase_uid, role_id, display_name, email, coin, avatar_url, join_date
    `;

    const result = await pool.query(query, [
      firebase_uid,
      roleId,
      display_name || null,
      email
    ]);

    res.status(201).json({
      success: true,
      message: 'User registered successfully',
      data: result.rows[0]
    });
  } catch (error: any) {
    console.error('Error registering user:', error);
    res.status(500).json({
      success: false,
      message: 'Error registering user',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

/**
 * Login user - Verify Firebase token and return user data from database
 */
export const login = async (req: Request, res: Response): Promise<void> => {
  try {
    console.log('Login request body:', req.body);
    
    const { firebase_uid } = req.body;

    if (!firebase_uid) {
      console.log('Missing firebase_uid in request');
      res.status(400).json({
        success: false,
        message: 'Firebase UID is required',
        received: req.body
      });
      return;
    }

    // Verify Firebase user exists
    try {
      await auth.getUser(firebase_uid);
    } catch (error) {
      res.status(401).json({
        success: false,
        message: 'Invalid Firebase UID'
      });
      return;
    }

    // Get user from database
    const result = await pool.query(
      'SELECT id, firebase_uid, role_id, display_name, email, coin, avatar_url, join_date FROM users WHERE firebase_uid = $1',
      [firebase_uid]
    );

    if (result.rows.length === 0) {
      res.status(404).json({
        success: false,
        message: 'User not found. Please register first.'
      });
      return;
    }

    res.json({
      success: true,
      message: 'Login successful',
      data: result.rows[0]
    });
  } catch (error: any) {
    console.error('Error logging in user:', error);
    res.status(500).json({
      success: false,
      message: 'Error logging in',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

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
        customClaims: userRecord.customClaims || {}
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
