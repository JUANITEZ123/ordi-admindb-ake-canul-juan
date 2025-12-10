

SELECT 
    u.user_id,
    u.name AS user_name,
    SUM(l.seconds_played) AS total_seconds,
    ROUND(SUM(l.seconds_played) / 60, 2) AS total_minutes
FROM listens l
JOIN users u ON u.user_id = l.user_id
WHERE YEAR(l.listen_datetime) = 2025
GROUP BY u.user_id, u.name
ORDER BY total_minutes DESC
LIMIT 1;
