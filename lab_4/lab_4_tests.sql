--View Test
SELECT * FROM `v_Detailed_Orders`;

--Procedure Test
CALL sp_AddNewProduct(
    'Зірчастий аніс',
    'Сушені зореподібні плоди вічнозеленого дерева з насиченим пряним і солодко-анісовим ароматом',
    160.00,
    40,
    4 -- ID категорії "Зернова кава"
);
SELECT * FROM `Products` WHERE `name` = 'Зірчастий аніс';

--Triger Test
SELECT * FROM Products WHERE id = 2;

UPDATE Products
SET price = 400.00
WHERE id = 2;