CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar(50),
  "description" text
);

CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "firebase_uid" varchar(128) UNIQUE NOT NULL,
  "role_id" uuid NOT NULL,
  "display_name" varchar(100),
  "email" varchar(255),
  "coin" int,
  "avatar_url" varchar(255),
  "join_date" timestamp
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar(100),
  "description" text,
  "icon_url" varchar(255)
);

CREATE TABLE "signs" (
  "id" uuid PRIMARY KEY,
  "category_id" uuid,
  "name" varchar(100),
  "description" text,
  "image_url" varchar(255),
  "video_url" varchar(255)
);

CREATE TABLE "exercises" (
  "id" uuid PRIMARY KEY,
  "category_id" uuid,
  "type" varchar(50),
  "prompt" text,
  "order_num" int
);

CREATE TABLE exercises (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_id UUID NOT NULL REFERENCES categories(id),
    type VARCHAR(50),
    prompt TEXT,
    correct_sign_id UUID NOT NULL REFERENCES signs(id)
);

CREATE TABLE "exercise_options" (
  "id" uuid PRIMARY KEY,
  "exercise_id" uuid,
  "text" text,
  "image_url" varchar(255),
  "video_url" varchar(255),
  "is_correct" boolean
);

CREATE TABLE "attempts" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "exercise_id" uuid,
  "selected_option" uuid,
  "is_correct" boolean,
  "created_at" timestamp
);

CREATE TABLE "progress" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "category_id" uuid,
  "score" int,
  "status" varchar(20),
  "updated_at" timestamp
);

CREATE TABLE "streaks" (
  "user_id" uuid PRIMARY KEY,
  "current_days" int,
  "best_days" int,
  "last_check" date
);

CREATE TABLE "medals" (
  "id" uuid PRIMARY KEY,
  "name" varchar(100),
  "description" text,
  "icon_url" varchar(255),
  "condition_type" varchar(50),
  "condition_value" int
);

CREATE TABLE "user_medals" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "medal_id" uuid,
  "achieved_at" timestamp
);

CREATE TABLE user_stats (
    user_id uuid NOT NULL,
    stat_name varchar(50) NOT NULL,
    current_value int NOT NULL DEFAULT 0,
    max_value int NOT NULL DEFAULT 100,
    last_update TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (user_id, stat_name),
    CONSTRAINT fk_user_stats_user
        FOREIGN KEY (user_id)
        REFERENCES users (id)
        ON DELETE CASCADE
);

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "signs" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "exercises" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "exercise_options" ADD FOREIGN KEY ("exercise_id") REFERENCES "exercises" ("id");

ALTER TABLE "attempts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "attempts" ADD FOREIGN KEY ("exercise_id") REFERENCES "exercises" ("id");

ALTER TABLE "attempts" ADD FOREIGN KEY ("selected_option") REFERENCES "exercise_options" ("id");

ALTER TABLE "progress" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "progress" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "streaks" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_medals" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_medals" ADD FOREIGN KEY ("medal_id") REFERENCES "medals" ("id");


-- Correcciones a la base de datos y debug
ALTER TABLE "categories" DROP COLUMN "description";

INSERT INTO "categories" ("id", "name", "icon_url") VALUES (gen_random_uuid(),'Abecedario', 'https://img.icons8.com/?size=100&id=MXyR2CZikptq&format=png&color=000000')

DELETE FROM categories WHERE id = 'f1908e19-5ab1-4d30-921d-a8db3efbd773';

DELETE FROM signs WHERE category_id = 'fb59bac7-7119-4c93-837e-f12469bf699b';

ALTER TABLE attempts DROP COLUMN selected_option;

ALTER TABLE attempts ADD COLUMN selected_sign_id uuid REFERENCES signs(id);

DROP TABLE IF EXISTS exercise_options CASCADE;

ALTER TABLE exercises DROP COLUMN order_num;

ALTER TABLE exercises ADD COLUMN correct_sign_id UUID REFERENCES signs(id);

ALTER TABLE exercises ALTER COLUMN correct_sign_id SET NOT NULL;
