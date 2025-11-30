# KetzalliDB API Documentation

**Version:** 1.0.0  
**Base URL:** `http://localhost:3000` or `https://ketzallidbapi-production.up.railway.app`

Mexican Sign Language Learning Platform REST API

---

## Table of Contents

- [Authentication](#authentication)
- [Signs Endpoints](#signs-endpoints)
- [Categories Endpoints](#categories-endpoints)
- [Exercises Endpoints](#exercises-endpoints)
- [User Endpoints](#user-endpoints)
- [Error Responses](#error-responses)

---

## Authentication

Most endpoints require Firebase authentication. Include the Firebase ID token in the Authorization header:

```
Authorization: Bearer <firebase_token>
```

### POST `/api/auth/register`

Register a new user in the database (after Firebase signup)

**Request Body:**
```json
{
  "firebase_uid": "string",
  "email": "string",
  "display_name": "string" 
}
```

**Response:**
```json
{
  "success": true,
  "message": "User registered successfully",
  "data": {
    "id": "uuid",
    "firebase_uid": "string",
    "email": "string",
    "display_name": "string",
    "role_id": "uuid",
    "avatar_url": null,
    "join_date": "2025-11-25T00:00:00.000Z"
  }
}
```

---

### POST `/api/auth/login`

Login user - Auto-creates user in DB if doesn't exist

**Request Body:**
```json
{
  "firebase_uid": "string"
}
```

**Response:**
```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "id": "uuid",
    "firebase_uid": "string",
    "email": "string",
    "display_name": "string",
    "role_id": "uuid",
    "avatar_url": "https://...",
    "join_date": "2025-11-25T00:00:00.000Z"
  }
}
```

---

### GET `/api/auth/me` 🔒

Get current authenticated user profile from Firebase and DB

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "uid": "firebase_uid",
    "email": "user@example.com",
    "displayName": "User Name",
    "photoURL": "https://...",
    "emailVerified": true,
    "disabled": false,
    "metadata": {
      "creationTime": "2025-11-25T00:00:00.000Z",
      "lastSignInTime": "2025-11-25T12:00:00.000Z"
    },
    "customClaims": {},
    "internal": {
      "id": "uuid",
      "email": "user@example.com",
      "display_name": "User Name",
      "avatar_url": "https://..."
    },
    "stats": {
      "progress": [],
      "streak": null,
      "medals": [],
      "stats": [],
      "attempts": {
        "total": 0,
        "correct": 0,
        "accuracy_percentage": 0
      },
      "daily_quiz_history": [],
      "exercise_history": [],
      "sign_views": []
    }
  }
}
```

---

### GET `/api/auth/me/stats` 🔒

Get user statistics and progress

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": "uuid",
      "firebase_uid": "string",
      "display_name": "User Name",
      "email": "user@example.com",
      "avatar_url": "https://..."
    },
    "progress": [
      {
        "category_id": "uuid",
        "score": 85,
        "status": "in_progress",
        "updated_at": "2025-11-25T00:00:00.000Z"
      }
    ],
    "streak": {
      "current_days": 5,
      "best_days": 10,
      "last_check": "2025-11-25"
    },
    "medals": [],
    "stats": [
      {
        "stat_id": "uuid",
        "name": "signs_viewed",
        "description": "Total signs viewed",
        "current_value": 42,
        "max_value": null,
        "last_update": "2025-11-25T00:00:00.000Z"
      }
    ],
    "attempts": {
      "total": 50,
      "correct": 40,
      "accuracy_percentage": 80
    },
    "daily_quiz_history": [],
    "exercise_history": [],
    "sign_views": []
  }
}
```

---

### POST `/api/auth/me/signs/:signId/view` 🔒

Record a sign view for the authenticated user

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Response:**
```json
{
  "success": true,
  "message": "Sign view recorded"
}
```

---

### POST `/api/auth/me/exercises/:exerciseId/complete` 🔒

Record an exercise completion/attempt

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Request Body:**
```json
{
  "isCorrect": true,
  "selectedSignId": "uuid",
  "timeTaken": 15000,
  "score": 100
}
```

**Response:**
```json
{
  "success": true,
  "message": "Exercise completion recorded"
}
```

**Rewards (if correct):**
- +10 EXP
- +5 Coins (via stats table)

---

### POST `/api/auth/me/daily-quiz` 🔒

Record or update daily quiz result

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Request Body:**
```json
{
  "date": "2025-11-25",
  "numQuestions": 10,
  "correctCount": 8,
  "score": 80,
  "completed": true
}
```

**Response:**
```json
{
  "success": true,
  "message": "Daily quiz recorded"
}
```

---

### POST `/api/auth/me/favorites/:signId` 🔒

Add a sign to user's favorites

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Response:**
```json
{
  "success": true,
  "message": "Sign added to favorites",
  "id": "uuid"
}
```

---

### DELETE `/api/auth/me/favorites/:signId` 🔒

Remove a sign from user's favorites

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Response:**
```json
{
  "success": true,
  "message": "Sign removed from favorites"
}
```

---

### GET `/api/auth/me/favorites` 🔒

Get user's favorite signs

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": "uuid",
      "name": "Hola",
      "description": "Greeting sign",
      "image_url": "https://...",
      "video_url": "https://...",
      "created_at": "2025-11-25T00:00:00.000Z"
    }
  ]
}
```

---

### GET `/api/auth/medals`

Get all available medals (public)

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": "uuid",
      "name": "First Steps",
      "description": "Complete your first exercise",
      "icon_url": "https://...",
      "condition_type": "stat",
      "condition_value": 1
    }
  ]
}
```

---

### GET `/api/auth/me/medals` 🔒

Get medals earned by the authenticated user

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "user_medal_id": "uuid",
      "medal_id": "uuid",
      "name": "First Steps",
      "description": "Complete your first exercise",
      "icon_url": "https://...",
      "achieved_at": "2025-11-25T00:00:00.000Z"
    }
  ]
}
```

---

### POST `/api/auth/me/medals/:medalId/claim` 🔒

Claim a medal (user must meet conditions)

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Response:**
```json
{
  "success": true,
  "message": "Medal awarded"
}
```

**Error (conditions not met):**
```json
{
  "success": false,
  "message": "Medal conditions not met",
  "required": 10,
  "current": 5,
  "condition": {...}
}
```

---

### POST `/api/auth/users/:uid/medals/:medalId` 🔒 Admin Only

Award a medal to a user (Admin only)

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Response:**
```json
{
  "success": true,
  "message": "Medal awarded to user"
}
```

---

### POST `/api/auth/verify` 🔒

Verify Firebase token validity

**Headers:**
```
Authorization: Bearer <firebase_token>
```

**Response:**
```json
{
  "success": true,
  "message": "Token is valid",
  "data": {
    "uid": "firebase_uid",
    "email": "user@example.com",
    "email_verified": true
  }
}
```

---

### POST `/api/auth/users` 🔒 Admin Only

Create a new Firebase user (Admin only)

**Request Body:**
```json
{
  "email": "string",
  "password": "string",
  "displayName": "string",
  "photoURL": "string"
}
```

**Response:**
```json
{
  "success": true,
  "message": "User created successfully",
  "data": {
    "uid": "firebase_uid",
    "email": "user@example.com",
    "displayName": "User Name"
  }
}
```

---

### POST `/api/auth/users/claims` 🔒 Admin Only

Set custom claims for a user (Admin only)

**Request Body:**
```json
{
  "uid": "firebase_uid",
  "claims": {
    "admin": true,
    "role": "moderator"
  }
}
```

**Response:**
```json
{
  "success": true,
  "message": "Custom claims set successfully",
  "data": {
    "uid": "firebase_uid",
    "claims": {
      "admin": true,
      "role": "moderator"
    }
  }
}
```

---

### DELETE `/api/auth/users/:uid` 🔒 Admin Only

Delete a user from Firebase (Admin only)

**Response:**
```json
{
  "success": true,
  "message": "User deleted successfully",
  "data": {
    "uid": "firebase_uid"
  }
}
```

---

## Signs Endpoints

### GET `/api/items?type=signs&category_id=uuid`

Get all signs (optionally filtered by category)

**Query Parameters:**
- `type`: `"signs"` (optional)
- `category_id`: `"uuid"` (optional)

**Response:**
```json
{
  "success": true,
  "count": 2,
  "data": [
    {
      "id": "uuid",
      "category_id": "uuid",
      "name": "Hola",
      "description": "Seña de saludo",
      "image_url": "https://...",
      "video_url": "https://..."
    }
  ]
}
```

---

### GET `/api/items/:id?type=signs`

Get a specific sign by ID

**Response:**
```json
{
  "success": true,
  "data": {
    "id": "uuid",
    "category_id": "uuid",
    "name": "Hola",
    "description": "Seña de saludo",
    "image_url": "https://...",
    "video_url": "https://..."
  }
}
```

---

### POST `/api/items/signs` 🔒

Create a new sign with image and video

**Content-Type:** `multipart/form-data`

**Form Data:**
- `name`: `string` (required)
- `category_id`: `uuid` (required)
- `description`: `string` (optional)
- `image`: `File` (optional)
- `video`: `File` (optional)

**Response:**
```json
{
  "success": true,
  "message": "Sign created successfully",
  "data": {
    "id": "uuid",
    "category_id": "uuid",
    "name": "Hola",
    "description": "Seña de saludo",
    "image_url": "https://...",
    "video_url": "https://..."
  }
}
```

---

### PUT `/api/items/signs/:id` 🔒

Update an existing sign

**Content-Type:** `multipart/form-data`

**Form Data (all optional):**
- `name`: `string`
- `category_id`: `uuid`
- `description`: `string`
- `image`: `File`
- `video`: `File`

**Response:**
```json
{
  "success": true,
  "message": "Sign updated successfully",
  "data": {
    "id": "uuid",
    "category_id": "uuid",
    "name": "Hola",
    "description": "Updated description",
    "image_url": "https://...",
    "video_url": "https://..."
  }
}
```

---

### DELETE `/api/items/signs/:id` 🔒

Delete a sign and its media files

**Response:**
```json
{
  "success": true,
  "message": "Sign deleted successfully"
}
```

---

## Categories Endpoints

### GET `/api/items?type=categories`

Get all categories

**Response:**
```json
{
  "success": true,
  "count": 5,
  "data": [
    {
      "id": "uuid",
      "name": "Abecedario",
      "description": "Letras del abecedario",
      "icon_url": "https://..."
    }
  ]
}
```

---

### GET `/api/items/:id?type=categories`

Get a specific category by ID

**Response:**
```json
{
  "success": true,
  "data": {
    "id": "uuid",
    "name": "Abecedario",
    "description": "Letras del abecedario",
    "icon_url": "https://..."
  }
}
```

---

### POST `/api/items/categories` 🔒

Create a new category

**Content-Type:** `multipart/form-data`

**Form Data:**
- `name`: `string` (required)
- `description`: `string` (optional)
- `file`: `File` (icon image, optional)

**Response:**
```json
{
  "success": true,
  "message": "Category created successfully",
  "data": {
    "id": "uuid",
    "name": "Abecedario",
    "description": "Letras del abecedario",
    "icon_url": "https://..."
  }
}
```

---

### PUT `/api/items/categories/:id` 🔒

Update a category

**Content-Type:** `multipart/form-data`

**Form Data (all optional):**
- `name`: `string`
- `description`: `string`
- `file`: `File` (icon image)

**Response:**
```json
{
  "success": true,
  "message": "Category updated successfully",
  "data": {
    "id": "uuid",
    "name": "Abecedario",
    "description": "Updated description",
    "icon_url": "https://..."
  }
}
```

---

### DELETE `/api/items/categories/:id` 🔒

Delete a category

**Response:**
```json
{
  "success": true,
  "message": "Category deleted successfully"
}
```

---

## Exercises Endpoints

### GET `/api/items/exercises`

Get exercises with complete details (optimized for Android)

**Query Parameters:**
- `category_id`: `uuid` (optional)
- `exercise_id`: `uuid` (optional)

**Response:**
```json
{
  "success": true,
  "count": 1,
  "data": [
    {
      "id": "uuid",
      "category_id": "uuid",
      "category_name": "Abecedario",
      "type": "multiple_choice",
      "question": "¿Cuál es la seña para la letra A?",
      "correct_sign_id": "uuid",
      "correct_sign": {
        "id": "uuid",
        "name": "Letra A",
        "description": "Seña para la letra A",
        "image_url": "https://...",
        "video_url": "https://..."
      },
      "options": [
        {
          "id": "uuid",
          "name": "Letra A",
          "description": "...",
          "image_url": "https://...",
          "video_url": "https://...",
          "is_correct": true
        },
        {
          "id": "uuid",
          "name": "Letra B",
          "description": "...",
          "image_url": "https://...",
          "video_url": "https://...",
          "is_correct": false
        },
        {
          "id": "uuid",
          "name": "Letra C",
          "description": "...",
          "image_url": "https://...",
          "video_url": "https://...",
          "is_correct": false
        },
        {
          "id": "uuid",
          "name": "Letra D",
          "description": "...",
          "image_url": "https://...",
          "video_url": "https://...",
          "is_correct": false
        }
      ]
    }
  ]
}
```

---

### GET `/api/items/exercises/:id/quiz`

Get a single exercise with correct sign and 3 random incorrect options

**Response:**
```json
{
  "success": true,
  "data": {
    "exercise": {
      "id": "uuid",
      "category_id": "uuid",
      "category_name": "Abecedario",
      "type": "multiple_choice",
      "prompt": "¿Cuál es la seña para la letra A?",
      "correct_sign_id": "uuid",
      "structure_type": null
    },
    "correct": {
      "id": "uuid",
      "name": "Letra A",
      "description": "...",
      "image_url": "https://...",
      "video_url": "https://..."
    },
    "incorrect": [
      {
        "id": "uuid",
        "name": "Letra B",
        "description": "...",
        "image_url": "https://...",
        "video_url": "https://..."
      }
    ],
    "options": [
      // Shuffled array of correct + incorrect signs
    ]
  }
}
```

---

### POST `/api/items/exercises/generate-quiz`

Generate a quiz with multiple exercises

**Request Body:**
```json
{
  "mode": "category",
  "count": 10,
  "category_id": "uuid"
}
```

**Mode Options:**
- `"category"` - Questions from specific category (requires `category_id`)
- `"mixed"` - Random questions from all categories
- `"custom"` - Specific exercises (requires `exercise_ids` array)

**Request Body (Custom mode):**
```json
{
  "mode": "custom",
  "count": 5,
  "exercise_ids": ["uuid1", "uuid2", "uuid3"]
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "questions": [
      {
        "exercise": {
          "id": "uuid",
          "category_id": "uuid",
          "category_name": "Abecedario",
          "type": "multiple_choice",
          "prompt": "Question text",
          "correct_sign_id": "uuid",
          "structure_type": null
        },
        "correct": {
          "id": "uuid",
          "name": "Correct answer",
          "description": "...",
          "image_url": "https://...",
          "video_url": "https://..."
        },
        "incorrect": [
          // Array of incorrect options
        ],
        "options": [
          // Shuffled array of all options
        ]
      }
    ]
  }
}
```

---

### POST `/api/items/exercises` 🔒

Create a new exercise with options

**Content-Type:** `application/json`

**Request Body:**
```json
{
  "category_id": "uuid",
  "type": "multiple_choice",
  "prompt": "¿Cuál es la seña correcta?",
  "order_num": 1,
  "options": [
    {
      "text": "Opción A",
      "image_url": "https://...",
      "video_url": "https://...",
      "is_correct": true
    },
    {
      "text": "Opción B",
      "image_url": "https://...",
      "video_url": "https://...",
      "is_correct": false
    }
  ]
}
```

**Response:**
```json
{
  "success": true,
  "message": "Exercise created successfully",
  "data": {
    "id": "uuid",
    "category_id": "uuid",
    "type": "multiple_choice",
    "prompt": "¿Cuál es la seña correcta?",
    "order_num": 1
  }
}
```

---

### DELETE `/api/items/exercises/:id` 🔒

Delete an exercise

**Response:**
```json
{
  "success": true,
  "message": "Exercise deleted successfully"
}
```

---

## User Endpoints

### PUT `/api/items/users/:userId/avatar` 🔒

Update user avatar

**Content-Type:** `multipart/form-data`

**Form Data:**
- `file`: `File` (image, required)

**Response:**
```json
{
  "success": true,
  "message": "Avatar updated successfully",
  "data": {
    "id": "uuid",
    "display_name": "John Doe",
    "email": "john@example.com",
    "avatar_url": "https://..."
  }
}
```

---

## Error Responses

### 400 Bad Request

```json
{
  "success": false,
  "message": "Category ID and name are required"
}
```

### 401 Unauthorized

```json
{
  "success": false,
  "message": "No token provided. Please include Authorization header with Bearer token."
}
```

### 403 Forbidden

```json
{
  "success": false,
  "message": "Admin access required."
}
```

### 404 Not Found

```json
{
  "success": false,
  "message": "Item with id uuid not found"
}
```

### 409 Conflict

```json
{
  "success": false,
  "message": "User already registered"
}
```

### 500 Internal Server Error

```json
{
  "success": false,
  "message": "Failed to fetch items",
  "error": "Database connection error"
}
```

### 503 Service Unavailable

```json
{
  "success": false,
  "message": "Database connection failed. Please try again."
}
```

---

## Additional Resources

- **Health Check:** `GET /api/health`
- **API Info:** `GET /api`
- **GitHub:** [https://github.com/KetzalliLabs](https://github.com/KetzalliLabs)

---

**Built with ❤️ for accessibility by KetzalliLabs**  
© 2025 KetzalliLabs
