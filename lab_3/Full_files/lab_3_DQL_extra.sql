-- DQL: Агрегація (COUNT + GROUP BY)
-- Рахуємо кількість товарів у кожній категорії
SELECT
  `category_id`,
  COUNT(*) AS `total_products`
FROM
  `Products`
GROUP BY
  `category_id`;


-- DQL: Агрегація (SUM)
-- Рахуємо загальну вартість всіх товарів на складі
SELECT
  SUM(`price` * `stock_quantity`) AS `total_stock_value`
FROM
  `Products`;


-- DQL: Агрегація (AVG, MIN, MAX)
-- Аналітика цін по категорії "Коштовні прянощі"
SELECT
  AVG(`price`) AS `average_price`,
  MIN(`price`) AS `min_price`,
  MAX(`price`) AS `max_price`
FROM
  `Products`
WHERE
  `category_id` = 2;


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
  
  -- DQL: Комбінування вибірок (UNION)
-- Отримати єдиний список імен клієнтів та назв категорій
SELECT
  u.name AS item_name,
  'User' AS item_type -- Додаємо колонку, щоб розрізняти
FROM
  Users AS u

UNION

SELECT
  c.name AS item_name,
  'Category' AS item_type
FROM
  Categories AS c
ORDER BY
  item_type, item_name
