
CREATE TABLE CUST
(
	CUST_address         VARCHAR2(20)  NULL ,
	CUST_city            VARCHAR2(20)  NULL ,
	CUST_first_name      VARCHAR2(20)  NULL ,
	CUST_last_name       VARCHAR2(20)  NULL ,
	CUST_state           VARCHAR2(20)  NULL ,
	CUST_zip_code        INTEGER  NULL ,
	email                VARCHAR2  NULL ,
	CUST_number          INTEGER  NOT NULL 
);

CREATE UNIQUE INDEX XPKCUSTOMER ON CUST
(CUST_number   ASC);

ALTER TABLE CUST
	ADD CONSTRAINT  XPKCUSTOMER PRIMARY KEY (CUST_number);

CREATE UNIQUE INDEX XAK1CUSTOMER ON CUST
(CUST_address   ASC);

ALTER TABLE CUST
ADD 
CONSTRAINT  XAK1CUSTOMER UNIQUE (CUST_address);

CREATE INDEX XIE1CUSTOMER ON CUST
(CUST_last_name   ASC);

CREATE TABLE CUST_CREDIT
(
	credit_card          INTEGER  NULL ,
	credit_card_exp      INTEGER  NULL ,
	status_code          VARCHAR2(20)  NULL ,
	CUST_number          INTEGER  NOT NULL 
);

CREATE UNIQUE INDEX XPKCUSTOMER_CREDIT ON CUST_CREDIT
(CUST_number   ASC);

ALTER TABLE CUST_CREDIT
	ADD CONSTRAINT  XPKCUSTOMER_CREDIT PRIMARY KEY (CUST_number);

CREATE TABLE EMP
(
	EMP_first_name       VARCHAR2(20)  NULL ,
	EMP_address          VARCHAR2(20)  NULL ,
	EMP_phone            INTEGER  NULL ,
	store_number         INTEGER  NULL ,
	EMP_address_2        VARCHAR2(20)  NULL ,
	email                VARCHAR2(20)  NULL ,
	salary               INTEGER  NULL ,
	hire_date            DATE  NULL ,
	soc_sec_number       INTEGER  NULL ,
	EMP_number           VARCHAR2(20)  NOT NULL ,
	supervisor           VARCHAR2(20)  NOT NULL 
);

CREATE UNIQUE INDEX XPKEMPLOYEE ON EMP
(EMP_number   ASC);

ALTER TABLE EMP
	ADD CONSTRAINT  XPKEMPLOYEE PRIMARY KEY (EMP_number);

CREATE UNIQUE INDEX XAK1EMPLOYEE ON EMP
(soc_sec_number   ASC,EMP_phone   ASC);

ALTER TABLE EMP
ADD 
CONSTRAINT  XAK1EMPLOYEE UNIQUE (soc_sec_number,EMP_phone);

CREATE INDEX XIE1EMPLOYEE ON EMP
(EMP_first_name   ASC);

CREATE TABLE MO_RENT_REC
(
	rental_date          DATE  NULL ,
	due_date             DATE  NULL ,
	rental_status        VARCHAR2(20)  NULL ,
	payment_transaction_number INTEGER  NULL ,
	overdue_charge       INTEGER  NULL ,
	rental_rate          INTEGER  NULL ,
	EMP_phone            INTEGER  NOT NULL ,
	soc_sec_number       INTEGER  NOT NULL ,
	rental_record_date   DATE  NOT NULL ,
	mo_co_num            INTEGER  NOT NULL ,
	movie_number         INTEGER  NOT NULL ,
	CUST_number          INTEGER  NOT NULL 
);

CREATE UNIQUE INDEX XPKMOVIE_RENTAL_RECORD ON MO_RENT_REC
(rental_record_date   ASC,mo_co_num   ASC,movie_number   ASC,soc_sec_number   ASC,EMP_phone   ASC,CUST_number   ASC);

ALTER TABLE MO_RENT_REC
	ADD CONSTRAINT  XPKMOVIE_RENTAL_RECORD PRIMARY KEY (rental_record_date,mo_co_num,movie_number,soc_sec_number,EMP_phone,CUST_number);

CREATE TABLE MOVIE
(
	movie_title          VARCHAR2(20)  NULL ,
	movie_director       VARCHAR2(20)  NULL ,
	description          VARCHAR2(20)  NULL ,
	star_1_name          VARCHAR2(20)  NULL ,
	rating               VARCHAR2  NULL ,
	star_2_name          VARCHAR2(20)  NULL ,
	movie_number         INTEGER  NOT NULL ,
	genre                char  NULL  CONSTRAINT  Movie_genre_354617017 CHECK (genre IN ('AA', 'AN', 'CO', 'DO', 'DR', 'FA', 'CL', 'HO', 'MY', 'SF', 'WS')),
	rental_rate          NUMBER  NULL ,
	movie_url            VARCHAR2  NULL ,
	movie_clip           BLOB  NULL 
);

CREATE UNIQUE INDEX XPKMOVIE ON MOVIE
(movie_number   ASC);

ALTER TABLE MOVIE
	ADD CONSTRAINT  XPKMOVIE PRIMARY KEY (movie_number);

