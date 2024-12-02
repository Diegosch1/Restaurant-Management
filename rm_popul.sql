Rem
Rem $Header: rm_popul.sql 30-nov-2024.11:44:02 hyeh Exp $
Rem
Rem rm_popul.sql
Rem
Rem    NAME
Rem      rm_comnt.sql - Populate database tables for RM schema
Rem
Rem    DESCRIPTION
Rem      This script populates all the tables in the RM schema. 
Rem
Rem    CREATED by Diego Rodríguez - 30/11/24

SET VERIFY OFF
ALTER SESSION SET NLS_LANGUAGE=American; 

REM ***************************insert data into the CUSTOMER table

Prompt ******  Populating CUSTOMER table ....

INSERT INTO customer VALUES (1, 'John Doe', 'john.doe@example.com', '123-456-7890');
INSERT INTO customer VALUES (2, 'Jane Smith', 'jane.smith@example.com', '987-654-3210');
INSERT INTO customer VALUES (3, 'Alice Johnson', 'alice.johnson@example.com', '555-123-4567');
INSERT INTO customer VALUES (4, 'Bob Brown', 'bob.brown@example.com', '555-987-6543');
INSERT INTO customer VALUES (5, 'Charlie Davis', 'charlie.davis@example.com', '555-111-2233');
INSERT INTO customer VALUES (6, 'David Wilson', 'david.wilson@example.com', '555-222-3344');
INSERT INTO customer VALUES (7, 'Eve Taylor', 'eve.taylor@example.com', '555-333-4455');
INSERT INTO customer VALUES (8, 'Frank Harris', 'frank.harris@example.com', '555-444-5566');
INSERT INTO customer VALUES (9, 'Grace Martin', 'grace.martin@example.com', '555-555-6677');
INSERT INTO customer VALUES (10, 'Henry Lee', 'henry.lee@example.com', '555-666-7788');


REM ***************************insert data into the TABLE_ table

Prompt ******  Populating TABLE_ table ....

INSERT INTO table_ VALUES (1, 101, 4);
INSERT INTO table_ VALUES (2, 102, 2);
INSERT INTO table_ VALUES (3, 103, 6);
INSERT INTO table_ VALUES (4, 104, 8);
INSERT INTO table_ VALUES (5, 105, 4);
INSERT INTO table_ VALUES (6, 106, 5);
INSERT INTO table_ VALUES (7, 107, 10);
INSERT INTO table_ VALUES (8, 108, 2);
INSERT INTO table_ VALUES (9, 109, 6);
INSERT INTO table_ VALUES (10, 110, 4);
INSERT INTO table_ VALUES (11, 111, 12);
INSERT INTO table_ VALUES (12, 112, 8);

REM ***************************insert data into the MENU_ITEM table

Prompt ******  Populating MENU_ITEM table ....

INSERT INTO menu_item VALUES (1, 'Margherita Pizza', 'Classic pizza with tomato, mozzarella, and basil', 12.99, 'Pizza');
INSERT INTO menu_item VALUES (2, 'Pepperoni Pizza', 'Pizza topped with pepperoni and mozzarella', 14.99, 'Pizza');
INSERT INTO menu_item VALUES (3, 'Veggie Burger', 'Burger with lettuce, tomato, onion, and vegan patty', 10.50, 'Burgers');
INSERT INTO menu_item VALUES (4, 'Cheeseburger', 'Classic cheeseburger with cheddar and lettuce', 11.75, 'Burgers');
INSERT INTO menu_item VALUES (5, 'Caesar Salad', 'Crisp romaine lettuce with Caesar dressing, croutons, and parmesan', 8.99, 'Salads');
INSERT INTO menu_item VALUES (6, 'Chicken Caesar Salad', 'Caesar salad topped with grilled chicken', 12.99, 'Salads');
INSERT INTO menu_item VALUES (7, 'Penne Alfredo', 'Penne pasta with creamy Alfredo sauce', 13.50, 'Pasta');
INSERT INTO menu_item VALUES (8, 'Spaghetti Bolognese', 'Spaghetti with rich meat-based Bolognese sauce', 14.99, 'Pasta');
INSERT INTO menu_item VALUES (9, 'Grilled Salmon', 'Salmon fillet served with steamed vegetables and rice', 18.00, 'Seafood');
INSERT INTO menu_item VALUES (10, 'Fish Tacos', 'Soft tacos with grilled fish, avocado, and salsa', 11.50, 'Seafood');
INSERT INTO menu_item VALUES (11, 'Chicken Tikka Masala', 'Chicken in a creamy tomato-based curry sauce', 16.00, 'Indian');
INSERT INTO menu_item VALUES (12, 'Vegetable Samosas', 'Crispy pastry filled with spiced vegetables', 7.00, 'Indian');
INSERT INTO menu_item VALUES (13, 'Beef Burritos', 'Burrito filled with seasoned beef, rice, and beans', 12.50, 'Mexican');
INSERT INTO menu_item VALUES (14, 'Chicken Fajitas', 'Grilled chicken served with sautéed peppers and onions', 15.00, 'Mexican');
INSERT INTO menu_item VALUES (15, 'Lamb Kofta', 'Grilled lamb skewers with a side of tzatziki', 13.00, 'Mediterranean');
INSERT INTO menu_item VALUES (16, 'Hummus and Pita', 'Classic hummus served with fresh pita bread', 6.00, 'Mediterranean');
INSERT INTO menu_item VALUES (17, 'Beef Steak', 'Grilled steak served with mashed potatoes and vegetables', 22.00, 'Steaks');
INSERT INTO menu_item VALUES (18, 'Chicken Fried Rice', 'Fried rice with chicken, vegetables, and soy sauce', 10.99, 'Asian');
INSERT INTO menu_item VALUES (19, 'Vegetable Stir-Fry', 'Mixed vegetables stir-fried with soy sauce', 9.50, 'Asian');
INSERT INTO menu_item VALUES (20, 'Spring Rolls', 'Crispy rolls stuffed with vegetables, served with dipping sauce', 7.50, 'Asian');

