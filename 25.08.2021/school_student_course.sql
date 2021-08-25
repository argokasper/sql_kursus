SELECT * FROM school.student_course;

-- courses id: 1, 3-8
-- students id: 6, 10-13
-- Add 3 students into each course (5x)
INSERT INTO student_course (student_id, course_id) VALUES (6, 1);
INSERT INTO student_course (student_id, course_id) VALUES (10, 1);
INSERT INTO student_course (student_id, course_id) VALUES (11, 1);

INSERT INTO student_course (student_id, course_id) VALUES (12, (SELECT id FROM course WHERE name='SQL kursus'));
INSERT INTO student_course (student_id, course_id) VALUES (13, 3);
INSERT INTO student_course (student_id, course_id) VALUES (6, 3);

INSERT INTO student_course (student_id, course_id) VALUES (12, (SELECT id FROM course WHERE name='SQL kursus'));
INSERT INTO student_course (student_id, course_id) VALUES (13, 3);
INSERT INTO student_course (student_id, course_id) VALUES (6, 3);

INSERT INTO student_course (student_id, course_id) VALUES ((SELECT student.id FROM student INNER JOIN user ON user.id = student.user_id WHERE user.email='joe@email.com'), (SELECT id FROM course WHERE name='Programmeerimise alused'));
INSERT INTO student_course (student_id, course_id) VALUES (11, (SELECT id FROM course WHERE name='Programmeerimise alused'));
INSERT INTO student_course (student_id, course_id) VALUES (12, (SELECT id FROM course WHERE name='Programmeerimise alused'));

INSERT INTO student_course (student_id, course_id) VALUES (10, (SELECT id FROM course WHERE name='Sissejuhatus analüütikasse'));
INSERT INTO student_course (student_id, course_id) VALUES (11, (SELECT id FROM course WHERE name='Sissejuhatus analüütikasse'));
INSERT INTO student_course (student_id, course_id) VALUES (12, (SELECT id FROM course WHERE name='Sissejuhatus analüütikasse'));