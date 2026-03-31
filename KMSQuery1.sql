SELECT * FROM [KMS Sql Case Study]


----CASE SCENARIO 1----
---1. Which product category had the highest sales?
SELECT TOP 1
    [Product_Category], 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM 
    [KMS Sql Case Study]
GROUP BY 
    [Product_Category]
ORDER BY 
    Total_Sales DESC

---2. What are the Top 3 and Bottom 3 regions in terms of sales?
---Top 3 Regions By Sales
SELECT TOP 3 
    [Region], 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM 
    [KMS Sql Case Study]
GROUP BY 
    [Region]
ORDER BY 
    Total_Sales DESC;

---Bottom 3 Regions By Sales
SELECT TOP 3 
    [Region], 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM 
    [KMS Sql Case Study]
GROUP BY 
    [Region]
ORDER BY 
    Total_Sales ASC;

---3. What were the total sales of appliances in Ontario?
SELECT 
    [Product_Category], 
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM 
    [KMS Sql Case Study]
WHERE 
    [Region] = 'Ontario'
GROUP BY 
    [Product_Category]
ORDER BY 
    Total_Sales DESC;

---4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers.
SELECT TOP 10 [Customer_Name], SUM([Sales]) as [Total Sales]
FROM [KMS Sql Case Study]
GROUP BY Customer_Name
ORDER BY [Total Sales] ASC

---5. KMS incurred the most shipping cost using which shipping method?
SELECT TOP 1 [Ship_Mode], SUM([Shipping_Cost]) as [Total Shipping Cost]
FROM [KMS Sql Case Study]
GROUP BY Ship_Mode
ORDER BY [Total Shipping Cost] DESC

----CASE SCENARIO 2----
---6. Who are the most valuable customers, and what products or services do they typically purchase?
SELECT [Customer_Name],Product_Name, SUM(sales) as [Total Sales]
FROM [KMS Sql Case Study]
GROUP BY Customer_Name,Product_Name
ORDER BY [Total Sales] DESC

---7. Which small business customer had the highest sales?
SELECT TOP 1 Customer_Name,Customer_Segment, SUM([Sales]) as [Total Sales]
FROM [KMS Sql Case Study]
WHERE Customer_Segment ='small Business'
GROUP BY Customer_Name,Customer_Segment
ORDER BY [Total Sales] DESC

---8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
SELECT TOP 1  Customer_Name,Customer_Segment, count([Order_ID]) as [Total order]
FROM [KMS Sql Case Study]
WHERE Customer_Segment ='corporate' and Order_Date between '2009' and '2012'
GROUP BY Customer_Name,Customer_Segment
ORDER BY [Total order] DESC

---9. Which consumer customer was the most profitable one?

SELECT SUM(TRY_CAST(REPLACE([Profit], ',', '') AS FLOAT)) AS Total_Profit
FROM [KMS Sql Case Study]

SELECT TOP 1 Customer_Name,Customer_Segment, sum([Profit]) as [Total profit]
FROM [KMS Sql Case Study]
WHERE Customer_Segment ='Consumer'
GROUP BY Customer_Name,Customer_Segment
ORDER BY [Total profit] DESC

---10. Which customer returned items, and what segment do they belong to?
SELECT Customer_Name,Customer_Segment,[Status]
FROM [KMS Sql Case Study]
JOIN [dbo].[Order_Status]
ON [KMS Sql Case Study].Order_ID = [dbo].[Order_Status].[Order_ID]

---11. If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer
SELECT Order_Priority, Ship_Mode,
    COUNT([Order_ID]) AS [order count],
    SUM(sales - profit) AS [Estimated shipping cost],
    AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS [Avg ship date]
    FROM  [KMS Sql Case Study] 
GROUP BY Order_Priority,Ship_Mode
ORDER BY  Order_Priority,Ship_Mode DESC 






































