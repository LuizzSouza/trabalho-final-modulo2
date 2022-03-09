CREATE USER VEM_SER IDENTIFIED BY VEM_SER;
GRANT CONNECT TO VEM_SER;
GRANT CONNECT, RESOURCE, DBA TO VEM_SER;
GRANT CREATE SESSION TO VEM_SER;
GRANT DBA TO VEM_SER;
GRANT CREATE VIEW, CREATE PROCEDURE, CREATE SEQUENCE to VEM_SER;
GRANT UNLIMITED TABLESPACE TO VEM_SER;
GRANT CREATE MATERIALIZED VIEW TO VEM_SER;
GRANT CREATE TABLE TO VEM_SER;
GRANT GLOBAL QUERY REWRITE TO VEM_SER;
GRANT SELECT ANY TABLE TO VEM_SER;


CREATE TABLE ADDRESS (
  ID_ADDRESS INT  NOT NULL,
  STREET VARCHAR2(255) NOT NULL,
  HOUSE_NUMBER INT  NOT NULL,
  CITY VARCHAR2(255) NOT NULL,
  PRIMARY KEY (ID_ADDRESS)
 );

DROP TABLE ADDRESS;

CREATE TABLE PERSOINFO (
  ID_PERSOINFO INT  NOT NULL,
  REALNAME VARCHAR2(255) NOT NULL,
  AGE INT NOT NULL,
  EMAIL VARCHAR2(255) UNIQUE NOT NULL,
  PRIMARY KEY (ID_PERSOINFO)
  );

 DROP table PERSOINFO;


CREATE TABLE TINDEV_USER (
  USER_ID INT NOT NULL,
  USERNAME VARCHAR2(45) UNIQUE NOT NULL,
  PASSWORD VARCHAR2(45) NOT NULL,
  PERSOINFO_ID_PERSOINFO INT UNIQUE NOT NULL,
  ADDRESS_ID_ADDRESS INT UNIQUE NOT NULL,
  PROGLANGS VARCHAR2(255) NOT NULL,
  GENDER VARCHAR2(255) NOT NULL,
  PREF VARCHAR2(255) NOT NULL,
  PRIMARY KEY (USER_ID),
  CONSTRAINT fk_address FOREIGN KEY (ADDRESS_ID_ADDRESS) REFERENCES ADDRESS (ID_ADDRESS),
  CONSTRAINT fk_persoInfo FOREIGN KEY (PERSOINFO_ID_PERSOINFO) REFERENCES PERSOINFO (ID_PERSOINFO)
  );

 DROP TABLE TINDEV_USER;
 
CREATE SEQUENCE SEQ_ADDRESS
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;
DROP SEQUENCE SEQ_ADDRESS;

CREATE SEQUENCE SEQ_PERSOINFO
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;
DROP SEQUENCE SEQ_PERSOINFO;

CREATE SEQUENCE SEQ_TINDEV_USER
START WITH 1
INCREMENT BY 1
NOCACHE NOCYCLE;
DROP SEQUENCE SEQ_TINDEV_USER;

SELECT * FROM PERSOINFO;
SELECT * FROM ADDRESS;

SELECT *
FROM TINDEV_USER tu
INNER JOIN PERSOINFO p ON tu.PERSOINFO_ID_PERSOINFO = p.ID_PERSOINFO
INNER JOIN ADDRESS a ON tu.ADDRESS_ID_ADDRESS = a.ID_ADDRESS;

SELECT USERNAME FROM TINDEV_USER WHERE USERNAME LIKE 'marcio';

INSERT INTO ADDRESS(ID_ADDRESS, STREET, CITY, HOUSE_NUMBER) VALUES(SEQ_ADDRESS.nextval, 'rua marcio', 'cachoeirinha', 13);
INSERT INTO PERSOINFO (ID_PERSOINFO , REALNAME , AGE , EMAIL) VALUES(SEQ_PERSOINFO.nextval, 'marcio', 35, 'marcio@mail.com');
INSERT INTO TINDEV_USER(USER_ID, USERNAME, PASSWORD, PERSOINFO_ID_PERSOINFO, ADDRESS_ID_ADDRESS, PROGLANGS, GENDER, PREF ) 
VALUES (SEQ_TINDEV_USER.nextval, 'marcio', '321', 1, 1, 'PHP', 'MALE', 'BOTH');

INSERT INTO ADDRESS(ID_ADDRESS, STREET, CITY, HOUSE_NUMBER) VALUES(SEQ_ADDRESS.nextval, 'rua JOSE', 'JOSELANDIA', 10);
INSERT INTO PERSOINFO (ID_PERSOINFO , REALNAME , AGE , EMAIL) VALUES(SEQ_PERSOINFO.nextval, 'jose', 35, 'jose@mail.com');
INSERT INTO TINDEV_USER(USER_ID, USER_TYPE, USERNAME, PASSWORD, PERSOINFO_ID_PERSOINFO, ADDRESS_ID_ADDRESS, PROGLANGS, GENDER, PREF ) 
VALUES (SEQ_TINDEV_USER.nextval, 0 , 'jose', '321', 2, 2, 'JAVA', 'MALE', 'BOTH');



