-- 1. Додаємо нову колонку в таблицю Products
--    для збереження дати останнього оновлення
ALTER TABLE `Products`
ADD COLUMN `updated_at` TIMESTAMP NULL DEFAULT NULL
AFTER `category_id`;

-- Змінюємо стандартний роздільник ";" на "//"
DELIMITER //

-- 1. Створення тригера, який спрацьовує
--    ПЕРЕД (BEFORE) ОНОВЛЕННЯМ (UPDATE)
--    на таблиці Products
CREATE TRIGGER `trg_Products_BeforeUpdate`
BEFORE UPDATE ON `Products`
FOR EACH ROW
BEGIN
    -- Тіло тригера:
    -- 'NEW' - це спеціальне слово, яке посилається
    -- на рядок, ЯКИМ ВІН СТАНЕ ПІСЛЯ оновлення.
    -- Ми примусово встановлюємо значення колонки
    -- 'updated_at' на поточний час.
    SET NEW.updated_at = NOW();
END //
-- Закінчили тригер нашим новим роздільником "//"

-- Повертаємо стандартний роздільник ";"
DELIMITER ;