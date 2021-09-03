SELECT * FROM classicmodels.customers;

-- Ül1: millisel müügiagendil on kõige rohkem kliente (agent, client_count)
-- 1. samm: tekita müügiagendi grupid ja loetle kokku palju igal agendil on kliente
-- 2. samm: Sorteeri klientide arvu järgi kahanevalt
-- 3. samm : Lisa SQL päringu kõige lõppu ... LIMIT 1: Süntaks LIMIT [n] - kuvab välja n arv ridu lõpptulemuses - LIMIT märgend lähjeb alati kõige viimasele kohale SQL lauses;

SELECT salesRepEmployeeNumber as agent, COUNT(customerNumber) as client_count FROM customers WHERE salesRepEmployeeNumber IS NOT NULL GROUP BY salesRepEmployeeNumber ORDER BY client_count DESC LIMIT 1;

-- Ül2: tabel, kus on kliendi nimi ning tema kas tema agent asub kliendiga samas riigis ning on grupeeritud kliendi koodi(customerCode) järgi (client_full_name, client_country, agent_country, is_in_same_country)
-- 1. samm: välja filtreerida need kliendid, kellel on agent
-- 2. samm: tabelisse saada agendi lisaandmed (JOIN employees)
-- 3. samm: tabelisse saada kontori riik (JOIN offices)
-- 4. samm: kirjutada SELECT-itatad tulbad
-- 5. samm: luua tulp IF(condition, value_if_true, value_if_false) abiga, kas riigid on võrdsed
-- 6. samm: grupeeri customerNumber järgi kogu tulemuste tabel

SELECT
    CONCAT(contactFirstName,
            ' ',
            contactLastName) AS client_full_name,
    customers.country AS client_country,
    offices.country AS agent_country,
    IF(customers.country = offices.country,
        'Yes',
        'No') AS is_in_same_country
FROM
    customers
        LEFT JOIN
    employees ON employees.employeeNumber = customers.salesRepEmployeeNumber
        LEFT JOIN
    offices ON offices.officeCode = employees.officeCode
WHERE
    customers.salesRepEmployeeNumber IS NOT NULL
GROUP BY customers.customerNumber;
