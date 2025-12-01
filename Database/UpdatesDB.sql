-- Correcciones a la base de datos y debug
ALTER TABLE "categories" DROP COLUMN "description";

INSERT INTO "categories" ("id", "name", "icon_url") VALUES (gen_random_uuid(),'Abecedario', 'https://img.icons8.com/?size=100&id=MXyR2CZikptq&format=png&color=000000');

DELETE FROM categories WHERE id = 'f1908e19-5ab1-4d30-921d-a8db3efbd773';

DELETE FROM signs WHERE category_id = 'fb59bac7-7119-4c93-837e-f12469bf699b';

ALTER TABLE attempts DROP COLUMN selected_option;

ALTER TABLE attempts ADD COLUMN selected_sign_id uuid REFERENCES signs(id);

DROP TABLE IF EXISTS exercise_options CASCADE;

DROP TABLE IF EXISTS user_stats CASCADE;

ALTER TABLE exercises DROP COLUMN order_num;

ALTER TABLE exercises ADD COLUMN correct_sign_id UUID REFERENCES signs(id);

ALTER TABLE exercises ALTER COLUMN correct_sign_id SET NOT NULL;

ALTER TABLE exercises ADD COLUMN structure_type VARCHAR(20) DEFAULT 'text-image';

ALTER TABLE exercises DROP COLUMN structure_type;

ALTER TABLE users DROP COLUMN coin;

ALTER TABLE stats DROP COLUMN icon_url;

ALTER TABLE medals DROP COLUMN condition_type;

ALTER TABLE medals DROP COLUMN condition_value;