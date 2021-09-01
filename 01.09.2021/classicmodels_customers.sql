SELECT * FROM classicmodels.customers;

-- kuvada välja ned kliendid kelle creditLimi on suurem kui 90 000
SELECT count(*) FROM customers WHERE creditLimit > 90000;

-- ... , kui customerNAme on suurem kui 20 tähemärki: length()
SELECT count(*) FROM customers WHERE length(customerName) > 20;

-- kellel on täidetud aadress(addressLine1, city, state, postalCode)
SELECT * FROM customers WHERE addressLine1 IS NOT NULL AND city IS NOT NULL AND state IS NOT NULL AND country IS NOT NULL;

-- kes on USAst või Londonist
SELECT * FROM customers WHERE city="London" OR country="USA";
