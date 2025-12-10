
INSERT INTO countries (name, code, created_by)
VALUES
('México', 'MX', 'admin'),
('Colombia', 'CO', 'admin'),
('Argentina', 'AR', 'admin'),
('Estados Unidos', 'US', 'admin'),
('España', 'ES', 'admin');


INSERT INTO users (name, email, birth_date, country_id, created_by)
VALUES
('Juan Pérez', 'juanp@example.com', '1999-04-10', 1, 'admin'),
('María López', 'marial@example.com', '2002-11-22', 2, 'admin'),
('Carlos Ruiz', 'carlosr@example.com', '1995-06-15', 3, 'admin'),
('Ana Torres', 'anat@example.com', '1988-01-05', 4, 'admin'),
('Luis García', 'luisg@example.com', '2000-03-08', 1, 'admin');


INSERT INTO subscription_plans (name, monthly_price, max_members, created_by)
VALUES
('free', 0.00, NULL, 'admin'),
('premium', 149.00, NULL, 'admin'),
('familiar', 249.00, 5, 'admin'),
('estudiantil', 79.00, NULL, 'admin'),
('premium_plus', 199.00, NULL, 'admin');


INSERT INTO user_subscriptions (user_id, plan_id, start_date, status, created_by)
VALUES
(1, 2, '2025-01-01', 'active', 'admin'),
(2, 1, '2025-01-10', 'active', 'admin'),
(3, 3, '2025-02-01', 'active', 'admin'),
(4, 4, '2025-03-01', 'cancelled', 'admin'),
(5, 2, '2025-02-15', 'active', 'admin');


INSERT INTO subscription_payments (user_subscription_id, payment_date, amount, created_by)
VALUES
(1, '2025-01-01', 149.00, 'admin'),
(3, '2025-02-01', 249.00, 'admin'),
(5, '2025-02-15', 149.00, 'admin'),
(1, '2025-02-01', 149.00, 'admin'),
(4, '2025-03-01', 79.00, 'admin');


INSERT INTO artists (name, country_id, created_by)
VALUES
('Bad Bunny', 4, 'admin'),
('Karol G', 2, 'admin'),
('Duki', 3, 'admin'),
('Feid', 2, 'admin'),
('Peso Pluma', 1, 'admin');


INSERT INTO albums (artist_id, title, release_date, created_by)
VALUES
(1, 'Un Verano Sin Ti', '2022-05-06', 'admin'),
(2, 'Mañana Será Bonito', '2023-02-24', 'admin'),
(3, 'Desde el Fin del Mundo', '2021-04-30', 'admin'),
(4, 'Feliz Cumpleaños Ferxxo', '2022-09-08', 'admin'),
(5, 'Génesis', '2023-06-22', 'admin');


INSERT INTO genres (name, created_by)
VALUES
('Reggaeton', 'admin'),
('Trap Latino', 'admin'),
('Pop Urbano', 'admin'),
('Corridos Tumbados', 'admin'),
('Electrónica', 'admin');


INSERT INTO songs (album_id, genre_id, title, duration_seconds, created_by)
VALUES
(1, 1, 'Tití Me Preguntó', 240, 'admin'),
(2, 3, 'Provenza', 215, 'admin'),
(3, 2, 'Malbec', 200, 'admin'),
(4, 3, 'Normal', 230, 'admin'),
(5, 4, 'Ella Baila Sola', 210, 'admin');


INSERT INTO listens (user_id, song_id, listen_datetime, seconds_played, created_by)
VALUES
(1, 1, '2025-01-05 10:00:00', 200, 'admin'),
(2, 2, '2025-01-10 15:22:00', 215, 'admin'),
(3, 3, '2025-02-01 08:11:00', 180, 'admin'),
(4, 4, '2025-03-03 20:30:00', 230, 'admin'),
(5, 5, '2025-02-20 19:00:00', 210, 'admin');
