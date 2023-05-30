show databases;

create database warehouse;

use warehouse;

-- Create CITIES table
CREATE TABLE CITIES (
  CITY CHAR(20),
  STATE CHAR(20),
  PRIMARY KEY (CITY)
);

-- Create WAREHOUSES table
CREATE TABLE WAREHOUSES (
  WID INTEGER,
  WNAME CHAR(30),
  LOCATION CHAR(20),
  EXTRA_CONTEXT JSON,
  CITY CHAR(20),
  PRIMARY KEY (WID),
  FOREIGN KEY (CITY) REFERENCES CITIES(CITY)
);

-- Create STORES table
CREATE TABLE STORES (
  SID INTEGER,
  STORE_NAME CHAR(20),
  LOCATION_CITY CHAR(20),
  PRIMARY KEY (SID),
  FOREIGN KEY (LOCATION_CITY) REFERENCES CITIES(CITY)
);

-- Create CUSTOMER table
CREATE TABLE CUSTOMER (
  CNO INTEGER,
  CNAME CHAR(50),
  ADDR VARCHAR(50),
  CU_CITY CHAR(20),
  PRIMARY KEY (CNO),
  FOREIGN KEY (CU_CITY) REFERENCES CITIES(CITY)
);

-- Create ORDERS table
CREATE TABLE ORDERS (
  ONO INT,
  ODATE DATE,
  CNO INTEGER,
  PRIMARY KEY (ONO),
  FOREIGN KEY (CNO) REFERENCES CUSTOMER(CNO)
);

-- Create ITEMS table
CREATE TABLE ITEMS (
  ITEMNO INTEGER,
  DESCRIPTION TEXT,
  WEIGHT DECIMAL(5,2),
  COST DECIMAL(5,2),
  PRIMARY KEY (ITEMNO)
);

-- Create STORES_ITEMS junction table
CREATE TABLE STORES_ITEMS (
  SID INTEGER,
  ITEMNO INTEGER,
  QUANTITY INTEGER,
  PRIMARY KEY (SID, ITEMNO),
  FOREIGN KEY (SID) REFERENCES STORES(SID),
  FOREIGN KEY (ITEMNO) REFERENCES ITEMS(ITEMNO)
);

-- Create ORDERS_ITEMS junction table
CREATE TABLE ORDERS_ITEMS (
  ONO INT,
  ITEMNO INTEGER,
  ORDERED_QUANTITY INTEGER,
  PRIMARY KEY (ONO, ITEMNO),
  FOREIGN KEY (ONO) REFERENCES ORDERS(ONO),
  FOREIGN KEY (ITEMNO) REFERENCES ITEMS(ITEMNO)
);

-- Insert sample data into CITIES table
INSERT INTO CITIES (CITY, STATE) VALUES
  ('Pune', 'Maharashtra'),
  ('Mumbai', 'Maharashtra'),
  ('Delhi', 'Delhi');

-- Insert sample data into WAREHOUSES table
INSERT INTO WAREHOUSES (WID, WNAME, LOCATION, EXTRA_CONTEXT, CITY) VALUES
  (1, 'Warehouse A', 'Pune', '{"attribute": "value"}', 'Pune'),
  (2, 'Warehouse B', 'Mumbai', '{"attribute": "value"}', 'Mumbai');

-- Insert sample data into STORES table
INSERT INTO STORES (SID, STORE_NAME, LOCATION_CITY) VALUES
  (1, 'Store X', 'Pune'),
  (2, 'Store Y', 'Mumbai');

-- Insert sample data into CUSTOMER table
INSERT INTO CUSTOMER (CNO, CNAME, ADDR, CU_CITY) VALUES
  (1, 'Mr. Patil', 'Address 1', 'Pune'),
  (2, 'Mr. Sharma', 'Address 2', 'Mumbai');

-- Insert sample data into ORDERS table
INSERT INTO ORDERS (ONO, ODATE, CNO) VALUES
  (1, '2023-05-01', 1),
  (2, '2023-05-02', 2);

-- Insert sample data into ITEMS table
INSERT INTO ITEMS (ITEMNO, DESCRIPTION, WEIGHT, COST) VALUES
  (1, 'Item A', 10.5, 25.0),
  (2, 'Item B', 5.2, 10.0);

-- Insert sample data into STORES_ITEMS table
INSERT INTO STORES_ITEMS (SID, ITEMNO, QUANTITY) VALUES
  (1, 1, 100),
  (1, 2, 50),
  (2, 2, 75);

-- Insert sample data into ORDERS_ITEMS table
INSERT INTO ORDERS_ITEMS (ONO, ITEMNO, ORDERED_QUANTITY) VALUES
  (1, 1, 10),
  (1, 2, 5),
  (2, 1, 15);
  
  select * from warehouse;


