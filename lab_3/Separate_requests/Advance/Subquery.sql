-- DQL: Підзапит (Subquery)
-- Знайти товари, які ніколи не купували
SELECT
  p.name
FROM
  Products AS p
WHERE
  p.id NOT IN (
      -- Внутрішній запит:
      -- Отримуємо унікальний список ID всіх куплених товарів
      SELECT DISTINCT oi.product_id FROM Order_Items AS oi
  )