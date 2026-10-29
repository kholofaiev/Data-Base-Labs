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