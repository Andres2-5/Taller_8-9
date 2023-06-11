create database NEON;
use NEON;

create table users_tlb (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_firstname VARCHAR(40) NOT NULL,
    user_lastname VARCHAR(40) NOT NULL,
    user_email VARCHAR(60) NOT NULL,
    user_password VARBINARY(256)
);

create table category (
category_id int primary key auto_increment,
category_name varchar(50)
);

create table product (
product_id int primary key auto_increment,
product_name varchar(50),
product_value decimal,
category_id int,
foreign key (category_id) references category(category_id) 
);

create table category_tbl(
category_id int not null primary key auto_increment,
category_name VARCHAR(40) not null
);
create table product_tbl(
product_id int not null primary key auto_increment,
product_name VARCHAR(40) not null,
product_value int null,
category_id int not null
);


alter table product_tbl 
add constraint category_id
foreign key (category_id)
references category_tbl (category_id);

INSERT INTO NEON.users_tlb (user_firstname, user_lastname, user_email, user_password)
VALUES (UPPER('pablo'), UPPER('gomez'), 'pabgomez2000@gmail.com', AES_ENCRYPT('password','$2a$12$0BIhaYgJ9rTTPnzcoYW4texXnkQNdimS8l9TrFmIQeSM2zp9OtZQm'));
INSERT INTO NEON.users_tlb (user_firstname, user_lastname, user_email, user_password)
VALUES (UPPER('jose'), UPPER('fino'), 'jose.fino896@gmail.com', AES_ENCRYPT('password','$2a$12$0BIhaYgJ9rTTPnzcoYW4texXnkQNdimS8l9TrFmIQeSM2zp9OtZQm'));

SELECT *, CAST(AES_DECRYPT(user_password,'$2a$12$0BIhaYgJ9rTTPnzcoYW4texXnkQNdimS8l9TrFmIQeSM2zp9OtZQm') AS CHAR(50)) end_data FROM users_tlb WHERE user_id = 1;

DROP DATABASE NEON;
select * from users_tbl;
