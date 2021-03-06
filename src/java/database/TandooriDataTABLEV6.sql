DROP SCHEMA IF EXISTS tandoorigrilldb;
CREATE SCHEMA tandoorigrilldb ;
USE tandoorigrilldb;

CREATE TABLE IF NOT EXISTS delivery (
  deliveryID  INT(6) NOT NULL AUTO_INCREMENT,
  actorID INT(6) NOT NULL,
  house_number VARCHAR(20) NOT NULL,
  unit_number VARCHAR(25),
  street VARCHAR(50) NOT NULL,
  postal_code VARCHAR(6) NOT NULL,
  city VARCHAR(50) NOT NULL,
  province CHAR(20) NOT NULL,
  note VARCHAR(300),
  contact_email VARCHAR(50) NOT NULL,
  phone_number VARCHAR(10) NOT NULL,
  PRIMARY KEY (deliveryID));

CREATE TABLE IF NOT EXISTS actor (
  actorID INT(6) NOT NULL AUTO_INCREMENT,
  email_login VARCHAR(50) NOT NULL ,
  password VARCHAR(25) ,
  phone_number VARCHAR(10) NOT NULL,
  f_name VARCHAR(25) NOT NULL ,
  l_name VARCHAR(25) NOT NULL,
  house_number VARCHAR(20),
  unit_number VARCHAR(25),
  street VARCHAR(50),
  postal_code VARCHAR(6),
  city VARCHAR(25),
  province CHAR(2),
  role CHAR(1) NOT NULL,
  active TINYINT(1) NOT NULL,
  PRIMARY KEY (actorID));

CREATE TABLE IF NOT EXISTS favourite (
  actorID INT(6),
  itemID INT(6));

CREATE TABLE IF NOT EXISTS report (
  report_made DATETIME,
  total_income FLOAT NOT NULL,
  count_paypal INT(6));

CREATE TABLE IF NOT EXISTS menu (
  itemID INT(6) NOT NULL AUTO_INCREMENT,
  item VARCHAR(50),
  description VARCHAR(500),
  price FLOAT,
  category VARCHAR(40), 
  image VARCHAR(1000),
  active TINYINT(1) NOT NULL,
  PRIMARY KEY (itemID));

CREATE TABLE IF NOT EXISTS order_items (
  orderID INT(6) NOT NULL,
  itemID INT(6) NOT NULL,
  quantity INT(2),
  note VARCHAR(300),
  PRIMARY KEY (orderID, itemID));

CREATE TABLE IF NOT EXISTS orders (
  orderID INT(6) NOT NULL AUTO_INCREMENT,
  deliveryID INT(6),
  order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  due_date DATETIME,
  total_price FLOAT NOT NULL,
  status VARCHAR(20),
  payment_type VARCHAR(20) NOT NULL,
  delivery_method VARCHAR(20) NOT NULL,
  PRIMARY KEY (orderID));

ALTER TABLE delivery ADD FOREIGN KEY (actorID) REFERENCES actor(actorID);

ALTER TABLE favourite ADD FOREIGN KEY (actorID) REFERENCES actor(actorID);
ALTER TABLE favourite ADD FOREIGN KEY (itemID) REFERENCES menu(itemID);

ALTER TABLE order_items ADD FOREIGN KEY (orderID) REFERENCES orders(orderID);
ALTER TABLE order_items ADD FOREIGN KEY (itemID) REFERENCES menu(itemID);

ALTER TABLE orders ADD FOREIGN KEY (deliveryID) REFERENCES delivery(deliveryID);

