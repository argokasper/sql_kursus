-- Creates a database called "test_db"
CREATE DATABASE test_db;

-- Shows all databases
SHOW DATABASES;

-- Creates a new user called "argo" with a native password policy of "test1234"
CREATE USER 'argo'@'%' IDENTIFIED WITH mysql_native_password BY 'test1234';

-- Grants all permissions on "test_db" database tables to user "argo"
GRANT ALL ON test_db.* TO 'argo'@'%';

-- Query for all mysql users in this SQL server
SELECT user from mysql.user;
