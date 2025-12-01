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
    (gen_random_uuid(), 'Mango', (SELECT id FROM categories WHERE name='Frutas'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Mango_Web.m4v');

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
    (gen_random_uuid(), 'Gas', (SELECT id FROM categories WHERE name='Hogar'), NULL, 'https://pub-05700fc259bc4e839552241871f5e896.r2.dev/Gas_Web.m4v');

-------------------------------------------------------
-- Lugares Query
-------------------------------------------------------

INSERT INTO "signs" ("id", "name", "category_id", "image_url", "video_url") VALUES
    (gen_random_uuid(), 'Antro', (SELECT id FROM categories WHERE name='Lugares'), NULL, NULL),
    (gen_random_uuid(), 'Banco', (SELECT id FROM categories WHERE name='Lugares'), NULL, NULL),
    (gen_random_uuid(), 'Calle', (SELECT id FROM categories WHERE name='Lugares'), NULL, NULL),
    (gen_random_uuid(), 'Cantina', (SELECT id FROM categories WHERE name='Lugares'), NULL, NULL),
    (gen_random_uuid(), 'Casa', (SELECT id FROM categories WHERE name='Lugares'), NULL, NULL),
    (gen_random_uuid(), 'Centro', (SELECT id FROM categories WHERE name='Lugares'), NULL, NULL),
    (gen_random_uuid(), 'Cine', (SELECT id FROM categories WHERE name='Lugares'), NULL, NULL),
    (gen_random_uuid(), 'Ciudad', (SELECT id FROM categories WHERE name='Lugares'), NULL, NULL),
    (gen_random_uuid(), 'Edificio', (SELECT id FROM categories WHERE name='Lugares'), NULL, NULL),
    (gen_random_uuid(), 'Escuela', (SELECT id FROM categories WHERE name='Lugares'), NULL, NULL);

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