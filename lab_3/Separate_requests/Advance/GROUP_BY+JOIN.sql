-- DQL: Агрегація (GROUP BY + JOIN)
-- Рахуємо загальну суму витрат для кожного клієнта
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
  u.id, u.name -- Групуємо за ID та іменем
ORDER BY
  total_spent DESC -- Сортуємо, щоб бачити топ-клієнтів
  -- Крапка з комою в кінці відсутня навмисно.
  