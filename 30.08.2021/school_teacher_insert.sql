SELECT * FROM school.teacher;

-- Mis user_id'd ei ole student'id:
SELECT id FROM user WHERE id NOT IN (SELECT user.id FROM user JOIN student ON student.user_id = user.id) order by id;

INSERT INTO teacher (user_id) VALUES (1);
INSERT INTO teacher (user_id) VALUES (2);
INSERT INTO teacher (user_id) VALUES (9);
INSERT INTO teacher (user_id) VALUES (10);
