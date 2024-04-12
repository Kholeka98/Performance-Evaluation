# Performance Evaluation 

## Project objective
The objective of this SQL project is to conduct a comprehensive performance analysis of four products based on their quantity sold and revenue generated. Through the utilization of SQL queries and database management techniques, this project aims to:
- **Analyze Product Performance**: Evaluate the sales performance of four products within a given timeframe by examining their respective quantities sold and revenue generated.
- **Identify Key Performance Indicators (KPIs)**: Determine key metrics such as total revenue, average revenue per product, total quantity sold, and average quantity sold for each product.
- **Compare Product Performance**: Compare the performance metrics among the four selected products to identify trends, patterns, and disparities in sales volume and revenue generation.
- **Uncover Insights**: Extract actionable insights from the analysis to understand which products are performing well and which may require further attention or improvement strategies.

## About Data 
The dataset was obtained from [Kaggle](https://www.kaggle.com/datasets/ksabishek/product-sales-data). This dataset contains quantity sold and revenue of four different products from 2010 to 2023. The dataset description states: "This is a hypothetical dataset generated using python for educational purposes. It bears no resemblance to any real firm."
| Column       | Description           | Data Type |
| ------------- |:-------------:|:------------:|
| sales_id     | This is a unique identifier assigned to each day of sales | VARCHAR(5)      |
| Date         | This is a date of day od sales                           |  DATE           |
| Q-P1         | Total quantity sold of product 1                         | DECIMAL(12, 3)  |
| Q-P2         | Total quantity sold of product 2                         | DECIMAL(12, 3)  |
| Q-P3         | Total quantity sold of product 3                         | DECIMAL(12, 3)  |
| Q-P4         | Total quantity sold of product 4                         | DECIMAL(12, 3)  |
| S-P1         | Total sales of product 1                                 | DECIMAL(12, 3)  |
| S-P2         | Total sales of product 2                                 | DECIMAL(12, 3)  |
| S-P3         | Total sales of product 3                                 | DECIMAL(12, 3)  |
| S-P4         | Total sales of product 4                                 | DECIMAL(12, 3)  |

### Description of datasets uploaded
- `statsfinal` is the dataset from Kaggle.
- `product_sales_data` is the dataset I obtained after renaming columns and preparing the data.
- `SQL imported data` is the dataset SQL imported.

## Strategy 
1. **Dataset Prepation on Excel and MySQL**
      - Data wrangling involved inspecting the dataset for null values and appropriately renaming columns based on their descriptions.
      - Build a database.
      - Define a table  and import NOT NULL data into the table.

2. **Feature Engineering on MySQL**
     - Add a new column named ` day_of_week ` which extracts the day of the week from the date field.
     - Add a new column named ` month_name ` which extracts the month of the week from the date field.
     - Add a new column named ` year ` which extracts the year from the date field.
     - Add a new column named `total_quantity` that computes the total quantity sold for each record, aggregating the quantities of all products.
     - Add a new column named `total_revenue` that computes the total revenue generated for each record, aggregating the revenue of all products.
   
## Business Questions to answer
1. What is the average quantity sold for each product per year?
2. What is the total revenue generated by each product per year?
3. Which product had the highest total revenue by year?
4. What is the average revenue per day?	
5. What is the total quantity sold per month for all products combined in 2020?	
6. What is the total quantity sold by year?
7. What is the total quantity sold for each day of the week, grouped by year?
8. Which product had the highest total revenue in a 2022, and what was the total revenue for that product?
 
## Code
I have attached a file named [SQL Project](https://github.com/Kholeka98/Performance-Evaluation/blob/main/SQL%20Project.sql) containing the rest of the code.


```sql
-- Create database
CREATE DATABASE IF NOT EXISTS product_sales;

-- Create table named product 
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

```
