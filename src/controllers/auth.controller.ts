import { Request, Response } from 'express';
import { auth } from '../config/firebase.config';

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
