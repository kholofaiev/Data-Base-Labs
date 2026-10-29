-- DML: Додавання нового користувача (User)
INSERT INTO `users` (`name`, `email`, `password_hash`) VALUES
('Віктор Павленко', 'viktor.pavlenko@gmail.com', 'hash_xyz_9');

-- DML: Додавання нового товару (Product)
INSERT INTO `Products` (`name`, `description`, `price`, `stock_quantity`, `category_id`) VALUES
('Зелений кардамон Extra Bold (Гватемала)', 'Добірні цілі зелені коробочки преміум-якості з виразним евкаліптово-цитрусовим ароматом.', 275, 35, 4);

-- DML: Оновлення ціни товару (Update)
UPDATE `Products`
SET `price` = 135.00
WHERE `name` = 'Чорний кардамон (Вʼєтнам)';

-- DML: Видалення позиції з замовлення (Delete)
DELETE FROM `Order_Items`
WHERE `order_id` = 2 AND `product_id` = 1;