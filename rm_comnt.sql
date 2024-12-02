Rem
Rem $Header: rm_comnt.sql 30-nov-2024.11:44:02 hyeh Exp $
Rem
Rem rm_comnt.sql
Rem
Rem    NAME
Rem      rm_comnt.sql - Create comments for RM schema
Rem
Rem    DESCRIPTION
Rem      This script creates comments for the RM schema
Rem
Rem    CREATED by Diego Rodríguez - 30/11/24

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET ECHO OFF 

COMMENT ON TABLE customer 
IS 'Customer table that stores information about customers, including name, email, and phone number.';

COMMENT ON COLUMN customer.customer_id
IS 'Primary key of the customer table.';

COMMENT ON COLUMN customer.name
IS 'Name of the customer.';

COMMENT ON COLUMN customer.email
IS 'Email address of the customer.';

COMMENT ON COLUMN customer.phone_number
IS 'Phone number of the customer.';

REM *********************************************

COMMENT ON TABLE table_ 
IS 'Table table that stores information about the tables in the restaurant, including their number and seating capacity.';

COMMENT ON COLUMN table_.table_id
IS 'Primary key of the table table.';

COMMENT ON COLUMN table_.table_number
IS 'Number assigned to the table.';

COMMENT ON COLUMN table_.seating_capacity
IS 'Seating capacity of the table.';

REM *********************************************

COMMENT ON TABLE menu_item 
IS 'Menu_item table that stores information about the menu items, including name, description, price, and category.';

COMMENT ON COLUMN menu_item.item_id
IS 'Primary key of the menu_item table.';

COMMENT ON COLUMN menu_item.item_name
IS 'Name of the menu item.';

COMMENT ON COLUMN menu_item.description
IS 'Description of the menu item.';

COMMENT ON COLUMN menu_item.price
IS 'Price of the menu item.';

COMMENT ON COLUMN menu_item.category
IS 'Category of the menu item.';

REM *********************************************

COMMENT ON TABLE reservation 
IS 'Reservation table that stores reservations made by customers for specific tables.';

COMMENT ON COLUMN reservation.reservation_id
IS 'Primary key of the reservation table.';

COMMENT ON COLUMN reservation.customer_id
IS 'Foreign key to the customer table indicating which customer made the reservation.';

COMMENT ON COLUMN reservation.table_id
IS 'Foreign key to the table table indicating which table is reserved.';

COMMENT ON COLUMN reservation.reservation_date
IS 'Date and time of the reservation.';

COMMENT ON COLUMN reservation.num_guests
IS 'Number of guests for the reservation.';

REM *********************************************

COMMENT ON TABLE order_ 
IS 'Order table that stores information about orders placed by customers, including date, total amount, and status.';

COMMENT ON COLUMN order_.order_id
IS 'Primary key of the order table.';

COMMENT ON COLUMN order_.customer_id
IS 'Foreign key to the customer table indicating who placed the order.';

COMMENT ON COLUMN order_.table_id
IS 'Foreign key to the table table indicating the table where the order was placed.';

COMMENT ON COLUMN order_.order_date
IS 'Date and time when the order was placed.';

COMMENT ON COLUMN order_.total_amount
IS 'Total amount of the order.';

COMMENT ON COLUMN order_.status
IS 'Current status of the order (e.g., pending, completed).';

REM *********************************************

COMMENT ON TABLE order_details 
IS 'Order_details table that stores the details of each item in an order, including quantity.';

COMMENT ON COLUMN order_details.order_details_id
IS 'Primary key of the order_details table.';

COMMENT ON COLUMN order_details.order_id
IS 'Foreign key to the order table indicating which order this detail belongs to.';

COMMENT ON COLUMN order_details.item_id
IS 'Foreign key to the menu_item table indicating which item was ordered.';

COMMENT ON COLUMN order_details.quantity
IS 'Quantity of the item ordered.';

REM *********************************************

COMMENT ON TABLE payment 
IS 'Payment table that stores information about payments made for orders.';

COMMENT ON COLUMN payment.payment_id
IS 'Primary key of the payment table.';

COMMENT ON COLUMN payment.order_id
IS 'Foreign key to the order table indicating which order the payment is for.';

COMMENT ON COLUMN payment.amount
IS 'Amount paid.';

COMMENT ON COLUMN payment.method
IS 'Payment method used (e.g., cash, credit card).';

COMMENT ON COLUMN payment.payment_date
IS 'Date and time of the payment.';

REM *********************************************

COMMENT ON TABLE review 
IS 'Review table that stores reviews given by customers for menu items.';

COMMENT ON COLUMN review.review_id
IS 'Primary key of the review table.';

COMMENT ON COLUMN review.customer_id
IS 'Foreign key to the customer table indicating who gave the review.';

COMMENT ON COLUMN review.order_id
IS 'Foreign key to the order table indicating which order the review is associated with.';

COMMENT ON COLUMN review.item_id
IS 'Foreign key to the menu_item table indicating which item the review is about.';

COMMENT ON COLUMN review.rating
IS 'Rating given by the customer (e.g., 1-5).';

COMMENT ON COLUMN review.review_comment
IS 'Comment provided by the customer in the review.';

COMMENT ON COLUMN review.review_date
IS 'Date when the review was submitted.';

COMMIT;
