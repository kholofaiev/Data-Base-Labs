-- DQL: Фільтрація (WHERE + AND)
SELECT *
FROM `Products`
WHERE `category_id` = 1 AND `price` < 250;