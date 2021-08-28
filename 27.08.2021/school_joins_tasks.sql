-- Ül: mitu ainet on igal õpilasel: õpilase nimi, ainete arv, (ainete nimed(aine1, aine2, ...)) - Tegime koos
SELECT
    CONCAT(user.first_name, " ", user.last_name) AS "Õpilase nimi",
    COUNT(DISTINCT(course_subject.subject_id)) as "Ainete arv",
    GROUP_CONCAT(DISTINCT(course_subject.subject_id), ", ") as "Ainete nimed(id)"
FROM
    student
        JOIN
    user ON user.id = student.user_id
        LEFT JOIN
    student_course ON student_course.student_id = student.id
    left join course_subject ON course_subject.course_id = student_course.course_id
    GROUP BY student.id;

-- Ül: Mitu ainet on kursusel? Väljad: Kursuse nimi, ainet arv. Tabelid on: course, course_subject. - Individuaalne ülesanne
SELECT __, COUNT(__) FROM __ ____ __ ON __ GROUP BY course.id;

-- Nele
SELECT course.name, COUNT(course_subject.subject_id) FROM course
LEFT JOIN course_subject ON course_subject.course_id=course.id GROUP BY course.id;

-- Kristjan
select course.name, count(course_subject.subject_id) from course left join course_subject on course.id = course_subject.course_id group by course.id;

