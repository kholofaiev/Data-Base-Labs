-- DQL: INNER JOIN
SELECT
  u.name AS customer_name,
  p.name AS product_name,
  oi.quantity,
  o.status
FROM
  Users AS u
INNER JOIN
  Orders AS o ON u.id = o.user_id
INNER JOIN
  Order_Items AS oi ON o.id = oi.order_id
INNER JOIN
  Products AS p ON oi.product_id = p.id
WHERE
  o.status = 'completed' -- Наприклад, показуємо тільки виконані
ORDER BY
  u.name