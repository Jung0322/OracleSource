CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLDF_LGNID_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR(20) DEFAULT '1234',
    TEL VARCHAR(20));
    
INSERT INTO TABLE_DEFAULT(LOGIN_ID ,LOGIN_PWD ,TEL)
VALUES('TEST_ID3',NULL,'010-5689-1234');