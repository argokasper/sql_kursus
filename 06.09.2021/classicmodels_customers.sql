SELECT * FROM classicmodels.customers;

-- Ül1. Filtreerime customers tabeli addressLine2  järgi kui on väärtus ja
-- kui ei ole siis addressLine1 järgi selliselt et seal sisalduks numbreid
-- 1. samm: tekstist numbrite kätte saamine funkts: CAST(col_name) WHERE CAST(___) IS NOT NULL

SELECT contactLastName, CAST(contactLastName AS UNSIGNED) AS test FROM customers WHERE CAST(contactLastName AS UNSIGNED) IS NOT NULL;
SELECT
    *
FROM
    customers
WHERE
    CAST((CASE
        WHEN addressLine2 IS NULL THEN addressLine1
        ELSE addressLine2
    END) AS UNSIGNED) IS NOT NULL;


-- Ül2: Kui addressLine2 on NULL, siis kirjuta tulpa "Väärtus puudub"- Tulbad: (customerNumber, addressLine2) IF() === CASE, kui kasutada SELECTis
SELECT
    customerNumber,
    (CASE
        WHEN addressLine2 IS NULL THEN 'Väärtus puudub'
        ELSE addressLine2
    END) AS test
FROM
    customers;
