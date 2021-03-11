CREATE VIEW faturamento_atual AS
SELECT
CAST(ROUND(MIN(ap.plan_value), 2) AS DECIMAL(5, 2)) AS faturamento_minimo,
CAST(ROUND(MAX(ap.plan_value), 2) AS DECIMAL(5, 2)) AS faturamento_maximo,
CAST(ROUND(AVG(ap.plan_value), 2) AS DECIMAL(5, 2)) AS faturamento_medio,
CAST(ROUND(SUM(ap.plan_value), 2) AS DECIMAL(5, 2)) AS faturamento_total
FROM Available_Plans AS ap
INNER JOIN User AS u
ON ap.plan_id = u.plan_id;