CREATE UNIQUE INDEX XAK1MOVIE ON MOVIE
(movie_title   ASC);

ALTER TABLE MOVIE
ADD 
CONSTRAINT  XAK1MOVIE UNIQUE (movie_title);

CREATE TABLE MOVIE_COPY
(
	general_condition    VARCHAR2(20)  NULL ,
	movie_format         VARCHAR2(20)  NULL ,
	mo_co_num            INTEGER  NOT NULL ,
	movie_number         INTEGER  NOT NULL 
);

CREATE UNIQUE INDEX XPKMOVIE_COPY ON MOVIE_COPY
(mo_co_num   ASC,movie_number   ASC);

ALTER TABLE MOVIE_COPY
	ADD CONSTRAINT  XPKMOVIE_COPY PRIMARY KEY (mo_co_num,movie_number);

CREATE TABLE PAYMENT
(
	payment_transaction_number INTEGER  NOT NULL ,
	payment_type         char(18)  NULL ,
	payment_amount       NUMBER  NULL ,
	payment_date         DATE  NULL ,
	payment_status       VARCHAR2(1)  NULL ,
	EMP_number           VARCHAR2(20)  NOT NULL ,
	CUST_number          INTEGER  NULL ,
	customer_no          INTEGER  NULL ,
	check_bank_number    INTEGER  NULL ,
	check_number         INTEGER  NULL ,
	epay_vendor_number   INTEGER  NULL ,
	epay_account_number  INTEGER  NULL ,
	credit_card_number   CHAR(18)  NULL ,
	credit_card_exp      DATE  NULL ,
	credit_card_type     CHAR(18)  NULL 
);

CREATE UNIQUE INDEX XPKPAYMENT ON PAYMENT
(payment_transaction_number   ASC);

ALTER TABLE PAYMENT
	ADD CONSTRAINT  XPKPAYMENT PRIMARY KEY (payment_transaction_number);

CREATE TABLE STORE
(
	store_manager        VARCHAR2(20)  NULL ,
	store_address        VARCHAR2(20)  NULL ,
	store_address_2      VARCHAR2(20)  NULL ,
	store_phone          INTEGER  NULL ,
	store_city           VARCHAR2(20)  NULL ,
	store_state          VARCHAR2(20)  NULL ,
	store_zip_code       INTEGER  NULL ,
	store_number         INTEGER  NOT NULL 
);

CREATE UNIQUE INDEX XPKSTORE ON STORE
(store_number   ASC);

ALTER TABLE STORE
	ADD CONSTRAINT  XPKSTORE PRIMARY KEY (store_number);

CREATE INDEX XIE1STORE ON STORE
(store_manager   ASC);

CREATE TABLE MOVIE_STORE
(
	movie_number         INTEGER  NOT NULL ,
	store_number         INTEGER  NOT NULL 
);

CREATE UNIQUE INDEX XPKMOVIE_STORE ON MOVIE_STORE
(movie_number   ASC,store_number   ASC);

ALTER TABLE MOVIE_STORE
	ADD CONSTRAINT  XPKMOVIE_STORE PRIMARY KEY (movie_number,store_number);

CREATE VIEW CUSTOMER_INVOICEx ( credit_card,credit_card_exp,status_code,CUST_number,CUST_address,email,CUST_city,CUST_first_name,CUST_last_name,CUST_state,CUST_zip_code,rental_record_date,mo_co_num,movie_number,rental_date,due_date,rental_status,overdue_charge,rental_rate,movie_title,Overdue_Charge_Rate ) 
	 AS  SELECT ALL CUST_CREDIT.credit_card,CUST_CREDIT.credit_card_exp,CUST_CREDIT.status_code,CUST.CUST_number,CUST.CUST_address,CUST.email,CUST.CUST_city,CUST.CUST_first_name,CUST.CUST_last_name,CUST.CUST_state,CUST.CUST_zip_code,MO_RENT_REC.rental_record_date,MO_RENT_REC.mo_co_num,MO_RENT_REC.movie_number,MO_RENT_REC.rental_date,MO_RENT_REC.due_date,MO_RENT_REC.rental_status,MO_RENT_REC.overdue_charge,MO_RENT_REC.rental_rate,MOVIE.movie_title,rental_rate * 1.5
		FROM CUST_CREDIT ,CUST ,MO_RENT_REC ,MOVIE ;

CREATE VIEW OVERDUE_NOTICE ( credit_card,credit_card_exp,status_code,Overdue_Charge_Rate,CUST_number,CUST_address,email,CUST_city,CUST_first_name,CUST_last_name,CUST_state,CUST_zip_code,rental_record_date,mo_co_num,movie_number,rental_date,due_date,rental_status,overdue_charge,rental_rate ) 
	 AS  SELECT ALL CUST_CREDIT.credit_card,CUST_CREDIT.credit_card_exp,CUST_CREDIT.status_code,rental_rate * 1.5,CUST.CUST_number,CUST.CUST_address,CUST.email,CUST.CUST_city,CUST.CUST_first_name,CUST.CUST_last_name,CUST.CUST_state,CUST.CUST_zip_code,MO_RENT_REC.rental_record_date,MO_RENT_REC.mo_co_num,MO_RENT_REC.movie_number,MO_RENT_REC.rental_date,MO_RENT_REC.due_date,MO_RENT_REC.rental_status,MO_RENT_REC.overdue_charge,MO_RENT_REC.rental_rate
		FROM CUST_CREDIT ,CUST ,MO_RENT_REC ;

