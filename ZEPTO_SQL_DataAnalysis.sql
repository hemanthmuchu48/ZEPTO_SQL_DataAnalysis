drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountpercent NUMERIC(5,2),
avaliableQuantity INTEGER,
discountSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);


--DATA EXPLORATION

--COUNT OF ROWS
SELECT COUNT(*) FROM zepto;

--SAMPLE DATA
SELECT * FROM zepto
LIMIT 10;

--NULL VALUES
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountSellingPrice IS NULL
OR
weightInGms IS NULL
OR
avaliableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--DIFFERENT PRODUCT CATEGORIES
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--PRODUCTS IN STOCK VS OUT OF STOCK
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

--PRODUCTS NAME PRESENT MULTIPLE TIMES
SELECT name, COUNT(sku_id) AS "nUMBER OF SKUs"
FROM zepto
GROUP BY name 
HAVING COUNT(sku_id)>1
ORDER BY COUNT(sku_id) DESC;

--DATA CLEANING

--PRODUCTS WITH PRICE=0
SELECT * FROM zepto
WHERE mrp = 0 OR discountSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

--CONVERT PAISE TO RUPEES
UPDATE zepto
SET mrp = mrp/100.0,
discountSellingPrice = discountSellingPrice/100.0;

SELECT mrp, discountSellingPrice FROM  zepto;

--business insight queries
--FIND THE TOP 10 BEST VALUE PRODUCTS ON THE DISCOUNT PERCENTAGE
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

--WHAT ARE THE PRODUCTS WITH HIGH MRP BUT OUT OF STOCK
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

--CALCULATE ESTIMATED REVENUE FOR EACH CATEGORY
SELECT category,
SUM(discountSellingPrice * avaliableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

--FIND ALL PRODUCTS WHERE MRP IS GREAYER THEN ₹400 AND DISCOUNT IS LESS THAN 10%
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

--IDENTIFY THE TOP 5 CATEGORIES OFFERING THE HIGHEST AVERAGE DISCOUNT PERCENTAGE.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

--FIND THE PRICE PER GRAM FOR GRAM FOR PRODUCTS ABOVE 100G AND SORT BY BEST VALUE
SELECT DISTINCT name, weightInGms, discountSellingPrice,
ROUND(discountSellingPrice/weightInGms,2)AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

--GROUP THE PRODUCTS INTO CATEGORIES LIKE LOW, MEDIUM, BULK
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
WHEN weightInGms < 5000 THEN 'Medium'
ELSE 'BULK'
END AS weight_category
FROM zepto;

--WHAT IS THE TOTAL INVENTORY WEIGHT PER CATEGORY
SELECT category,
SUM(weightInGms * avaliableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;




















