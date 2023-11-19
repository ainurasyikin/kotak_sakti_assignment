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

<img width="530" alt="image" src="https://github.com/ainurasyikin/ks_assignment/assets/116057562/b9fd6ebd-2e70-44ba-9627-1f117b54f598">
