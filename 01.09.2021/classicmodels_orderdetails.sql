SELECT * FROM classicmodels.employees;

-- sorteeri kasvavalt eesnime ja siis perenime järgi (firstName, lastName)
SELECT * FROM employees ORDER BY firstName DESC, lastName DESC;

-- töötajad, kelle jobTitle on "Sales Rep" ja tulemused nime (firstName + lastName) järgi tähestiku järjekorras: fullName, jobTitle

SELECT concat(firstName, " ",lastName) AS fullName, jobTitle FROM employees WHERE jobTitle="Sales Rep" ORDER BY fullName;


-- Mitu alluvat on IGAL töölisel? employeeNumber <-> reportsTo

SELECT managers.employeeNumber, COUNT(employees.employeeNumber), GROUP_CONCAT(employees.employeeNumber) FROM employees AS managers LEFT JOIN employees ON managers.employeeNumber = employees.reportsTo GROUP BY managers.employeeNumber;

-- Kuvame töötajate tabelit koos kontori linnaga (vahetame välja officeCode'i officeLocation'i vastu)
SELECT employees.employeeNumber, employees.firstName, offices.city as officeLocation FROM employees JOIN offices ON offices.officeCode = employees.officeCode;
SELECT employees.*, offices.city FROM employees NATURAL JOIN offices;
