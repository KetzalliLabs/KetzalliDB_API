import admin from 'firebase-admin';
import path from 'path';

// Initialize Firebase Admin SDK
const serviceAccountPath = path.join(__dirname, '../../serviceAccount.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccountPath),
  projectId: 'amoxcalli-10c58'
});

// Export Firebase Admin services
export const auth = admin.auth();
export const firestore = admin.firestore();

export default admin;
