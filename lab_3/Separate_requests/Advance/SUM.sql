-- DQL: Агрегація (SUM)
-- Рахуємо загальну вартість всіх товарів на складі
SELECT
  SUM(`price` * `stock_quantity`) AS `total_stock_value`
FROM
  `Products`;