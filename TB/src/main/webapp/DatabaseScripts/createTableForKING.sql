conn supradb/surapwd;
select * from tab;

desc USERS_DTLS;

CREATE TABLE USERS_DTLS (
    SEQ_ID NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(50) UNIQUE NOT NULL,
    FIRST_NAME VARCHAR2(50) NOT NULL,
    LAST_NAME VARCHAR2(50) NOT NULL,
    ADDRESS VARCHAR2(100),
    EMAIL VARCHAR2(100),
    PHONE VARCHAR2(50),
    PASSWORD VARCHAR2(60) NOT NULL,
    ROLE_ID NUMBER
   -- CONSTRAINT fk_role  FOREIGN KEY (ROLE_ID) REFERENCES ROLES_DTLS (ROLE_ID)
);

CREATE TABLE ROLES_DTLS (
    ROLE_ID NUMBER PRIMARY KEY,
    ROLE_NAME VARCHAR2(50) NOT NULL UNIQUE
);

ALTER TABLE USERS_DTLS ADD CREATOR VARCHAR2(50) NOT NULL;
ALTER TABLE USERS_DTLS ADD CREATED_ON  DATE NOT NULL;
ALTER TABLE USERS_DTLS ADD MODIFIER VARCHAR2(50); 
ALTER TABLE USERS_DTLS ADD MODIFIED_ON DATE;


INSERT INTO export_table (
    seq_id,
    user_id,
    first_name,
    last_name,
    address,
    email,
    phone,
    password,
    role_id,
    creator,
    created_on,
    modifier,
    modified_on
) VALUES (
    1,
    'user_001',
    'John',
    'Doe',
    '1234 Elm Street, Springfield, IL',
    'johndoe@example.com',
    '555-1234',
    'password123',
    1,
    'admin',
    TO_DATE('01-01-23', 'DD-MM-RR'),
    NULL,
    NULL
);



--DROP TABLE USERS_DTLS;


