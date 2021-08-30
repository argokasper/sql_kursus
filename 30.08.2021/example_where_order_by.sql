-- WHERE näited

-- Välja filtreerida need kursused, mille algusaeg on enne septembrit: tulbad: name, start_date
SELECT course.name, course.start_date FROM course WHERE course.start_date < "2021-09-01";

-- Välja filtreerida need kursused, kus on nimes sõna "kursus" sees: tulbad: name. Vihjed:
-- 1. LIKE "%kursus%" = näited: " KURSUS", "sdfsfsKURSUSsdfsdf",  "KURSUSdsdf"
SELECT course.name, course.start_date FROM course WHERE name LIKE "%kursus%";

-- Muudame kursuste algus ja lõppkupäevi
-- muudame start_date
UPDATE course SET start_date="2021-11-01"  WHERE id=1;
UPDATE course SET start_date="2021-10-10"  WHERE id=2;

-- Välja filtreerida need kursused, mille nimi on vähemalt 10 tähemärki: tulbad: name. Vihjed:
-- 1. length("some_word") = < , > , >=, <= != , IS
SELECT name FROM course WHERE length(name) > 10;

-- Välja filtreerida need kursused, mis kestavad vähem kui 2 kuud (60 päeva). Väljad: name, duration = (DATEDIFF(end, start)) Vihjed:
-- .1 DATEDIFF(date1, date2) - returns difference in days
SELECT name, DATEDIFF(end_date, start_date) AS duration FROM course WHERE DATEDIFF(end_date, start_date) < 60;

SELECT name, DATEDIFF(end_date, start_date) AS duration FROM course;

-- ORDER BY näited

SELECT * FROM course ORDER BY name;
SELECT * FROM course ORDER BY name DESC;
SELECT * FROM course ORDER BY code DESC;
SELECT * FROM course ORDER BY name, start_date ASC;

-- Sorteerida õpilaste üksikainete rohkust: student_name, subject count
SELECT
    CONCAT(user.first_name, ' ', user.last_name) AS full_name,
    COUNT(student_subject.subject_id) AS subject_count
FROM
    student
        INNER JOIN
    user ON user.id = student.user_id
        LEFT JOIN
    student_subject ON student_subject.student_id = student.id
GROUP BY student.id ORDER BY subject_count DESC;