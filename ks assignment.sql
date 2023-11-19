a. Show schema generation query


### Create table customers ####


CREATE TABLE customers
(

	id INT PRIMARY KEY,
	name VARCHAR (100),
	email VARCHAR (100),
	tel VARCHAR (50),
	created_at DATETIME,
	updated_at DATETIME
);


### Insert values into customers table ###



INSERT INTO customers ( id, name, email, tel, created_at, updated_at )
VALUES

(1, 'Irfan Bakti' , 'irfan88@example.com' , '+60123456789' , '2019-08-07 08:13:21' , '2019-08-07 08:13:21' ) ,
(2, 'Jack Smmith' , 'jack.smmith@acme.io' , '+60132456781' , '2019-08-07 08:13:21' , '2019-08-07 08:13:21' ) ,
(3,	'Nazir' , '', '+601185434012' , '2019-08-07 08:13:21' ,	'2019-08-07 08:13:21' ) ,
(4,	'Faiz Ma' , 'faiz.ma@jholow.cn' , '+6019772002' ,	'2019-08-07 08:13:21' , '2019-08-07 08:13:21' ) ,
(5,	'Isham Rais' , 'isham@pmo.gov.my' , '+60135482020' , '2019-08-07 08:13:21' , '2019-08-07 08:13:21') ,
(6,	'Shanon Teoh' , 'shahnon.teoh@st.com.sg' , '', '2019-08-07 08:13:21' , '2019-08-07 08:13:21' ) 


### Create table invoices ####


CREATE TABLE invoices (

id INT PRIMARY KEY,
number VARCHAR(100),
sub_Total DECIMAL(20, 2),
tax_Total DECIMAL(20, 2),
total DECIMAL(20, 2),
customer_id INT,
created_at DATETIME,
updated_at DATETIME
)



### Insert values into invoices table ###


INSERT INTO invoices (ID, Number, Sub_Total, Tax_Total, Total, Customer_ID, Created_At, Updated_At)
VALUES

(1, '20190001', 30.00, 0.00, 30.00, 1, '2019-08-07 08:13:21', '2019-08-07 08:13:21'),
(2, '20190002', 150.00, 0.00, 150.00, 2, '2019-08-07 08:13:21', '2019-08-07 08:13:21'),
(3, '20190003', 30.00, 0.00, 30.00, 2, '2019-09-15 08:13:21', '2019-09-15 08:13:21'),
(4, '20190004', 55.00, 0.00, 55.00, 3, '2019-09-15 08:13:21', '2019-09-15 08:13:21'),
(5, '20190005', 450.00, 0.00, 0.00, 6, '2019-09-15 08:13:21', '2019-09-15 08:13:21')




### Create table invoice_lines ####

CREATE TABLE invoice_lines (

    id INT PRIMARY KEY,
    description VARCHAR(100),
    unit_price DECIMAL(20, 2),
    quantity INT,
    sub_total DECIMAL(20, 2),
    tax_total DECIMAL(20, 2),
    total DECIMAL(20, 2),
    tax_id INT,
    sku_id INT,
    invoice_iD INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id)
)


### Insert values into invoice_lines table ###


INSERT INTO invoice_lines (id, description, unit_price, quantity, sub_total, tax_total, total, tax_id, sku_id, invoice_id)
VALUES
    (1, 'Book #1', 30.00, 1, 30.00, 0.00, 30.00, NULL, 1, 1),
    (2, 'Book #2', 25.00, 4, 100.00, 0.00, 100.00, NULL, 2, 2),
    (3, 'Book #3', 50.00, 1, 50.00, 0.00, 50.00, NULL, 3, 2),
    (4, 'Book #1', 30.00, 1, 30.00, 0.00, 30.00, NULL, 1, 3),
    (5, 'Book #1', 30.00, 1, 30.00, 0.00, 30.00, NULL, 1, 4),
    (6, 'Book #2', 25.00, 1, 25.00, 0.00, 25.00, NULL, 2, 4),
    (7, 'Book #1', 30.00, 5, 150.00, 0.00, 150.00, NULL, 1, 5),
    (8, 'Book #3', 50.00, 6, 300.00, 0.00, 300.00, NULL, 3, 5)




b. Show the SQL query for number of customers purchasing more than 5 books

WITH num_cust AS (
SELECT c.id, c.name, SUM(il.quantity) AS book_count
FROM customers c
JOIN invoices i ON c.id = i.customer_id
JOIN invoice_lines il ON i.id = il.invoice_id
GROUP BY c.id, c.name
HAVING SUM(il.quantity) > 5

)

SELECT COUNT(num_cust.id) AS customers_purchased_more_than_5_books
FROM num_cust


c. Show the SQL query for a list of customers who never purchased anything

SELECT c.id, c.name
FROM customers c
LEFT JOIN invoices i ON c.id = i.customer_id
WHERE i.customer_id IS NULL


d. Show the SQL query for list of book purchased with the users

SELECT c.id, c.name, il.description
FROM customers c
JOIN invoices i ON c.id = i.customer_id
JOIN invoice_lines il ON i.id = il.invoice_id