REM ****************************insert data into the RESERVATION table

Prompt ******  Populating RESERVATION table ....

INSERT INTO reservation VALUES (1, 1, 2, TO_DATE('2024-12-02 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
INSERT INTO reservation VALUES (2, 2, 3, TO_DATE('2024-12-02 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
INSERT INTO reservation VALUES (3, 3, 5, TO_DATE('2024-12-02 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
INSERT INTO reservation VALUES (4, 4, 6, TO_DATE('2024-12-03 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
INSERT INTO reservation VALUES (5, 5, 1, TO_DATE('2024-12-03 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6);
INSERT INTO reservation VALUES (6, 6, 4, TO_DATE('2024-12-04 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
INSERT INTO reservation VALUES (7, 7, 2, TO_DATE('2024-12-04 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
INSERT INTO reservation VALUES (8, 8, 7, TO_DATE('2024-12-05 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
INSERT INTO reservation VALUES (9, 9, 3, TO_DATE('2024-12-05 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
INSERT INTO reservation VALUES (10, 10, 5, TO_DATE('2024-12-06 18:15:00', 'YYYY-MM-DD HH24:MI:SS'), 2);

REM ***************************insert data into the ORDER_ table

Prompt ******  Populating ORDER_ table ....

INSERT INTO order_ VALUES (1, 1, 2, TO_DATE('2024-12-02 18:45:00', 'YYYY-MM-DD HH24:MI:SS'), 150.00, 'Completed');
INSERT INTO order_ VALUES (2, 2, 3, TO_DATE('2024-12-02 19:15:00', 'YYYY-MM-DD HH24:MI:SS'), 85.50, 'Pending');
INSERT INTO order_ VALUES (3, 3, 5, TO_DATE('2024-12-02 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 120.00, 'Completed');
INSERT INTO order_ VALUES (4, 4, 6, TO_DATE('2024-12-03 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 75.00, 'Cancelled');
INSERT INTO order_ VALUES (5, 5, 1, TO_DATE('2024-12-03 21:15:00', 'YYYY-MM-DD HH24:MI:SS'), 200.00, 'Completed');
INSERT INTO order_ VALUES (6, 6, 4, TO_DATE('2024-12-04 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), 95.00, 'Pending');
INSERT INTO order_ VALUES (7, 7, 2, TO_DATE('2024-12-04 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 50.00, 'Completed');
INSERT INTO order_ VALUES (8, 8, 7, TO_DATE('2024-12-05 19:45:00', 'YYYY-MM-DD HH24:MI:SS'), 60.00, 'Pending');
INSERT INTO order_ VALUES (9, 9, 3, TO_DATE('2024-12-05 20:45:00', 'YYYY-MM-DD HH24:MI:SS'), 110.00, 'Completed');
INSERT INTO order_ VALUES (10, 10, 5, TO_DATE('2024-12-06 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 130.00, 'Completed');

REM ***************************insert data into the ORDER_DETAILS table

Prompt ******  Populating ORDER_DETAILS table ....

INSERT INTO order_details VALUES (1, 1, 3, 2);
INSERT INTO order_details VALUES (2, 1, 5, 1);
INSERT INTO order_details VALUES (3, 2, 7, 3);
INSERT INTO order_details VALUES (4, 2, 1, 1);
INSERT INTO order_details VALUES (5, 3, 9, 2);
INSERT INTO order_details VALUES (6, 3, 4, 1);
INSERT INTO order_details VALUES (7, 4, 6, 1);
INSERT INTO order_details VALUES (8, 5, 8, 4);
INSERT INTO order_details VALUES (9, 6, 2, 2);
INSERT INTO order_details VALUES (10, 7, 10, 1);

REM ********* insert data into the PAYMENT table

Prompt ******  Populating PAYMENT table ....

INSERT INTO payment VALUES (1, 1, 50.00, 'Credit Card', TO_DATE('2024-12-01', 'YYYY-MM-DD'));
INSERT INTO payment VALUES (2, 2, 80.50, 'Cash', TO_DATE('2024-12-02', 'YYYY-MM-DD'));
INSERT INTO payment VALUES (3, 3, 120.75, 'Debit Card', TO_DATE('2024-12-03', 'YYYY-MM-DD'));
INSERT INTO payment VALUES (4, 4, 200.00, 'Cash', TO_DATE('2024-12-04', 'YYYY-MM-DD'));
INSERT INTO payment VALUES (5, 5, 95.20, 'Credit Card', TO_DATE('2024-12-05', 'YYYY-MM-DD'));
INSERT INTO payment VALUES (6, 6, 150.00, 'Debit Card', TO_DATE('2024-12-06', 'YYYY-MM-DD'));
INSERT INTO payment VALUES (7, 7, 45.50, 'Credit Card', TO_DATE('2024-12-07', 'YYYY-MM-DD'));
INSERT INTO payment VALUES (8, 8, 110.00, 'Cash', TO_DATE('2024-12-08', 'YYYY-MM-DD'));
INSERT INTO payment VALUES (9, 9, 75.30, 'Debit Card', TO_DATE('2024-12-09', 'YYYY-MM-DD'));
INSERT INTO payment VALUES (10, 10, 55.00, 'Credit Card', TO_DATE('2024-12-10', 'YYYY-MM-DD'));

REM ********* insert data into the REVIEW table

Prompt ******  Populating REVIEW table ....

INSERT INTO review VALUES (1, 1, 1, 1, 5, 'Excellent dish, highly recommend!', TO_DATE('2024-12-01', 'YYYY-MM-DD'));
INSERT INTO review VALUES (2, 2, 2, 2, 4, 'Good flavor but could use more seasoning.', TO_DATE('2024-12-02', 'YYYY-MM-DD'));
INSERT INTO review VALUES (3, 3, 3, 3, 3, 'It was okay, but nothing special.', TO_DATE('2024-12-03', 'YYYY-MM-DD'));
INSERT INTO review VALUES (4, 4, 4, 4, 5, 'Amazing! Will definitely order again.', TO_DATE('2024-12-04', 'YYYY-MM-DD'));
INSERT INTO review VALUES (5, 5, 5, 5, 2, 'Not satisfied, the dish was cold.', TO_DATE('2024-12-05', 'YYYY-MM-DD'));
INSERT INTO review VALUES (6, 6, 6, 6, 4, 'Very good, but the portion could be larger.', TO_DATE('2024-12-06', 'YYYY-MM-DD'));
INSERT INTO review VALUES (7, 7, 7, 7, 1, 'Did not enjoy it at all, too spicy for my taste.', TO_DATE('2024-12-07', 'YYYY-MM-DD'));
INSERT INTO review VALUES (8, 8, 8, 8, 5, 'Fantastic meal, exceeded my expectations!', TO_DATE('2024-12-08', 'YYYY-MM-DD'));
INSERT INTO review VALUES (9, 9, 9, 9, 3, 'It was decent, but I’ve had better.', TO_DATE('2024-12-09', 'YYYY-MM-DD'));
INSERT INTO review VALUES (10, 10, 10, 10, 4, 'Good quality, but took too long to arrive.', TO_DATE('2024-12-10', 'YYYY-MM-DD'));

Prompt === Tables Populated ===

COMMIT;

