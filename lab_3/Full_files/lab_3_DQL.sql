-- DQL: Фільтрація (WHERE + AND)
SELECT *
FROM `Products`
WHERE `category_id` = 1 AND `price` < 250;

-- DQL: Фільтрація (WHERE + IN)
SELECT *
FROM `Orders`
WHERE `status` IN ('pending', 'processing');

-- DQL: Фільтрація (WHERE + LIKE)
SELECT *
FROM `Users`
WHERE `email` LIKE '%@gmail.com';

-- DQL: Сортування (ORDER BY)
SELECT *
FROM `Products`
ORDER BY `price` DESC;