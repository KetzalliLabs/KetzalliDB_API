# Firebase Authentication Setup

Your API now has Firebase authentication integrated! Here's how to use it:

## 📋 Overview

The API uses Firebase Admin SDK for authentication. Users authenticate using Firebase Auth tokens, which are verified on the server side.

## 🔐 Authentication Flow

### Client-Side (Frontend)
1. User signs in using Firebase Authentication (Email/Password, Google, etc.)
2. Get the ID token: `const token = await user.getIdToken()`
3. Include token in API requests: `Authorization: Bearer <token>`

### Server-Side (Your API)
- Verifies the token using Firebase Admin SDK
- Extracts user information from the token
- Protects routes with authentication middleware

## 🛣️ API Endpoints

### Authentication Routes (`/api/auth`)

#### Get Current User
```
GET /api/auth/me
Authorization: Bearer <firebase-token>
```
Returns authenticated user information.

#### Verify Token
```
POST /api/auth/verify
Authorization: Bearer <firebase-token>
```
Validates if a token is valid.

#### Create User (Admin Only)
```
POST /api/auth/users
Authorization: Bearer <admin-token>
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "displayName": "John Doe",
  "photoURL": "https://example.com/photo.jpg"
}
```

#### Set Custom Claims (Admin Only)
```
POST /api/auth/users/claims
Authorization: Bearer <admin-token>
Content-Type: application/json

{
  "uid": "user-uid",
  "claims": {
    "admin": true,
    "premium": true
  }
}
```

#### Delete User (Admin Only)
```
DELETE /api/auth/users/:uid
Authorization: Bearer <admin-token>
```

### Item Routes (`/api/items`)

- `GET /api/items` - Get all items (optional auth)
- `GET /api/items/:id` - Get item by ID (optional auth)
- `POST /api/items` - Create item (**requires auth**)
- `PUT /api/items/:id` - Update item (**requires auth**)
- `DELETE /api/items/:id` - Delete item (**requires auth**)

## 🔧 Middleware

### `verifyFirebaseToken`
Requires valid Firebase token. Returns 401 if token is missing or invalid.

```typescript
router.post('/protected', verifyFirebaseToken, handler);
```

### `optionalAuth`
Tries to authenticate but doesn't fail if token is missing.

```typescript
router.get('/public', optionalAuth, handler);
```

### `requireAdmin`
Must be used after `verifyFirebaseToken`. Checks if user has admin custom claim.

```typescript
router.delete('/admin-only', verifyFirebaseToken, requireAdmin, handler);
```

## 🧪 Testing with Postman/Thunder Client

### 1. Get a Firebase Token

First, you need to authenticate with Firebase. You can do this:

**Option A: Using Firebase REST API**
```bash
POST https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=YOUR_API_KEY
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "returnSecureToken": true
}
```

The response will include an `idToken` field.

**Option B: From Frontend**
```javascript
const user = await firebase.auth().signInWithEmailAndPassword(email, password);
const token = await user.user.getIdToken();
console.log(token);
```

### 2. Make Authenticated Requests

Add the token to your headers:
```
Authorization: Bearer <your-firebase-token>
Content-Type: application/json
```

## 👥 User Access in Controllers

After authentication, user info is available in `req.user`:

```typescript
export const createItem = async (req: Request, res: Response) => {
  // Access authenticated user info
  const userId = req.user?.uid;
  const userEmail = req.user?.email;
  
  // Your logic here...
};
```

## 🔑 Setting Up Admin Users

To set admin privileges for a user:

1. First create a user (or use existing)
2. Use the Set Custom Claims endpoint with an admin token
3. Or run this script:

```typescript
import { auth } from './config/firebase.config';

async function setAdmin(uid: string) {
  await auth.setCustomUserClaims(uid, { admin: true });
  console.log(`Admin privileges granted to ${uid}`);
}

// setAdmin('user-uid-here');
```

## 🔒 Security Best Practices

1. **Never commit** `serviceAccount.json` to version control
2. Add to `.gitignore`: `serviceAccount.json`
3. Use environment variables for sensitive data
4. Always use HTTPS in production
5. Set token expiration appropriately
6. Validate user input
7. Implement rate limiting

## 🐛 Common Errors

### 401 Unauthorized
- Token is missing, invalid, or expired
- Check Authorization header format: `Bearer <token>`

### 403 Forbidden
- User doesn't have required permissions (e.g., admin role)
- Check custom claims

### Token Expired
- Firebase tokens expire after 1 hour
- Client should refresh token: `user.getIdToken(true)`

## 📚 Next Steps

1. **Add Environment Variables**
   Create `.env` file:
   ```
   PORT=3000
   NODE_ENV=development
   FIREBASE_PROJECT_ID=amoxcalli-10c58
   ```

2. **Secure serviceAccount.json**
   ```bash
   echo "serviceAccount.json" >> .gitignore
   ```

3. **Add CORS Configuration**
   Update CORS settings in `index.ts` for your frontend URL

4. **Implement Rate Limiting**
   ```bash
   npm install express-rate-limit
   ```

5. **Add Request Validation**
   ```bash
   npm install express-validator
   ```

## 🚀 Running the API

```bash
# Development
npm run dev

# Build
npm run build

# Production
npm start
```

Your API will be available at `http://localhost:3000`
