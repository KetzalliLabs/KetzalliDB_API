INSERT INTO exercises (id, category_id, type, prompt, correct_sign_id) VALUES
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Números'), 'multiple_choice', '¿Cuál es el signo para el número 1?', (SELECT id FROM signs WHERE name='1')),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Colores'), 'multiple_choice', '¿Cuál es el signo para el color Rojo?', (SELECT id FROM signs WHERE name='Rojo')),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Frutas'), 'multiple_choice', '¿Cuál es el signo para la fruta Mango?', (SELECT id FROM signs WHERE name='Mango')),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Lugares'), 'multiple_choice', '¿Cuál es el signo para el lugar Casa?', (SELECT id FROM signs WHERE name='Casa')),
    (gen_random_uuid(), (SELECT id FROM categories WHERE name='Hogar'), 'multiple_choice', '¿Cuál es el signo para el objeto Cama?', (SELECT id FROM signs WHERE name='Cama'));