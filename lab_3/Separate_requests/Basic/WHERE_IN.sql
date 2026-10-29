-- DQL: Фільтрація (WHERE + IN)
SELECT *
FROM `Orders`
WHERE `status` IN ('pending', 'processing');