ALTER TABLE EMP
	ADD (
CONSTRAINT employs_is FOREIGN KEY (store_number) REFERENCES STORE (store_number) ON DELETE SET NULL);

ALTER TABLE EMP
	ADD (
CONSTRAINT reports_to FOREIGN KEY (supervisor) REFERENCES EMP (EMP_number) ON DELETE SET NULL);

ALTER TABLE MO_RENT_REC
	ADD (
CONSTRAINT completes FOREIGN KEY (soc_sec_number, EMP_phone) REFERENCES EMP (soc_sec_number, EMP_phone));

ALTER TABLE MO_RENT_REC
	ADD (
CONSTRAINT is_rented_under FOREIGN KEY (mo_co_num, movie_number) REFERENCES MOVIE_COPY (mo_co_num, movie_number));

ALTER TABLE MO_RENT_REC
	ADD (
CONSTRAINT R_8_1 FOREIGN KEY (CUST_number) REFERENCES CUST (CUST_number));

ALTER TABLE MO_RENT_REC
	ADD (
CONSTRAINT R_8_2 FOREIGN KEY (CUST_number) REFERENCES CUST_CREDIT (CUST_number));

ALTER TABLE MO_RENT_REC
	ADD (
CONSTRAINT is_made_on FOREIGN KEY (payment_transaction_number) REFERENCES PAYMENT (payment_transaction_number) ON DELETE SET NULL);

ALTER TABLE MOVIE_COPY
	ADD (
CONSTRAINT is_rented_as FOREIGN KEY (movie_number) REFERENCES MOVIE (movie_number));

ALTER TABLE PAYMENT
	ADD (
CONSTRAINT receives FOREIGN KEY (EMP_number) REFERENCES EMP (EMP_number) ON DELETE SET NULL);

ALTER TABLE PAYMENT
	ADD (
CONSTRAINT R_7_1 FOREIGN KEY (customer_no) REFERENCES CUST (CUST_number) ON DELETE SET NULL);

ALTER TABLE PAYMENT
	ADD (
CONSTRAINT R_7_2 FOREIGN KEY (CUST_number) REFERENCES CUST_CREDIT (CUST_number) ON DELETE SET NULL);

ALTER TABLE MOVIE_STORE
	ADD (
CONSTRAINT rents FOREIGN KEY (movie_number) REFERENCES MOVIE (movie_number));

ALTER TABLE MOVIE_STORE
	ADD (
CONSTRAINT is_in FOREIGN KEY (store_number) REFERENCES STORE (store_number));

CREATE  TRIGGER  tD_CUST AFTER DELETE ON CUST for each row
-- erwin Builtin Trigger
-- DELETE trigger on CUST 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* CUST makes PAYMENT on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0001c04c", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
    UPDATE PAYMENT
      SET
        /* %SetFK(PAYMENT,NULL) */
        PAYMENT.customer_no = NULL
      WHERE
        /* %JoinFKPK(PAYMENT,:%Old," = "," AND") */
        PAYMENT.customer_no = :old.CUST_number;

    /* erwin Builtin Trigger */
    /* CUST rents under MO_RENT_REC on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CUST_number" */
    SELECT count(*) INTO NUMROWS
      FROM MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,:%Old," = "," AND") */
        MO_RENT_REC.CUST_number = :old.CUST_number;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete CUST because MO_RENT_REC exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_CUST AFTER UPDATE ON CUST for each row
-- erwin Builtin Trigger
-- UPDATE trigger on CUST 
DECLARE NUMROWS INTEGER;
BEGIN
  /* CUST makes PAYMENT on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00020e63", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.CUST_number <> :new.CUST_number
  THEN
    UPDATE PAYMENT
      SET
        /* %SetFK(PAYMENT,NULL) */
        PAYMENT.customer_no = NULL
      WHERE
        /* %JoinFKPK(PAYMENT,:%Old," = ",",") */
        PAYMENT.customer_no = :old.CUST_number;
  END IF;

  /* erwin Builtin Trigger */
  /* CUST rents under MO_RENT_REC on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CUST_number" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.CUST_number <> :new.CUST_number
  THEN
    SELECT count(*) INTO NUMROWS
      FROM MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,:%Old," = "," AND") */
        MO_RENT_REC.CUST_number = :old.CUST_number;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update CUST because MO_RENT_REC exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_CUST_CREDIT AFTER DELETE ON CUST_CREDIT for each row
-- erwin Builtin Trigger
-- DELETE trigger on CUST_CREDIT 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* CUST_CREDIT makes PAYMENT on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0001c9d2", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CUST_number" */
    UPDATE PAYMENT
      SET
        /* %SetFK(PAYMENT,NULL) */
        PAYMENT.CUST_number = NULL
      WHERE
        /* %JoinFKPK(PAYMENT,:%Old," = "," AND") */
        PAYMENT.CUST_number = :old.CUST_number;

    /* erwin Builtin Trigger */
    /* CUST_CREDIT rents under MO_RENT_REC on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CUST_number" */
    SELECT count(*) INTO NUMROWS
      FROM MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,:%Old," = "," AND") */
        MO_RENT_REC.CUST_number = :old.CUST_number;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete CUST_CREDIT because MO_RENT_REC exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_CUST_CREDIT AFTER UPDATE ON CUST_CREDIT for each row
