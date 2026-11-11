-- Змінюємо стандартний роздільник ";" на "//"
DELIMITER //

-- 1. Створення процедури "Додати Новий Товар"
CREATE PROCEDURE `sp_AddNewProduct`(
    IN p_name VARCHAR(255),         -- "IN" означає вхідний параметр
    IN p_description TEXT,
    IN p_price DECIMAL(10,2),
    IN p_stock_quantity INT,
    IN p_category_id INT
)
BEGIN
    -- Тіло процедури:
    -- Виконуємо звичайний INSERT з даними,
    -- які ми отримали через параметри
    INSERT INTO `Products`
        (`name`, `description`, `price`, `stock_quantity`, `category_id`)
    VALUES
        (p_name, p_description, p_price, p_stock_quantity, p_category_id);
END //
-- Закінчили процедуру нашим новим роздільником "//"

-- Повертаємо стандартний роздільник ";"
DELIMITER ;