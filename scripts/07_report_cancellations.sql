

SELECT
    u.user_id,
    u.name AS user_name,
    COUNT(*) AS times_cancelled,
    GROUP_CONCAT(DISTINCT MONTHNAME(us.end_date) ORDER BY MONTH(us.end_date) SEPARATOR ', ') AS cancelled_months
FROM user_subscriptions us
JOIN users u ON u.user_id = us.user_id
WHERE
    us.status = 'cancelled'
    AND us.end_date IS NOT NULL
    AND YEAR(us.end_date) = 2025
GROUP BY u.user_id, u.name
ORDER BY times_cancelled DESC
LIMIT 1;