-- erwin Builtin Trigger
-- UPDATE trigger on CUST_CREDIT 
DECLARE NUMROWS INTEGER;
BEGIN
  /* CUST_CREDIT makes PAYMENT on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00021f52", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CUST_number" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.CUST_number <> :new.CUST_number
  THEN
    UPDATE PAYMENT
      SET
        /* %SetFK(PAYMENT,NULL) */
        PAYMENT.CUST_number = NULL
      WHERE
        /* %JoinFKPK(PAYMENT,:%Old," = ",",") */
        PAYMENT.CUST_number = :old.CUST_number;
  END IF;

  /* erwin Builtin Trigger */
  /* CUST_CREDIT rents under MO_RENT_REC on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CUST_number" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.CUST_number <> :new.CUST_number
  THEN
    SELECT count(*) INTO NUMROWS
      FROM MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,:%Old," = "," AND") */
        MO_RENT_REC.CUST_number = :old.CUST_number;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update CUST_CREDIT because MO_RENT_REC exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_EMP AFTER DELETE ON EMP for each row
-- erwin Builtin Trigger
-- DELETE trigger on EMP 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* EMP receives PAYMENT on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0002b32a", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_number" */
    UPDATE PAYMENT
      SET
        /* %SetFK(PAYMENT,NULL) */
        PAYMENT.EMP_number = NULL
      WHERE
        /* %JoinFKPK(PAYMENT,:%Old," = "," AND") */
        PAYMENT.EMP_number = :old.EMP_number;

    /* erwin Builtin Trigger */
    /* EMP reports to EMP on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="supervisor" */
    UPDATE EMP
      SET
        /* %SetFK(EMP,NULL) */
        EMP.supervisor = NULL
      WHERE
        /* %JoinFKPK(EMP,:%Old," = "," AND") */
        EMP.supervisor = :old.EMP_number;

    /* erwin Builtin Trigger */
    /* EMP completes MO_RENT_REC on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="soc_sec_number""EMP_phone" */
    SELECT count(*) INTO NUMROWS
      FROM MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,:%Old," = "," AND") */
        MO_RENT_REC.EMP_phone = :old.EMP_phone AND
        MO_RENT_REC.soc_sec_number = :old.soc_sec_number;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete EMP because MO_RENT_REC exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_EMP BEFORE INSERT ON EMP for each row
-- erwin Builtin Trigger
-- INSERT trigger on EMP 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* EMP reports to EMP on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="0001f5c5", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="supervisor" */
    UPDATE EMP
      SET
        /* %SetFK(EMP,NULL) */
        EMP.supervisor = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM EMP
            WHERE
              /* %JoinFKPK(:%New,EMP," = "," AND") */
              :new.supervisor = EMP.EMP_number
        ) 
        /* %JoinPKPK(EMP,:%New," = "," AND") */
         and EMP.EMP_number = :new.EMP_number;

    /* erwin Builtin Trigger */
    /* STORE employs is EMP on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="store_number" */
    UPDATE EMP
      SET
        /* %SetFK(EMP,NULL) */
        EMP.store_number = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM STORE
            WHERE
              /* %JoinFKPK(:%New,STORE," = "," AND") */
              :new.store_number = STORE.store_number
        ) 
        /* %JoinPKPK(EMP,:%New," = "," AND") */
         and EMP.EMP_number = :new.EMP_number;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_EMP AFTER UPDATE ON EMP for each row
-- erwin Builtin Trigger
-- UPDATE trigger on EMP 
DECLARE NUMROWS INTEGER;
BEGIN
  /* EMP receives PAYMENT on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00051f98", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_number" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.EMP_number <> :new.EMP_number
  THEN
    UPDATE PAYMENT
      SET
        /* %SetFK(PAYMENT,NULL) */
        PAYMENT.EMP_number = NULL
      WHERE
        /* %JoinFKPK(PAYMENT,:%Old," = ",",") */
        PAYMENT.EMP_number = :old.EMP_number;
  END IF;

  /* EMP reports to EMP on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="supervisor" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.EMP_number <> :new.EMP_number
  THEN
    UPDATE EMP
      SET
        /* %SetFK(EMP,NULL) */
        EMP.supervisor = NULL
      WHERE
        /* %JoinFKPK(EMP,:%Old," = ",",") */
        EMP.supervisor = :old.EMP_number;
  END IF;

  /* erwin Builtin Trigger */
  /* EMP completes MO_RENT_REC on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="soc_sec_number""EMP_phone" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.EMP_number <> :new.EMP_number
  THEN
    SELECT count(*) INTO NUMROWS
      FROM MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,:%Old," = "," AND") */
        MO_RENT_REC.EMP_phone = :old.EMP_phone AND
        MO_RENT_REC.soc_sec_number = :old.soc_sec_number;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update EMP because MO_RENT_REC exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* EMP reports to EMP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="reports to", C2P_VERB_PHRASE="supervises", 
    FK_CONSTRAINT="reports_to", FK_COLUMNS="supervisor" */
  SELECT count(*) INTO NUMROWS
    FROM EMP
    WHERE
      /* %JoinFKPK(:%New,EMP," = "," AND") */
      :new.supervisor = EMP.EMP_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.supervisor IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update EMP because EMP does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* STORE employs is EMP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="store_number" */
  SELECT count(*) INTO NUMROWS
    FROM STORE
    WHERE
      /* %JoinFKPK(:%New,STORE," = "," AND") */
      :new.store_number = STORE.store_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.store_number IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update EMP because STORE does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_MO_RENT_REC BEFORE INSERT ON MO_RENT_REC for each row
