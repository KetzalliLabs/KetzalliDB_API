-------------------------------------------------------
-- Categories Query
-------------------------------------------------------

INSERT INTO "categories" ("id", "name", "icon_url") VALUES
 (gen_random_uuid(), 'Abecedario', 'https://img.icons8.com/?size=100&id=MXyR2CZikptq&format=png&color=000000'),
 (gen_random_uuid(), 'Animales', 'https://img.icons8.com/?size=100&id=ZuzscBIny4qF&format=png&color=000000'),
 (gen_random_uuid(), 'Colores', 'https://img.icons8.com/?size=100&id=859&format=png&color=000000'),
 (gen_random_uuid(), 'Comida', 'https://img.icons8.com/?size=100&id=7613&format=png&color=000000'),
 (gen_random_uuid(), 'Cuerpo', 'https://img.icons8.com/?size=100&id=60865&format=png&color=000000'),
 (gen_random_uuid(), 'Dias de la Semana', 'https://img.icons8.com/?size=100&id=4NXrrgLpkEuk&format=png&color=000000'),
 (gen_random_uuid(), 'Frutas', 'https://img.icons8.com/?size=100&id=GWislv927j8I&format=png&color=000000'),
 (gen_random_uuid(), 'Hogar', 'https://img.icons8.com/?size=100&id=4823&format=png&color=000000'),
 (gen_random_uuid(), 'Lugares', 'https://img.icons8.com/?size=100&id=undefined&format=png&color=000000'),
 (gen_random_uuid(), 'Meses del Año', 'https://img.icons8.com/?size=100&id=39mJ0wyUp2YO&format=png&color=000000'),
 (gen_random_uuid(), 'Números', 'https://img.icons8.com/?size=100&id=107428&format=png&color=000000'),
 (gen_random_uuid(), 'Personas', 'https://img.icons8.com/?size=100&id=undefined&format=png&color=000000'),
 (gen_random_uuid(), 'Preguntas', 'https://img.icons8.com/?size=100&id=4501&format=png&color=000000'),
 (gen_random_uuid(), 'Gramática', 'https://img.icons8.com/?size=100&id=OzvsjhXE24ws&format=png&color=000000'),
 (gen_random_uuid(), 'Pronombres', 'https://img.icons8.com/?size=100&id=UzivRUTTbNKR&format=png&color=000000'),
 (gen_random_uuid(), 'Oficios', 'https://img.icons8.com/?size=100&id=tJJWhcXCnpyE&format=png&color=000000'),
 (gen_random_uuid(), 'Ropa', 'https://img.icons8.com/?size=100&id=24899&format=png&color=000000'),
 (gen_random_uuid(), 'Saludos', 'https://img.icons8.com/?size=100&id=25573&format=png&color=000000'),
 (gen_random_uuid(), 'Tiempo', 'https://img.icons8.com/?size=100&id=19100&format=png&color=000000'),
 (gen_random_uuid(), 'Transporte', 'https://img.icons8.com/?size=100&id=undefined&format=png&color=000000'),
 (gen_random_uuid(), 'Verbos comunes', 'https://img.icons8.com/?size=100&id=ro6d8kA3GXyL&format=png&color=000000'),
 (gen_random_uuid(), 'Verbos Narrativos', 'https://img.icons8.com/?size=100&id=undefined&format=png&color=000000'),
 (gen_random_uuid(), 'Verduras', 'https://img.icons8.com/?size=100&id=11307&format=png&color=000000');

