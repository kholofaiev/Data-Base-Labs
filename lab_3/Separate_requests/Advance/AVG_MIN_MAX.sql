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