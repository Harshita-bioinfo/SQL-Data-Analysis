# 🛍️ E-Commerce Database Project (`e_commerce`)

## 📦 Overview

This project implements a normalized **relational database system** named `e_commerce` to model and manage real-world online retail data. It supports key business operations including **order processing**, **inventory management**, **customer tracking**, **payment records**, **shipment monitoring**, and **product-level analytics**.

The database is designed to answer critical business questions such as:

Which products are selling the most?

Who are the highest-value customers?

What are the monthly sales trends?

How efficient are our suppliers and logistics?

The database schema and SQL queries are designed to reflect standard practices in e-commerce operations and support business intelligence insights.

---

## 📁 Repository Contents

| File Name                       | Description                                                   |
| ------------------------------- | ------------------------------------------------------------- |
| `expanded_ecommerce_schema.sql` | Complete schema and sample data with keys and constraints     |
| `ecommerce_queries.sql`         | Business and analytics SQL queries (JOINs, GROUP BY, CASE...) |
| `README.md`                     | Project documentation and usage instructions                  |
| `e_commerce_queries_output/`    | Folder containing screenshots of query outputs                |

---

## 🧪 What I Have Done

* ✅ **Designed and normalized** an e-commerce database schema from scratch.
* ✅ **Created SQL scripts** to populate sample data and simulate operations.
* ✅ **Wrote 15+ SQL queries** for insights, analytics, and reports.
* ✅ **Applied indexing** strategies for optimal query performance.
* ✅ **Used subqueries, joins, aggregates**, and `CASE` for business rules.
* ✅ **Prepared data stories** like customer spending behavior, sales trends, product popularity, and delay detection.

---

## 🛠️ Tools Used

* **MySQL**
* **SQL Workbench**

---

## 🧱 Key Tables

| Table Name          | Description                                                         |
| ------------------- | ------------------------------------------------------------------- |
| **Customers**       | Stores customer details like name and contact.                      |
| **Orders**          | Tracks customer orders including date and total amount.             |
| **Orders\_Details** | Holds item-level data for each order (quantity, price, product ID). |
| **Products**        | Contains product info including category and supplier.              |
| **Categories**      | Categorizes products (e.g., electronics, clothing).                 |
| **Suppliers**       | Details of product suppliers.                                       |
| **Payments**        | Captures order payment data including method and amount.            |
| **Shipments**       | Tracks shipments and their dates.                                   |
| **Employees**       | Records employees responsible for handling shipments.               |

---



---

## 🔎 SQL Queries and Their Purpose

### 📌 Basic Queries

| Query                                               | Description                                                 |
| --------------------------------------------------- | ----------------------------------------------------------- |
| ✅ `INNER JOIN` between **orders** and **customers** | Retrieves high-value orders (> ₹1000) and customer names.   |
| ✅ `JOIN` with **products** and aggregation          | Finds total quantity sold for each product.                 |
| ✅ `Subquery + AVG`                                  | Returns products in orders where quantity is above average. |
| ✅ `GROUP BY` with `COUNT(DISTINCT)`                 | Counts unique products in each order.                       |
| ✅ `EXTRACT(MONTH)` and aggregation                  | Shows monthly sales trends for 2023.                        |

### 📊 Analytical & Business Intelligence Queries

| Query                                  | Description                                   |
| -------------------------------------- | --------------------------------------------- |
| ✅ **Order classification** with `CASE` | Labels orders as High, Medium, or Low Value.  |
| ✅ **Customer-level aggregation**       | Identifies top 3 customers by total spending. |
| ✅ `DATE_FORMAT` & `GROUP BY`           | Displays monthly total revenue in 2023.       |
| ✅ `AVG(total_amount)`                  | Computes average order value per customer.    |
| ✅ `ORDER BY DESC` + `LIMIT`            | Shows the highest-selling product.            |

### 🏷️ Product, Supplier, and Inventory Insights

| Query                         | Description                                                  |
| ----------------------------- | ------------------------------------------------------------ |
| ✅ Multi-table `JOIN`          | Lists products with category and supplier name.              |
| ✅ `GROUP BY supplier`         | Ranks top 3 suppliers by number of products supplied.        |
| ✅ `JOIN` on employee-shipment | Counts shipments handled by each employee.                   |
| ✅ Shipment delay detection    | Shows orders where shipment occurred > 2 days after payment. |

### 📈 Market & User Behavior Analysis

| Query                              | Description                                                   |
| ---------------------------------- | ------------------------------------------------------------- |
| ✅ Category-wise sales              | Determines the most sold product category.                    |
| ✅ Loyal customers                  | Lists customers with more than one order.                     |
| ✅ Most expensive product purchased | Returns highest `order_price` with customer and product info. |

---


## 📌 Index Strategy Recap

| Table           | Indexed Column(s)            | Purpose                           |
| --------------- | ---------------------------- | --------------------------------- |
| Orders          | `customer_id`                | Optimize joins with customers     |
| Orders\_Details | `product_id`, `order_id`     | Speed up quantity & product stats |
| Payments        | `order_id`                   | Match payment with order          |
| Products        | `category_id`, `supplier_id` | Speed up filters and joins        |
| Shipments       | `shipped_by`                 | Track employee shipment metrics   |

---

## 🔁 How to Reproduce

1. Clone the repository:

```bash
git clone https://github.com/Harshita-bioinfo/SQL-Data-Analysis.git
cd SQL-Data-Analysis
```

2. Open your preferred SQL IDE and run:

   * `ecommerce_schema.sql` to build the schema and populate tables
   * `ecommerce_queries.sql` to run the analysis queries

3. Review results and optimize queries if needed.

---


