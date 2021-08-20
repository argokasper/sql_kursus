
-- NOT NULL
CREATE TABLE STUDENT(
    ROLL_NO INT NOT NULL,
    STU_NAME VARCHAR (35) NOT NULL,
    STU_AGE INT NOT NULL,
    STU_ADDRESS VARCHAR (235),
    PRIMARY KEY (ROLL_NO)
);


-- UNIQUE
CREATE TABLE STUDENT(
    ROLL_NO INT NOT NULL,
    STU_NAME VARCHAR (35) NOT NULL UNIQUE,
    STU_AGE INT NOT NULL,
    STU_ADDRESS VARCHAR (35) UNIQUE,
    PRIMARY KEY (ROLL_NO)
);


-- DEFAULT
CREATE TABLE STUDENT(
    ROLL_NO   INT  NOT NULL,
    STU_NAME VARCHAR (35) NOT NULL,
    STU_AGE INT NOT NULL,
    EXAM_FEE INT  DEFAULT 10000,
    STU_ADDRESS VARCHAR (35) ,
    PRIMARY KEY (ROLL_NO)
);


-- CHECK
CREATE TABLE STUDENT(
    ROLL_NO   INT  NOT NULL CHECK(ROLL_NO >1000) ,
    STU_NAME VARCHAR (35)  NOT NULL,
    STU_AGE INT  NOT NULL,
    EXAM_FEE INT DEFAULT 10000,
    STU_ADDRESS VARCHAR (35) ,
    PRIMARY KEY (ROLL_NO)
);