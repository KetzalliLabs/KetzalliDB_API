INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Lunes', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Lunes_Web.m4v'),
    (gen_random_uuid(), 'Martes', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Martes_Web.m4v'),
    (gen_random_uuid(), 'Miércoles', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Miercoles_Web.m4v'),
    (gen_random_uuid(), 'Jueves', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Jueves_Web.m4v'),
    (gen_random_uuid(), 'Viernes', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Viernes_Web.m4v'),
    (gen_random_uuid(), 'Sábado', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Sabado_Web.m4v'),
    (gen_random_uuid(), 'Domingo', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Domingo_Web.m4v');