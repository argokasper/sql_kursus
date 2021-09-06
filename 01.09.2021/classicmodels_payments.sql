SELECT sum(amount) FROM classicmodels.payments where customerNumber=141;

-- kuvame välja kui palju on iga klient oma krediidist tellimuste eest tagasi maksnud(customerNumber, totalPurchased, totalPaid)
SELECT
    payments.customerNumber,
    SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS totalPurchased,
    COUNT(orderdetails.quantityOrdered) AS purchases,
    SUM(payments.amount) AS totalPaid,
    COUNT(payments.amount) AS payments_test
FROM
    payments
        NATURAL JOIN
    orderdetails
        NATURAL JOIN
    orders
GROUP BY orders.customerNumber
ORDER BY totalPurchased DESC;

-- Siin on viga, JOIN-imisel tekib liiga palju ridu, mis summeerimisel vale summa annavad
SELECT
    payments.customerNumber,
    SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS totalPurchased,
    COUNT(orderdetails.quantityOrdered) AS purchases,
    SUM(payments.amount) AS totalPaid,
    GROUP_CONCAT(payments.amount) AS payments_test
FROM
    payments
        JOIN
    orders ON orders.customerNumber = payments.customerNumber
        JOIN
    orderdetails ON orderdetails.orderNumber=orders.orderNumber
GROUP BY payments.customerNumber
ORDER BY totalPurchased DESC;
