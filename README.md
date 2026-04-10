# 🛒 Zepto SQL Data Analysis Project

## 📌 Project Overview

This project focuses on analyzing a retail dataset (Zepto-like inventory data) using **PostgreSQL**. The goal is to explore product data, clean missing values, and extract meaningful business insights using SQL queries.

---

## 🎯 Objectives

* Perform **data exploration** on product dataset
* Handle **missing/null values**
* Analyze **product categories**
* Identify **stock availability trends**
* Detect **duplicate product entries**
* Generate insights using SQL aggregation

---

## 🗂️ Dataset Details

The dataset contains product-level information such as:

* `sku_id` → Unique product ID
* `category` → Product category
* `name` → Product name
* `mrp` → Maximum Retail Price
* `discountPercent` → Discount offered
* `availableQuantity` → Stock quantity
* `discountSellingPrice` → Final selling price
* `weightInGms` → Product weight
* `outOfStock` → Availability status (True/False)
* `quantity` → Number of units

---

## 🛠️ Tools & Technologies

* PostgreSQL 18
* pgAdmin 4
* SQL (Structured Query Language)
* Excel (for dataset handling)

---

## ⚙️ Database Setup

```sql
DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);
```

---

## 🔍 Data Exploration Queries

### 1️⃣ Total Number of Records

```sql
SELECT COUNT(*) FROM zepto;
```

---

### 2️⃣ Sample Data

```sql
SELECT * FROM zepto
LIMIT 10;
```

---

### 3️⃣ Handling NULL Values

```sql
SELECT * FROM zepto
WHERE name IS NULL
OR category IS NULL
OR mrp IS NULL
OR discountPercent IS NULL
OR discountSellingPrice IS NULL
OR weightInGms IS NULL
OR availableQuantity IS NULL
OR outOfStock IS NULL
OR quantity IS NULL;
```

---

### 4️⃣ Unique Product Categories

```sql
SELECT DISTINCT category
FROM zepto
ORDER BY category;
```

---

### 5️⃣ Products In Stock vs Out of Stock

```sql
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;
```

---

### 6️⃣ Duplicate Product Names

```sql
SELECT name, COUNT(sku_id) AS "NUMBER OF SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;
```

---

## 📊 Key Insights

* 📦 Total Products: **3732**
* 🟢 In Stock Products: **3279**
* 🔴 Out of Stock Products: **453**
* 🏷️ Multiple duplicate product names found
* 🗃️ Around **14 product categories** identified

---

## 🚀 What I Learned

* Writing optimized SQL queries
* Using **GROUP BY, HAVING, ORDER BY** effectively
* Handling real-world messy data
* Data exploration and analysis techniques
* Working with PostgreSQL and pgAdmin

---

## 🔮 Future Improvements

* Build dashboard using **Power BI / Tableau**
* Add **data visualization charts**
* Integrate with Python (Pandas, Matplotlib)
* Create an API for real-time analysis

---

## 📁 Project Structure

```
📦 Zepto-SQL-Project
 ┣ 📜 ZEPTO_SQL_DataAnalysis.sql
 ┣ 📊 zepto_v1.xlsx
 ┗ 📄 README.md
```

---

## 🙌 Author

**Hemanth (AI & ML Student)**

* Passionate about Data Analytics & AI
* Skilled in SQL, Web Development & Automation

---

## ⭐ If you like this project

Give it a ⭐ on GitHub and share feedback!
