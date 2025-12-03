-- =========================
-- TABLE: categories
-- =========================
CREATE TABLE categories (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name varchar(1000),
    icon_url varchar(255)
);

-- =========================
-- TABLE: roles
-- =========================
CREATE TABLE roles (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name varchar(50),
    description text
);

-- =========================
-- TABLE: signs
-- =========================
CREATE TABLE signs (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    category_id uuid REFERENCES categories(id),
    name varchar(100),
    description text,
    image_url varchar(255),
    video_url varchar(255)
);

-- =========================
-- TABLE: stats
-- =========================
CREATE TABLE stats (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name varchar(50),
    description text,
    category varchar(50),
    max_limit integer,
    default_max integer
);

-- =========================
-- TABLE: exercises
-- =========================
CREATE TABLE exercises (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    category_id uuid REFERENCES categories(id),
    type varchar(50),
    prompt text,
    correct_sign_id uuid REFERENCES signs(id),
    structure_type varchar(20)
);

-- =========================
-- TABLE: users
-- =========================
CREATE TABLE users (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    firebase_uid varchar(128),
    role_id uuid REFERENCES roles(id),
    display_name varchar(100),
    email varchar(255),
    avatar_url varchar(255),
    join_date timestamp
);

-- =========================
-- TABLE: user_sign_views
-- =========================
CREATE TABLE user_sign_views (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES users(id),
    sign_id uuid REFERENCES signs(id),
    viewed_at timestamp
);

-- =========================
-- TABLE: attempts (quiz attempts)
-- =========================
CREATE TABLE attempts (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES users(id),
    exercise_id uuid REFERENCES exercises(id),
    selected_sign_id uuid REFERENCES signs(id),
    is_correct boolean,
    created_at timestamp
);

-- =========================
-- TABLE: user_exercise_history
-- =========================
CREATE TABLE user_exercise_history (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES users(id),
    exercise_id uuid REFERENCES exercises(id),
    completed_at timestamp
);

-- =========================
-- TABLE: user_stats
-- =========================
CREATE TABLE user_stats (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES users(id),
    stat_id uuid REFERENCES stats(id),
    current_value integer,
    max_value integer,
    last_update timestamp
);

-- =========================
-- TABLE: streaks
-- =========================
CREATE TABLE streaks (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES users(id),
    current_days integer,
    best_days integer,
    last_check date
);

-- =========================
-- TABLE: progress (per category)
-- =========================
CREATE TABLE progress (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES users(id),
    category_id uuid REFERENCES categories(id),
    score integer,               
    updated_at timestamp,
    CONSTRAINT unique_user_category UNIQUE (user_id, category_id)
);


-- =========================
-- TABLE: medals
-- =========================
CREATE TABLE medals (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name varchar(100),
    description text,
    icon_url varchar(255),
    condition_type varchar(50),
    condition_value integer
);

-- =========================
-- TABLE: user_medals
-- =========================
CREATE TABLE user_medals (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES users(id),
    medal_id uuid REFERENCES medals(id),
    achieved_at timestamp,
    CONSTRAINT uq_user_medal UNIQUE (user_id, medal_id)
);

-- =========================
-- TABLE: daily_quiz_history
-- =========================
CREATE TABLE daily_quiz_history (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid REFERENCES users(id),
    score integer,
    completed boolean,
    date date
);

-- =========================
-- TABLE: medal_conditions
-- =========================
CREATE TABLE medal_conditions (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    medal_id uuid NOT NULL REFERENCES medals(id) ON DELETE CASCADE,
    source_type varchar(50) NOT NULL, 
    stat_id uuid, 
    source_key varchar(100), 
    operator varchar(10) DEFAULT '>=',
    threshold integer NOT NULL
);

-- =========================
-- TABLE: user_favorite_signs
-- =========================
CREATE TABLE user_favorite_signs (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL REFERENCES users(id),
    sign_id uuid NOT NULL REFERENCES signs(id),
    name varchar(100),
    created_at timestamp DEFAULT NOW(),
    CONSTRAINT uq_user_favorite_sign UNIQUE (user_id, sign_id)
);

CREATE INDEX IF NOT EXISTS idx_user_favorite_signs_user_id ON user_favorite_signs (user_id);