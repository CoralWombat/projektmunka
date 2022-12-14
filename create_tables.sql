CREATE TABLE STOCK_AUTHOR 
(
  ID VARCHAR2(10 BYTE) NOT NULL 
, NAME NVARCHAR2(128) 
, CONSTRAINT SYS_C0014340 PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C0014340 ON STOCK_AUTHOR (ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

CREATE TABLE STOCK_CATEGORY 
(
  ID VARCHAR2(10 BYTE) NOT NULL 
, NAME NVARCHAR2(128) 
, CONSTRAINT SYS_C0014341 PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C0014341 ON STOCK_CATEGORY (ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

CREATE TABLE STOCK_TYPE 
(
  ID VARCHAR2(10 BYTE) NOT NULL 
, LANG VARCHAR2(2 BYTE) 
, NAME NVARCHAR2(128) 
, CONSTRAINT SYS_C0014348 PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C0014348 ON STOCK_TYPE (ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

CREATE TABLE MEMBER 
(
  ID VARCHAR2(10 BYTE) NOT NULL 
, NAME VARCHAR2(128 BYTE) 
, EMAIL VARCHAR2(128 BYTE) 
, ADDRESS VARCHAR2(128 BYTE) 
, ACTIVE NUMBER(1, 0) 
, CONSTRAINT SYS_C0014347 PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C0014347 ON MEMBER (ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

ALTER TABLE MEMBER
ADD CONSTRAINT CH_MEMBER_ACTIVE CHECK 
(ACTIVE = 0
                                        OR ACTIVE = 1)
ENABLE;

CREATE TABLE SECTION 
(
  ID VARCHAR2(10 BYTE) NOT NULL 
, NAME VARCHAR2(128 BYTE) 
, BUILDING_ID VARCHAR2(10 BYTE) 
, CONSTRAINT SYS_C0014344 PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C0014344 ON SECTION (ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

ALTER TABLE SECTION
ADD CONSTRAINT FK_SECTION_BUILDING FOREIGN KEY
(
  BUILDING_ID 
)
REFERENCES BUILDING
(
  ID 
)
ENABLE;

CREATE TABLE STOCK 
(
  ID VARCHAR2(64 BYTE) NOT NULL 
, TITLE NVARCHAR2(128) 
, LANG VARCHAR2(2 BYTE) 
, PAGE_COUNT NUMBER(4, 0) 
, STOCK_TYPE_ID VARCHAR2(10 BYTE) 
, CONSTRAINT SYS_C0014349 PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C0014349 ON STOCK (ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

ALTER TABLE STOCK
ADD CONSTRAINT SYS_C0014350 FOREIGN KEY
(
  STOCK_TYPE_ID 
)
REFERENCES STOCK_TYPE
(
  ID 
)
ENABLE;

CREATE TABLE INSTANCE 
(
  ID VARCHAR2(10 BYTE) NOT NULL 
, STOCK_ID VARCHAR2(64 BYTE) 
, SECTION_ID VARCHAR2(10 BYTE) 
, CONSTRAINT SYS_C0014357 PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C0014357 ON INSTANCE (ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

ALTER TABLE INSTANCE
ADD CONSTRAINT FK_INSTANCE_SECTION FOREIGN KEY
(
  SECTION_ID 
)
REFERENCES SECTION
(
  ID 
)
ENABLE;

ALTER TABLE INSTANCE
ADD CONSTRAINT FK_INSTANCE_STOCK FOREIGN KEY
(
  STOCK_ID 
)
REFERENCES STOCK
(
  ID 
)
ENABLE;

CREATE TABLE RENT 
(
  ID VARCHAR2(10 BYTE) NOT NULL 
, MEMBER_ID VARCHAR2(10 BYTE) 
, INSTANCE_ID VARCHAR2(10 BYTE) 
, RENT_DATE DATE 
, RETURN_DATE DATE 
, CONSTRAINT SYS_C0014360 PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C0014360 ON RENT (ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

ALTER TABLE RENT
ADD CONSTRAINT FK_RENT_INSTANCE FOREIGN KEY
(
  INSTANCE_ID 
)
REFERENCES INSTANCE
(
  ID 
)
ENABLE;

ALTER TABLE RENT
ADD CONSTRAINT FK_RENT_MEMBER FOREIGN KEY
(
  MEMBER_ID 
)
REFERENCES MEMBER
(
  ID 
)
ENABLE;

CREATE TABLE STOCK_STOCK_AUTHOR 
(
  STOCK_ID VARCHAR2(64 BYTE) NOT NULL 
, STOCK_AUTHOR_ID VARCHAR2(10 BYTE) NOT NULL 
, CONSTRAINT PK_STOCK_STOCK_AUTHOR PRIMARY KEY 
  (
    STOCK_ID 
  , STOCK_AUTHOR_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX PK_STOCK_STOCK_AUTHOR ON STOCK_STOCK_AUTHOR (STOCK_ID ASC, STOCK_AUTHOR_ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

ALTER TABLE STOCK_STOCK_AUTHOR
ADD CONSTRAINT FK_STOCK_STOCK_AUTHOR_STOCK FOREIGN KEY
(
  STOCK_ID 
)
REFERENCES STOCK
(
  ID 
)
ENABLE;

ALTER TABLE STOCK_STOCK_AUTHOR
ADD CONSTRAINT FK_STOCK_STOCK_AUTHOR_STOCK_AU FOREIGN KEY
(
  STOCK_AUTHOR_ID 
)
REFERENCES STOCK_AUTHOR
(
  ID 
)
ENABLE;

CREATE TABLE STOCK_STOCK_CATEGORY 
(
  STOCK_ID VARCHAR2(64 BYTE) NOT NULL 
, STOCK_CATEGORY_ID VARCHAR2(10 BYTE) NOT NULL 
, CONSTRAINT PK_STOCK_STOCK_CATEGORY PRIMARY KEY 
  (
    STOCK_ID 
  , STOCK_CATEGORY_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX PK_STOCK_STOCK_CATEGORY ON STOCK_STOCK_CATEGORY (STOCK_ID ASC, STOCK_CATEGORY_ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

ALTER TABLE STOCK_STOCK_CATEGORY
ADD CONSTRAINT FK_STOCK_STOCK_CATEGORY_STOCK FOREIGN KEY
(
  STOCK_ID 
)
REFERENCES STOCK
(
  ID 
)
ENABLE;

ALTER TABLE STOCK_STOCK_CATEGORY
ADD CONSTRAINT FK_STOCK_STOCK_CATEGORY_STOCK_ FOREIGN KEY
(
  STOCK_CATEGORY_ID 
)
REFERENCES STOCK_CATEGORY
(
  ID 
)
ENABLE;
