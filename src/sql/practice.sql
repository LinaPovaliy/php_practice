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

# 11
SELECT AVG(speed) AS AVG_speed
FROM PC;

# 12
SELECT AVG(speed) AS Avg_speed
FROM Laptop
WHERE price > 1000;

# 13
SELECT AVG(PC.speed) AS Avg_speed
FROM PC
         JOIN Product ON PC.model = Product.model
WHERE Product.maker = 'A';

# 14
SELECT Ships.class, Ships.name, Classes.country
FROM Ships
         JOIN Classes ON Ships.class = Classes.class
WHERE Classes.numGuns >= 10;

# 15
SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(*) >= 2;

# 16
SELECT DISTINCT a.model, b.model, a.speed, a.ram
FROM PC a, PC b
WHERE a.speed=b.speed AND a.ram=b.ram AND a.model>b.model;

# 17
SELECT DISTINCT pr.TYPE AS Type, l.model AS Model, l.speed
FROM Product AS pr JOIN Laptop AS l
                        ON pr.model = l.model
WHERE l.speed < ALL (
                    SELECT speed
                    FROM PC
                    );

# 18
SELECT DISTINCT Product.maker, Printer.price
FROM Product JOIN Printer
                  ON Product.model = Printer.model
WHERE Printer.color = 'y'
AND Printer.price = (
                     SELECT MIN(price)
                     FROM Printer
                     WHERE color = 'y'
                     );

# 19
SELECT pr.maker, AVG(l.screen)
FROM Product AS pr
         JOIN Laptop AS l
              ON pr.model= l.model
GROUP BY pr.maker;

#20
SELECT maker, COUNT(model)
FROM Product
WHERE TYPE = 'PC'
GROUP BY maker
HAVING COUNT(model) >= 3;

# 21
SELECT pr.maker, MAX(DISTINCT pc.price)
FROM Product AS pr
         JOIN PC AS pc
              ON pr.model= pc.model
GROUP BY pr.maker;

# 22
SELECT speed, AVG(price)
FROM PC
WHERE speed > 600
GROUP BY speed;

# 23
SELECT DISTINCT maker
FROM Product
WHERE maker IN (
    SELECT DISTINCT maker
    FROM Product AS pr
             JOIN PC AS pc
                  ON pr.model = pc.model
    WHERE pc.speed >= 750
)
  AND maker IN (
    SELECT DISTINCT maker
    FROM Product AS pr
             JOIN Laptop AS l
                  ON pr.model = l.model
    WHERE l.speed >= 750;
)

# 24
    WITH MAX
    AS (2
    SELECT model, price FROM PC
    UNION
    SELECT model, price FROM Laptop
    UNION
    SELECT model, price FROM printer
    )

SELECT model FROM MAX
WHERE price = (
                  SELECT MAX(price)
                  FROM MAX
              );

# 25
    SELECT DISTINCT maker
FROM Product JOIN PC
ON Product.model = PC.model
WHERE ram = (
    SELECT MIN(ram)
    FROM PC
    )
  AND speed = (
    SELECT MAX(speed)
    FROM PC
    WHERE ram = (
    SELECT MIN(ram)
    FROM PC)
    )
  AND maker IN (
    SELECT maker
    FROM Product
    WHERE TYPE='Printer'
    );

# 26
SELECT AVG(price)
FROM (
         SELECT price
         FROM Product JOIN PC
                           ON Product.model = PC.model
         WHERE maker = 'A'
         UNION ALL
         SELECT price
         FROM Product JOIN Laptop
                           ON Product.model = Laptop.model
         WHERE maker='A'
     ) AS AVG_price;

# 27
SELECT pr.maker, AVG(pc.hd)
FROM Product AS pr JOIN PC AS pc
ON pr.model = pc.model
WHERE maker IN (
	SELECT DISTINCT maker
	FROM Product
	WHERE TYPE='Printer'
)
GROUP BY maker;

# 28
WITH total_count
AS (
	SELECT maker
	FROM product
	GROUP BY maker
	HAVING COUNT(model) = 1
)

SELECT COUNT(maker) AS qty
FROM total_count;

# 29
SELECT i.point, i.date, i.inc, o.out
FROM Income_o i LEFT JOIN Outcome_o o
                          ON i.point = o.point
                              AND i.date = o.date

UNION
SELECT o.point, o.date, i.inc, o.out
FROM Outcome_o o LEFT JOIN Income_o i
                           ON o.point = i.point
                               AND o.date = i.date;

