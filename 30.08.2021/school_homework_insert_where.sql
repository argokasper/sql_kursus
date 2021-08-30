SELECT * FROM school.homework;

select * from student where id=11;
select * from task where id=1;
INSERT INTO homework (name, uploaded_by, task_id) VALUES ("Kodutöö 1",11, 1);



INSERT INTO homework (name, uploaded_by, task_id) VALUES ("Kodutöö 2", 1, 1);
INSERT INTO homework (name, uploaded_by, task_id) VALUES ("Kodutöö 3", 1, 2);

-- Muuta ühe kodutöö staatust
UPDATE homework SET status_id='published' WHERE id=1;

-- 1. Filtreeri kodutööd, mis on on 'draft' staatusega
SELECT * FROM homework WHERE status_id="draft";
-- 2. Filtreeri kodutööd, millel on task ID=1
SELECT * FROM homework WHERE task_id=1;
-- 3. Filtreeri kodutööd, millel on hinne. Vihje kasutada "NOT NULL".
SELECT * FROM homework WHERE mark != NULL; -- != NULL ei toimi korrektselt kuna SQL parser arvutab selle ümber "!=   ", samas IS NOT NULL kontrollibki tühja väärtust
SELECT * FROM homework WHERE mark IS NOT NULL;

-- Muuta kodutööde staatust ja hinnet
UPDATE homework SET status_id='marked', mark=5 WHERE id=1;
UPDATE homework SET status_id='marked', mark=3 WHERE id=2;