-- erwin Builtin Trigger
-- INSERT trigger on MO_RENT_REC 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* PAYMENT is made on MO_RENT_REC on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00062920", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="payment_transaction_number" */
    UPDATE MO_RENT_REC
      SET
        /* %SetFK(MO_RENT_REC,NULL) */
        MO_RENT_REC.payment_transaction_number = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM PAYMENT
            WHERE
              /* %JoinFKPK(:%New,PAYMENT," = "," AND") */
              :new.payment_transaction_number = PAYMENT.payment_transaction_number
        ) 
        /* %JoinPKPK(MO_RENT_REC,:%New," = "," AND") */
         and MO_RENT_REC.EMP_phone = :new.EMP_phone AND
        MO_RENT_REC.soc_sec_number = :new.soc_sec_number AND
        MO_RENT_REC.rental_record_date = :new.rental_record_date AND
        MO_RENT_REC.mo_co_num = :new.mo_co_num AND
        MO_RENT_REC.movie_number = :new.movie_number AND
        MO_RENT_REC.CUST_number = :new.CUST_number;

    /* erwin Builtin Trigger */
    /* CUST_CREDIT rents under MO_RENT_REC on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CUST_number" */
    SELECT count(*) INTO NUMROWS
      FROM CUST_CREDIT
      WHERE
        /* %JoinFKPK(:%New,CUST_CREDIT," = "," AND") */
        :new.CUST_number = CUST_CREDIT.CUST_number;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert MO_RENT_REC because CUST_CREDIT does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* CUST rents under MO_RENT_REC on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CUST_number" */
    SELECT count(*) INTO NUMROWS
      FROM CUST
      WHERE
        /* %JoinFKPK(:%New,CUST," = "," AND") */
        :new.CUST_number = CUST.CUST_number;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert MO_RENT_REC because CUST does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* MOVIE_COPY is rented under MO_RENT_REC on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="mo_co_num""movie_number" */
    SELECT count(*) INTO NUMROWS
      FROM MOVIE_COPY
      WHERE
        /* %JoinFKPK(:%New,MOVIE_COPY," = "," AND") */
        :new.mo_co_num = MOVIE_COPY.mo_co_num AND
        :new.movie_number = MOVIE_COPY.movie_number;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert MO_RENT_REC because MOVIE_COPY does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* EMP completes MO_RENT_REC on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="soc_sec_number""EMP_phone" */
    SELECT count(*) INTO NUMROWS
      FROM EMP
      WHERE
        /* %JoinFKPK(:%New,EMP," = "," AND") */
        :new.EMP_phone = EMP.EMP_phone AND
        :new.soc_sec_number = EMP.soc_sec_number;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert MO_RENT_REC because EMP does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_MO_RENT_REC AFTER UPDATE ON MO_RENT_REC for each row
-- erwin Builtin Trigger
-- UPDATE trigger on MO_RENT_REC 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* PAYMENT is made on MO_RENT_REC on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0005aa1a", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="payment_transaction_number" */
  SELECT count(*) INTO NUMROWS
    FROM PAYMENT
    WHERE
      /* %JoinFKPK(:%New,PAYMENT," = "," AND") */
      :new.payment_transaction_number = PAYMENT.payment_transaction_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.payment_transaction_number IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update MO_RENT_REC because PAYMENT does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* CUST_CREDIT rents under MO_RENT_REC on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_2", 
    FK_CONSTRAINT="R_8_2", FK_COLUMNS="CUST_number" */
  SELECT count(*) INTO NUMROWS
    FROM CUST_CREDIT
    WHERE
      /* %JoinFKPK(:%New,CUST_CREDIT," = "," AND") */
      :new.CUST_number = CUST_CREDIT.CUST_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update MO_RENT_REC because CUST_CREDIT does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* CUST rents under MO_RENT_REC on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="rents under", C2P_VERB_PHRASE="identifies_1", 
    FK_CONSTRAINT="R_8_1", FK_COLUMNS="CUST_number" */
  SELECT count(*) INTO NUMROWS
    FROM CUST
    WHERE
      /* %JoinFKPK(:%New,CUST," = "," AND") */
      :new.CUST_number = CUST.CUST_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update MO_RENT_REC because CUST does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* MOVIE_COPY is rented under MO_RENT_REC on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="mo_co_num""movie_number" */
  SELECT count(*) INTO NUMROWS
    FROM MOVIE_COPY
    WHERE
      /* %JoinFKPK(:%New,MOVIE_COPY," = "," AND") */
      :new.mo_co_num = MOVIE_COPY.mo_co_num AND
      :new.movie_number = MOVIE_COPY.movie_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update MO_RENT_REC because MOVIE_COPY does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* EMP completes MO_RENT_REC on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="completes", C2P_VERB_PHRASE="is completed by", 
    FK_CONSTRAINT="completes", FK_COLUMNS="soc_sec_number""EMP_phone" */
  SELECT count(*) INTO NUMROWS
    FROM EMP
    WHERE
      /* %JoinFKPK(:%New,EMP," = "," AND") */
      :new.EMP_phone = EMP.EMP_phone AND
      :new.soc_sec_number = EMP.soc_sec_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update MO_RENT_REC because EMP does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_MOVIE AFTER DELETE ON MOVIE for each row
