/**
 * Script to create the first admin user for your application
 * Run this once to set up your initial admin account
 * 
 * Usage: tsx src/scripts/createFirstAdmin.ts
 */

import { auth } from '../config/firebase.config';
import * as readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function question(query: string): Promise<string> {
  return new Promise(resolve => {
    rl.question(query, resolve);
  });
}

async function createFirstAdmin() {
  console.log('\n🔧 Create First Admin User');
  console.log('═'.repeat(60));
  
  try {
    // Get user details
    const email = await question('\n📧 Enter admin email: ');
    const password = await question('🔒 Enter password (min 6 characters): ');
    const displayName = await question('👤 Enter display name: ');
    
    if (!email || !password || password.length < 6) {
      console.error('\n❌ Invalid input. Email and password (min 6 chars) are required.');
      rl.close();
      return;
    }
    
    console.log('\n⏳ Creating user...');
    
    // Create the user
    const userRecord = await auth.createUser({
      email,
      password,
      displayName,
      emailVerified: true // Set to true for admin
    });
    
    console.log('✅ User created successfully!');
    console.log(`   UID: ${userRecord.uid}`);
    console.log(`   Email: ${userRecord.email}`);
    
    console.log('\n⏳ Setting admin privileges...');
    
    // Set admin custom claims
    await auth.setCustomUserClaims(userRecord.uid, { admin: true });
    
    console.log('✅ Admin privileges granted!');
    
    // Verify
    const updatedUser = await auth.getUser(userRecord.uid);
    
    console.log('\n📋 Admin User Details:');
    console.log('─'.repeat(60));
    console.log(`UID: ${updatedUser.uid}`);
    console.log(`Email: ${updatedUser.email}`);
    console.log(`Display Name: ${updatedUser.displayName}`);
    console.log(`Email Verified: ${updatedUser.emailVerified}`);
    console.log(`Custom Claims:`, updatedUser.customClaims);
    console.log('─'.repeat(60));
    
    console.log('\n✨ Success! Your first admin user is ready.');
    console.log('\n📝 Next steps:');
    console.log('   1. Start your API: npm run dev');
    console.log('   2. Sign in with these credentials in your app');
    console.log('   3. Get the Firebase ID token');
    console.log('   4. Use the token to access admin endpoints');
    
  } catch (error: any) {
    console.error('\n❌ Error:', error.message);
    
    if (error.code === 'auth/email-already-exists') {
      console.log('\n💡 Tip: This email is already registered.');
      console.log('   You can set admin privileges for existing user:');
      console.log('   tsx src/utils/setAdmin.ts set <user-uid>');
    }
  } finally {
    rl.close();
  }
}

// Run the script
createFirstAdmin()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error('Fatal error:', error);
    process.exit(1);
  });
