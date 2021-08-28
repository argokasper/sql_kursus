-- INNER JOIN
SELECT * FROM student JOIN user ON user.id = student.user_id;

SELECT * FROM student JOIN user WHERE user.id = student.user_id;


-- student ja user kokku liita kindla tingimusega, aga filtreerida välja vanemad kui 2005 aastal sündinud
SELECT * FROM student JOIN user ON user.id = student.user_id WHERE user.date_of_birth >= '2005-01-01';
SELECT * FROM student JOIN user WHERE user.id = student.user_id AND user.date_of_birth >= '2005-01-01';


-- LEFT JOIN
SELECT subject.id as subject_id,  subject.name, course_subject.course_id FROM subject LEFT JOIN course_subject ON course_subject.subject_id = subject.id;
select * from course_subject;

-- RIGHT JOIN
SELECT subject.id as subject_id,  subject.name, course_subject.course_id FROM subject RIGHT JOIN course_subject ON course_subject.subject_id = subject.id;

select * from course_subject;

-- FULL JOIN
-- did not work
SELECT subject.id as subject_id,  subject.name, course_subject.course_id FROM subject FULL JOIN course_subject ON course_subject.subject_id = subject.id;

-- FULL JOIN
SELECT * FROM subject FULL JOIN course_subject;

-- CROSS JOIN
SELECT * FROM subject CROSS JOIN course_subject;

-- SELF JOIN
SELECT * FROM subject AS sub1 INNER JOIN subject AS sub2 ON sub2.id=sub1.id;
SELECT * FROM subject AS sub1 LEFT JOIN subject AS sub2 ON sub2.id=sub1.id;
SELECT * FROM subject AS sub1 RIGHT JOIN subject AS sub2 ON sub2.id=sub1.id;
SELECT * FROM subject AS sub1 CROSS JOIN subject AS sub2 ON sub2.id=sub1.id;

-- NATURAL JOIN
select * from course_subject;
select * from subject;
SELECT * FROM subject NATURAL JOIN course_subject;
SELECT * FROM subject INNER JOIN course_subject ON course_subject.subject_id = subject.id;
