INSERT INTO stats (name, description, category, has_limit, default_max) VALUES
('coins', 'Monedas virtuales ganadas por completar actividades y canjear por recompensas', 'gamificacion', TRUE, 100000),
('exp', 'Puntos de experiencia para medir progreso y calcular nivel', 'progreso', FALSE, NULL),
('exercises_completed', 'Conteo total de ejercicios completados por el usuario', 'progreso', FALSE, NULL),
('signs_viewed', 'Cantidad de signos vistos (uso para progreso y filtrado de ejercicios)', 'progreso', FALSE, NULL);