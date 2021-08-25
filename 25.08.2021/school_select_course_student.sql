SELECT * FROM student;
SELECT * FROM user;
SELECT * FROM course;
SELECT * FROM student_course;

-- Leia mitu õpilast on kursustel (kursuse_nimi, õpilaste arv)
SELECT course.name, COUNT(student_course.student_id) AS student_count FROM course LEFT JOIN student_course ON student_course.course_id = course.id GROUP BY course.id;

-- Leia, millsed kursused on igal õpilasel (õpilase nimi(duplikaadid on OK), kursuse nimi)
SELECT
    CONCAT(user.first_name, ' ', user.last_name) AS full_name,
    course.name AS course_name
FROM
    student
        INNER JOIN
    user ON user.id = student.user_id
        INNER JOIN
    student_course ON student_course.student_id = student.id
        INNER JOIN
    course ON course.id = student_course.course_id;
