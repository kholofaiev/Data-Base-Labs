-- DQL: Фільтрація після агрегації (HAVING)
-- Знаходимо клієнтів, які витратили більше 1000
SELECT
  u.name,
  SUM(oi.quantity * oi.price_at_purchase) AS total_spent
FROM
  Users AS u
JOIN
  Orders AS o ON u.id = o.user_id
JOIN
  Order_Items AS oi ON o.id = oi.order_id
GROUP BY
  u.id, u.name
HAVING
  total_spent > 1000 -- Фільтруємо результати агрегації
ORDER BY
  total_spent desc
