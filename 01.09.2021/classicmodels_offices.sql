SELECT * FROM classicmodels.orderdetails;

-- Koonda kokku orderdetails ja orders tabelid

SELECT * FROM orders NATURAL JOIN orderdetails;

-- koonda kokku orderdetails ja orders tabelid ja filtreeri staatuse "Shipped" järgi
SELECT * FROM orders NATURAL JOIN orderdetails WHERE orders.status="Shipped";

-- Kui palju on iga toodet tema tootekoodi järgi tellitud staatusega "Shipped"
SELECT *, SUM(orderdetails.quantityOrdered) AS totalQuantatyOrdered FROM orders NATURAL JOIN orderdetails WHERE orders.status="Shipped" GROUP BY orderDetails.productCode;
SELECT *, SUM(orderdetails.quantityOrdered) AS totalQuantatyOrdered FROM orders JOIN orderdetails ON orderdetails.orderNumber=orders.orderNumber WHERE orders.status="Shipped" GROUP BY orderDetails.productCode;

SELECT sum(quantityOrdered) FROM classicmodels.orderdetails WHERE productCode="S18_1749";

-- Koonda kokku orderdetails ja orders tabelid ning  kliendid
SELECT * FROM orders NATURAL JOIN orderdetails NATURAL JOIN customers;

SELECT * FROM customers NATURAL JOIN orderdetails NATURAL JOIN orders;

-- filtereerida välja need read, kus tootede summa ei ületa kliendi krediidilimiiti
SELECT *,  orderdetails.quantityOrdered * orderdetails.priceEach AS creditUsed FROM orders  NATURAL JOIN orderdetails NATURAL JOIN customers WHERE orderdetails.quantityOrdered * orderdetails.priceEach < customers.creditLimit;

-- grupeeri kliendi põhiselt ja filtreeri välja need read, kus krediidilimiiti ei ületata

SELECT *,  SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS creditUsed FROM orders  NATURAL JOIN orderdetails NATURAL JOIN customers GROUP BY customers.customerNumber ORDER BY creditUsed DESC;