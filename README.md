# KetzalliDB API

A secure CRUD Express API built with TypeScript, Node.js, and Firebase Authentication.

## Features

- ✅ Express.js REST API
- ✅ TypeScript for type safety
- ✅ TSX for fast development with hot reload
- ✅ **Firebase Authentication** integration
- ✅ **JWT token verification** with Firebase Admin SDK
- ✅ **Role-based access control** (Admin privileges)
- ✅ CRUD operations for Items resource
- ✅ Error handling middleware
- ✅ CORS enabled
- ✅ Environment variables support
- ✅ Secure authentication middleware

## Prerequisites

- Node.js (v18 or higher)
- npm or yarn

## Installation

1. Install dependencies:
```bash
npm install
```

2. Create environment file:
```bash
copy .env.example .env
```

3. Configure your environment variables in `.env`:
```
PORT=3000
NODE_ENV=development
FIREBASE_PROJECT_ID=amoxcalli-10c58
```

4. **Set up Firebase:**
   - Make sure `serviceAccount.json` is in the root directory
   - This file contains your Firebase Admin SDK credentials
   - **Never commit this file to version control!**

5. **Create your first admin user:**
```bash
npm run admin:create
```

Follow the prompts to create an admin account.

## Development

Run the development server with hot reload:
```bash
npm run dev
```

The API will be available at `http://localhost:3000`

## Build

Compile TypeScript to JavaScript:
```bash
npm run build
```

## Production

Run the compiled version:
```bash
npm start
```

## API Endpoints

### Health Check
- **GET** `/` - Check API status

### Authentication Endpoints (`/api/auth`)

- **GET** `/api/auth/me` - Get current user info (requires auth)
- **POST** `/api/auth/verify` - Verify Firebase token (requires auth)
- **POST** `/api/auth/users` - Create new user (admin only)
- **POST** `/api/auth/users/claims` - Set custom user claims (admin only)
- **DELETE** `/api/auth/users/:uid` - Delete user (admin only)

### Items CRUD (`/api/items`)

- **GET** `/api/items` - Get all items (public/optional auth)
- **GET** `/api/items/:id` - Get item by ID (public/optional auth)
- **POST** `/api/items` - Create new item (**requires auth**)
- **PUT** `/api/items/:id` - Update item (**requires auth**)
- **DELETE** `/api/items/:id` - Delete item (**requires auth**)

## Authentication

This API uses Firebase Authentication. To access protected endpoints:

1. **Sign in** with Firebase (client-side)
2. **Get the ID token**: `await user.getIdToken()`
3. **Include in requests**:
   ```
   Authorization: Bearer <your-firebase-token>
   ```

See [FIREBASE_AUTH.md](./FIREBASE_AUTH.md) for detailed authentication setup and usage.

## Admin Management Scripts

```bash
# Create first admin user (interactive)
npm run admin:create

# Set admin privileges for existing user
npm run admin:set <user-uid>

# Remove admin privileges
npm run admin:remove <user-uid>

# List all admin users
npm run admin:list
```

## Request Examples

### Create Item (Authenticated)
```bash
POST http://localhost:3000/api/items
Authorization: Bearer <your-firebase-token>
Content-Type: application/json

{
  "name": "Sample Item",
  "description": "This is a sample item"
}
```

### Get All Items (Public)
```bash
GET http://localhost:3000/api/items
```

### Get Current User Info
```bash
GET http://localhost:3000/api/auth/me
Authorization: Bearer <your-firebase-token>
```

See [API_EXAMPLES.md](./API_EXAMPLES.md) for more examples.

## Response Format

All responses follow this format:

### Success Response
```json
{
  "success": true,
  "data": { /* response data */ },
  "message": "Optional success message"
}
```

### Error Response
```json
{
  "success": false,
  "message": "Error message"
}
```

## Project Structure

```
KetzalliDB_API/
├── src/
│   ├── config/              # Configuration files
│   │   └── firebase.config.ts
│   ├── controllers/         # Request handlers
│   │   ├── item.controller.ts
│   │   └── auth.controller.ts
│   ├── middleware/          # Express middleware
│   │   ├── error.middleware.ts
│   │   └── auth.middleware.ts
│   ├── models/             # TypeScript interfaces
│   │   └── item.model.ts
│   ├── routes/             # API routes
│   │   ├── item.routes.ts
│   │   └── auth.routes.ts
│   ├── scripts/            # Utility scripts
│   │   └── createFirstAdmin.ts
│   ├── utils/              # Helper functions
│   │   └── setAdmin.ts
│   └── index.ts            # Application entry point
├── dist/                   # Compiled JavaScript (generated)
├── Database/               # Database files
├── serviceAccount.json     # Firebase credentials (DO NOT COMMIT!)
├── .env                    # Environment variables (DO NOT COMMIT!)
├── .env.example            # Environment template
├── .gitignore             # Git ignore rules
├── package.json           # Dependencies and scripts
├── tsconfig.json          # TypeScript configuration
├── README.md              # This file
├── FIREBASE_AUTH.md       # Firebase authentication guide
└── API_EXAMPLES.md        # API usage examples
```

## Technologies Used

- **Express.js** - Web framework
- **TypeScript** - Type-safe JavaScript
- **TSX** - TypeScript execution with hot reload
- **Firebase Admin SDK** - Authentication and user management
- **CORS** - Cross-Origin Resource Sharing
- **dotenv** - Environment variables management

## Security Features

- ✅ **JWT Token Verification** - All protected routes verify Firebase ID tokens
- ✅ **Role-Based Access Control** - Admin-only endpoints for sensitive operations
- ✅ **Middleware Protection** - Authentication and authorization middleware
- ✅ **Secure Headers** - CORS and security best practices
- ✅ **Environment Variables** - Sensitive data stored securely
- ✅ **Service Account** - Firebase Admin SDK with service account credentials

## Documentation

- [FIREBASE_AUTH.md](./FIREBASE_AUTH.md) - Complete Firebase authentication guide
- [API_EXAMPLES.md](./API_EXAMPLES.md) - API request examples and testing

## Next Steps

- ✅ ~~Add Firebase authentication~~ (Completed!)
- ✅ ~~Implement authorization middleware~~ (Completed!)
- Add database integration (MongoDB, PostgreSQL, or Firestore)
- Add input validation (e.g., using Zod or Joi)
- Add request logging with Morgan
- Add unit and integration tests
- Add API documentation (Swagger/OpenAPI)
- Implement pagination and filtering
- Add rate limiting
- Set up CI/CD pipeline

## License

ISC
