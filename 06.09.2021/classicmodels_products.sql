SELECT * FROM classicmodels.products;

-- INSERT AND CHECK
-- Ül1: Lisada uus toode "Motorcycles" productLine'i
INSERT INTO products VALUES ('NEW_1234', "2021 Harley Davidson NEW", "Motorcycles", "1:10", "New line products", "testing test", 1000, 10.00, 50.00);
-- Kontrolli, kas uus toode on olemas
SELECT * FROM products WHERE productCode='NEW_1234';




-- Ül2: Lisa tellimus kus on peal uus, äsja lisatud, toode.
-- orderdetails tahab productCode'i, selle peame andma alam-päringuga toote nime kaudu
-- 1. samm: kätte saada tootekood, mille nimi on "2021 Harley Davidson NEW" või midagi muud : SELECT ____ FROM products
-- 2. samm: 1. sammu päring taaskasutada INSERT INTO lauses
-- 1. sammu päring:
SELECT productCode FROM products WHERE productName="2021 Harley Davidson NEW";

-- 3. samm: Luua uus order: INSERT INTO orders VALUES ();
-- 4. Lodud orderi orderCode kätte saada alam-päringu kaudu: SELECT orderCode FROM orders WHERE ...

-- 3. sammu INSERT päring:
INSERT INTO orders (orderNumber, orderDate, requiredDate, status, customerNumber)
	VALUES ('999999', '2021-09-06', '2021-10-06', 'In Process', 119);
-- 4. sammu SELECT ... WHERE päring:
SELECT orderNumber FROM orders WHERE orderDate='2021-09-06' AND requiredDate='2021-10-06' AND customerNumber=119;

-- loome orderdetails rea
INSERT INTO orderdetails VALUES (
(SELECT orderNumber FROM orders WHERE orderDate='2021-09-06' AND requiredDate='2021-10-06' AND customerNumber=119),
(SELECT productCode FROM products WHERE productName="2021 Harley Davidson NEW"),
30,
45,
10
);

-- kontroll, kas tellimus sai sisestatud:
 SELECT * FROM orderdetails where orderNumber=999999;

 -- ÜL3: uuenda orderi staatust (Shipped) ja lisa shippedDate
 -- Näide: UPDATE orders SET col=val, vol1=val2, ... WHERE condition; WHERE peab olema ette antud, vastasel juhul uuendataks kõiki ridu!
 UPDATE orders SET status="Shipped", shippedDate="2021-09-10" WHERE orderNumber=999999;

 -- Kontrolli, kas order uuenes:
 SELECT * FROM orders WHERE orderNumber=999999;
