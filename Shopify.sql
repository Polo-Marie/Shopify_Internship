SQL 

# SQL Shopify Answers

a. How many orders were shipped by Speedy Express in total? Answer: 54
    
    SELECT * 
    FROM [Orders] 
    LEFT JOIN Shippers ON Orders.shipperID = Shippers.shipperID 
        WHERE ShipperName = "Speedy Express";

b. What is the last name of the employee with the most orders? Answer: Peacock with 40 orders

    SELECT distinct LastName, count(OrderID) AS "Order Count" 
    FROM [Employees] 
    LEFT JOIN Orders ON Employees.employeeID = Orders.employeeID 
        GROUP BY LastName 
        ORDER BY "Order Count" DESC;


c. What product was ordered the most by customers in Germany? Answer: Gorgonzola Telino with 5 orders
SELECT ProductName, count(ProductName) AS "Product Count" 
FROM [Products] 
LEFT JOIN OrderDetails ON Products.productID = OrderDetails.productID 
LEFT JOIN Orders ON OrderDetails.orderID = Orders.orderID 
LEFT JOIN Customers ON Orders.CustomerID = Customers.customerID 
    WHERE country = "Germany" 
    GROUP BY ProductName 
    ORDER BY "Product Count" DESC; --Insert "Limit 1" after Desc (to show one answer)