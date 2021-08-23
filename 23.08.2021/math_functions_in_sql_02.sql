SELECT 
    customers.customerNumber,
    CONCAT(customers.contactFirstName,
            customers.contactLastName) AS contact_full_name,
    customers.creditLimit,
    COUNT(orders.orderNumber) AS num_of_orders,
    tmp_payments.total_payments,
    customers.creditLimit - tmp_payments.total_payments as credit_leftover
FROM
    customers
        INNER JOIN
    orders ON orders.customerNumber = customers.customerNumber
        INNER JOIN
    (SELECT 
        SUM(payments.amount) AS total_payments,
            payments.customerNumber
    FROM
        payments
    GROUP BY payments.customerNumber) AS tmp_payments ON tmp_payments.customerNumber = customers.customerNumber
WHERE
    orders.status = 'Resolved'
GROUP BY customers.customerNumber
