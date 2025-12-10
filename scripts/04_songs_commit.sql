

START TRANSACTION;

INSERT INTO songs (album_id, genre_id, title, duration_seconds, created_by)
VALUES
(1, 1, 'Me Porto Bonito', 200, 'admin'),
(1, 1, 'Después de la Playa', 240, 'admin'),
(2, 3, 'Mientras Me Curo del Cora', 210, 'admin'),
(2, 3, 'Besties', 220, 'admin'),
(3, 2, 'Goteo', 230, 'admin'),
(3, 2, 'Pintao', 250, 'admin'),
(4, 3, 'Vacaxiones', 260, 'admin'),
(4, 3, 'Hey Mor', 245, 'admin'),
(5, 4, 'PRC', 200, 'admin'),
(5, 4, 'Rubicon', 215, 'admin');

COMMIT;
