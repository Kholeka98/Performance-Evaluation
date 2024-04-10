# Performance Evaluation Analysis 

## Project objective
The objective of this SQL project is to conduct a comprehensive performance analysis of four products based on their quantity sold and revenue generated. Through the utilization of SQL queries and database management techniques, this project aims to:
- **Analyze Product Performance**: Evaluate the sales performance of four products within a given timeframe by examining their respective quantities sold and revenue generated.
- **Identify Key Performance Indicators (KPIs)**: Determine key metrics such as total revenue, average revenue per product, total quantity sold, and average quantity sold for each product.
- **Compare Product Performance**: Compare the performance metrics among the four selected products to identify trends, patterns, and disparities in sales volume and revenue generation.
- **Uncover Insights**: Extract actionable insights from the analysis to understand which products are performing well and which may require further attention or improvement strategies.
- **Inform Decision-Making**: Provide stakeholders with valuable insights to inform decision-making processes related to product management, marketing strategies, inventory planning, and resource allocation.

## About Data 
The dataset was obtained from [Kaggle](https://www.kaggle.com/datasets/ksabishek/product-sales-data). This dataset contains quantity sold and revenue of four different products. The dataset description states: "This is a hypothetical dataset generated using python for educational purposes. It bears no resemblance to any real firm."
| Column       | Description           | Data Type |
| ------------- |:-------------:|:------------:|
| sales_id     | This is a unique identifierassigned to each day of sales | VARCHAR(5)      |
| Date         | This is a date of day od sales                           |  DATE           |
| Q-P1         | Total quantity sold of product 1                         | DECIMAL(12, 3)  |
| Q-P2         | Total quantity sold of product 2                         | DECIMAL(12, 3)  |
| Q-P3         | Total quantity sold of product 3                         | DECIMAL(12, 3)  |
| Q-P4         | Total quantity sold of product 4                         | DECIMAL(12, 3)  |
| S-P1         | Total sales of product 1                                 | DECIMAL(12, 3)  |
| S-P2         | Total sales of product 2                                 | DECIMAL(12, 3)  |
| S-P3         | Total sales of product 3                                 | DECIMAL(12, 3)  |
| S-P4         | Total sales of product 4                                 | DECIMAL(12, 3)  |

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
### Product
### Sales



## Code
The res
```sql
-- Create database
CREATE DATABASE IF NOT EXISTS product_sales;

-- Create table named product 
CREATE TABLE IF NOT EXISTS product(
	 order_id VARCHAR(4) NOT NULL PRIMARY KEY,
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
