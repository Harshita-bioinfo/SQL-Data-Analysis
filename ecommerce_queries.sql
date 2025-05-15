use e_commerce;

### High Value Orders with Customer Details

SELECT orders.order_id, customers.customer_id, customers.customer_name, orders.total_amount
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
WHERE orders.total_amount>1000;

### Total Quantity Sold Per Product

SELECT p.product_name, sum(od.qty) AS total_quantity_sold
FROM orders_details od
JOIN products p ON p.product_id = od.product_id
GROUP BY p.product_id;

### Products with Above-Average Quantity per Order

Select Order_ID, p.Product_Name, Qty
From Orders_Details as o
Inner Join Products as p
On o.product_id=p.product_id
Where Qty> (Select Avg(Qty) From Orders_Details);

### Unique Products Per Order

SELECT Order_ID, COUNT(DISTINCT Product_ID) AS Unique_Products
FROM Orders_Details
GROUP BY Order_ID;

### Monthly Product Sales in 2023

SELECT EXTRACT(MONTH FROM Order_Date) AS Month, 
SUM(Qty) AS Total_Products_Sold 
FROM Orders 
JOIN Orders_Details 
ON Orders.Order_ID = Orders_Details.Order_ID 
WHERE EXTRACT(YEAR FROM Order_Date) = 2023 
GROUP BY EXTRACT(MONTH FROM Order_Date) ORDER BY Month;

### Order Value Classification (High/Low)

SELECT order_id, total_amount, 
 CASE 
  WHEN total_amount > 1000 
  THEN 'High Value' 
  ELSE 'Low Value' 
 END AS Value 
FROM Orders;

#### High Value Orders Using Subquery Classification

SELECT order_id, total_amount, order_value
FROM (
SELECT order_id,
total_amount,
CASE
 WHEN total_amount > 1000 THEN 'High Value'
 WHEN total_amount = 1000 THEN 'Medium Value'
 ELSE 'Low Value'
END AS order_value
FROM Orders) as sub
WHERE order_value = 'High Value';

### Top 3 Customers by Total Spend

SELECT c.customer_id, c.customer_name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 3;

### Monthly Sales Summary for 2023

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_amount) AS monthly_sales
FROM Orders
WHERE YEAR(order_date) = 2023
GROUP BY month
ORDER BY month;

### Average Order Value Per Customer

SELECT c.customer_id, c.customer_name, AVG(o.total_amount) AS avg_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

### Most Sold Product by Quantity

SELECT p.product_id, p.product_name, SUM(od.qty) AS total_quantity
FROM Products p
JOIN Orders_Details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC
LIMIT 1;

### Product Category and Supplier Details

SELECT p.product_name, c.category_name, s.supplier_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id;

### Revenue by Payment Method

SELECT payment_method, SUM(amount) AS total_revenue
FROM payments
GROUP BY payment_method;

### Top 3 Suppliers by Number of Products

SELECT s.supplier_name, COUNT(p.product_id) AS product_count
FROM suppliers s
JOIN products p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name
ORDER BY product_count DESC
LIMIT 3;

### Employee Shipment Handling Count

SELECT e.employee_name, COUNT(s.shipment_id) AS shipments_handled
FROM employees e
JOIN shipments s ON e.employee_id = s.shipped_by
GROUP BY e.employee_name;

### Orders with Shipment Delay > 2 Days After Payment

SELECT o.order_id, p.payment_date, s.shipment_date
FROM orders o
JOIN payments p ON o.order_id = p.order_id
JOIN shipments s ON o.order_id = s.order_id
WHERE DATEDIFF(s.shipment_date, p.payment_date) > 2;

### Top Selling Product Category

SELECT c.category_name, SUM(od.qty) AS total_sold
FROM orders_details od
JOIN products p ON od.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_sold DESC
LIMIT 1;

### Customers with More Than One Order
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING total_orders > 1;

### Highest Priced Product Ordered with Customer

SELECT c.customer_name, p.product_name, od.order_price
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN orders_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
ORDER BY od.order_price DESC
LIMIT 1;

