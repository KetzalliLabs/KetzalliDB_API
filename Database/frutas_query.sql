INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Almendra', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Almendra_Web.m4v'),
    (gen_random_uuid(), 'Cereza', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cereza_Web.m4v'),
    (gen_random_uuid(), 'Coco', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Coco_Web.m4v'),
    (gen_random_uuid(), 'Durazno', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Durazno_Web.m4v'),
    (gen_random_uuid(), 'Fresa', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Fresa_Web.m4v'),
    (gen_random_uuid(), 'Guayaba', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Guayaba_Web.m4v'),
    (gen_random_uuid(), 'Jamaica', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Jamaica_Web.m4v'),
    (gen_random_uuid(), 'Jicama', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Jicama_Web.m4v'),
    (gen_random_uuid(), 'Limón', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Limon_Web.m4v'),
    (gen_random_uuid(), 'Mango', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mango_Web.m4v');