# API Testing Examples

## Environment Variables
Set these in your HTTP client (Postman, Thunder Client, etc.):

```
BASE_URL=http://localhost:3000
FIREBASE_TOKEN=<your-firebase-id-token>
```

## 1. Health Check
```http
GET {{BASE_URL}}/
```

## 2. Get All Items (No Auth Required)
```http
GET {{BASE_URL}}/api/items
```

## 3. Get Item by ID (No Auth Required)
```http
GET {{BASE_URL}}/api/items/1
```

## 4. Create Item (Auth Required)
```http
POST {{BASE_URL}}/api/items
Authorization: Bearer {{FIREBASE_TOKEN}}
Content-Type: application/json

{
  "name": "Sample Item",
  "description": "This is a sample item",
  "price": 29.99,
  "quantity": 10
}
```

## 5. Update Item (Auth Required)
```http
PUT {{BASE_URL}}/api/items/1
Authorization: Bearer {{FIREBASE_TOKEN}}
Content-Type: application/json

{
  "name": "Updated Item",
  "description": "Updated description",
  "price": 39.99,
  "quantity": 15
}
```

## 6. Delete Item (Auth Required)
```http
DELETE {{BASE_URL}}/api/items/1
Authorization: Bearer {{FIREBASE_TOKEN}}
```

## 7. Get Current User Info
```http
GET {{BASE_URL}}/api/auth/me
Authorization: Bearer {{FIREBASE_TOKEN}}
```

## 8. Verify Token
```http
POST {{BASE_URL}}/api/auth/verify
Authorization: Bearer {{FIREBASE_TOKEN}}
```

## 9. Create User (Admin Only)
```http
POST {{BASE_URL}}/api/auth/users
Authorization: Bearer {{FIREBASE_TOKEN}}
Content-Type: application/json

{
  "email": "newuser@example.com",
  "password": "SecurePassword123!",
  "displayName": "New User",
  "photoURL": "https://example.com/photo.jpg"
}
```

## 10. Set Custom Claims (Admin Only)
```http
POST {{BASE_URL}}/api/auth/users/claims
Authorization: Bearer {{FIREBASE_TOKEN}}
Content-Type: application/json

{
  "uid": "user-firebase-uid",
  "claims": {
    "admin": true,
    "premium": true
  }
}
```

## 11. Delete User (Admin Only)
```http
DELETE {{BASE_URL}}/api/auth/users/user-firebase-uid
Authorization: Bearer {{FIREBASE_TOKEN}}
```

---

## How to Get Firebase Token

### Option 1: Using Firebase REST API (Sign In)
```http
POST https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=YOUR_FIREBASE_API_KEY
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "returnSecureToken": true
}
```

Response will include `idToken` field.

### Option 2: Using Firebase SDK (JavaScript)
```javascript
import { getAuth, signInWithEmailAndPassword } from 'firebase/auth';

const auth = getAuth();
const userCredential = await signInWithEmailAndPassword(auth, email, password);
const token = await userCredential.user.getIdToken();
console.log(token);
```

### Option 3: From Firebase Console
1. Go to Firebase Console
2. Authentication > Users
3. Click on a user
4. Copy the UID
5. Use a tool to generate a custom token

---

## Expected Responses

### Success (200/201)
```json
{
  "success": true,
  "message": "Operation successful",
  "data": { ... }
}
```

### Unauthorized (401)
```json
{
  "success": false,
  "message": "No token provided. Please include Authorization header with Bearer token."
}
```

### Forbidden (403)
```json
{
  "success": false,
  "message": "Access denied. Admin privileges required."
}
```

### Error (400/500)
```json
{
  "success": false,
  "message": "Error description",
  "error": "Detailed error (dev mode only)"
}
```
