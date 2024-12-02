Rem
Rem $Header: rm_cre.sql 30-nov-2024.11:44:02 hyeh Exp $
Rem
Rem rm_cre.sql
Rem
Rem    NAME
Rem      rm_comnt.sql - Create database objects for RM schema
Rem
Rem    DESCRIPTION
Rem      This script creates tables, associated constraints
Rem      and indexes in the RM schema. 
Rem
Rem    CREATED by Diego Rodríguez - 30/11/24

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET ECHO OFF 

REM ********************************************************************
REM Create the CUSTOMER table to hold customer details.

Prompt ******  Creating CUSTOMER table ....

CREATE TABLE customer (
    customer_id NUMBER(10) CONSTRAINT customer_id_pk PRIMARY KEY,
    name VARCHAR2(255) CONSTRAINT customer_name_nn NOT NULL,
    email VARCHAR2(255) CONSTRAINT customer_email_uk UNIQUE NOT NULL,
    phone_number VARCHAR2(20)
);

REM ********************************************************************
REM Create the TABLE_ table to hold table details for reservations.

Prompt ******  Creating TABLE_ table ....

CREATE TABLE table_ (
    table_id NUMBER(10) CONSTRAINT table_id_pk PRIMARY KEY,
    table_number NUMBER(10) CONSTRAINT table_number_uk UNIQUE NOT NULL,
    seating_capacity NUMBER(10) CONSTRAINT seating_capacity_ck CHECK (seating_capacity > 0)
);

REM ********************************************************************
REM Create the MENU_ITEM table to hold menu item details.

Prompt ******  Creating MENU_ITEM table ....

CREATE TABLE menu_item (
    item_id NUMBER(10) CONSTRAINT item_id_pk PRIMARY KEY,
    item_name VARCHAR2(255) CONSTRAINT item_name_nn NOT NULL,
    description VARCHAR2(1000),
    price NUMBER(10, 2) CONSTRAINT price_ck CHECK (price > 0),
    category VARCHAR2(100) CONSTRAINT category_nn NOT NULL
);

REM ********************************************************************
REM Create the RESERVATION table to hold reservation details.

Prompt ******  Creating RESERVATION table ....

CREATE TABLE reservation (
    reservation_id NUMBER(10) CONSTRAINT reservation_id_pk PRIMARY KEY,
    customer_id NUMBER(10) CONSTRAINT reservation_customer_fk REFERENCES customer(customer_id),
    table_id NUMBER(10) CONSTRAINT reservation_table_fk REFERENCES table_(table_id),
    reservation_date DATE CONSTRAINT reservation_date_nn NOT NULL,
    num_guests NUMBER(10) CONSTRAINT num_guests_ck CHECK (num_guests > 0)
);

REM ********************************************************************
REM Create the ORDER_ table to hold customer orders.

Prompt ******  Creating ORDER_ table ....

CREATE TABLE order_ (
    order_id NUMBER(10) CONSTRAINT order_id_pk PRIMARY KEY,
    customer_id NUMBER(10) CONSTRAINT order_customer_fk REFERENCES customer(customer_id),
    table_id NUMBER(10) CONSTRAINT order_table_fk REFERENCES table_(table_id),
    order_date DATE CONSTRAINT order_date_nn NOT NULL,
    total_amount NUMBER(10, 2) CONSTRAINT total_amount_ck CHECK (total_amount >= 0),
    status VARCHAR2(20) CONSTRAINT status_nn NOT NULL
);

REM ********************************************************************
REM Create the ORDER_DETAILS table to hold order details.

Prompt ******  Creating ORDER_DETAILS table ....

CREATE TABLE order_details (
    order_details_id NUMBER(10) CONSTRAINT order_details_id_pk PRIMARY KEY,
    order_id NUMBER(10) CONSTRAINT order_details_order_fk REFERENCES order_(order_id),
    item_id NUMBER(10) CONSTRAINT order_details_item_fk REFERENCES menu_item(item_id),
    quantity NUMBER(10) CONSTRAINT quantity_ck CHECK (quantity > 0)
);

REM ********************************************************************
REM Create the PAYMENT table to hold payment information.

Prompt ******  Creating PAYMENT table ....

CREATE TABLE payment (
    payment_id NUMBER(10) CONSTRAINT payment_id_pk PRIMARY KEY,
    order_id NUMBER(10) CONSTRAINT payment_order_fk REFERENCES order_(order_id),
    amount NUMBER(10, 2) CONSTRAINT payment_amount_ck CHECK (amount > 0),
    method VARCHAR2(50) CONSTRAINT method_nn NOT NULL,
    payment_date DATE CONSTRAINT payment_date_nn NOT NULL
);

REM ********************************************************************
REM Create the REVIEW table to hold customer reviews.

Prompt ******  Creating REVIEW table ....

CREATE TABLE review (
    review_id NUMBER(10) CONSTRAINT review_id_pk PRIMARY KEY,
    customer_id NUMBER(10) CONSTRAINT review_customer_fk REFERENCES customer(customer_id),
    order_id NUMBER(10) CONSTRAINT review_order_fk REFERENCES order_(order_id),
    item_id NUMBER(10) CONSTRAINT review_item_fk REFERENCES menu_item(item_id),
    rating NUMBER(2) CONSTRAINT rating_ck CHECK (rating BETWEEN 1 AND 5),
    review_comment VARCHAR2(200),
    review_date DATE CONSTRAINT review_date_nn NOT NULL
);


COMMIT;
