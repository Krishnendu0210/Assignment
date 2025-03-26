create database Tech shop 



-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);






-- Products
INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1,'Laptop', 'High-performance laptop', 1200.00),
(2,'Smartphone', 'Latest smartphone model', 800.00),
(3,'Tablet', '10-inch tablet', 300.00),
(4,'Headphones', 'Noise-canceling headphones', 150.00),
(5,'Smartwatch', 'Fitness tracking smartwatch', 200.00),
(6,'Camera', 'Digital SLR camera', 600.00),
(7,'Printer', 'Wireless printer', 250.00),
(8,'Monitor', '27-inch monitor', 350.00),
(9,'Keyboard', 'Mechanical keyboard', 100.00),
(10,'Mouse', 'Wireless mouse', 50.00);

-- Orders
INSERT INTO Orders (OrderID, CustomerID,OrderDate, TotalAmount) VALUES
(1,255, '2023-10-26', 1200.00),
(2,256, '2023-10-27', 800.00),
(3,257, '2023-10-28', 300.00),
(4,258, '2023-10-29', 150.00),
(5,259, '2023-10-30', 200.00),
(6,260, '2023-10-31', 600.00),
(7,261, '2023-11-01', 250.00),
(8,262, '2023-11-02', 350.00),
(9,263, '2023-11-03', 100.00),
(10,264, '2023-11-04', 50.00);

-- OrderDetails
INSERT INTO OrderDetails (OrderDetailID,OrderID, ProductID, Quantity) VALUES
(1,1, 1, 1),
(2,2, 2, 1),
(3,3, 3, 1),
(4,4, 4, 1),
(5,5, 5, 1),
(6,6, 6, 1),
(7,7, 7, 1),
(8,8, 8, 1),
(9,9, 9, 1),
(10,10, 10, 1);

-- Inventory
INSERT INTO Inventory (InventoryID, QuantityInStock, LastStockUpdate) VALUES
(1, 10, '2023-10-26 10:00:00'),
(2, 20, '2023-10-27 11:00:00'),
(3, 30, '2023-10-28 12:00:00'),
(4, 40, '2023-10-29 13:00:00'),
(5, 50, '2023-10-30 14:00:00'),
(6, 60, '2023-10-31 15:00:00'),
(7, 70, '2023-11-01 16:00:00'),
(8, 80, '2023-11-02 17:00:00'),
(9, 90, '2023-11-03 18:00:00'),
(10, 100, '2023-11-04 19:00:00');

update Inventory set ProductID = 1 where QuantityInStock IN (50,60,70,80,90,100) ;

select * from Customers;

select * from Inventory;

select * from OrderDetails;

select * from Orders;

select * from Products;


TASK 2

SELECT First_Name, Last_Name, Email
FROM Customers;


SELECT Orders.OrderID, Orders.OrderDate, Customers.First_Name, Customers.Last_Name
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;


INSERT INTO Customers (First_Name, Last_Name, Email, Phone, Address)
VALUES ('New', 'Customer', 'new.customer@example.com', '123-123-1234', 'New Address');



-- Replace @OrderID with the actual OrderID
DELETE FROM OrderDetails
WHERE OrderID = @OrderID;

DELETE FROM Orders
WHERE OrderID = @OrderID;


 DELETE FROM OrderDetails  
 WHERE OrderID = 3;  
 
 DELETE FROM dbo.Orders  
 WHERE OrderID = 3;
 
 insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
 values
 (10, 10, '2025-03-10', 90.87);
 
 update Customers
 set Email='jabajaba@example.com',
 	Address= '123 New Street, Jandy, Jordan'
 	where CustomerID=1;
 
 UPDATE Orders 
 SET TotalAmount = (
     SELECT SUM(Products.Price * OrderDetails.Quantity) 
     FROM OrderDetails 
     JOIN Products ON OrderDetails.ProductID = Products.ProductID 
     WHERE OrderDetails.OrderID = Orders.OrderID
 );
 
 DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 101);
 DELETE FROM Orders WHERE CustomerID = 101;
 
 INSERT INTO Products (ProductID,ProductName,Description, Price) 
 VALUES (11,'Smartphone X', 'Latest electronic smartphone with AI features', 799.99);
 
 UPDATE Orders 
 SET TotalAmount = '90'
 WHERE OrderID = '10';
 
  UPDATE Customers 
 SET First_Name = (
     SELECT COUNT(*) 
     FROM Orders 
     WHERE Orders.CustomerID = Customers.CustomerID
 );
 
 
 
 


