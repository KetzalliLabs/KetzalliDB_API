import admin from 'firebase-admin';
import path from 'path';
import dotenv from 'dotenv';

dotenv.config();

// Initialize Firebase Admin SDK
let credential: admin.credential.Credential;

if (process.env.FIREBASE_PRIVATE_KEY && process.env.FIREBASE_CLIENT_EMAIL) {
  // Use environment variables (production/Railway)
  credential = admin.credential.cert({
    projectId: process.env.FIREBASE_PROJECT_ID,
    privateKey: process.env.FIREBASE_PRIVATE_KEY.replace(/\\n/g, '\n'),
    clientEmail: process.env.FIREBASE_CLIENT_EMAIL
  });
} else {
  // Fallback to serviceAccount.json file (local development)
  const serviceAccountPath = path.join(__dirname, '../../serviceAccount.json');
  credential = admin.credential.cert(serviceAccountPath);
}

admin.initializeApp({
  credential,
  projectId: process.env.FIREBASE_PROJECT_ID || 'amoxcalli-10c58'
});

// Export Firebase Admin services
export const auth = admin.auth();
export const firestore = admin.firestore();

export default admin;
