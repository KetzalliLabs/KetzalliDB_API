INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Amarillo', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Amarillo_Web.m4v'),
    (gen_random_uuid(), 'Ázul', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Azul_Web.m4v'),
    (gen_random_uuid(), 'Blanco', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Blanco_Web.m4v'),
    (gen_random_uuid(), 'Café', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cafe_Web.m4v'),
    (gen_random_uuid(), 'Gris', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gris_Web.m4v'),
    (gen_random_uuid(), 'Morado', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Morado_Web.m4v'),
    (gen_random_uuid(), 'Naranja', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Naranja_Web.m4v'),
    (gen_random_uuid(), 'Negro', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Negro_Web.m4v'),
    (gen_random_uuid(), 'Oro', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Oro_Web.m4v'),
    (gen_random_uuid(), 'Plata', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Plata_Web.m4v'),
    (gen_random_uuid(), 'Rojo', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Rojo_Web.m4v'),
    (gen_random_uuid(), 'Rosa', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Rosa_Web.m4v'),
    (gen_random_uuid(), 'Verde', (SELECT id FROM categories WHERE name='Colores'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Verde_Web.m4v');