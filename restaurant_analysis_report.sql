USE restaurant_db;

-- Objective 1
-- Explore the items table
-- i. View the menu_items table and write a query to find the number of items on the menu
SELECT *
FROM menu_items;

SELECT COUNT(DISTINCT menu_item_id) 
	AS num_items
FROM menu_items;

-- ii. What are the least and most expensive items on the menu?
-- Least Expensive
(SELECT *
FROM menu_items
ORDER BY price
LIMIT 1)
UNION
-- Most Expensive
(SELECT *
FROM menu_items
ORDER BY price DESC
LIMIT 1);  

-- iii. How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?  
SELECT COUNT(*) num_italian_dishes
FROM menu_items
WHERE category='Italian';
    
-- Least Expensive
(SELECT *
FROM menu_items
WHERE category='Italian'
ORDER BY price
LIMIT 1)
UNION
-- Most Expensive
(SELECT *
FROM menu_items
WHERE category='Italian'
ORDER BY price DESC
LIMIT 1);  

-- iv. How many dishes are in each category? What is the average dish price within each category?
SELECT category, COUNT(menu_item_id) num_dishes, ROUND(AVG(price), 2) average_price
FROM menu_items
GROUP BY category;

-- Objective 2
-- Explore the orders table
-- i. View the order_details table. What is the date range of the table?
SELECT *
FROM order_details;

SELECT MIN(order_date) start_date, MAX(order_date) end_date
FROM order_details;

-- ii. How many orders were made within this date range? How many items were ordered within this date range?
SELECT COUNT(DISTINCT order_id) num_orders, COUNT(*) num_items
FROM order_details;

-- iii. Which orders had the most number of items?
SELECT order_id, COUNT(item_id) num_items_ordered
FROM order_details
GROUP BY order_id
ORDER BY num_items_ordered DESC
LIMIT 1;

-- iv. How many orders had more than 12 items?
SELECT COUNT(*) FROM
(SELECT order_id, COUNT(item_id) num_items_ordered
FROM order_details
GROUP BY order_id
HAVING num_items_ordered > 12) as num_orders;

-- Objective 3
-- Combine the menu_items and order_details tables into a single table
-- i. Combine the menu_items and order_details tables into a single table
SELECT *
FROM order_details o
JOIN menu_items m
ON o.item_id = m.menu_item_id;

-- ii. What were the least and most ordered items? What categories were they in?
SELECT item_name, category, COUNT(order_details_id) num_purchases
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases;

-- iii. What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) money_spent
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY money_spent DESC
LIMIT 5;


-- iv. View the details of the highest spend order. Which specific items were purchased?
SELECT category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category;

-- v. BONUS: View the details of the top 5 highest spend orders
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;

-- most expensive order
SELECT order_id, SUM(price) order_amt
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY order_amt DESC;

