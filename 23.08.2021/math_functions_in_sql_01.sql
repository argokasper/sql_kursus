SELECT 
    SUM(amount) AS total_payment,
    AVG(amount) AS average_payment,
    COUNT(amount) AS number_of_payments,
    MIN(amount) as min_payment,
    MAX(amount) as max_payment
FROM
    payments;

select * from payments;