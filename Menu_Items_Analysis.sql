USE restaurant_db;

-- 1. View the menu_items table
SELECT * 
FROM menu_items;

-- 2. Find the number of items on the menu
SELECT COUNT(*)
FROM menu_items;

-- 3. WHat are the most and least expensive items on the menu?
-- Most expensive item
SELECT item_name,price
FROM menu_items
ORDER BY price DESC
LIMIT 1;
-- Least expensive item
SELECT item_name,price
FROM menu_items
ORDER BY price DESC
LIMIT 1;

-- 4. How many italians dishes are there on the menu
SELECT COUNT(*)
FROM menu_items
WHERE category='Italian';
-- 5. WHat are the most and least expensive Italians items on the menu?
-- Most expensive italian item
SELECT item_name,price
FROM menu_items
WHERE category='Italian'
ORDER BY price DESC
LIMIT 1;
-- Least expensive italian item
SELECT item_name,price
FROM menu_items
WHERE category='Italian'
ORDER BY price ASC
LIMIT 1;

-- 6.How many dishes are there in each category
SELECT category, COUNT(menu_item_id) AS num_dishes
FROM menu_items
GROUP BY category;

-- 7. What is the average dish price within each category
SELECT category, AVG(price) AS avg_dishes
FROM menu_items
GROUP BY category;

