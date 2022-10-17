CREATE TABLE STOCK_TYPE (
    ID   VARCHAR2(10) PRIMARY KEY,
    LANG VARCHAR2(2),
    NAME NVARCHAR2(128)
);

CREATE TABLE STOCK (
    ID            VARCHAR2(10) PRIMARY KEY,
    TITLE         NVARCHAR2(128),
    LANG          VARCHAR2(2),
    PAGE_COUNT    NUMBER(4),
    STOCK_TYPE_ID VARCHAR2(10),
    FOREIGN KEY ( STOCK_TYPE_ID )
        REFERENCES STOCK_TYPE ( ID )
);

CREATE TABLE STOCK_AUTHOR (
    ID   VARCHAR2(10) PRIMARY KEY,
    NAME NVARCHAR2(128)
);

CREATE TABLE STOCK_STOCK_AUTHOR (
    STOCK_ID        VARCHAR2(10),
    STOCK_AUTHOR_ID VARCHAR2(10),
    CONSTRAINT PK_STOCK_STOCK_AUTHOR PRIMARY KEY ( STOCK_ID,
                                                   STOCK_AUTHOR_ID ),
    CONSTRAINT FK_STOCK_STOCK_AUTHOR_STOCK FOREIGN KEY ( STOCK_ID )
        REFERENCES STOCK ( ID ),
    CONSTRAINT FK_STOCK_STOCK_AUTHOR_STOCK_AUTHOR FOREIGN KEY ( STOCK_AUTHOR_ID )
        REFERENCES STOCK_AUTHOR ( ID )
);

CREATE TABLE STOCK_CATEGORY (
    ID   VARCHAR2(10) PRIMARY KEY,
    NAME NVARCHAR2(128)
);

CREATE TABLE STOCK_STOCK_CATEGORY (
    STOCK_ID          VARCHAR2(10),
    STOCK_CATEGORY_ID VARCHAR2(10),
    CONSTRAINT PK_STOCK_STOCK_CATEGORY PRIMARY KEY ( STOCK_ID,
                                                     STOCK_CATEGORY_ID ),
    CONSTRAINT FK_STOCK_STOCK_CATEGORY_STOCK FOREIGN KEY ( STOCK_ID )
        REFERENCES STOCK ( ID ),
    CONSTRAINT FK_STOCK_STOCK_CATEGORY_STOCK_CATEGORY FOREIGN KEY ( STOCK_CATEGORY_ID )
        REFERENCES STOCK_CATEGORY ( ID )
);

CREATE TABLE BUILDING (
    ID      VARCHAR2(10) PRIMARY KEY,
    NAME    VARCHAR2(128) UNIQUE,
    CITY    VARCHAR2(128),
    ADDRESS NVARCHAR2(128)
);

CREATE TABLE SECTION (
    ID          VARCHAR2(10) PRIMARY KEY,
    NAME        VARCHAR2(128),
    BUILDING_ID VARCHAR2(10),
    CONSTRAINT FK_SECTION_BUILDING FOREIGN KEY ( ID )
        REFERENCES BUILDING ( ID )
);

CREATE TABLE INSTANCE (
    ID         VARCHAR2(10) PRIMARY KEY,
    STOCK_ID   VARCHAR2(10),
    SECTION_ID VARCHAR2(10),
    CONSTRAINT FK_INSTANCE_STOCK FOREIGN KEY ( STOCK_ID )
        REFERENCES STOCK ( ID ),
    CONSTRAINT FK_INSTANCE_SECTION FOREIGN KEY ( SECTION_ID )
        REFERENCES SECTION ( ID )
);

CREATE TABLE MEMBER (
    ID      VARCHAR2(10) PRIMARY KEY,
    NAME    VARCHAR2(128),
    EMAIL   VARCHAR2(128),
    ADDRESS VARCHAR2(128),
    ACTIVE  NUMBER(1),
    CONSTRAINT CH_MEMBER_ACTIVE CHECK ( ACTIVE = 0
                                        OR ACTIVE = 1 )
);

CREATE TABLE RENT (
    ID          VARCHAR2(10) PRIMARY KEY,
    MEMBER_ID   VARCHAR2(10),
    INSTANCE_ID VARCHAR2(10),
    RENT_DATE   DATE,
    RETURN_DATE DATE,
    CONSTRAINT FK_RENT_MEMBER FOREIGN KEY ( MEMBER_ID )
        REFERENCES MEMBER ( ID ),
    CONSTRAINT FK_RENT_INSTANCE FOREIGN KEY ( INSTANCE_ID )
        REFERENCES INSTANCE ( ID )
);