# Amoxcalli API - Endpoints Reference

Este documento describe los endpoints públicos y protegidos de la API (base: `http://localhost:3000` si ejecutas localmente).
Las rutas principales están montadas en:
- `/api/items` — gestión de signos, categorías y ejercicios (Tema: Contenido / Items)
- `/api/auth` — autenticación, eventos de usuario, progreso, favoritos y medallas (Tema: Usuario / Progreso / Gamificación)

---

## Autenticación
La API usa Firebase ID Tokens (JWT). Para rutas protegidas, añade la cabecera:

```
Authorization: Bearer <ID_TOKEN>
```

Cómo obtener un `idToken` rápido:
- Desde cliente Firebase: `await firebase.auth().currentUser.getIdToken()`.
- Usando REST (Email/Password):
	POST `https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=YOUR_API_KEY`
	Body: `{ "email": "user@example.com", "password": "pass", "returnSecureToken": true }`
	Respuesta incluye `idToken`.

---

## Rutas: `/api/items` (ItemController) — Tema: Contenido / Autoría

GET /api/items
- Name: List Items
- Auth: optional
- Query params: `type` (e.g. `signs`), `category_id`
- Descripción: Recupera listas de recursos (señas, categorías, ejercicios). Útil para listar contenido en vistas y catálogos.

GET /api/items/exercises
- Name: List Exercises
- Auth: optional
- Query params: `category_id`, `exercise_id`
- Descripción: Obtener ejercicios filtrados por categoría o id. (Tema: Contenido / Practica)

POST /api/items/exercises
- Name: Create Exercise
- Auth: required
- Body (JSON): `{ category_id, type, prompt, order_num, options: [...] }`
- Descripción: Crear un ejercicio asociado a una categoría (Tema: Contenido / Autoría).

POST /api/items/exercises/generate-quiz
- Name: Generate Quiz (batch)
- Auth: optional
- Body (JSON): `{ mode: 'category'|'mixed'|'custom', count: number, category_id?: string, exercise_ids?: string[] }`
- Descripción: Genera un lote de ejercicios/quiz para practicar según modo.

GET /api/items/exercises/:id/quiz
- Name: Get Exercise Quiz
- Auth: optional
- Descripción: Devuelve el ejercicio con opciones y la información necesaria para mostrar el quiz.

DELETE /api/items/exercises/:id
- Name: Delete Exercise
- Auth: required
- Descripción: Borrar ejercicio (Tema: Contenido / Autoría).

GET /api/items/:id
- Name: Get Item By ID
- Auth: optional
- Query param: `type` (e.g., `signs`)
- Descripción: Obtener detalle de un recurso por id.

POST /api/items/signs
- Name: Create Sign
- Auth: required
- Body: `multipart/form-data` campos: `name`, `description`, `category_id`, `image` (file), `video` (file)
- Descripción: Crear nueva seña; pensada para administradores o creadores de contenido.

PUT /api/items/signs/:id
- Name: Update Sign
- Auth: required
- Body: `multipart/form-data` similar a create
- Descripción: Actualizar metadatos o archivos de una seña.

DELETE /api/items/signs/:id
- Name: Delete Sign
- Auth: required
- Descripción: Eliminar seña del catálogo.

POST /api/items/categories
- Name: Create Category
- Auth: required
- Body: `multipart/form-data` campos: `name`, `description`, `file`(icon)
- Descripción: Crear una nueva categoría temática.

PUT /api/items/categories/:id
- Name: Update Category
- Auth: required
- Body: `multipart/form-data` similar a create
- Descripción: Editar nombre/descripcion/icono de la categoría.

DELETE /api/items/categories/:id
- Name: Delete Category
- Auth: required
- Descripción: Eliminar categoría (tener cuidado con signs asociados).

PUT /api/items/users/:userId/avatar
- Name: Update User Avatar
- Auth: required
- Body: `multipart/form-data` campo: `file` (imagen)
- Descripción: Actualiza la imagen de avatar del usuario.

(Además se proveen rutas legacy: `POST /api/items`, `PUT /api/items/:id`, `DELETE /api/items/:id`.)

---

## Rutas: `/api/auth` (auth.controller) — Tema: Usuario / Progreso / Gamificación

POST /api/auth/register
- Name: Register User
- Auth: Public
- Body: `{ firebase_uid, email, display_name }`
- Descripción: Registra al usuario en la base de datos tras validar que existe en Firebase.

POST /api/auth/login
- Name: Login (server-side)
- Auth: Public
- Body: `{ firebase_uid }`
- Descripción: Ruta usada por el servidor para obtener/crear el registro interno del usuario y devolver su perfil.

GET /api/auth/me
- Name: Get Current User + Stats
- Auth: required
- Descripción: Devuelve el perfil de Firebase junto con información interna (usuario, avatar, y estadísticas resumidas). (Tema: Usuario)

GET /api/auth/me/stats
- Name: Get User Stats
- Auth: required
- Descripción: Devuelve información agregada del usuario: progreso por categoría, streaks, estadísticas (exp, monedas), historial de intentos y vistas. Útil para pantallas de perfil y dashboard. (Tema: Progreso / Analytics)

POST /api/auth/verify
- Name: Verify Token
- Auth: required
- Descripción: Endpoint de verificación para chequear que el token es válido y que el usuario está sincronizado con la DB.

### Eventos de actividad de usuario (Tema: Actividad / Progreso)

