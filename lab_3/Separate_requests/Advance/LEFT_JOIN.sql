-- DQL: LEFT JOIN
-- Знайти всіх користувачів, та їхні замовлення (якщо вони є)
SELECT
  u.name AS customer_name,
  o.id AS order_id
FROM
  Users AS u
LEFT JOIN
  Orders AS o ON u.id = o.user_id
ORDER BY
  u.name