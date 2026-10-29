-- DQL: Агрегація (COUNT + GROUP BY)
-- Рахуємо кількість товарів у кожній категорії
SELECT
  `category_id`,
  COUNT(*) AS `total_products`
FROM
  `Products`
GROUP BY
  `category_id`;
