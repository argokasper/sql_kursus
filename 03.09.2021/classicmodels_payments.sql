SELECT * FROM classicmodels.payments;

-- Ül1: kuvame välja aastalõikes palju sisse maksti(year, amount)
-- 1. samm: kasutada abifunktsiooni(YEAR()) aasta välja võtmiseks kuupäevast
-- 2. samm: grupeerida selle abifunktsiooniga terve tabel - tekivad grupid 2003, 2004, 2005, ...
-- 3. samm: Liita kokku maksed igas aastas
-- 4. samm: kirjutada välja tulbad, mis on nõutud

SELECT YEAR(paymentDate) AS year, SUM(amount) AS amount FROM payments GROUP BY YEAR(paymentDate);

-- Ül2: Mitmes osas on arveid makstud? (checkNumber, paymentCount)
SELECT checkNumber, COUNT(amount) AS paymentCount FROM payments GROUP BY checkNumber;

-- ÜL3: Võtame välja aasta aruanded iga kliendi kohta(customerName)? (client_name, year, amount_paid)
-- 1. samm: JOIN customers tabel
-- 2. samm: Grupeeri kliendi numbri järgi(customerNumber) ja siis aasta järgi

SELECT
    customers.customerName,
    YEAR(payments.paymentDate) AS year,
    SUM(payments.amount) AS amount_paid
FROM
    payments
        NATURAL JOIN
    customers
GROUP BY payments.customerNumber, YEAR(payments.paymentDate)
ORDER BY customers.customerName , year;