-- erwin Builtin Trigger
-- DELETE trigger on MOVIE 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* MOVIE rents MOVIE_STORE on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001e806", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="movie_number" */
    SELECT count(*) INTO NUMROWS
      FROM MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,:%Old," = "," AND") */
        MOVIE_STORE.movie_number = :old.movie_number;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete MOVIE because MOVIE_STORE exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* MOVIE is rented as MOVIE_COPY on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="movie_number" */
    SELECT count(*) INTO NUMROWS
      FROM MOVIE_COPY
      WHERE
        /*  %JoinFKPK(MOVIE_COPY,:%Old," = "," AND") */
        MOVIE_COPY.movie_number = :old.movie_number;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete MOVIE because MOVIE_COPY exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_MOVIE AFTER UPDATE ON MOVIE for each row
-- erwin Builtin Trigger
-- UPDATE trigger on MOVIE 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* MOVIE rents MOVIE_STORE on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00023877", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="movie_number" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.movie_number <> :new.movie_number
  THEN
    SELECT count(*) INTO NUMROWS
      FROM MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,:%Old," = "," AND") */
        MOVIE_STORE.movie_number = :old.movie_number;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update MOVIE because MOVIE_STORE exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* MOVIE is rented as MOVIE_COPY on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="movie_number" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.movie_number <> :new.movie_number
  THEN
    SELECT count(*) INTO NUMROWS
      FROM MOVIE_COPY
      WHERE
        /*  %JoinFKPK(MOVIE_COPY,:%Old," = "," AND") */
        MOVIE_COPY.movie_number = :old.movie_number;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update MOVIE because MOVIE_COPY exists.'
      );
    END IF;
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_MOVIE_COPY AFTER DELETE ON MOVIE_COPY for each row
-- erwin Builtin Trigger
-- DELETE trigger on MOVIE_COPY 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* MOVIE_COPY is rented under MO_RENT_REC on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="00010cf4", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="mo_co_num""movie_number" */
    SELECT count(*) INTO NUMROWS
      FROM MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,:%Old," = "," AND") */
        MO_RENT_REC.mo_co_num = :old.mo_co_num AND
        MO_RENT_REC.movie_number = :old.movie_number;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete MOVIE_COPY because MO_RENT_REC exists.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_MOVIE_COPY BEFORE INSERT ON MOVIE_COPY for each row
-- erwin Builtin Trigger
-- INSERT trigger on MOVIE_COPY 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* MOVIE is rented as MOVIE_COPY on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0000f789", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="movie_number" */
    SELECT count(*) INTO NUMROWS
      FROM MOVIE
      WHERE
        /* %JoinFKPK(:%New,MOVIE," = "," AND") */
        :new.movie_number = MOVIE.movie_number;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert MOVIE_COPY because MOVIE does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_MOVIE_COPY AFTER UPDATE ON MOVIE_COPY for each row
-- erwin Builtin Trigger
-- UPDATE trigger on MOVIE_COPY 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* MOVIE_COPY is rented under MO_RENT_REC on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="00025370", PARENT_OWNER="", PARENT_TABLE="MOVIE_COPY"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is rented under", C2P_VERB_PHRASE="records rental of a", 
    FK_CONSTRAINT="is_rented_under", FK_COLUMNS="mo_co_num""movie_number" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.mo_co_num <> :new.mo_co_num OR 
    :old.movie_number <> :new.movie_number
  THEN
    SELECT count(*) INTO NUMROWS
      FROM MO_RENT_REC
      WHERE
        /*  %JoinFKPK(MO_RENT_REC,:%Old," = "," AND") */
        MO_RENT_REC.mo_co_num = :old.mo_co_num AND
        MO_RENT_REC.movie_number = :old.movie_number;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update MOVIE_COPY because MO_RENT_REC exists.'
      );
    END IF;
  END IF;

  /* erwin Builtin Trigger */
  /* MOVIE is rented as MOVIE_COPY on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_COPY"
    P2C_VERB_PHRASE="is rented as", C2P_VERB_PHRASE="is a copy of a", 
    FK_CONSTRAINT="is_rented_as", FK_COLUMNS="movie_number" */
  SELECT count(*) INTO NUMROWS
    FROM MOVIE
    WHERE
      /* %JoinFKPK(:%New,MOVIE," = "," AND") */
      :new.movie_number = MOVIE.movie_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update MOVIE_COPY because MOVIE does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_PAYMENT AFTER DELETE ON PAYMENT for each row
