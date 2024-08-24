-- 1. Combine the menu_items and order_details table into a single table
SELECT *
FROM order_details AS od
LEFT JOIN menu_items AS menu
ON od.item_id=menu.menu_item_id;

-- 2. What were the most and least ordered items? What categories were they in?alter
-- Most ordered items
SELECT item_name,category,COUNT(order_details_id) AS num_purchase
FROM order_details AS od
LEFT JOIN menu_items AS menu
ON od.item_id=menu.menu_item_id
GROUP BY item_name,category
ORDER BY num_purchase DESC
LIMIT 1;
-- Least ordered items
SELECT item_name,category,COUNT(order_details_id) AS num_purchase
FROM order_details AS od
LEFT JOIN menu_items AS menu
ON od.item_id=menu.menu_item_id
GROUP BY item_name,category
ORDER BY num_purchase ASC
LIMIT 1;
-- 3. What were the top 5 orders that spent the most of money?
SELECT order_id,SUM(price) AS total_spend
FROM order_details AS od
LEFT JOIN menu_items AS menu
ON od.item_id=menu.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;
-- 4. Viwe the details of highest spend order? What insights can you gather from this?
SELECT category, COUNT(item_id) AS num_items
FROM order_details AS od
LEFT JOIN menu_items AS menu
ON od.item_id=menu.menu_item_id
WHERE order_id=440
GROUP BY category;
-- 5. View the detils of the top 5 highest spend orders? What insights can you gather from this?
SELECT order_id,category, COUNT(item_id) AS num_items
FROM order_details AS od
LEFT JOIN menu_items AS menu
ON od.item_id=menu.menu_item_id
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY order_id,category;