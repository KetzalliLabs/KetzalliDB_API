-- Ejemplo de creación de registros 

INSERT INTO exercises (id, category_id, type, prompt, correct_sign_id)
VALUES (gen_random_uuid(), (SELECT id FROM categories WHERE name='Abecedario'), 'multiple_choice', '¿Cuál es el signo para la letra "A"?', (SELECT id FROM signs WHERE name='A'));

-- Consulta para obtener un ejercicio de opción múltiple con opciones correctas e incorrectas en el backend
1️⃣ Obtener el ejercicio
SELECT * FROM exercises WHERE id = $exercise_id;

2️⃣ Traer el signo correcto
SELECT * FROM signs WHERE id = correct_sign_id;

3️⃣ Traer signos incorrectos al azar
SELECT * FROM signs
WHERE id <> $correct_sign_id AND category_id = $category_id
ORDER BY RANDOM()
LIMIT 3;

-- Consulta para obtener un ejercicio de opción múltiple 
1️⃣ Obtener el ejercicio
SELECT * FROM exercises WHERE id = 'b0c0a085-8bde-4456-b905-c250e1ab2684';

2️⃣ Traer el signo correcto
SELECT * FROM signs WHERE id = '396f25c7-1c08-41a5-8fa8-5a8b3fbe4e7f';

3️⃣ Traer signos incorrectos al azar
SELECT * FROM signs
WHERE id <> '396f25c7-1c08-41a5-8fa8-5a8b3fbe4e7f' AND category_id = (SELECT id FROM categories WHERE name='Abecedario')
ORDER BY RANDOM()
LIMIT 3;