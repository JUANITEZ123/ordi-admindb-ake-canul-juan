

SELECT
    YEAR(payment_date) AS year,
    MONTH(payment_date) AS month_number,
    MONTHNAME(payment_date) AS month_name,
    SUM(amount) AS total_revenue
FROM subscription_payments
GROUP BY
    YEAR(payment_date),
    MONTH(payment_date),
    MONTHNAME(payment_date)
ORDER BY
    YEAR(payment_date),
    MONTH(payment_date);
