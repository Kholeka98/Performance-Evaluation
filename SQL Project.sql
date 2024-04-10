CREATE DATABASE IF NOT EXISTS product_sales;


-- Create table
CREATE TABLE IF NOT EXISTS product(
	 sales_id VARCHAR(4) NOT NULL PRIMARY KEY,
    date DATETIME NOT NULL,
    quantity_p1 INT NOT NULL,
    quantity_p2 INT NOT NULL,
    quantity_p3 INT NOT NULL,
    quantity_p4 INT NOT NULL,
    revenue_p1 DECIMAL(12, 3)  NOT NULL,
    revenue_p2 DECIMAL(12, 3)  NOT NULL,
    revenue_p3 DECIMAL(12, 3) NOT NULL,
    revenue_p4 DECIMAL(12, 3)  NOT NULL
);
-- Add the year column to table
ALTER TABLE product ADD COLUMN year VARCHAR(4);

UPDATE product
SET year= year(date);


-- Add month name column to the product table
ALTER TABLE product ADD COLUMN month_name VARCHAR(10);

UPDATE product
SET month_name = MONTHNAME(date);


-- Add day of the week  column.
ALTER TABLE product ADD COLUMN day_of_week VARCHAR(10);

UPDATE product 
SET day_of_week = DAYNAME(date); 

-- Add total quantity column that aggregate the quantity sold for all products. 
ALTER TABLE product ADD COLUMN total_quantity VARCHAR(10);

UPDATE product 
SET total_quantity = quantity_p1 + quantity_p2 + quantity_p3 + quantity_p4; 

-- Add total quantity column that aggregate the quantity sold for all products. 
ALTER TABLE product ADD COLUMN total_revenue VARCHAR(10);

UPDATE product 
SET total_revenue = revenue_p1 + revenue_p2 + revenue_p3 + revenue_p4; 


-- 1. What is the average quantity sold for each product per year?
SELECT 
    year,
    AVG(quantity_p1) AS avg_quantity_product1,
    AVG(quantity_p2) AS avg_quantity_product2,
    AVG(quantity_p3) AS avg_quantity_product3,
    AVG(quantity_p4) AS avg_quantity_product4
FROM
    product
GROUP BY year
ORDER BY year;

-- 2. What is the total revenue generated by each product per year?
SELECT 
    year, ROUND(SUM(revenue_p1), 0) AS total_revenue_product1,
    ROUND(SUM(revenue_p2), 0) AS total_revenue_product2,
    ROUND(SUM(revenue_p3), 0) AS total_revenue_product3,
    ROUND(SUM(revenue_p4), 0) AS total_revenue_product4
FROM
    product
    group by year;
    
-- 3. Which product had the highest total revenue by year?
SELECT 
    year,
    CASE
        WHEN SUM(revenue_p1) >= SUM(revenue_p2) AND SUM(revenue_p1) >= SUM(revenue_p3) AND SUM(revenue_p1) >= SUM(revenue_p4) THEN 'Product1'
        WHEN SUM(revenue_p2) >= SUM(revenue_p1) AND SUM(revenue_p2) >= SUM(revenue_p3) AND SUM(revenue_p2) >= SUM(revenue_p4) THEN 'Product2'
        WHEN SUM(revenue_p3) >= SUM(revenue_p1) AND SUM(revenue_p3) >= SUM(revenue_p2) AND SUM(revenue_p3) >= SUM(revenue_p4) THEN 'Product3'
        ELSE 'Product4'
    END AS highest_revenue_product
FROM 
    product 
GROUP BY year
ORDER BY year;

-- 4. What is the total revenue per day?	
SELECT 
    date,
    total_revenue 
FROM product;	

-- 5. What is the total quantity sold per month for all products combined in 2020?	
SELECT 
	month_name, year,
    SUM(quantity_p1 + quantity_p2 + quantity_p3 + quantity_p4) AS total_quantity_sold
FROM 
    product
WHERE 
    year = 2020
GROUP BY 
    month_name, year
ORDER BY 
    year, 
    CASE month_name
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
END;


-- 6 What is the total quantity sold by year?
SELECT 
    year,
    SUM(quantity_p1 + quantity_p2 + quantity_p3 + quantity_p4) AS total_quantity_sold
FROM 
    product 
GROUP BY 
    year
ORDER BY year;

-- 7. What is the total quantity sold for each day of the week, grouped by year?
SELECT 
    day_of_week, year,
    SUM(quantity_p1 + quantity_p2 + quantity_p3 + quantity_p4) AS total_quantity_sold
FROM 
    product
GROUP BY 
    year, day_of_week
ORDER BY 
    year, CASE day_of_week
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Sartuday' THEN 6
        WHEN 'Sunday' THEN 7
END;

;
    
    
-- 8. Which product had the highest total revenue in a 2022, and what was the total revenue for that product?
    SELECT 
    product_name,
    total_revenue
FROM 
    (
        SELECT 
            'Product1' AS product_name,
            SUM(revenue_p1) AS total_revenue
        FROM 
            product
        WHERE 
            YEAR(date) = 2022

        UNION ALL

        SELECT 
            'Product2' AS product_name,
            SUM(revenue_p2) AS total_revenue
        FROM 
            product
        WHERE 
            YEAR(date) = 2022

        UNION ALL

        SELECT 
            'Product3' AS product_name,
            SUM(revenue_p3) AS total_revenue
        FROM 
            product
        WHERE 
            YEAR(date) = 2022

        UNION ALL

        SELECT 
            'Product4' AS product_name,
            SUM(revenue_p4) AS total_revenue
        FROM 
            product
        WHERE 
            year = 2022
    ) AS yearly_revenues
ORDER BY 
    total_revenue DESC
     LIMIT 1;
    

