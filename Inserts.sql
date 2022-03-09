
INSERT INTO ADDRESS(ID_ADDRESS, STREET, CITY, HOUSE_NUMBER) VALUES(SEQ_ADDRESS.nextval, 'rua maranhao', 'cachoeirinha', 13);
INSERT INTO PERSOINFO (ID_PERSOINFO , REALNAME , AGE , EMAIL) VALUES(SEQ_PERSOINFO.nextval, 'marcio', 26, 'marcio@mail.com');
INSERT INTO TINDEV_USER(USER_ID, USERNAME, PASSWORD, PERSOINFO_ID_PERSOINFO, ADDRESS_ID_ADDRESS, PROGLANGS, GENDER, PREF ) VALUES (SEQ_TINDEV_USER.nextval, 'marcio', '321', 1, 1, 'PHP', 'MALE', 'BOTH');

INSERT INTO ADDRESS(ID_ADDRESS, STREET, CITY, HOUSE_NUMBER) VALUES(SEQ_ADDRESS.nextval, 'rua ararangua', 'porto alegre', 112);
INSERT INTO PERSOINFO (ID_PERSOINFO , REALNAME , AGE , EMAIL) VALUES(SEQ_PERSOINFO.nextval, 'jose', 28, 'jose@mail.com');
INSERT INTO TINDEV_USER(USER_ID, USERNAME, PASSWORD, PERSOINFO_ID_PERSOINFO, ADDRESS_ID_ADDRESS, PROGLANGS, GENDER, PREF ) VALUES (SEQ_TINDEV_USER.nextval, 'jose', '321', 2, 2, 'JAVA', 'MALE', 'BOTH');

INSERT INTO ADDRESS(ID_ADDRESS, STREET, CITY, HOUSE_NUMBER) VALUES(SEQ_ADDRESS.nextval, 'rua amapa', 'sao paulo', 10);
INSERT INTO PERSOINFO (ID_PERSOINFO , REALNAME , AGE , EMAIL) VALUES(SEQ_PERSOINFO.nextval, 'tiago', 35, 'tiagoa@mail.com');
INSERT INTO TINDEV_USER(USER_ID, USERNAME, PASSWORD, PERSOINFO_ID_PERSOINFO, ADDRESS_ID_ADDRESS, PROGLANGS, GENDER, PREF ) VALUES (SEQ_TINDEV_USER.nextval, 'tiago', '321', 3, 3, 'JAVA', 'MALE', 'MEN');

INSERT INTO ADDRESS(ID_ADDRESS, STREET, CITY, HOUSE_NUMBER) VALUES(SEQ_ADDRESS.nextval, 'rua tabajara', 'santos', 27);
INSERT INTO PERSOINFO (ID_PERSOINFO , REALNAME , AGE , EMAIL) VALUES(SEQ_PERSOINFO.nextval, 'maria', 21, 'maria@mail.com');
INSERT INTO TINDEV_USER(USER_ID, USERNAME, PASSWORD, PERSOINFO_ID_PERSOINFO, ADDRESS_ID_ADDRESS, PROGLANGS, GENDER, PREF ) VALUES (SEQ_TINDEV_USER.nextval, 'maria', '321', 4, 4, 'JAVA', 'FEMALE', 'MEN');

INSERT INTO ADDRESS(ID_ADDRESS, STREET, CITY, HOUSE_NUMBER) VALUES(SEQ_ADDRESS.nextval, 'rua ipanema', 'criciuma', 46);
INSERT INTO PERSOINFO (ID_PERSOINFO , REALNAME , AGE , EMAIL) VALUES(SEQ_PERSOINFO.nextval, 'julia', 20, 'julia@mail.com');
INSERT INTO TINDEV_USER(USER_ID, USERNAME, PASSWORD, PERSOINFO_ID_PERSOINFO, ADDRESS_ID_ADDRESS, PROGLANGS, GENDER, PREF ) VALUES (SEQ_TINDEV_USER.nextval, 'julia', '321', 5, 5, 'JAVA', 'FEMALE', 'MEN');

INSERT INTO ADDRESS(ID_ADDRESS, STREET, CITY, HOUSE_NUMBER) VALUES(SEQ_ADDRESS.nextval, 'rua bravo', 'porto alegre', 273);
INSERT INTO PERSOINFO (ID_PERSOINFO , REALNAME , AGE , EMAIL) VALUES(SEQ_PERSOINFO.nextval, 'vitoria', 32, 'vitoria@mail.com');
INSERT INTO TINDEV_USER(USER_ID, USERNAME, PASSWORD, PERSOINFO_ID_PERSOINFO, ADDRESS_ID_ADDRESS, PROGLANGS, GENDER, PREF ) VALUES (SEQ_TINDEV_USER.nextval, 'vitoria', '321', 6, 6, 'JAVA', 'FEMALE', 'BOTH');

SELECT * FROM TINDEV_USER;
SELECT * FROM ADDRESS;
SELECT * FROM PERSOINFO; 