POST /api/auth/me/signs/:signId/view
- Name: Record Sign View
- Auth: required
- Descripción: Registra que el usuario vio la seña `:signId`. Inserta/actualiza `user_sign_views` y además actualiza el `progress` de la categoría asociada calculando el porcentaje completado (score = floor(viewed/total * 100)).
	- Uso: llamar cada vez que el usuario visualiza una seña por primera vez.
	- Respuesta: `200 OK` con `{ success: true, message: 'Sign view recorded' }`.

GET /api/auth/me/signs/views
- Name: Get Viewed Signs & Progress
- Auth: required
- Descripción: Devuelve por categoría las señas que el usuario ya vio y métricas de progreso por categoría.
	- Respuesta: `{ success: true, data: [ { category_id, category_name, viewed_count, total_count, score, sign_ids: [...] }, ... ] }`.
	- Uso típico: mostrar el avance del usuario en cada tema/categoría y las señas vistas para marcar como completadas en UI. (Tema: Progreso / UI)

POST /api/auth/me/exercises/:exerciseId/complete
- Name: Record Exercise Completion
- Auth: required
- Body: `{ is_correct: boolean, selectedSignId?: string, timeTaken?: number, score?: number }`
- Descripción: Guarda historial de intento (`attempts`), marca `user_exercise_history` y actualiza estadísticas (ej. `exercises_completed`, `exp`, `coins`). (Tema: Práctica / Recompensas)

POST /api/auth/me/daily-quiz
- Name: Record Daily Quiz
- Auth: required
- Body: `{ date?: string, numQuestions?: number, correctCount?: number, score?: number, completed?: boolean }`
- Descripción: Registra el resultado del daily quiz y actualiza streaks/estadísticas relacionadas. (Tema: Retención / Streaks)

### Favoritos (Tema: Personalización)

POST /api/auth/me/favorites/:signId
- Name: Add Favorite Sign
- Auth: required
- Descripción: Añade `:signId` a la lista de favoritos del usuario (`user_favorite_signs`).
	- Respuestas: `201 Created` (agregado) o `200 OK` (ya existía).

DELETE /api/auth/me/favorites/:signId
- Name: Remove Favorite Sign
- Auth: required
- Descripción: Elimina la seña de favoritos.

GET /api/auth/me/favorites
- Name: List Favorite Signs
- Auth: required
- Descripción: Lista las señas favoritas del usuario con metadatos para mostrarlas en la UI.

### Medallas (Tema: Gamificación / Logros)

GET /api/auth/medals
- Name: List Medals
- Auth: Public
- Descripción: Lista las medallas disponibles, con descripción e icono.

GET /api/auth/me/medals
- Name: List User Medals
- Auth: required
- Descripción: Medallas ya obtenidas por el usuario.

POST /api/auth/me/medals/:medalId/claim
- Name: Claim Medal
- Auth: required
- Descripción: Permite que el usuario reclame una medalla; el servidor valida las condiciones almacenadas en `medal_conditions` (stats, streaks, etc.) y registra `user_medals` si cumple.

POST /api/auth/users/:uid/medals/:medalId
- Name: Admin Award Medal
- Auth: admin required (`requireAdmin`)
- Descripción: Acción administrativa para otorgar manualmente una medalla a un usuario.

### Admin user management

POST /api/auth/users
- Name: Admin Create User
- Auth: admin required
- Descripción: Crear un usuario interno.

POST /api/auth/users/claims
- Name: Admin Set User Claims
- Auth: admin required
- Descripción: Asignar claims (roles) a un usuario (admin).

DELETE /api/auth/users/:uid
- Auth: admin required
- Descripción: Eliminar usuario por UID.

---

## Códigos de respuesta comunes

- `200` - OK — petición exitosa.
- `201` - Created — recurso creado.
- `400` - Bad Request — faltan parámetros o formato incorrecto.
- `401` - Unauthorized — token faltante o inválido.
- `403` - Forbidden — condiciones no cumplidas o no autorizado.
- `404` - Not Found — recurso no encontrado.
- `500` - Internal Server Error — error del servidor.

---

## Ejemplos con cURL (favorites & progreso)

# Listar favoritos
curl -X GET "http://localhost:3000/api/auth/me/favorites" -H "Authorization: Bearer <ID_TOKEN>"

# Agregar favorito
curl -X POST "http://localhost:3000/api/auth/me/favorites/<SIGN_UUID>" -H "Authorization: Bearer <ID_TOKEN>"

# Eliminar favorito
curl -X DELETE "http://localhost:3000/api/auth/me/favorites/<SIGN_UUID>" -H "Authorization: Bearer <ID_TOKEN>"

# Obtener progreso y signos vistos por categoría
curl -X GET "http://localhost:3000/api/auth/me/signs/views" -H "Authorization: Bearer <ID_TOKEN>"

---

## Levantar la API localmente

1. Instala dependencias:

```powershell
npm install
```

2. Ejecuta en modo desarrollo (requiere `tsx`):

```powershell
npm run dev
```

3. Asegúrate de tener variables de entorno en `.env` (DB, Firebase service account, etc.).

---

## Notas finales

- Revisa `Database/AmoxcalliDB.sql` para ver tablas relacionadas: `user_favorite_signs`, `user_medals`, `medal_conditions`, `daily_quiz_history`, `progress`, `user_sign_views`, etc.
- Para probar rutas protegidas sin usar email/password en cliente, considera generar un `custom token` con `firebase-admin` y luego hacer `signInWithCustomToken` para obtener un `idToken`.

Si quieres, puedo generar una colección Postman exportable con las requests principales y un pre-request script para obtener `idToken` automáticamente.

