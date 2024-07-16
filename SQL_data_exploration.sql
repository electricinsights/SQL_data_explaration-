--Analyzing Data
SELECT*
FROM muzammildb.dbo.data

-- Creating Duplicate Table `sales_data`
SELECT *
INTO sales_data
FROM muzammildb.dbo.data
WHERE 1=0;

-- Inserting Data into `sales_data`
INSERT INTO sales_data
SELECT *
FROM muzammildb.dbo.sales_data;

-- Data Cleaning: Removing null values from `sales_data`
DELETE FROM muzammildb.dbo.sales_data
WHERE invoiceno IS NULL
    OR stockcode IS NULL
    OR customerid IS NULL;

-- Checking Data Types: Altering `invoicedate` to DATE type
ALTER TABLE muzammildb.dbo.sales_data
ALTER COLUMN invoicedate DATE;

-- Data Exploration Queries

-- Total Sales Per Invoice
SELECT invoiceno, SUM(total_price) AS total_sales
FROM muzammildb.dbo.sales_data 
GROUP BY invoiceno
ORDER BY total_sales DESC;

-- Total Quantity sold per product
SELECT stockcode, SUM(quantity) AS total_quantity
FROM muzammildb.dbo.sales_data 
GROUP BY stockcode
ORDER BY total_quantity DESC;

-- Average Unit Price Per Product
SELECT stockcode, AVG(unitprice) AS avg_unitprice
FROM muzammildb.dbo.sales_data 
GROUP BY stockcode
ORDER BY avg_unitprice DESC;

-- Total Sales by Country
SELECT SUM(total_price) AS total_sales, country
FROM muzammildb.dbo.sales_data 
GROUP BY country
ORDER BY total_sales DESC;

-- Monthly Sales Trend
SELECT SUM(total_price) AS total_sales, YEAR(invoicedate) AS year, MONTH(invoicedate) AS month
FROM muzammildb.dbo.sales_data
GROUP BY YEAR(invoicedate), MONTH(invoicedate)
ORDER BY year, month;

-- Top Customers by sale
SELECT customerid, SUM(total_price) AS total_sales
FROM muzammildb.dbo.sales_data
GROUP BY customerid
ORDER BY total_sales DESC;

-- Avg Quantity Per Invoice
SELECT invoiceno, AVG(quantity) AS average_quantity
FROM muzammildb.dbo.sales_data
GROUP BY invoiceno
ORDER BY average_quantity DESC;

-- Product Performance Analysis
SELECT stockcode, SUM(total_price) AS total_sales, AVG(unitprice) AS average_unit_price
FROM muzammildb.dbo.sales_data
GROUP BY stockcode
ORDER BY total_sales DESC;

