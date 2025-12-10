

START TRANSACTION;

INSERT INTO songs (album_id, genre_id, title, duration_seconds, created_by)
VALUES
(1, 1, 'Canción Valida 1', 200, 'admin'),
(2, 3, 'Canción Valida 2', 210, 'admin'),
(3, 2, 'Canción Valida 3', 240, 'admin'),
(4, 3, 'Canción Valida 4', 230, 'admin'),

(5, 4, 'Canción NO Valida (muy corta)', 120, 'admin');


ROLLBACK;
