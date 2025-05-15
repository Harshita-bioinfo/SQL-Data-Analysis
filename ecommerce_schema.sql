create database e_commerce;

use e_commerce;

 SET SQL_SAFE_UPDATES = 0;


-- Drop tables if they exist (in reverse order of dependencies)
DROP TABLE IF EXISTS shipments;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS orders_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;

-- Customers Table
CREATE TABLE customers (
  customer_id INT NOT NULL PRIMARY KEY,
  customer_name VARCHAR(50) NOT NULL,
  email VARCHAR(50),
  shipping_address VARCHAR(80)
);

-- Categories Table
CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL
);

-- Suppliers Table
CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY,
  supplier_name VARCHAR(100),
  contact_email VARCHAR(50)
);

-- Products Table
CREATE TABLE products (
  product_id INT NOT NULL PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  description VARCHAR(80),
  price DECIMAL NOT NULL,
  stock_quantity INT,
  category_id INT,
  supplier_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(category_id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Orders Table
CREATE TABLE orders (
  order_id INT NOT NULL PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  total_amount DECIMAL NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Details Table
CREATE TABLE orders_details (
  order_detail_id INT NOT NULL PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  qty INT NOT NULL,
  order_price DECIMAL NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Employees Table
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(100),
  role VARCHAR(50)
);

-- Payments Table
CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  order_id INT,
  payment_date DATE,
  amount DECIMAL,
  payment_method VARCHAR(20),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Shipments Table
CREATE TABLE shipments (
  shipment_id INT PRIMARY KEY,
  order_id INT,
  shipment_date DATE,
  shipped_by INT,
  tracking_number VARCHAR(30),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (shipped_by) REFERENCES employees(employee_id)
);

-- Insert Data

-- Customers
INSERT INTO customers VALUES
(1, 'John Smith', 'john.smith@example.com', '123 Main St, Anytown'),
(2, 'Jane Doe', 'jane.doe@example.com', '456 Elm St, AnotherTown'),
(3, 'Michael Johnson', 'michael.johnson@example.com', '789 Oak St, Somewhere'),
(4, 'Emily Wilson', 'emily.wilson@example.com', '567 Pine St, Nowhere'),
(5, 'David Brown', 'david.brown@example.com', '321 Maple St, Anywhere');

-- Categories
INSERT INTO categories VALUES
(1, 'Mobile'),
(2, 'Tablet'),
(3, 'Laptop');

-- Suppliers
INSERT INTO suppliers VALUES
(1, 'Apple Inc.', 'contact@apple.com'),
(2, 'Samsung Ltd.', 'support@samsung.com'),
(3, 'Microsoft Corp.', 'info@microsoft.com'),
(4, 'Lenovo Inc.', 'sales@lenovo.com');

-- Products
INSERT INTO products (product_id, product_name, description, price, stock_quantity, category_id, supplier_id) VALUES
(1, 'iPhone X', 'Apple iPhone X, 64GB', 999, 10, 1, 1),
(2, 'Galaxy S9', 'Samsung Galaxy S9, 128GB', 899, 5, 1, 2),
(3, 'iPad Pro', 'Apple iPad Pro, 11-inch', 799, 8, 2, 1),
(4, 'Pixel 4a', 'Google Pixel 4a, 128GB', 499, 12, 1, NULL),
(5, 'MacBook Air', 'Apple MacBook Air, 13-inch', 1099, 3, 3, 1),
(6, 'Surface Go', 'Microsoft Surface Go, 10-inch', 599, 7, 2, 3),
(7, 'Lenovo ThinkPad', 'Lenovo ThinkPad, 14-inch', 1299, 4, 3, 4),
(8, 'Galaxy Tab', 'Samsung Galaxy Tab, 10.5-inch', 649, 6, 2, 2);

-- Orders
INSERT INTO orders VALUES
(1, 1, '2023-01-01', 0),
(2, 2, '2023-02-15', 0),
(3, 3, '2023-03-10', 0),
(4, 4, '2023-04-05', 0),
(5, 5, '2023-05-20', 0),
(6, 1, '2023-06-15', 0),
(7, 2, '2023-07-20', 0),
(8, 3, '2023-08-25', 0);

-- Order Details
INSERT INTO orders_details VALUES
(1, 1, 1, 1, 999),
(2, 2, 2, 1, 899),
(3, 3, 3, 2, 1598),
(4, 4, 4, 2, 998),
(5, 5, 5, 1, 1099),
(6, 5, 6, 1, 799),
(7, 6, 7, 1, 1299),
(8, 7, 8, 2, 1298);

-- Employees
INSERT INTO employees VALUES
(1, 'Sarah Johnson', 'Sales Manager'),
(2, 'James Lee', 'Support Staff'),
(3, 'Anna Patel', 'Logistics');

-- Payments
INSERT INTO payments VALUES
(1, 1, '2023-01-02', 999, 'Credit Card'),
(2, 2, '2023-02-16', 899, 'PayPal'),
(3, 3, '2023-03-11', 2397, 'Debit Card'),
(4, 4, '2023-04-06', 998, 'UPI'),
(5, 5, '2023-05-21', 2897, 'Credit Card'),
(6, 6, '2023-06-16', 1299, 'Debit Card'),
(7, 7, '2023-07-21', 1299, 'Net Banking'),
(8, 8, '2023-08-26', 1298, 'Credit Card');

-- Shipments
INSERT INTO shipments VALUES
(1, 1, '2023-01-03', 3, 'TRACK123'),
(2, 2, '2023-02-18', 3, 'TRACK124'),
(3, 3, '2023-03-13', 3, 'TRACK125'),
(4, 4, '2023-04-08', 3, 'TRACK126'),
(5, 5, '2023-05-24', 3, 'TRACK127'),
(6, 6, '2023-06-18', 3, 'TRACK128');

UPDATE orders SET total_amount = 999 WHERE order_id = 1;
UPDATE orders SET total_amount = 899 WHERE order_id = 2;
UPDATE orders SET total_amount = 1598 WHERE order_id = 3;
UPDATE orders SET total_amount = 998 WHERE order_id = 4;
UPDATE orders SET total_amount = 1099 WHERE order_id = 5;

