/**
 * Utility script to set admin privileges for a user
 * 
 * Usage:
 * 1. Import this in your code or run directly with tsx
 * 2. Call setAdminUser(uid) with the user's Firebase UID
 * 
 * Example:
 * tsx src/utils/setAdmin.ts
 */

import { auth } from '../config/firebase.config';

/**
 * Set admin custom claims for a user
 * @param uid - Firebase user UID
 */
export async function setAdminUser(uid: string): Promise<void> {
  try {
    // Set custom claims
    await auth.setCustomUserClaims(uid, { admin: true });
    
    console.log('✅ Admin privileges granted successfully!');
    console.log(`User ID: ${uid}`);
    
    // Verify the claims were set
    const user = await auth.getUser(uid);
    console.log('Custom claims:', user.customClaims);
    
  } catch (error: any) {
    console.error('❌ Error setting admin privileges:', error.message);
    throw error;
  }
}

/**
 * Remove admin privileges from a user
 * @param uid - Firebase user UID
 */
export async function removeAdminUser(uid: string): Promise<void> {
  try {
    const user = await auth.getUser(uid);
    const customClaims = user.customClaims || {};
    
    // Remove admin claim
    delete customClaims.admin;
    
    await auth.setCustomUserClaims(uid, customClaims);
    
    console.log('✅ Admin privileges removed successfully!');
    console.log(`User ID: ${uid}`);
    
  } catch (error: any) {
    console.error('❌ Error removing admin privileges:', error.message);
    throw error;
  }
}

/**
 * List all users with admin privileges
 */
export async function listAdminUsers(): Promise<void> {
  try {
    const listUsersResult = await auth.listUsers(1000);
    
    console.log('\n👥 Admin Users:');
    console.log('─'.repeat(60));
    
    const adminUsers = listUsersResult.users.filter(
      user => user.customClaims?.admin === true
    );
    
    if (adminUsers.length === 0) {
      console.log('No admin users found.');
      return;
    }
    
    adminUsers.forEach(user => {
      console.log(`\nUID: ${user.uid}`);
      console.log(`Email: ${user.email}`);
      console.log(`Display Name: ${user.displayName || 'N/A'}`);
      console.log(`Custom Claims:`, user.customClaims);
    });
    
  } catch (error: any) {
    console.error('❌ Error listing admin users:', error.message);
    throw error;
  }
}

// If running this file directly
if (require.main === module) {
  const args = process.argv.slice(2);
  const command = args[0];
  const uid = args[1];
  
  if (command === 'set' && uid) {
    setAdminUser(uid)
      .then(() => process.exit(0))
      .catch(() => process.exit(1));
  } else if (command === 'remove' && uid) {
    removeAdminUser(uid)
      .then(() => process.exit(0))
      .catch(() => process.exit(1));
  } else if (command === 'list') {
    listAdminUsers()
      .then(() => process.exit(0))
      .catch(() => process.exit(1));
  } else {
    console.log('Usage:');
    console.log('  Set admin:    tsx src/utils/setAdmin.ts set <user-uid>');
    console.log('  Remove admin: tsx src/utils/setAdmin.ts remove <user-uid>');
    console.log('  List admins:  tsx src/utils/setAdmin.ts list');
    process.exit(1);
  }
}
