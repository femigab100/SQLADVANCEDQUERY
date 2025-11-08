drop database if exists advanced_analytics;
create database advanced_analytics;
use advanced_analytics;

-- Creating the separate tables in the database
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    supplier_id INT
);

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    signup_date DATE
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    sale_date DATE,
    quantity INT,
    unit_price DECIMAL(10,2),
    region VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Data Insertion into the database
INSERT INTO products (product_id, product_name, category, supplier_id) VALUES
(1, 'Wireless Mouse', 'Electronics', 101),
(2, 'Bluetooth Speaker', 'Electronics', 102),
(3, 'Running Shoes', 'Footwear', 103),
(4, 'Coffee Maker', 'Home Appliances', 104),
(5, 'Yoga Mat', 'Fitness', 105);

INSERT INTO suppliers (supplier_id, supplier_name, country) VALUES
(101, 'TechNova Ltd.', 'USA'),
(102, 'SoundWave Inc.', 'Germany'),
(103, 'StrideGear', 'China'),
(104, 'BrewMaster Co.', 'Italy'),
(105, 'ZenFit Supplies', 'India');

INSERT INTO customers (customer_id, customer_name, country, signup_date) VALUES
(201, 'Alice Johnson', 'USA', '2023-01-15'),
(202, 'Carlos Mendes', 'Brazil', '2023-02-20'),
(203, 'Fatima Noor', 'UAE', '2023-03-05'),
(204, 'John Smith', 'UK', '2023-04-10'),
(205, 'Aisha Bello', 'Nigeria', '2023-05-25');

INSERT INTO sales (sale_id, product_id, customer_id, sale_date, quantity, unit_price, region) VALUES
(301, 1, 201, '2023-06-01', 2, 25.00, 'North America'),
(302, 2, 202, '2023-06-15', 1, 60.00, 'South America'),
(303, 3, 203, '2023-07-05', 1, 80.00, 'Middle East'),
(304, 4, 204, '2023-07-20', 1, 120.00, 'Europe'),
(305, 5, 205, '2023-08-10', 3, 20.00, 'Africa'),
(306, 1, 202, '2023-08-15', 1, 25.00, 'South America'),
(307, 3, 201, '2023-09-01', 2, 80.00, 'North America'),
(308, 2, 204, '2023-09-12', 1, 60.00, 'Europe'),
(309, 5, 203, '2023-09-25', 2, 20.00, 'Middle East'),
(310, 4, 205, '2023-10-05', 1, 120.00, 'Africa');