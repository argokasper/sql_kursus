SELECT * FROM school.homework_status;


--  Loome kodutöö staatused: draft -> (deleted) -> published -> marked
INSERT INTO homework_status VALUES('draft', 'Kodutöö on mustand');
INSERT INTO homework_status VALUES('published', 'Kodutöö on esitatud');
INSERT INTO homework_status VALUES('deleted', 'Kodutöö on kustutatud');
INSERT INTO homework_status VALUES('marked', 'Kodutöö on hinnatud');
