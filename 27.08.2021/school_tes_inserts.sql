SELECT * FROM school.subject;

-- insert subjects

INSERT INTO subject (code, name, description) VALUES ('123456', 'Matemaatika', 'Siin õptakse matemaatilisi teooriaid');
INSERT INTO subject (code, name, description) VALUES ('qwerty', 'Füüsika', null); -- description on null
INSERT INTO subject (code, name) VALUES ('CHEM12', 'Keemia'); -- description'it ei väärtusta üldse
INSERT INTO subject (code, name, description) VALUES ('LANG00', 'Eesti keel', 'Test test test test Test test test test Test test test test Test test test test Test test test test');
INSERT INTO subject (code, name, description) VALUES ('LANG01', 'Vene keel', 'Test test test test Test test test test Test test test test Test test test test Test test test test');

INSERT INTO subject (code, name) VALUES ('TOO123', 'Tööõpetus');
INSERT INTO subject (code, name) VALUES ('IT1234', 'Informaatika');
INSERT INTO subject (code, name) VALUES ('BIO000', 'Bioloogia');


-- add course to a subject
INSERT INTO course_subject (course_id, subject_id) VALUES (1, 1);
INSERT INTO course_subject (course_id, subject_id) VALUES (1, 2);
INSERT INTO course_subject (course_id, subject_id) VALUES (4, 2);
INSERT INTO course_subject (course_id, subject_id) VALUES (3, 3);

-- (SELECT id FROM course WHERE name="Testimise A&O") = 1 != Testimise A&O
-- Testimise A&O
INSERT INTO course_subject (course_id, subject_id) VALUES ((SELECT id FROM course WHERE name="Testimise A&O"), (SELECT id FROM subject WHERE name="Tööõpetus"));
INSERT INTO course_subject (course_id, subject_id) VALUES ((SELECT id FROM course WHERE name="Testimise A&O"), (SELECT id FROM subject WHERE name="Informaatika"));
INSERT INTO course_subject (course_id, subject_id) VALUES ((SELECT id FROM course WHERE name="Testimise A&O"), (SELECT id FROM subject WHERE name="Bioloogia"));

-- SQL kursus
INSERT INTO course_subject (course_id, subject_id) VALUES ((SELECT id FROM course WHERE name="SQL kursus"), (SELECT id FROM subject WHERE name="Tööõpetus"));
INSERT INTO course_subject (course_id, subject_id) VALUES ((SELECT id FROM course WHERE name="SQL kursus"), (SELECT id FROM subject WHERE name="Informaatika"));
INSERT INTO course_subject (course_id, subject_id) VALUES ((SELECT id FROM course WHERE name="SQL kursus"), (SELECT id FROM subject WHERE name="Bioloogia"));

-- Programmeerimise alused
-- INSERT INSERT INTO course_subject (course_id, subject_id) VALUES (1, 2)
-- (SELECT id FROM course WHERE name="Programmeerimise alused") = 1
-- (SELECT id FROM subject WHERE name="Tööõpetus") = 2
INSERT INTO course_subject (course_id, subject_id) VALUES ((SELECT id FROM course WHERE name="Programmeerimise alused"), (SELECT id FROM subject WHERE name="Tööõpetus"));
INSERT INTO course_subject (course_id, subject_id) VALUES ((SELECT id FROM course WHERE name="Programmeerimise alused"), (SELECT id FROM subject WHERE name="Informaatika"));
INSERT INTO course_subject (course_id, subject_id) VALUES ((SELECT id FROM course WHERE name="Programmeerimise alused"), (SELECT id FROM subject WHERE name="Bioloogia"));
