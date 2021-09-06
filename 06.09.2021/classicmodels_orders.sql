SELECT * FROM classicmodels.orders;

-- Ül1: Loo koondtabel kõikide tellimuste staatuste kohta näidates summana
-- mitu iga staatusega tellimust on: 'In Process', 'Shipped', 'On Hold', 'Disputed', 'Cancelled', 'Resolved', 'Total orders'
SELECT
    SUM(CASE
        WHEN status = 'In Process' THEN 1
        ELSE 0
    END) AS 'In Process',
    SUM(CASE
        WHEN status = 'Shipped' THEN 1
        ELSE 0
    END) AS 'Shipped',
    SUM(CASE
        WHEN status = 'On Hold' THEN 1
        ELSE 0
    END) AS 'On Hold',
    SUM(CASE
        WHEN status = 'Disputed' THEN 1
        ELSE 0
    END) AS 'Disputed',
    SUM(CASE
        WHEN status = 'Cancelled' THEN 1
        ELSE 0
    END) AS 'Cancelled',
    SUM(CASE
        WHEN status = 'Resolved' THEN 1
        ELSE 0
    END) AS 'Resolved',
    COUNT(*) AS 'Total orders'
FROM
    orders;

-- Kodu Ül: Lisa eelmisesse koondtabelisse samade tulpadega kuid iga kliendi kohta (tulemustesse peab tulema n arv ridu: n=klientide arv)
