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

# 30
SELECT i.point, i.date, o.out, i.inc
FROM (
         SELECT point, date, sum(inc) AS inc
         FROM Income
         GROUP BY point, date
     ) AS i
         LEFT JOIN (
    SELECT point, date, sum(out) AS out
    FROM Outcome
    GROUP BY point, date
) AS o
                   ON i.point = o.point
                       AND i.date = o.date

UNION
SELECT o.point, o.date, o.out, i.inc
FROM (
         SELECT point, date, sum(out) AS out
         FROM Outcome
         GROUP BY point, date
     ) AS o
         LEFT JOIN (
    SELECT point, date, sum(inc) AS inc
    FROM Income
    GROUP BY point, date
) AS i
                   ON o.point = i.point
                       AND o.date = i.date;

# 31
SELECT class, country
FROM Classes
WHERE bore >= 16.0;

# 32
    WITH total
AS (
	SELECT country, bore, name
	FROM Classes JOIN Ships
	ON Classes.class = Ships.class

	UNION
	SELECT country, bore, ship
	FROM Classes JOIN Outcomes
	ON Classes.class = Outcomes.ship
)

SELECT country, cast(round(AVG(power(bore,3)*0.5),2) AS numeric(10,2)) AS weight
FROM total
GROUP BY country;

# 33
SELECT ship
FROM Outcomes
WHERE result = 'sunk'
  AND battle = 'North Atlantic';

# 34
SELECT DISTINCT name
FROM Classes AS cl JOIN Ships AS sh
                        ON cl.class = sh.class
WHERE launched >= 1922
  AND displacement > 35000
  AND TYPE = 'bb';

# 35
SELECT model, TYPE
FROM Product
WHERE model NOT LIKE '%[^0-9]%' OR model NOT LIKE '%[^a-z]%'
   OR model NOT LIKE '%[^A-Z]%';

# 36
SELECT name
FROM Ships
WHERE name IN (
    SELECT class
    FROM Classes
)

UNION
SELECT ship
FROM Outcomes
WHERE ship IN (
    SELECT class
    FROM Classes
);

# 37
    WITH total_ship
AS (
	SELECT cl.class, sh.name
	Classes AS cl JOIN Ships AS sh
	ON cl.class = sh.class

	UNION
	SELECT cl.class, o.ship AS name
	FROM Classes AS cl JOIN Outcomes AS o
	ON cl.class = o.ship
)

SELECT class
FROM total_ship
GROUP BY class
HAVING COUNT(class) = 1;

# 38
SELECT DISTINCT country
FROM Classes
WHERE TYPE = 'bb'
  AND country IN (
    SELECT DISTINCT country
    FROM Classes
    WHERE TYPE = 'bc'
);

# 39
SELECT DISTINCT o2.ship
FROM (
         SELECT ship, battle, result, date
         FROM Outcomes JOIN Battles
                            ON Outcomes.battle = Battles.name
         WHERE result='damaged'
     ) AS o1
         JOIN (
    SELECT ship, battle, result, date
    FROM Outcomes JOIN Battles
                       ON Outcomes.battle = Battles.name
) AS o2
              ON o1.ship = o2.ship
WHERE o1.date < o2.date;

# 40
SELECT cl.class, sh.name, cl.country
FROM Ships AS sh, Classes AS cl
WHERE sh.class = cl.class
  AND numGuns >= 10;

# 41
SELECT DISTINCT maker, speed
FROM Product, Laptop
WHERE Product.model = Laptop.model
  AND hd >= 10;

SELECT 'cd' AS chr, cd AS value
FROM PC
WHERE code = (SELECT MAX(code) FROM PC)

UNION
SELECT  'model' AS chr, cast(model AS varchar) AS value
FROM PC
WHERE code = (SELECT MAX(code) FROM PC)

UNION
SELECT  'speed' AS chr, cast(speed AS varchar) AS value
FROM PC
WHERE code = (SELECT MAX(code) FROM PC)

UNION
SELECT  'ram' AS chr, cast(ram AS varchar) AS value
FROM PC
WHERE code = (SELECT MAX(code) FROM PC)

UNION
SELECT  'hd' AS chr, cast(hd AS varchar)  AS value
FROM PC
WHERE code = (SELECT MAX(code) FROM PC)

UNION
SELECT  'price' AS chr, cast(price AS varchar) AS value
FROM PC
WHERE code = (SELECT MAX(code) FROM PC);

# 42
SELECT ship, battle
FROM Outcomes
WHERE result = 'sunk';

# 43
SELECT name
FROM Battles
WHERE year(date)
          NOT IN (
          SELECT launched
          FROM Ships
          WHERE launched IS NOT NULL
      );

# 44
SELECT name
FROM Ships
WHERE name LIKE 'R%'
UNION
SELECT ship
FROM Outcomes
WHERE ship LIKE 'R%';

# 45
SELECT name
FROM Ships
WHERE name LIKE '% % %'
UNION
SELECT ship
FROM Outcomes
WHERE ship LIKE '% % %';

# 46
SELECT DISTINCT ship, displacement, numguns
FROM Classes LEFT JOIN Ships
                       ON classes.class = ships.class
             RIGHT JOIN Outcomes
                        ON Classes.class = ship
                            OR ships.name = ship
WHERE battle = 'Guadalcanal';

# 47
SELECT COUNT(*) num, t1.maker, t1.model
FROM (
         SELECT maker, model, c
         FROM Product
                  JOIN (
             SELECT COUNT(model) c, maker m
             FROM Product
             GROUP BY maker
         ) b1
                       ON maker = m
     ) t1
         JOIN (
    SELECT maker, model, c
    FROM Product
             JOIN (
        SELECT COUNT(model) c, maker m
        FROM Product
        GROUP BY maker
    ) b2
                  ON maker = m
) t2
              ON t2.c > t1.c
                  OR t2.c = t1.c AND t2.maker < t1.maker
                  OR t2.c = t1.c AND t2.maker = t1.maker AND t2.model <= t1.model
GROUP BY t1.maker, t1.model
ORDER BY 1;

# 48
SELECT DISTINCT Classes.class
FROM Classes, Ships, Outcomes
WHERE Classes.class = Ships.class
  AND Ships.name = Outcomes.ship
  AND Outcomes.result = 'sunk'

UNION
SELECT DISTINCT class
FROM Classes, Outcomes
WHERE Classes.class = Outcomes.ship
  AND Outcomes.result = 'sunk';

# 49
SELECT name
FROM Ships, Classes
WHERE Ships.class = Classes.class
  AND bore = 16

UNION
SELECT ship
FROM Outcomes, Classes
WHERE Outcomes.ship = Classes.class
  AND bore = 16;

# 50
SELECT battle
FROM Outcomes, Ships
WHERE Outcomes.ship = Ships.name
  AND Ships.class = 'Kongo';