-- erwin Builtin Trigger
-- DELETE trigger on PAYMENT 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* PAYMENT is made on MO_RENT_REC on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="0000e127", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="payment_transaction_number" */
    UPDATE MO_RENT_REC
      SET
        /* %SetFK(MO_RENT_REC,NULL) */
        MO_RENT_REC.payment_transaction_number = NULL
      WHERE
        /* %JoinFKPK(MO_RENT_REC,:%Old," = "," AND") */
        MO_RENT_REC.payment_transaction_number = :old.payment_transaction_number;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tI_PAYMENT BEFORE INSERT ON PAYMENT for each row
-- erwin Builtin Trigger
-- INSERT trigger on PAYMENT 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* CUST_CREDIT makes PAYMENT on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00032c8e", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CUST_number" */
    UPDATE PAYMENT
      SET
        /* %SetFK(PAYMENT,NULL) */
        PAYMENT.CUST_number = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM CUST_CREDIT
            WHERE
              /* %JoinFKPK(:%New,CUST_CREDIT," = "," AND") */
              :new.CUST_number = CUST_CREDIT.CUST_number
        ) 
        /* %JoinPKPK(PAYMENT,:%New," = "," AND") */
         and PAYMENT.payment_transaction_number = :new.payment_transaction_number;

    /* erwin Builtin Trigger */
    /* CUST makes PAYMENT on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
    UPDATE PAYMENT
      SET
        /* %SetFK(PAYMENT,NULL) */
        PAYMENT.customer_no = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM CUST
            WHERE
              /* %JoinFKPK(:%New,CUST," = "," AND") */
              :new.customer_no = CUST.CUST_number
        ) 
        /* %JoinPKPK(PAYMENT,:%New," = "," AND") */
         and PAYMENT.payment_transaction_number = :new.payment_transaction_number;

    /* erwin Builtin Trigger */
    /* EMP receives PAYMENT on child insert set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_number" */
    UPDATE PAYMENT
      SET
        /* %SetFK(PAYMENT,NULL) */
        PAYMENT.EMP_number = NULL
      WHERE
        NOT EXISTS (
          SELECT * FROM EMP
            WHERE
              /* %JoinFKPK(:%New,EMP," = "," AND") */
              :new.EMP_number = EMP.EMP_number
        ) 
        /* %JoinPKPK(PAYMENT,:%New," = "," AND") */
         and PAYMENT.payment_transaction_number = :new.payment_transaction_number;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_PAYMENT AFTER UPDATE ON PAYMENT for each row
