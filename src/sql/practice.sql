# 1 - номер задачи
SELECT model, speed, hd
FROM PC
WHERE price < 500;

# 2
SELECT DISTINCT maker
FROM Product
WHERE type LIKE 'Printer';

# 3
SELECT model, ram, screen
FROM Laptop
WHERE price > 1000;

# 4
SELECT *
FROM Printer
WHERE color = 'y';

# 5
SELECT model, speed, hd
FROM PC
WHERE (cd = '12x' OR cd = '24x') AND price < 600;

# 6
SELECT DISTINCT maker, speed
FROM Product
         JOIN Laptop ON Laptop.model = Product.model
WHERE type = 'Laptop' AND hd >= 10;

# 7
SELECT PC.model, price
FROM PC INNER JOIN
     Product ON PC.model = Product.model
WHERE maker = 'B'
UNION
SELECT Laptop.model, price
FROM Laptop INNER JOIN
     Product ON Laptop.model = Product.model
WHERE maker = 'B'
UNION
SELECT Printer.model, price
FROM Printer INNER JOIN
     Product ON Printer.model = Product.model
WHERE maker = 'B'
ORDER BY price;

# 8
SELECT DISTINCT maker
FROM Product
WHERE type = 'PC' AND
    maker NOT IN (SELECT maker
                  FROM Product
                  WHERE type = 'Laptop');

# 9
SELECT DISTINCT maker
FROM Product
         JOIN PC ON Product.model = PC.model
WHERE Product.type = 'PC' AND PC.speed >= 450;

# 10
SELECT model, price
FROM Printer
WHERE price = (SELECT MAX(price) FROM Printer);


