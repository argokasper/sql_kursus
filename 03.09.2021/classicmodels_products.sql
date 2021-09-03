SELECT * FROM classicmodels.products;

-- Ül1: Grupeerida productLine'i ja välja näidata, mitu sõidukit on ühes grupis: tulbad(productLine, count)
SELECT
    productLine, COUNT(*) AS count
FROM
    products
GROUP BY productLine;

-- Ül2: palju on tooteid igas hinna kümnendis(price_group, count) ROUND(55.55, 0) = 56, ROUND(43.34, -1) = 40, ROUND(43.34, -2) = 0
SELECT ROUND(buyPrice, -1) as price_group, COUNT(buyPrice) as count FROM products GROUP BY ROUND(buyPrice, -1);

-- jaota toote productLine'i järgi tooted gruppidesse ja näita nende laoseisu väärtust: (productLine, total_worth)
SELECT productLine, SUM(quantityInStock * MSRP) as total_worth FROM products GROUP BY productLine;

-- Ül3: productLine grupid ning total_worth koos money_spent, profit
-- 1. Using INNER JOIN and ON
SELECT
    DISTINCT(products.productLine),
    grouped_products.total_worth,
    grouped_products.money_spent,
	grouped_products.total_worth - grouped_products.money_spent AS profit
FROM
    products
    JOIN
		(SELECT productLine, SUM(quantityInStock * MSRP) as total_worth, SUM(quantityInStock * buyPrice) AS money_spent FROM products GROUP BY productLine) AS grouped_products
    ON grouped_products.productLine = products.productLine
 GROUP BY products.productLine;

-- 2. Selecting from multiple tables with WHERE
SELECT
    products.productLine,
    grouped_products.total_worth,
    grouped_products.money_spent,
	grouped_products.total_worth - grouped_products.money_spent AS profit
FROM
    products,
    (SELECT productLine, SUM(quantityInStock * MSRP) as total_worth, SUM(quantityInStock * buyPrice) AS money_spent FROM products GROUP BY productLine) AS grouped_products
 WHERE grouped_products.productLine = products.productLine
 GROUP BY products.productLine;

-- 3. Using INNER JOIN with WHERE
SELECT
    productLine,
    total_worth,
    money_spent,
	total_worth - grouped_products.money_spent AS profit
FROM
    products
    JOIN
		(SELECT productLine, SUM(quantityInStock * MSRP) as total_worth, SUM(quantityInStock * buyPrice) AS money_spent FROM products GROUP BY productLine) AS grouped_products
WHERE grouped_products.productLine = products.productLine
GROUP BY products.productLine;

-- Use of DISTINCT is equal to GROUP BY when SELECT has no aggregate functions used
SELECT
    DISTINCT(products.productLine),
    total_worth,
    money_spent,
	total_worth - grouped_products.money_spent AS profit
FROM
    products
    JOIN
		(SELECT productLine, SUM(quantityInStock * MSRP) as total_worth, SUM(quantityInStock * buyPrice) AS money_spent FROM products GROUP BY productLine) AS grouped_products
WHERE grouped_products.productLine = products.productLine;

-- Sub-query
SELECT productLine, SUM(quantityInStock * MSRP) as total_worth, SUM(quantityInStock * buyPrice) AS money_spent FROM products GROUP BY productLine;