-------------------------------------------------------
-- Abecedario Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'A', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/a.JPG', NULL),
    (gen_random_uuid(), 'B', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/b.JPG', NULL),
    (gen_random_uuid(), 'C', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/c.JPG', NULL),
    (gen_random_uuid(), 'D', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/d.JPG', NULL),
    (gen_random_uuid(), 'E', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/e.JPG', NULL),
    (gen_random_uuid(), 'F', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/f.JPG', NULL),
    (gen_random_uuid(), 'G', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/g.JPG', NULL),
    (gen_random_uuid(), 'H', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/h.JPG', NULL),
    (gen_random_uuid(), 'I', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/i.JPG', NULL),
    (gen_random_uuid(), 'J', (SELECT id FROM categories WHERE name='Abecedario'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/J_Web.m4v'),
    (gen_random_uuid(), 'K', (SELECT id FROM categories WHERE name='Abecedario'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/k_Web.m4v'),
    (gen_random_uuid(), 'L', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/l.JPG', NULL),
    (gen_random_uuid(), 'Ll', (SELECT id FROM categories WHERE name='Abecedario'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ll_Web.m4v'),
    (gen_random_uuid(), 'M', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/m.JPG', NULL),
    (gen_random_uuid(), 'N', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/n.JPG', NULL),
    (gen_random_uuid(), 'Ñ', (SELECT id FROM categories WHERE name='Abecedario'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nie_Web.m4v'),
    (gen_random_uuid(), 'O', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/o.JPG', NULL),
    (gen_random_uuid(), 'P', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/p.JPG', NULL),
    (gen_random_uuid(), 'Q', (SELECT id FROM categories WHERE name='Abecedario'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Q_Web.m4v'),
    (gen_random_uuid(), 'R', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/r.JPG', NULL),
    (gen_random_uuid(), 'Rr', (SELECT id FROM categories WHERE name='Abecedario'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Rr_Web.m4v'),
    (gen_random_uuid(), 'S', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/s.JPG', NULL),
    (gen_random_uuid(), 'T', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/t.JPG', NULL),
    (gen_random_uuid(), 'U', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/u.JPG', NULL),
    (gen_random_uuid(), 'V', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/v.JPG', NULL),
    (gen_random_uuid(), 'W', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/w.JPG', NULL),
    (gen_random_uuid(), 'X', (SELECT id FROM categories WHERE name='Abecedario'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/X_Web.m4v'),
    (gen_random_uuid(), 'Y', (SELECT id FROM categories WHERE name='Abecedario'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/y.JPG', NULL),
    (gen_random_uuid(), 'Z', (SELECT id FROM categories WHERE name='Abecedario'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Z_Web.m4v');

-------------------------------------------------------
-- Animales Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Abeja', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Abeja_Web.m4v'),
    (gen_random_uuid(), 'Águila', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Aguila_Web.m4v'),
    (gen_random_uuid(), 'Araña', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Arana_Web.m4v'),
    (gen_random_uuid(), 'Ardilla', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ardilla_Web.m4v'),
    (gen_random_uuid(), 'Burro', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Burro_Web.m4v'),
    (gen_random_uuid(), 'Caballo', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Caballo_Web.m4v'),
    (gen_random_uuid(), 'Cerdo', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cerdo_Web.m4v'),
    (gen_random_uuid(), 'Chango', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Chango_Web.m4v'),
    (gen_random_uuid(), 'Conejo', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Conejo_Web.m4v'),
    (gen_random_uuid(), 'Gato', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gato_Web.m4v'),
    (gen_random_uuid(), 'Gorila', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gorila_Web.m4v'),
    (gen_random_uuid(), 'Gusano', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gusano_Web.m4v'),
    (gen_random_uuid(), 'Jirafa', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Jirafa_Web.m4v'),
    (gen_random_uuid(), 'León', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Leon_Web.m4v'),
    (gen_random_uuid(), 'Mariposa', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mariposa_Web.m4v'),
    (gen_random_uuid(), 'Oso', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Oso_Web.m4v'),
    (gen_random_uuid(), 'Pajaro', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pajaro_Web.m4v'),
    (gen_random_uuid(), 'Paloma', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Paloma_Web.m4v'),
    (gen_random_uuid(), 'Pato', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pato_Web.m4v'),
    (gen_random_uuid(), 'Perro', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Perro_Web.m4v'),
    (gen_random_uuid(), 'Pez', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pez_Web.m4v'),
    (gen_random_uuid(), 'Ratón', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Raton_Web.m4v'),
    (gen_random_uuid(), 'Tigre', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tigre_Web.m4v'),
    (gen_random_uuid(), 'Toro', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Toro_Web.m4v'),
    (gen_random_uuid(), 'Tortuga', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tortuga_Web.m4v'),
    (gen_random_uuid(), 'Vaca', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Vaca_Web.m4v'),
    (gen_random_uuid(), 'Vibora', (SELECT id FROM categories WHERE name='Animales'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Vibora_Web.m4v');

-------------------------------------------------------
-- Colores Query
-------------------------------------------------------

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

-------------------------------------------------------
-- Comida Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Aceite', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Aceite_Web.m4v'),
    (gen_random_uuid(), 'Água', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Agua_Web.m4v'),
    (gen_random_uuid(), 'Arroz', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Arroz_Web.m4v'),
    (gen_random_uuid(), 'Azúcar', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Azucar_Web.m4v'),
    (gen_random_uuid(), 'Café', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cafe_Web.m4v'),
    (gen_random_uuid(), 'Caldo', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Caldo_Web.m4v'),
    (gen_random_uuid(), 'Carne', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Carne_Web.m4v'),
    (gen_random_uuid(), 'Cerveza', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cerveza_Web.m4v'),
    (gen_random_uuid(), 'Chile', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Chile_Web.m4v'),
    (gen_random_uuid(), 'Chocolate', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Chocolate_Web.m4v'),
    (gen_random_uuid(), 'Coca Cola', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cocacola_Web.m4v'),
    (gen_random_uuid(), 'Dulce', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Dulce_Web.m4v'),
    (gen_random_uuid(), 'Ensalada', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ensalada_Web.m4v'),
    (gen_random_uuid(), 'Frijol', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Frijol_Web.m4v'),
    (gen_random_uuid(), 'Fruta', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Fruta_Web.m4v'),
    (gen_random_uuid(), 'Galleta', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Galleta_Web.m4v'),
    (gen_random_uuid(), 'Hamburguesa', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hamburguesa_Web.m4v'),
    (gen_random_uuid(), 'Huevo', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Huevo_Web.m4v'),
    (gen_random_uuid(), 'Leche', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Leche_Web.m4v'),
    (gen_random_uuid(), 'Pan', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pan_Web.m4v'),
    (gen_random_uuid(), 'Pastel', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pastel_Web.m4v'),
    (gen_random_uuid(), 'Pescado', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pescado_Web.m4v'),
    (gen_random_uuid(), 'Pizza', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pizza_Web.m4v'),
    (gen_random_uuid(), 'Pollo', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pollo_Web.m4v'),
    (gen_random_uuid(), 'Queso', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Queso_Web.m4v'),
    (gen_random_uuid(), 'Refresco', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Refresco_Web.m4v'),
    (gen_random_uuid(), 'Sopa', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Sopa_Web.m4v'),
    (gen_random_uuid(), 'Taco', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Taco_Web.m4v'),
    (gen_random_uuid(), 'Tortilla', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tortilla_Web.m4v'),
    (gen_random_uuid(), 'Verdura', (SELECT id FROM categories WHERE name='Comida'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Verdura_Web.m4v');

-------------------------------------------------------
-- Cuerpo Query 
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Boca', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Boca_Web.m4v'),
    (gen_random_uuid(), 'Cabeza', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cabeza_Web.m4v'),
    (gen_random_uuid(), 'Cara', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cara_Web.m4v'),
    (gen_random_uuid(), 'Cejas', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cejas_Web.m4v'),
    (gen_random_uuid(), 'Corazón', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Corazon_Web.m4v'),
    (gen_random_uuid(), 'Estómago', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Estomago_Web.m4v'),
    (gen_random_uuid(), 'Hueso', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hueso_Web.m4v'),
    (gen_random_uuid(), 'Mano', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mano_Web.m4v'),
    (gen_random_uuid(), 'Nariz', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nariz_Web.m4v'),
    (gen_random_uuid(), 'Ojos', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ojos_Web.m4v'),
    (gen_random_uuid(), 'Oreja', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Oreja_Web.m4v'),
    (gen_random_uuid(), 'Pestañas', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pestanas_Web.m4v'),
    (gen_random_uuid(), 'Piel', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Piel_Web.m4v'),
    (gen_random_uuid(), 'Pies', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pies_Web.m4v'),
    (gen_random_uuid(), 'Sangre', (SELECT id FROM categories WHERE name='Cuerpo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Sangre_Web.m4v');

-------------------------------------------------------
-- Dias de la Semana Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Lunes', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Lunes_Web.m4v'),
    (gen_random_uuid(), 'Martes', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Martes_Web.m4v'),
    (gen_random_uuid(), 'Miércoles', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Miercoles_Web.m4v'),
    (gen_random_uuid(), 'Jueves', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Jueves_Web.m4v'),
    (gen_random_uuid(), 'Viernes', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Viernes_Web.m4v'),
    (gen_random_uuid(), 'Sábado', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Sabado_Web.m4v'),
    (gen_random_uuid(), 'Domingo', (SELECT id FROM categories WHERE name='Dias de la Semana'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Domingo_Web.m4v');

-------------------------------------------------------
-- Frutas Query 
-------------------------------------------------------

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
    (gen_random_uuid(), 'Mango', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mango_Web.m4v'),
    (gen_random_uuid(), 'Manzana', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Manzana_Web.m4v'),
    (gen_random_uuid(), 'Melón', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Melon_Web.m4v'),
    (gen_random_uuid(), 'Naranja', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Naranja_Web.m4v'),
    (gen_random_uuid(), 'Nuez', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nuez_Web.m4v'),
    (gen_random_uuid(), 'Papaya', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Papaya_Web.m4v'),
    (gen_random_uuid(), 'Pera', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pera_Web.m4v'),
    (gen_random_uuid(), 'Piña', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pina_Web.m4v'),
    (gen_random_uuid(), 'Plátano', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Platano_Web.m4v'),
    (gen_random_uuid(), 'Sandía', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Sandia_Web.m4v'),
    (gen_random_uuid(), 'Tamarindo', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tamarindo_Web.m4v'),
    (gen_random_uuid(), 'Toronja', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Toronja_Web.m4v'),
    (gen_random_uuid(), 'Uva', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Uva_Web.m4v');

-------------------------------------------------------
-- Hogar Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Baño', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bano_Web.m4v'),
    (gen_random_uuid(), 'Caja', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Caja_Web.m4v'),
    (gen_random_uuid(), 'Cama', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cama_Web.m4v'),
    (gen_random_uuid(), 'Celular', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Celular_Web.m4v'),
    (gen_random_uuid(), 'Cocina', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cocina_Web.m4v'),
    (gen_random_uuid(), 'Computadora', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Computadora_Web.m4v'),
    (gen_random_uuid(), 'Cuarto', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cuarto_Web.m4v'),
    (gen_random_uuid(), 'Cuchara', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cuchara_Web.m4v'),
    (gen_random_uuid(), 'Foco', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Foco_Web.m4v'),
    (gen_random_uuid(), 'Gas', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gas_Web.m4v'),
    (gen_random_uuid(), 'Impresora', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Impresora_Web.m4v'),
    (gen_random_uuid(), 'Lavadora', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Lavadora_Web.m4v'),
    (gen_random_uuid(), 'Licuadora', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Licuadora_Web.m4v'),
    (gen_random_uuid(), 'Llave', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Llave_Web.m4v'),
    (gen_random_uuid(), 'Luz', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Luz_Web.m4v'),
    (gen_random_uuid(), 'Mesa', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mesa_Web.m4v'),
    (gen_random_uuid(), 'Plancha', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Plancha_Web.m4v'),
    (gen_random_uuid(), 'Plato', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Plato_Web.m4v'),
    (gen_random_uuid(), 'Puerta', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Puerta_Web.m4v'),
    (gen_random_uuid(), 'Silla', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Silla_Web.m4v'),
    (gen_random_uuid(), 'Telefono', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Telefono_Web.m4v'),
    (gen_random_uuid(), 'Tenedor', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tenedor_Web.m4v'),
    (gen_random_uuid(), 'Vaso', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Vaso_Web.m4v'),
    (gen_random_uuid(), 'Ventana', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ventana_Web.m4v');

-------------------------------------------------------
-- Lugares Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Antro', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Antro_Web.m4v'),
    (gen_random_uuid(), 'Banco', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Banco_Web.m4v'),
    (gen_random_uuid(), 'Calle', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Calle_Web.m4v'),
    (gen_random_uuid(), 'Cantina', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cantina_Web.m4v'),
    (gen_random_uuid(), 'Casa', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Casa_Web.m4v'),
    (gen_random_uuid(), 'Centro', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Centro_Web.m4v'),
    (gen_random_uuid(), 'Cine', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cine_Web.m4v'),
    (gen_random_uuid(), 'Ciudad', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ciudad_Web.m4v'),
    (gen_random_uuid(), 'Edificio', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Edificio_Web.m4v'),
    (gen_random_uuid(), 'Escuela', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Escuela_Web.m4v'),
    (gen_random_uuid(), 'Fábrica', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Fábrica_Web.m4v'),
    (gen_random_uuid(), 'Feria', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Feria_Web.m4v'),
    (gen_random_uuid(), 'Fiesta', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Fiesta_Web.m4v'),
    (gen_random_uuid(), 'Hotel', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hotel_Web.m4v'),
    (gen_random_uuid(), 'Iglesia', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Iglesia_Web.m4v'),
    (gen_random_uuid(), 'Mercado', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mercado_Web.m4v'),
    (gen_random_uuid(), 'Museo', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Museo_Web.m4v'),
    (gen_random_uuid(), 'Restaurante', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Restaurante_Web.m4v'),
    (gen_random_uuid(), 'Teatro', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Teatro_Web.m4v'),
    (gen_random_uuid(), 'Tienda', (SELECT id FROM categories WHERE name='Lugares'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tienda_Web.m4v');

-------------------------------------------------------
--  Meses del Año Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Enero', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Enero_Web.m4v'),
    (gen_random_uuid(), 'Febrero', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Febrero_Web.m4v'),
    (gen_random_uuid(), 'Marzo', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Marzo_Web.m4v'),
    (gen_random_uuid(), 'Abril', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Abril_Web.m4v'),
    (gen_random_uuid(), 'Mayo', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mayo_Web.m4v'),
    (gen_random_uuid(), 'Junio', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Junio_Web.m4v'),
    (gen_random_uuid(), 'Julio', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Julio_Web.m4v'),
    (gen_random_uuid(), 'Agosto', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Agosto_Web.m4v'),
    (gen_random_uuid(), 'Septiembre', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Septiembre_Web.m4v'),
    (gen_random_uuid(), 'Octubre', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Octubre_Web.m4v'),
    (gen_random_uuid(), 'Noviembre', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Noviembre_Web.m4v'),
    (gen_random_uuid(), 'Diciembre', (SELECT id FROM categories WHERE name='Meses del Año'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Diciembre_Web.m4v');

-------------------------------------------------------
-- Número Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), '0', (SELECT id FROM categories WHERE name='Números'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/0.JPG', NULL),
    (gen_random_uuid(), '1', (SELECT id FROM categories WHERE name='Números'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/1.JPG', NULL),
    (gen_random_uuid(), '2', (SELECT id FROM categories WHERE name='Números'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/2.JPG', NULL),
    (gen_random_uuid(), '3', (SELECT id FROM categories WHERE name='Números'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/3.JPG', NULL),
    (gen_random_uuid(), '4', (SELECT id FROM categories WHERE name='Números'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/4.JPG', NULL),
    (gen_random_uuid(), '5', (SELECT id FROM categories WHERE name='Números'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/5.JPG', NULL),
    (gen_random_uuid(), '6', (SELECT id FROM categories WHERE name='Números'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/6.JPG', NULL),
    (gen_random_uuid(), '7', (SELECT id FROM categories WHERE name='Números'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/7.JPG', NULL),
    (gen_random_uuid(), '8', (SELECT id FROM categories WHERE name='Números'), 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/8.JPG', NULL),
    (gen_random_uuid(), '9', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/9_Web.m4v'),
    (gen_random_uuid(), '10', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/10_Web.m4v'),
    (gen_random_uuid(), '11', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/11_Web.m4v'),
    (gen_random_uuid(), '12', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/12_Web.m4v'),
    (gen_random_uuid(), '13', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/13_Web.m4v'),
    (gen_random_uuid(), '14', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/14_Web.m4v'),
    (gen_random_uuid(), '15', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/15_Web.m4v'),
    (gen_random_uuid(), '16', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/16_Web.m4v'),
    (gen_random_uuid(), '17', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/17_Web.m4v'),
    (gen_random_uuid(), '18', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/18_Web.m4v'),
    (gen_random_uuid(), '19', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/19_Web.m4v'),
    (gen_random_uuid(), '20', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/20_Web.m4v'),
    (gen_random_uuid(), '30', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/30_Web.m4v'),
    (gen_random_uuid(), '40', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/40_Web.m4v'),
    (gen_random_uuid(), '50', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/50_Web.m4v'),
    (gen_random_uuid(), '60', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/60_Web.m4v'),
    (gen_random_uuid(), '70', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/70_Web.m4v'),
    (gen_random_uuid(), '80', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/80_Web.m4v'),
    (gen_random_uuid(), '90', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/90_Web.m4v'),
    (gen_random_uuid(), '100', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/100_Web.m4v'),
    (gen_random_uuid(), '200', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/200_Web.m4v'),
    (gen_random_uuid(), '300', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/300_Web.m4v'),
    (gen_random_uuid(), '400', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/400_Web.m4v'),
    (gen_random_uuid(), '500', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/500_Web.m4v'),
    (gen_random_uuid(), '600', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/600_Web.m4v'),
    (gen_random_uuid(), '700', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/700_Web.m4v'),
    (gen_random_uuid(), '800', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/800_Web.m4v'),
    (gen_random_uuid(), '900', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/900_Web.m4v'),
    (gen_random_uuid(), '1000', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/1000_Web.m4v'),
    (gen_random_uuid(), '1000000', (SELECT id FROM categories WHERE name='Números'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/1000000_Web.m4v');

-------------------------------------------------------
--  Personas Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Abuela', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Abuela_Web.m4v'),
    (gen_random_uuid(), 'Abuelo', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Abuelo_Web.m4v'),
    (gen_random_uuid(), 'Adulto', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Adulto_Web.m4v'),
    (gen_random_uuid(), 'Amante', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Amante_Web.m4v'),
    (gen_random_uuid(), 'Amiga', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Amiga_Web.m4v'),
    (gen_random_uuid(), 'Amigo', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Amigo_Web.m4v'),
    (gen_random_uuid(), 'Anciano', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Anciano_Web.m4v'),
    (gen_random_uuid(), 'Bebé', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bebe_Web.m4v'),
    (gen_random_uuid(), 'Bisabuela', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bisabuela_Web.m4v'),
    (gen_random_uuid(), 'Bisabuelo', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bisabuelo_Web.m4v'),
    (gen_random_uuid(), 'Bisnieta', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bisnieta_Web.m4v'),
    (gen_random_uuid(), 'Bisnieto', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bisnieto_Web.m4v'),
    (gen_random_uuid(), 'Ciego', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ciego_Web.m4v'),
    (gen_random_uuid(), 'Compañero', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Companero_Web.m4v'),
    (gen_random_uuid(), 'Cuñada', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cunada_Web.m4v'),
    (gen_random_uuid(), 'Cuñado', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cunado_Web.m4v'),
    (gen_random_uuid(), 'Divorciado', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Divorciado_Web.m4v'),
    (gen_random_uuid(), 'Esposa', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Esposa_Web.m4v'),
    (gen_random_uuid(), 'Esposo', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Esposo_Web.m4v'),
    (gen_random_uuid(), 'Hermana', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hermana_Web.m4v'),
    (gen_random_uuid(), 'Hermano', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hermano_Web.m4v'),
    (gen_random_uuid(), 'Hijastra', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hijastra_Web.m4v'),
    (gen_random_uuid(), 'Hijastro', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hijastro_Web.m4v'),
    (gen_random_uuid(), 'Hija', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hija_Web.m4v'),
    (gen_random_uuid(), 'Hijo', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hijo_Web.m4v'),
    (gen_random_uuid(), 'Hombre', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hombre_Web.m4v'),
    (gen_random_uuid(), 'Huerfano', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Huerfano_Web.m4v'),
    (gen_random_uuid(), 'Madrastra', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Madrastra_Web.m4v'),
    (gen_random_uuid(), 'Madrina', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Madrina_Web.m4v'),
    (gen_random_uuid(), 'Mamá', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mama_Web.m4v'),
    (gen_random_uuid(), 'Matrimonio', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Matrimonio_Web.m4v'),
    (gen_random_uuid(), 'Media hermana', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mediahermana_Web.m4v'),
    (gen_random_uuid(), 'Medio hermano', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mediohermano_Web.m4v'),
    (gen_random_uuid(), 'Mujer', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mujer_Web.m4v'),
    (gen_random_uuid(), 'Nieta', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nieta_Web.m4v'),
    (gen_random_uuid(), 'Nieto', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nieto_Web.m4v'),
    (gen_random_uuid(), 'Niña', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nina_Web.m4v'),
    (gen_random_uuid(), 'Niño', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nino_Web.m4v'),
    (gen_random_uuid(), 'Novia', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Novia_Web.m4v'),
    (gen_random_uuid(), 'Novio', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Novio_Web.m4v'),
    (gen_random_uuid(), 'Nuera', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nuera_Web.m4v'),
    (gen_random_uuid(), 'Oyente', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Oyente_Web.m4v'),
    (gen_random_uuid(), 'Padrastro', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Padrastro_Web.m4v'),
    (gen_random_uuid(), 'Padrino', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Padrino_Web.m4v'),
    (gen_random_uuid(), 'Papá', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Papa_Web.m4v'),
    (gen_random_uuid(), 'Pareja', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pareja_Web.m4v'),
    (gen_random_uuid(), 'Persona', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Persona_Web.m4v'),
    (gen_random_uuid(), 'Prima', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Prima_Web.m4v'),
    (gen_random_uuid(), 'Primo', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Primo_Web.m4v'),
    (gen_random_uuid(), 'Señora', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Senora_Web.m4v'),
    (gen_random_uuid(), 'Señorita', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Senorita_Web.m4v'),
    (gen_random_uuid(), 'Señor', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Senor_Web.m4v'),
    (gen_random_uuid(), 'Separado', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Separado_Web.m4v'),
    (gen_random_uuid(), 'Sobrina', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Sobrina_Web.m4v'),
    (gen_random_uuid(), 'Sobrino', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Sobrino_Web.m4v'),
    (gen_random_uuid(), 'Soltero', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Soltero_Web.m4v'),
    (gen_random_uuid(), 'Sordo', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Sordo_Web.m4v'),
    (gen_random_uuid(), 'Suegra', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Suegra_Web.m4v'),
    (gen_random_uuid(), 'Suegro', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Suegro_Web.m4v'),
    (gen_random_uuid(), 'Tia', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tia_Web.m4v'),
    (gen_random_uuid(), 'Tio', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tio_Web.m4v'),
    (gen_random_uuid(), 'Unión libre', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Unionlibre_Web.m4v'),
    (gen_random_uuid(), 'Vecino', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Vecino_Web.m4v'),
    (gen_random_uuid(), 'Viudo', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Viudo_Web.m4v'),
    (gen_random_uuid(), 'Yerno', (SELECT id FROM categories WHERE name='Personas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Yerno_Web.m4v');


-------------------------------------------------------
--  Preguntas Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Cómo', (SELECT id FROM categories WHERE name='Preguntas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Como_Web.m4v'),
    (gen_random_uuid(), 'Cuál', (SELECT id FROM categories WHERE name='Preguntas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cual_Web.m4v'),
    (gen_random_uuid(), 'Cuándo', (SELECT id FROM categories WHERE name='Preguntas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cuando_Web.m4v'),
    (gen_random_uuid(), 'Cuánto', (SELECT id FROM categories WHERE name='Preguntas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cuanto_Web.m4v'),
    (gen_random_uuid(), 'Dónde', (SELECT id FROM categories WHERE name='Preguntas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Donde_Web.m4v'),
    (gen_random_uuid(), 'Para qué', (SELECT id FROM categories WHERE name='Preguntas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Paraque_Web.m4v'),
    (gen_random_uuid(), 'Por qué', (SELECT id FROM categories WHERE name='Preguntas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Porque_Web.m4v'),
    (gen_random_uuid(), 'Qué', (SELECT id FROM categories WHERE name='Preguntas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Que_Web.m4v'),
    (gen_random_uuid(), 'Quién', (SELECT id FROM categories WHERE name='Preguntas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Quien_Web.m4v');

-------------------------------------------------------
--  Grámatica Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Abajo', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Abajo_Web.m4v'),
    (gen_random_uuid(), 'Aburrido', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Aburrido_Web.m4v'),
    (gen_random_uuid(), 'Accidente', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Accidente_Web.m4v'),
    (gen_random_uuid(), 'Adentro', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Adentro_Web.m4v'),
    (gen_random_uuid(), 'Afortunado', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Afortunado_Web.m4v'),
    (gen_random_uuid(), 'Alegre / Divertido', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Alegredivertido_Web.m4v'),
    (gen_random_uuid(), 'Algunos', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Algunos_Web.m4v'),
    (gen_random_uuid(), 'Alto', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Altoestatura_Web.m4v'),
    (gen_random_uuid(), 'Amable', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Amable_Web.m4v'),
    (gen_random_uuid(), 'Antes', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Antes_Web.m4v'),
    (gen_random_uuid(), 'Arriba', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Arriba_Web.m4v'),
    (gen_random_uuid(), 'Asustado', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Asustado_Web.m4v'),
    (gen_random_uuid(), 'Atención / Atento', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Atencionatento_Web.m4v'),
    (gen_random_uuid(), 'Baboso', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Baboso_Web.m4v'),
    (gen_random_uuid(), 'Bonito', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bonito_Web.m4v'),
    (gen_random_uuid(), 'Broma', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Broma_Web.m4v'),
    (gen_random_uuid(), 'Bueno', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bueno_Web.m4v'),
    (gen_random_uuid(), 'Cada', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cada_Web.m4v'),
    (gen_random_uuid(), 'Caliente', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Caliente_Web.m4v'),
    (gen_random_uuid(), 'Cansado', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cansado_Web.m4v'),
    (gen_random_uuid(), 'Cariñoso', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Carino_Web.m4v'),
    (gen_random_uuid(), 'Celoso', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Celoso_Web.m4v'),
    (gen_random_uuid(), 'Chaparro', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Chaparro_Web.m4v'),
    (gen_random_uuid(), 'Chistoso', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Chistoso_Web.m4v'),
    (gen_random_uuid(), 'Cobarde', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cobarde_Web.m4v'),
    (gen_random_uuid(), 'Contento', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Contento_Web.m4v'),
    (gen_random_uuid(), 'Curioso', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Curioso_Web.m4v'),
    (gen_random_uuid(), 'Débil', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Debil_Web.m4v'),
    (gen_random_uuid(), 'Decente', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Decente_Web.m4v'),
    (gen_random_uuid(), 'Delgado', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Delgado_Web.m4v'),
    (gen_random_uuid(), 'Despacio', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Despacio_Web.m4v'),
    (gen_random_uuid(), 'Diferente', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Diferente_Web.m4v'),
    (gen_random_uuid(), 'Difícil', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Dificil_Web.m4v'),
    (gen_random_uuid(), 'Diploma', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Diploma_Web.m4v'),
    (gen_random_uuid(), 'Duda', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Duda_Web.m4v'),
    (gen_random_uuid(), 'Egoísta', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Egoista_Web.m4v'),
    (gen_random_uuid(), 'Ejemplo', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ejemplo_Web.m4v'),
    (gen_random_uuid(), 'Ejercicio', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ejercicio_Web.m4v'),
    (gen_random_uuid(), 'Enojado', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Enojado_Web.m4v'),
    (gen_random_uuid(), 'Envidia', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Envidia_Web.m4v'),
    (gen_random_uuid(), 'Especial', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Especial_Web.m4v'),
    (gen_random_uuid(), 'Fácil', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Facil_Web.m4v'),
    (gen_random_uuid(), 'Falso', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Falso_Web.m4v'),
    (gen_random_uuid(), 'Feliz', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Feliz_Web.m4v'),
    (gen_random_uuid(), 'Feo', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Feo_Web.m4v'),
    (gen_random_uuid(), 'Flojo', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Flojo_Web.m4v'),
    (gen_random_uuid(), 'Fuerte', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Fuerte_Web.m4v'),
    (gen_random_uuid(), 'Fuerza', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Fuerza_Web.m4v'),
    (gen_random_uuid(), 'Gordo', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gordo_Web.m4v'),
    (gen_random_uuid(), 'Gratis', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gratis_Web.m4v'),
    (gen_random_uuid(), 'Grosero', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Grosero_Web.m4v'),
    (gen_random_uuid(), 'Guapo', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Guapo_Web.m4v'),
    (gen_random_uuid(), 'Hambre', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hambre_Web.m4v'),
    (gen_random_uuid(), 'Historia', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Historia_Web.m4v'),
    (gen_random_uuid(), 'Humilde', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Humilde_Web.m4v'),
    (gen_random_uuid(), 'Importante', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Importante_Web.m4v'),
    (gen_random_uuid(), 'Inteligente', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Inteligente_Web.m4v'),
    (gen_random_uuid(), 'Jamás', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Jamas_Web.m4v'),
    (gen_random_uuid(), 'Junta', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Junta_Web.m4v'),
    (gen_random_uuid(), 'Junto', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Junto_Web.m4v'),
    (gen_random_uuid(), 'Lejos', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Lejos_Web.m4v'),
    (gen_random_uuid(), 'Libre', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Libre_Web.m4v'),
    (gen_random_uuid(), 'Loco', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Loco_Web.m4v'),
    (gen_random_uuid(), 'LSM', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Lsm_Web.m4v'),
    (gen_random_uuid(), 'Malo', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Malo_Web.m4v'),
    (gen_random_uuid(), 'Más', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mas_Web.m4v'),
    (gen_random_uuid(), 'Mejor', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mejor_Web.m4v'),
    (gen_random_uuid(), 'Miedo', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Miedo_Web.m4v'),
    (gen_random_uuid(), 'Necio', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Necio_Web.m4v'),
    (gen_random_uuid(), 'No', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/No_Web.m4v'),
    (gen_random_uuid(), 'Nuevo', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nuevo_Web.m4v'),
    (gen_random_uuid(), 'Nunca', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nunca_Web.m4v'),
    (gen_random_uuid(), 'Ojalá', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ojala_Web.m4v'),
    (gen_random_uuid(), 'Paciencia', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Paciencia_Web.m4v'),
    (gen_random_uuid(), 'Peor', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Peor_Web.m4v'),
    (gen_random_uuid(), 'Pero', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pero_Web.m4v'),
    (gen_random_uuid(), 'Pobre', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pobre_Web.m4v'),
    (gen_random_uuid(), 'Presumido', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Presumido_Web.m4v'),
    (gen_random_uuid(), 'Problema', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Problema_Web.m4v'),
    (gen_random_uuid(), 'Rápido / Pronto', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Rapidopronto_Web.m4v'),
    (gen_random_uuid(), 'Raro', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Raro_Web.m4v'),
    (gen_random_uuid(), 'Secreto', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Secreto_Web.m4v'),
    (gen_random_uuid(), 'Seña propia', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Senaproipa_Web.m4v'),
    (gen_random_uuid(), 'Señas', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Senas_Web.m4v'),
    (gen_random_uuid(), 'Sí', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Si_Web.m4v'),
    (gen_random_uuid(), 'Sucio', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Sucio_Web.m4v'),
    (gen_random_uuid(), 'Suerte', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Suerte_Web.m4v'),
    (gen_random_uuid(), 'Todo', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Todo_Web.m4v'),
    (gen_random_uuid(), 'Tonto', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tonto_Web.m4v'),
    (gen_random_uuid(), 'Travieso', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Travieso_Web.m4v'),
    (gen_random_uuid(), 'Triste', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Triste_Web.m4v'),
    (gen_random_uuid(), 'Verdad', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Verdad_Web.m4v'),
    (gen_random_uuid(), 'Vergüenza', (SELECT id FROM categories WHERE name='Gramática'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Verguenza_Web.m4v');

-------------------------------------------------------
--  Pronombres Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Él', (SELECT id FROM categories WHERE name='Pronombres'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/El_Web.m4v'),
    (gen_random_uuid(), 'Ella', (SELECT id FROM categories WHERE name='Pronombres'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ella_Web.m4v'),
    (gen_random_uuid(), 'Ellos', (SELECT id FROM categories WHERE name='Pronombres'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ellos_Web.m4v'),
    (gen_random_uuid(), 'Nosotros', (SELECT id FROM categories WHERE name='Pronombres'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nosotros_Web.m4v'),
    (gen_random_uuid(), 'Tú', (SELECT id FROM categories WHERE name='Pronombres'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tu_Web.m4v'),
    (gen_random_uuid(), 'Ustedes', (SELECT id FROM categories WHERE name='Pronombres'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ustedes_Web.m4v'),
    (gen_random_uuid(), 'Yo', (SELECT id FROM categories WHERE name='Pronombres'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Yo_Web.m4v');

-------------------------------------------------------
--  Oficios Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Abogado', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Abogado_Web.m4v'),
    (gen_random_uuid(), 'Actor', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Actor_Web.m4v'),
    (gen_random_uuid(), 'Albañil', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Albanil_Web.m4v'),
    (gen_random_uuid(), 'Alumno', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Alumno_Web.m4v'),
    (gen_random_uuid(), 'Arquitecto', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Arquitecto_Web.m4v'),
    (gen_random_uuid(), 'Bombero', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bombero_Web.m4v'),
    (gen_random_uuid(), 'Carpintero', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Carpintero_Web.m4v'),
    (gen_random_uuid(), 'Chofer', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Chofer_Web.m4v'),
    (gen_random_uuid(), 'Dentista', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Dentista_Web.m4v'),
    (gen_random_uuid(), 'Diputado', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Diputado_Web.m4v'),
    (gen_random_uuid(), 'Director', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Director_Web.m4v'),
    (gen_random_uuid(), 'Enfermera', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Enfermera_Web.m4v'),
    (gen_random_uuid(), 'Gobernador', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gobernador_Web.m4v'),
    (gen_random_uuid(), 'Guardia', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Guardia_Web.m4v'),
    (gen_random_uuid(), 'Ingeniero', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ingeniero_Web.m4v'),
    (gen_random_uuid(), 'Intérprete', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Interprete_Web.m4v'),
    (gen_random_uuid(), 'Jefe', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Jefe_Web.m4v'),
    (gen_random_uuid(), 'Licenciado', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Licenciado_Web.m4v'),
    (gen_random_uuid(), 'Líder', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Lider_Web.m4v'),
    (gen_random_uuid(), 'Maestro', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Maestro_Web.m4v'),
    (gen_random_uuid(), 'Mecánico', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mecanico_Web.m4v'),
    (gen_random_uuid(), 'Médico', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Medico_Web.m4v'),
    (gen_random_uuid(), 'Mesero', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mesero_Web.m4v'),
    (gen_random_uuid(), 'Policía', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Policia_Web.m4v'),
    (gen_random_uuid(), 'Presidente', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Presidente_Web.m4v'),
    (gen_random_uuid(), 'Profesor', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Profesor_Web.m4v'),
    (gen_random_uuid(), 'Psicólogo', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Psicologo_Web.m4v'),
    (gen_random_uuid(), 'Senador', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Senador_Web.m4v'),
    (gen_random_uuid(), 'Soldado', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Soldado_Web.m4v'),
    (gen_random_uuid(), 'Taxista', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Taxista_Web.m4v'),
    (gen_random_uuid(), 'Técnico', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tecnico_Web.m4v'),
    (gen_random_uuid(), 'Vendedor', (SELECT id FROM categories WHERE name='Oficios'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Vendedor_Web.m4v');

-------------------------------------------------------
--  Ropa Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Abrigo', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Abrigo_Web.m4v'),
    (gen_random_uuid(), 'Brasier', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Brasier_Web.m4v'),
    (gen_random_uuid(), 'Bufanda', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bufanda_Web.m4v'),
    (gen_random_uuid(), 'Calzon', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Calzon_Web.m4v'),
    (gen_random_uuid(), 'Camisa', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Camisa_Web.m4v'),
    (gen_random_uuid(), 'Corbata', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Corbata_Web.m4v'),
    (gen_random_uuid(), 'Falda', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Falda_Web.m4v'),
    (gen_random_uuid(), 'Medias', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Medias_Web.m4v'),
    (gen_random_uuid(), 'Pantalon', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pantalon_Web.m4v'),
    (gen_random_uuid(), 'Tenis', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tenis_Web.m4v'),
    (gen_random_uuid(), 'Vestido', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Vestido_Web.m4v'),
    (gen_random_uuid(), 'Zapatos', (SELECT id FROM categories WHERE name='Ropa'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Zapatos_Web.m4v');

-------------------------------------------------------
--  Saludos Cortesias Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Adios', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Adios_Web.m4v'),
    (gen_random_uuid(), 'Bien', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bien_Web.m4v'),
    (gen_random_uuid(), 'Buenasnoches', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Buenasnoches_Web.m4v'),
    (gen_random_uuid(), 'Buenastardes', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Buenastardes_Web.m4v'),
    (gen_random_uuid(), 'Buenosdias', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Buenosdias_Web.m4v'),
    (gen_random_uuid(), 'Comoestas', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Comoestas_Web.m4v'),
    (gen_random_uuid(), 'Comotellamas', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Comotellamas_Web.m4v'),
    (gen_random_uuid(), 'Denada', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Denada_Web.m4v'),
    (gen_random_uuid(), 'Gracias', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gracias_Web.m4v'),
    (gen_random_uuid(), 'Gustodeconocerte', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gustodeconocerte_Web.m4v'),
    (gen_random_uuid(), 'Hola', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hola_Web.m4v'),
    (gen_random_uuid(), 'Mal', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mal_Web.m4v'),
    (gen_random_uuid(), 'Masomenos', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Masomenos_Web.m4v'),
    (gen_random_uuid(), 'Nosvemos', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nosvemos_Web.m4v'),
    (gen_random_uuid(), 'Perdon', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Perdon_Web.m4v'),
    (gen_random_uuid(), 'Porfavor', (SELECT id FROM categories WHERE name='Saludos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Porfavor_Web.m4v');

-------------------------------------------------------
--  Tiempo Query
-------------------------------------------------------
INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Ahora', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ahora_Web.m4v'),
    (gen_random_uuid(), 'Ahorita', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ahorita_Web.m4v'),
    (gen_random_uuid(), 'Aire', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Aire_Web.m4v'),
    (gen_random_uuid(), 'Año', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ano_Web.m4v'),
    (gen_random_uuid(), 'Antier', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Antier_Web.m4v'),
    (gen_random_uuid(), 'A veces', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Aveces_Web.m4v'),
    (gen_random_uuid(), 'Ayer', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ayer_Web.m4v'),
    (gen_random_uuid(), 'Calendario', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Calendario_Web.m4v'),
    (gen_random_uuid(), 'Calor', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Calor_Web.m4v'),
    (gen_random_uuid(), 'Cumpleaños', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cumpleanos_Web.m4v'),
    (gen_random_uuid(), 'Después', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Despues_Web.m4v'),
    (gen_random_uuid(), 'Día', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Dia_Web.m4v'),
    (gen_random_uuid(), 'Edad', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Edad_Web.m4v'),
    (gen_random_uuid(), 'Fecha', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Fecha_Web.m4v'),
    (gen_random_uuid(), 'Frío', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Frio_Web.m4v'),
    (gen_random_uuid(), 'Futuro', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Futuro_Web.m4v'),
    (gen_random_uuid(), 'Hasta', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hasta_Web.m4v'),
    (gen_random_uuid(), 'Hora', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hora_Web.m4v'),
    (gen_random_uuid(), 'Hoy', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hoy_Web.m4v'),
    (gen_random_uuid(), 'Invierno', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Invierno_Web.m4v'),
    (gen_random_uuid(), 'Mañana', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Manana_Web.m4v'),
    (gen_random_uuid(), 'Mediodía', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mediodia_Web.m4v'),
    (gen_random_uuid(), 'Mes', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mes_Web.m4v'),
    (gen_random_uuid(), 'Mientras', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mientras_Web.m4v'),
    (gen_random_uuid(), 'Minuto', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Minuto_Web.m4v'),
    (gen_random_uuid(), 'Noche', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Noche_Web.m4v'),
    (gen_random_uuid(), 'Otoño', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Otono_Web.m4v'),
    (gen_random_uuid(), 'Otra vez', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Otravez_Web.m4v'),
    (gen_random_uuid(), 'Otro', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Otro_Web.m4v'),
    (gen_random_uuid(), 'Pasado', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pasado_Web.m4v'),
    (gen_random_uuid(), 'Presente', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Presente_Web.m4v'),
    (gen_random_uuid(), 'Primavera', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Primavera_Web.m4v'),
    (gen_random_uuid(), 'Primera vez', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Primeravez_Web.m4v'),
    (gen_random_uuid(), 'Próximo', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Proximo_Web.m4v'),
    (gen_random_uuid(), 'Semana', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Semana_Web.m4v'),
    (gen_random_uuid(), 'Siempre', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Siempre_Web.m4v'),
    (gen_random_uuid(), 'Tarde', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tarde_Web.m4v'),
    (gen_random_uuid(), 'Temprano', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Temprano_Web.m4v'),
    (gen_random_uuid(), 'Una vez', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Unavez_Web.m4v'),
    (gen_random_uuid(), 'Verano', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Verano_Web.m4v'),
    (gen_random_uuid(), 'Viento', (SELECT id FROM categories WHERE name='Tiempo'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Viento_Web.m4v');

-------------------------------------------------------
--  Transporte Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Avion', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Avion_Web.m4v'),
    (gen_random_uuid(), 'Barco', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Barco_Web.m4v'),
    (gen_random_uuid(), 'Bicicleta', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Bicicleta_Web.m4v'),
    (gen_random_uuid(), 'Camion', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Camion_Web.m4v'),
    (gen_random_uuid(), 'Carro', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Carro_Web.m4v'),
    (gen_random_uuid(), 'Cdeautobuses', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cdeautobuses_Web.m4v'),
    (gen_random_uuid(), 'Helicoptero', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Helicoptero_Web.m4v'),
    (gen_random_uuid(), 'Metro', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Metro_Web.m4v'),
    (gen_random_uuid(), 'Motocicleta', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Motocicleta_Web.m4v'),
    (gen_random_uuid(), 'Taxi', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Taxi_Web.m4v'),
    (gen_random_uuid(), 'Transporte', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Transporte_Web.m4v'),
    (gen_random_uuid(), 'Tren', (SELECT id FROM categories WHERE name='Transporte'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Tren_Web.m4v');

-------------------------------------------------------
--  verbos Comunes Query
-------------------------------------------------------
INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Aprender', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Aprender_Web.m4v'),
    (gen_random_uuid(), 'Avisar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Avisar_Web.m4v'),
    (gen_random_uuid(), 'Ayudar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ayudar_Web.m4v'),
    (gen_random_uuid(), 'Comer', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Comer_Web.m4v'),
    (gen_random_uuid(), 'Comprar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Comprar_Web.m4v'),
    (gen_random_uuid(), 'Creer', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Creer_Web.m4v'),
    (gen_random_uuid(), 'Cuidar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cuidar_Web.m4v'),
    (gen_random_uuid(), 'Dar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Dar_Web.m4v'),
    (gen_random_uuid(), 'Decir', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Decir_Web.m4v'),
    (gen_random_uuid(), 'Descansar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Descansar_Web.m4v'),
    (gen_random_uuid(), 'Dormir', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Dormir_Web.m4v'),
    (gen_random_uuid(), 'Empezar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Empezar_Web.m4v'),
    (gen_random_uuid(), 'Enseñar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ensenar_Web.m4v'),
    (gen_random_uuid(), 'Entender', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Entender_Web.m4v'),
    (gen_random_uuid(), 'Escribir', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Escribir_Web.m4v'),
    (gen_random_uuid(), 'Esperar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Esperar_Web.m4v'),
    (gen_random_uuid(), 'Estudiar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Estudiar_Web.m4v'),
    (gen_random_uuid(), 'Explicar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Explicar_Web.m4v'),
    (gen_random_uuid(), 'Hablar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hablar_Web.m4v'),
    (gen_random_uuid(), 'Hacer', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hacer_Web.m4v'),
    (gen_random_uuid(), 'Jugar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Jugar_Web.m4v'),
    (gen_random_uuid(), 'Limpiar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Limpiar_Web.m4v'),
    (gen_random_uuid(), 'Necesitar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Necesitar_Web.m4v'),
    (gen_random_uuid(), 'Olvidar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Olvidar_Web.m4v'),
    (gen_random_uuid(), 'Pagar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pagar_Web.m4v'),
    (gen_random_uuid(), 'Pensar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pensar_Web.m4v'),
    (gen_random_uuid(), 'Perder', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Perder_Web.m4v'),
    (gen_random_uuid(), 'Platicar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Platicar_Web.m4v'),
    (gen_random_uuid(), 'Poder', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Poder_Web.m4v'),
    (gen_random_uuid(), 'Preguntar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Preguntar_Web.m4v'),
    (gen_random_uuid(), 'Sentar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Sentar_Web.m4v'),
    (gen_random_uuid(), 'Terminar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Terminar_Web.m4v'),
    (gen_random_uuid(), 'Trabajar', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Trabajar_Web.m4v'),
    (gen_random_uuid(), 'Vender', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Vender_Web.m4v'),
    (gen_random_uuid(), 'Ver', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ver_Web.m4v'),
    (gen_random_uuid(), 'Vivir', (SELECT id FROM categories WHERE name='Verbos Comunes'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Vivir_Web.m4v');

-------------------------------------------------------
--  Verbos Narrativos Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Conocer', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Conocer_Web.m4v'),
    (gen_random_uuid(), 'Entender', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Entender_Web.m4v'),
    (gen_random_uuid(), 'Gustar', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gustar_Web.m4v'),
    (gen_random_uuid(), 'Haber', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Haber_Web.m4v'),
    (gen_random_uuid(), 'No conocer', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Noconocer_Web.m4v'),
    (gen_random_uuid(), 'No entender', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Noentender_Web.m4v'),
    (gen_random_uuid(), 'No gustar', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nogustar_Web.m4v'),
    (gen_random_uuid(), 'No haber', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nohaber_Web.m4v'),
    (gen_random_uuid(), 'No poder', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nopoder_Web.m4v'),
    (gen_random_uuid(), 'No querer', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Noquerer_Web.m4v'),
    (gen_random_uuid(), 'No saber', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nosaber_Web.m4v'),
    (gen_random_uuid(), 'No servir', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Noservir_Web.m4v'),
    (gen_random_uuid(), 'Poder', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Poder_Web.m4v'),
    (gen_random_uuid(), 'Querer', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Querer_Web.m4v'),
    (gen_random_uuid(), 'Saber', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Saber_Web.m4v'),
    (gen_random_uuid(), 'Servir', (SELECT id FROM categories WHERE name='Verbos Narrativos'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Servir_Web.m4v');

-------------------------------------------------------
--  Verduras Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Aguacate', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Aguacate_Web.m4v'),
    (gen_random_uuid(), 'Ajo', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Ajo_Web.m4v'),
    (gen_random_uuid(), 'Betabel', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Betabel_Web.m4v'),
    (gen_random_uuid(), 'Calabacita', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Calabacita_Web.m4v'),
    (gen_random_uuid(), 'Calabaza', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Calabaza_Web.m4v'),
    (gen_random_uuid(), 'Camote', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Camote_Web.m4v'),
    (gen_random_uuid(), 'Cebolla', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Cebolla_Web.m4v'),
    (gen_random_uuid(), 'Chicharo', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Chicharo_Web.m4v'),
    (gen_random_uuid(), 'Chile', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Chile_Web.m4v'),
    (gen_random_uuid(), 'Elote', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Elote_Web.m4v'),
    (gen_random_uuid(), 'Frijol', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Frijol_Web.m4v'),
    (gen_random_uuid(), 'Hongo', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Hongo_Web.m4v'),
    (gen_random_uuid(), 'Jitomate', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Jitomate_Web.m4v'),
    (gen_random_uuid(), 'Lechuga', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Lechuga_Web.m4v'),
    (gen_random_uuid(), 'Nopal', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Nopal_Web.m4v'),
    (gen_random_uuid(), 'Papa', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Papa_Web.m4v'),
    (gen_random_uuid(), 'Pepino', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Pepino_Web.m4v'),
    (gen_random_uuid(), 'Zanahoria', (SELECT id FROM categories WHERE name='Verduras'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Zanahoria_Web.m4v');

-------------------------------------------------------
-- Exercises Query
----- Abecedario Query

INSERT INTO exercises (id, category_id, type, prompt, correct_sign_id, structure_type) VALUES
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra B?', (SELECT id FROM signs WHERE name='B'), 'text-image'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra C?', (SELECT id FROM signs WHERE name='C'), 'text-image'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra D?', (SELECT id FROM signs WHERE name='D'), 'text-image'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿A qué letra corresponde este signo?', (SELECT id FROM signs WHERE name='E'), 'image-text'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿A qué letra corresponde este signo?', (SELECT id FROM signs WHERE name='F'), 'image-text'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra G?', (SELECT id FROM signs WHERE name='G'), 'text-image'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra H?', (SELECT id FROM signs WHERE name='H'), 'text-image'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra I?', (SELECT id FROM signs WHERE name='I'), 'text-image'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿A qué letra corresponde este signo?', (SELECT id FROM signs WHERE name='J'), 'image-text'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿A qué letra corresponde este signo?', (SELECT id FROM signs WHERE name='K'), 'image-text'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra L?', (SELECT id FROM signs WHERE name='L'), 'text-image'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra M?', (SELECT id FROM signs WHERE name='M'), 'text-image'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿A qué letra corresponde este signo?', (SELECT id FROM signs WHERE name='N'), 'image-text'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿A qué letra corresponde este signo?', (SELECT id FROM signs WHERE name='O'), 'image-text'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra P?', (SELECT id FROM signs WHERE name='P'), 'text-image'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra Q?', (SELECT id FROM signs WHERE name='Q'), 'text-image'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra R?', (SELECT id FROM signs WHERE name='R'), 'text-image');

---- Animales Query
INSERT INTO exercises (id, category_id, type, prompt, correct_sign_id, structure_type) VALUES
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Animales'), 'multiple_choice', '¿Cuál es el signo para la palabra Abeja?', (SELECT id FROM signs WHERE name='Abeja'), 'text-image'),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Animales'), 'multiple_choice', '¿A que animal corresponde este signo?', (SELECT id FROM signs WHERE name='Águila'), 'image-text');

-------------------------------------------------------
-- Stats Query
-------------------------------------------------------

INSERT INTO stats (name, description, category, has_limit, default_max) VALUES
    ('coins', 'Monedas virtuales ganadas por completar actividades y canjear por recompensas', 'gamificacion', TRUE, 100000),
    ('exp', 'Puntos de experiencia para medir progreso y calcular nivel', 'progreso', FALSE, NULL),
    ('exercises_completed', 'Conteo total de ejercicios completados por el usuario', 'progreso', FALSE, NULL),
    ('signs_viewed', 'Cantidad de signos vistos (uso para progreso y filtrado de ejercicios)', 'progreso', FALSE, NULL);

-------------------------------------------------------
-- Medals Query
-------------------------------------------------------

INSERT INTO medals (id, name, description, icon_url) VALUES
    (gen_random_uuid(), 'Tlaolli', '3 días de racha.', 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/M_Tlaolli.png'),
    (gen_random_uuid(), 'Jade', '7 días de racha.', 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/M_Jade.png'),
    (gen_random_uuid(), 'Obsidiana', 'Practica 5 señas', 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/M_Obsidiana.png'),
    (gen_random_uuid(), 'Turquesa', 'Obtén 100 de XP.', 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/M_Turquesa.png'),
    (gen_random_uuid(), 'Quetzal', 'Completa 3 ejercicios', 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/M_Quetzal.png'),
    (gen_random_uuid(), 'Códice dorado', 'Completa 5 ejercicios.', 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/M_Oro.png');


-------------------------------------------------------
-- Roles Dump
-------------------------------------------------------
INSERT INTO roles (id, name, description) VALUES
    (gen_random_uuid(), 'admin', 'Administrador con acceso completo a todas las funcionalidades y configuraciones del sistema.'),
    (gen_random_uuid(), 'superadmin', 'Superadministrador con privilegios elevados para gestionar administradores y supervisar el sistema en su totalidad.')

INSERT INTO roles (id, name, description) VALUES
(gen_random_uuid(), 'teacher', 'Maestro o Maestra, responsable de la creación y gestión de contenido educativo.');