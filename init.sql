CREATE TABLE PROFESSOR (
    ID INT UNIQUE,
    NAME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL UNIQUE,
    ROLE SMALLINT,
    SUBJECT_ID INT,
    CONSTRAINT PK_PROFESSOR PRIMARY KEY (ID)

);

CREATE TABLE SUBJECT (
    ID INT UNIQUE,
    NAME VARCHAR(255) NOT NULL,
    YEAR VARCHAR(4) NOT NULL,
    PROFESSOR_ID INT,
    STUDENT_ID INT,
    SESSION_ID INT,
    CONSTRAINT PK_SUBJECT PRIMARY KEY (ID)

);

CREATE TABLE STUDENT (
    ID INT UNIQUE,
    INDEX VARCHAR(6) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    SUBJECT_ID INT,
    CONSTRAINT PK_STUDENT PRIMARY KEY (ID)
);

CREATE TABLE SESSION (
    ID INT UNIQUE,
    NAME VARCHAR(255) NOT NULL,
    DUE_DATE DATE NOT NULL,
    SUBJECT_ID INT,
    CONSTRAINT PK_SESSION PRIMARY KEY (ID)

);

CREATE TABLE RESULTS (
    ID INT UNIQUE,
    SUBJECT_ID INT NOT NULL,
    SESSION_ID INT NOT NULL,
    LINK_PDF VARCHAR(255),
    CONSTRAINT PK_RESULTS PRIMARY KEY (ID)


);

CREATE TABLE PROFESSOR_SUBJECT (
    ID INT UNIQUE,
    PROFESSOR_ID INT NOT NULL,
    SUBJECT_ID INT NOT NULL,
    CONSTRAINT PK_PROFESSOR_SUBJECT PRIMARY KEY (ID)


);

CREATE TABLE STUDENT_SUBJECT (
    ID INT UNIQUE,
    STUDENT_ID INT NOT NULL,
    SUBJECT_ID INT NOT NULL,
    CONSTRAINT PK_STUDENT_SUBJECT PRIMARY KEY (ID)


);

CREATE TABLE SESSION_SUBJECT (
    ID INT UNIQUE,
    SESSION_ID INT NOT NULL,
    SUBJECT_ID INT NOT NULL,
    CONSTRAINT PK_SESSION_SUBJECT PRIMARY KEY (ID)


);

ALTER TABLE RESULTS
    ADD CONSTRAINT FK_SUBJECT FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECT(ID),
    ADD CONSTRAINT FK_SESSION FOREIGN KEY (SESSION_ID) REFERENCES SESSION(ID);