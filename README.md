# 🍽️ Restaurant Orders Analysis using MySQL

<img src="assets/image.jpg" alt="Restaurant Orders Banner" width="100%">

This project explores and analyzes restaurant menu items and order data using SQL queries in MySQL. It involves uncovering insights such as best-selling items, category-wise pricing, order frequency, and high-spending orders.

---

## 📁 Project Structure

* `create_restaurant_db.sql`: SQL file to create the `restaurant_db` database and define two tables:

  * `menu_items`: Stores menu item details (name, category, price).
  * `order_details`: Stores order history (order IDs, item IDs, timestamps).

* `restaurant_analysis.sql`: Contains all the SQL queries used for exploration and analysis.

---

## 📊 Objectives & Analysis Summary

### 🔍 Objective 1: Explore `menu_items` Table

* Total number of items on the menu.
* Least and most expensive items.
* Number of Italian dishes and their price range.
* Category-wise dish counts and average prices.

### 📦 Objective 2: Explore `order_details` Table

* View overall order history.
* Get the date range of orders.
* Count of total orders and items ordered.
* Identify orders with the highest number of items.
* Number of bulk orders (more than 12 items).

### 🔗 Objective 3: Combine & Analyze Orders with Menu Data

* Join `order_details` and `menu_items` to analyze:

  * Least and most ordered items along with their categories.
  * Top 5 orders with the highest total spend.
  * Items purchased in the highest-spend orders.
  * Breakdown of items per category in those high-spend orders.

---

## ✅ How to Use

1. Import the schema using:

   ```sql
   SOURCE create_restaurant_db.sql;
   ```

2. Run the analysis:

   ```sql
   USE restaurant_db;
   SOURCE restaurant_analysis.sql;
   ```

---

## 📌 Requirements

* MySQL Server (8.x recommended)
* Any SQL client (MySQL CLI, MySQL Workbench, DBeaver, etc.)

---

## 📈 Key Insights

* The restaurant menu includes diverse categories with varying pricing.
* Italian dishes are among the more frequent and varied categories.
* Certain items and orders dominate in terms of frequency and revenue contribution.

---

## 🧠 Learnings

This project demonstrates practical SQL skills including:

* Aggregation and grouping
* Joining tables
* Subqueries and filtering
* Order analysis and business insight extraction
