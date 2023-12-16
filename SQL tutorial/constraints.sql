-- constraints
 -- 1. unique: unique values in a column
  create table product (
  p_id int,
  p_name varchar(20) unique,  /* we can't insert duplicate values */
  price decimal(4,2) /* 4 digits with precision of 2 decimals */
  );
  
INSERT INTO product VALUES (100, 'hamburger', 3.99), (101, 'fries', 1.89),  (102, 'soda', 1.00), (103, "ice cream", 1.49);
    
SELECT * FROM product;

  -- unique key after created table
alter table product add constraint unique(p_name);


  -- 2. NOT NULL
create table product (
  p_id int not null,  /* It can be 0 */
  p_name varchar(20) unique,  
  price decimal(4,2) 
  ); 
  
-- after created table
alter table product modify p_id int not null;

select * from product;

INSERT INTO product VALUES(NULL, "cookie", 5.0);   /* we get an error Column 'p_id' cannot be null */


 -- 3. CHECK: to limit what values can be placed in a column
   -- keep hourly pay wages greater than or equal to 50
create table empl(
  e_id int, 
  f_name varchar(50),
  l_name varchar(50),
  hourly_pay decimal(5,2),
  hire_date date,
  constraint chk_hour_pay check(hourly_pay>=50)    /*  we gave name to our constraint as chk_hour_pay */
  );
  
  insert into empl values(1, "Eugene", "Krabs", 55.00, "2023-01-02"), (2, "Squidward", "Tentacles", 51.00, "2023-01-03")
  , (3, "Spongebob", "Squarepants", 52.00, "2023-01-02"), (4, "Patric", "Star", 53.00, "2023-01-04")
  , (5, "Sandy", "Cheeks", 50.25, "2023-01-03");
  
  select * from empl;
  insert into empl values(6, "Sheldon", "Plankton",49, "2023-01-05");  /* we get an error Check constriant 'chk_hour_pay' is violted */
  
  -- after created table
  alter table empl add constraint chk_hour_pay check(hourly_pay>=50);

  -- to drop out check constraint
alter table empl drop check chk_hour_pay;

-- 4. DEFAULT
 CREATE TABLE product(
    p_id INT,
    p_name varchar(25),
    price DECIMAL(4, 2) DEFAULT 0
);

-- after created
ALTER TABLE product ALTER price SET DEFAULT 0;

INSERT INTO product(p_id, p_name) VALUES (104, "straw"), (105, "napkin"), (106, "fork"), (107, "spoon");

SELECT * FROM product;

-- EXAMPLE 2
CREATE TABLE transaction(
	transaction_id INT,
	amount DECIMAL(5, 2),
    transaction_date DATETIME DEFAULT NOW()
);

INSERT INTO transaction(transaction_id, amount) VALUES (1, 4.99);
SELECT * FROM transaction;

DROP TABLE transaction;


 -- 5. PRIMARY KEY: unique + not null, Note: We can only have one pk
CREATE TABLE transaction(
	transaction_id INT PRIMARY KEY,
	amount DECIMAL(5, 2),
    transaction_date DATETIME DEFAULT NOW()
); 

INSERT INTO transaction(transaction_id, amount) values (1000, 4.99),
(1001, 3.39), (1002, 2.89), (1003,4.99);

select * from transaction; 

-- after created table
ALTER TABLE transaction ADD CONSTRAINT PRIMARY KEY (transaction_id);


 -- 6. AUTO_INCREMENT
 CREATE TABLE transaction(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,  /* By default pk is set to 1 */
    amount DECIMAL(5, 2)
);

insert into transaction(amount) values(4.99), (3.5), (2.89);

select * from transaction;

-- after created
ALTER TABLE transaction AUTO_INCREMENT = 1000;
insert into transaction(amount) values(4.99), (3.5), (2.89);  /* But before do this write 'delete from transaction;' */

select * from transaction;


 -- 7. FOREIGN KEY
CREATE TABLE customer(
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);
INSERT INTO customer(first_name, last_name) VALUES  ("Fred", "Fish"), ("Larry", "Lobster"), ("Bubble", "Bass");
                
SELECT * FROM customer;

-- Add a named foreign key constraint to a new table
CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

alter table transactions auto_increment=100;
insert into transactions(amount, customer_id) values(4.99,3), (2.89,2),(3.38,3),(4.99,1);
select * from transactions;

-- drop foreign key : we can see fk name in our transactions table(click there we can see)
alter table transactions drop FOREIGN KEY transactions_ibfk_1;

-- after created table (if we want we can name our foreign key)
ALTER TABLE transactions ADD CONSTRAINT fk_cust_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

-- we can't delete/ update a parent row as our fk fails
delete from customer where customer_id=3;
