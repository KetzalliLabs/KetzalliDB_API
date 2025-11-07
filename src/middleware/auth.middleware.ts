import { Request, Response, NextFunction } from 'express';
import { auth } from '../config/firebase.config';
import { DecodedIdToken } from 'firebase-admin/auth';

// Extend Express Request type to include user
declare global {
  namespace Express {
    interface Request {
      user?: DecodedIdToken;
    }
  }
}

/**
 * Middleware to verify Firebase authentication token
 * Expects Authorization header with format: "Bearer <token>"
 */
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
        message: 'Token has expired. Please login again.'
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
      message: 'Authentication failed. Invalid or expired token.',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

/**
 * Optional authentication middleware
 * Attempts to verify token but doesn't fail if token is missing
 */
export const optionalAuth = async (
  req: Request,
  res: Response,
  next: NextFunction
): Promise<void> => {
  try {
    const authHeader = req.headers.authorization;

    if (authHeader && authHeader.startsWith('Bearer ')) {
      const token = authHeader.split('Bearer ')[1];
      
      if (token) {
        try {
          const decodedToken = await auth.verifyIdToken(token);
          req.user = decodedToken;
        } catch (error) {
          // Token is invalid but we don't fail the request
          console.log('Optional auth: Invalid token provided');
        }
      }
    }

    next();
  } catch (error) {
    // Continue even if there's an error
    next();
  }
};

/**
 * Middleware to check if user has admin privileges
 * Must be used after verifyFirebaseToken
 */
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

    // Check custom claims for admin role
    if (req.user.admin === true) {
      next();
      return;
    }

    res.status(403).json({
      success: false,
      message: 'Access denied. Admin privileges required.'
    });
  } catch (error: any) {
    res.status(500).json({
      success: false,
      message: 'Error checking admin privileges.',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};