-- erwin Builtin Trigger
-- UPDATE trigger on PAYMENT 
DECLARE NUMROWS INTEGER;
BEGIN
  /* PAYMENT is made on MO_RENT_REC on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00045b4a", PARENT_OWNER="", PARENT_TABLE="PAYMENT"
    CHILD_OWNER="", CHILD_TABLE="MO_RENT_REC"
    P2C_VERB_PHRASE="is made on", C2P_VERB_PHRASE="requires", 
    FK_CONSTRAINT="is_made_on", FK_COLUMNS="payment_transaction_number" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.payment_transaction_number <> :new.payment_transaction_number
  THEN
    UPDATE MO_RENT_REC
      SET
        /* %SetFK(MO_RENT_REC,NULL) */
        MO_RENT_REC.payment_transaction_number = NULL
      WHERE
        /* %JoinFKPK(MO_RENT_REC,:%Old," = ",",") */
        MO_RENT_REC.payment_transaction_number = :old.payment_transaction_number;
  END IF;

  /* erwin Builtin Trigger */
  /* CUST_CREDIT makes PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST_CREDIT"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_2", FK_COLUMNS="CUST_number" */
  SELECT count(*) INTO NUMROWS
    FROM CUST_CREDIT
    WHERE
      /* %JoinFKPK(:%New,CUST_CREDIT," = "," AND") */
      :new.CUST_number = CUST_CREDIT.CUST_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.CUST_number IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PAYMENT because CUST_CREDIT does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* CUST makes PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="CUST"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="makes", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="R_7_1", FK_COLUMNS="customer_no" */
  SELECT count(*) INTO NUMROWS
    FROM CUST
    WHERE
      /* %JoinFKPK(:%New,CUST," = "," AND") */
      :new.customer_no = CUST.CUST_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.customer_no IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PAYMENT because CUST does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* EMP receives PAYMENT on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="EMP"
    CHILD_OWNER="", CHILD_TABLE="PAYMENT"
    P2C_VERB_PHRASE="receives", C2P_VERB_PHRASE="is received by", 
    FK_CONSTRAINT="receives", FK_COLUMNS="EMP_number" */
  SELECT count(*) INTO NUMROWS
    FROM EMP
    WHERE
      /* %JoinFKPK(:%New,EMP," = "," AND") */
      :new.EMP_number = EMP.EMP_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    :new.EMP_number IS NOT NULL AND
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update PAYMENT because EMP does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER  tD_STORE AFTER DELETE ON STORE for each row
-- erwin Builtin Trigger
-- DELETE trigger on STORE 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* STORE is in MOVIE_STORE on parent delete restrict */
    /* ERWIN_RELATION:CHECKSUM="0001b507", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="store_number" */
    SELECT count(*) INTO NUMROWS
      FROM MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,:%Old," = "," AND") */
        MOVIE_STORE.store_number = :old.store_number;
    IF (NUMROWS > 0)
    THEN
      raise_application_error(
        -20001,
        'Cannot delete STORE because MOVIE_STORE exists.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* STORE employs is EMP on parent delete set null */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="store_number" */
    UPDATE EMP
      SET
        /* %SetFK(EMP,NULL) */
        EMP.store_number = NULL
      WHERE
        /* %JoinFKPK(EMP,:%Old," = "," AND") */
        EMP.store_number = :old.store_number;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_STORE AFTER UPDATE ON STORE for each row
-- erwin Builtin Trigger
-- UPDATE trigger on STORE 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* STORE is in MOVIE_STORE on parent update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001f6e0", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="store_number" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.store_number <> :new.store_number
  THEN
    SELECT count(*) INTO NUMROWS
      FROM MOVIE_STORE
      WHERE
        /*  %JoinFKPK(MOVIE_STORE,:%Old," = "," AND") */
        MOVIE_STORE.store_number = :old.store_number;
    IF (NUMROWS > 0)
    THEN 
      raise_application_error(
        -20005,
        'Cannot update STORE because MOVIE_STORE exists.'
      );
    END IF;
  END IF;

  /* STORE employs is EMP on parent update set null */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="EMP"
    P2C_VERB_PHRASE="employs is", C2P_VERB_PHRASE="is employed by", 
    FK_CONSTRAINT="employs_is", FK_COLUMNS="store_number" */
  IF
    /* %JoinPKPK(:%Old,:%New," <> "," OR ") */
    :old.store_number <> :new.store_number
  THEN
    UPDATE EMP
      SET
        /* %SetFK(EMP,NULL) */
        EMP.store_number = NULL
      WHERE
        /* %JoinFKPK(EMP,:%Old," = ",",") */
        EMP.store_number = :old.store_number;
  END IF;


-- erwin Builtin Trigger
END;
/


CREATE  TRIGGER tI_MOVIE_STORE BEFORE INSERT ON MOVIE_STORE for each row
-- erwin Builtin Trigger
-- INSERT trigger on MOVIE_STORE 
DECLARE NUMROWS INTEGER;
BEGIN
    /* erwin Builtin Trigger */
    /* STORE is in MOVIE_STORE on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="0001f722", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="store_number" */
    SELECT count(*) INTO NUMROWS
      FROM STORE
      WHERE
        /* %JoinFKPK(:%New,STORE," = "," AND") */
        :new.store_number = STORE.store_number;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert MOVIE_STORE because STORE does not exist.'
      );
    END IF;

    /* erwin Builtin Trigger */
    /* MOVIE rents MOVIE_STORE on child insert restrict */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="movie_number" */
    SELECT count(*) INTO NUMROWS
      FROM MOVIE
      WHERE
        /* %JoinFKPK(:%New,MOVIE," = "," AND") */
        :new.movie_number = MOVIE.movie_number;
    IF (
      /* %NotnullFK(:%New," IS NOT NULL AND") */
      
      NUMROWS = 0
    )
    THEN
      raise_application_error(
        -20002,
        'Cannot insert MOVIE_STORE because MOVIE does not exist.'
      );
    END IF;


-- erwin Builtin Trigger
END;
/

CREATE  TRIGGER tU_MOVIE_STORE AFTER UPDATE ON MOVIE_STORE for each row
-- erwin Builtin Trigger
-- UPDATE trigger on MOVIE_STORE 
DECLARE NUMROWS INTEGER;
BEGIN
  /* erwin Builtin Trigger */
  /* STORE is in MOVIE_STORE on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="0001f753", PARENT_OWNER="", PARENT_TABLE="STORE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="is in", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="is_in", FK_COLUMNS="store_number" */
  SELECT count(*) INTO NUMROWS
    FROM STORE
    WHERE
      /* %JoinFKPK(:%New,STORE," = "," AND") */
      :new.store_number = STORE.store_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update MOVIE_STORE because STORE does not exist.'
    );
  END IF;

  /* erwin Builtin Trigger */
  /* MOVIE rents MOVIE_STORE on child update restrict */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="MOVIE"
    CHILD_OWNER="", CHILD_TABLE="MOVIE_STORE"
    P2C_VERB_PHRASE="rents", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="rents", FK_COLUMNS="movie_number" */
  SELECT count(*) INTO NUMROWS
    FROM MOVIE
    WHERE
      /* %JoinFKPK(:%New,MOVIE," = "," AND") */
      :new.movie_number = MOVIE.movie_number;
  IF (
    /* %NotnullFK(:%New," IS NOT NULL AND") */
    
    NUMROWS = 0
  )
  THEN
    raise_application_error(
      -20007,
      'Cannot update MOVIE_STORE because MOVIE does not exist.'
    );
  END IF;


-- erwin Builtin Trigger
END;
/

