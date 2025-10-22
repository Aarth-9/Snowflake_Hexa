
USE DATABASE SNOWPIPE;
USE SCHEMA RETAIL_SALES;

CREATE OR REPLACE TABLE RETAIL_SALES.SALES_ORDERS (
    OrderID STRING,
    OrderDate DATE,
    MonthOfSale STRING,
    CustomerID STRING,
    CustomerName STRING,
    Country STRING,
    Region STRING,
    City STRING,
    Category STRING,
    Subcategory STRING,
    Quantity NUMBER,
    Discount FLOAT,
    Sales FLOAT,
    Profit FLOAT
);

COPY INTO RETAIL_SALES.SALES_ORDERS
FROM @azure_sales_stage
FILE_FORMAT = (FORMAT_NAME = azure_csv_format)
ON_ERROR = 'CONTINUE';


SELECT Region, SUM(Sales) AS TotalSales
FROM RETAIL_SALES.SALES_ORDERS
GROUP BY Region;

SELECT 
    Region,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM RETAIL_SALES.SALES_ORDERS
GROUP BY Region
ORDER BY TotalSales DESC;



