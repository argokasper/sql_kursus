SELECT * FROM classicmodels.employees;

-- ÜL1: Sorteerida tabel kolmel erijuhul,
  -- 1. kui jobTitle on "Sales Rep", siis sorteeri lastName,
  -- 2. kui jobTitle'is sisaldub "Sales Manager", Vihjeks: kasutada otsingu funkts., siis sorteeri firstName
  -- ning kõikidel muudel juhtudel sorteerida email'i järgi

SELECT * FROM employees ORDER BY (
  CASE
	WHEN jobTitle = 'Sales Rep'
		THEN lastName
	WHEN jobTitle LiKE 'Sales Manager%'
		THEN firstName
	ELSE email
END);

-- Ül2: Kui on officeCode = 6, siis filteeri kogu tabel jobTitle = "Sales Rep"
SELECT * FROM employees WHERE (CASE WHEN officeCode = 6  THEN jobTitle END) = 'Sales Rep';
SELECT * FROM employees WHERE officeCode = 6 AND jobTitle = 'Sales Rep';

-- Üle3: Genereeri tabel, kus on kõik töötajad ning nende osakond tekstiliselt, officeCode'i põhjal
-- Kui on officeCode 1, siis väljasta osakonnaks 'Juhatus';
-- Kui on officeCode 2, siis väljasta osakonnaks 'Esindajad';
-- Kui on officeCode 3, siis väljasta osakonnaks 'Ülemused'
-- Kõik ülejäänd on "Töötajad"
-- See ülesanne on taas analoogne IF() kasutusega

SELECT
    (CASE
        WHEN officeCode = 1 THEN 'Juhatus'
        WHEN officeCode = 2 THEN 'Esindajad'
        WHEN officeCode = 3 THEN 'Ülemused'
        ELSE 'Töötajad'
    END) AS department
FROM
    employees;

-- Ül4: Loo koondtabel, kus on tabeli tulbad 'Juhatus'(President), 'Asepresidendid'(%VP%), 'Juhid'(%Manager%), 'Müügiesindajad'(%Rep%)
select CASE
        WHEN jobTitle LIKE '%VP%' THEN 1
        ELSE 0
        END
        FROM employees;
SELECT
    SUM(CASE
        WHEN jobTitle = 'President' THEN 1
        ELSE 0
    END) AS 'Juhatus',
    SUM(CASE
        WHEN jobTitle LIKE '%VP%' THEN 1
        ELSE 0
    END) AS 'Asepresidendid',
    SUM(CASE
        WHEN jobTitle LIKE '%Manager%' THEN 1
        ELSE 0
    END) AS 'Juhid',
    SUM(CASE
        WHEN jobTitle LIKE '%Rep%' THEN 1
        ELSE 0
    END) AS 'Esindajad'
FROM
    employees

