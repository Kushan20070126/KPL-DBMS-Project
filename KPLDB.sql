CREATE DATABASE KPLDB;

USE KPLDB;

-- Create Table Estate
CREATE TABLE Estate (
    EstateID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Area FLOAT,
    CropType VARCHAR(50)
);

-- Insert Data into Estate
INSERT INTO Estate (EstateID, Name, Location, Area, CropType) VALUES
('e001', 'Kurunegala Estate1', 'Kurunegala', 1500.5, 'Coconut'),
('e002', 'Gampaha Estate1', 'Gampaha', 1200.0, 'Rubber'),
('e003', 'Anuradhapura Estate1', 'Anuradhapura', 1800.75, 'Spices'),
('e004', 'Kurunegala Estate2', 'Kurunegala', 1350.0, 'Coconut'),
('e005', 'Puttalam Estate1', 'Puttalam', 1100.0, 'Coconut'),
('e006', 'Kurunegala Estate3', 'Kurunegala', 950.25, 'Fruits'),
('e007', 'Matale Estate1', 'Matale', 1400.0, 'Rubber'),
('e008', 'Kurunegala Estate4', 'Kurunegala', 1600.0, 'Coconut'),
('e009', 'Gampaha Estate2', 'Gampaha', 1250.0, 'Coconut'),
('e010', 'Kurunegala Estate5', 'Kurunegala', 1700.0, 'Spices');


-- Create Table Supplier
CREATE TABLE Supplier (
    supplierID VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) ,
    street VARCHAR(100),
    city VARCHAR(50),
    district VARCHAR(50),
    province VARCHAR(50)
);
-- Insert Data into Supplier

INSERT INTO Supplier (supplierID, name, street, city, district, province) VALUES
('S001', 'Green Farms Ltd.', '12 Palm Street', 'Kurunegala', 'Kurunegala', 'North Western'),
('S002', 'AgroSupplies Co.', '45 Coconut Road', 'Gampaha', 'Gampaha', 'Western'),
('S003', 'Sunshine Agro', '78 Spice Lane', 'Matale', 'Matale', 'Central'),
('S004', 'Rubber World', '21 Estate Ave', 'Kegalle', 'Kegalle', 'Sabaragamuwa'),
('S005', 'Fresh Harvest', '99 Mango Lane', 'Anuradhapura', 'Anuradhapura', 'North Central'),
('S006', 'Coconut Ceylon', '33 Palmyrah Road', 'Puttalam', 'Puttalam', 'North Western'),
('S007', 'AgriPlus Ltd.', '88 Tea Street', 'Nuwara Eliya', 'Nuwara Eliya', 'Central'),
('S008', 'Tropical Roots', '14 Fruit Cross', 'Hambantota', 'Hambantota', 'Southern'),
('S009', 'Spice Heaven', '67 Aroma Path', 'Kandy', 'Kandy', 'Central'),
('S010', 'Harvest Hub', '25 Green Valley', 'Badulla', 'Badulla', 'Uva');

-- multivalue table SupplierContact
CREATE TABLE SupplierContact (
    SupplierID VARCHAR(10),
    ContactNumber NVARCHAR(20),
    PRIMARY KEY (SupplierID, ContactNumber),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- multivalue table SupplierContact data insert
INSERT INTO SupplierContact (SupplierID, ContactNumber) VALUES
('S001', '0711234567'),
('S001', '0723456789'),
('S002', '0759876543'),
('S003', '0771122334'),
('S004', '0789988776'),
('S005', '0701111222'),
('S006', '0713333444'),
('S007', '0765555666'),
('S008', '0747777888'),
('S009', '0726666777');

-- Create Table Batch
CREATE TABLE Batch (
    BatchID INT PRIMARY KEY,
    EstateID VARCHAR(10),
    SupplierID VARCHAR(10),
    Quantity INT,
    Grade NVARCHAR(20),
    HarvestDate DATE,
    ExpiryDate DATE,
    FOREIGN KEY (EstateID) REFERENCES Estate(EstateID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

drop table Batch
-- Insert Data into Batch

INSERT INTO Batch (BatchID, EstateID, SupplierID, Quantity, Grade, HarvestDate, ExpiryDate) VALUES
(1, 'e001', 'S001', 500, 'A', '2024-07-01', '2025-07-15'),
(2, 'e002', 'S002', 300, 'B', '2024-07-02', '2025-07-16'),
(3, 'e003', 'S003', 450, 'A', '2024-07-03', '2025-07-17'),
(4, 'e004', 'S004', 600, 'C', '2023-07-04', '2025-07-18'),
(5, 'e005', 'S005', 200, 'B', '2024-07-05', '2025-07-19'),
(6, 'e006', 'S006', 550, 'A', '2024-07-06', '2025-07-20'),
(7, 'e007', 'S007', 400, 'B', '2023-07-07', '2025-07-21'),
(8, 'e008', 'S008', 700, 'C', '2024-07-08', '2025-07-22'),
(9, 'e009', 'S009', 350, 'A', '2024-07-09', '2025-07-23'),
(10, 'e010', 'S010', 250, 'B', '2024-07-10', '2025-07-24');

-- Create Table Buyer
CREATE TABLE Buyer (
    BuyerID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Street VARCHAR(100),
    City VARCHAR(50),
    District VARCHAR(50),
    Province VARCHAR(50),
    BuyerType VARCHAR(50)
);


-- Create Table BuyerContact
CREATE TABLE BuyerContact (
    BuyerID VARCHAR(10),
    ContactNumber VARCHAR(20),
    PRIMARY KEY (BuyerID, ContactNumber),
    FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID)
);
-- Insert Data into Buyer

INSERT INTO Buyer (BuyerID, Name, Street, City, District, Province, BuyerType) VALUES
('1B', 'Oceanic Traders', '10 Sea Breeze Ave', 'Colombo', 'Colombo', 'Western', 'Wholesaler'),
('2B', 'Fresh Mart', '22 Green Market Rd', 'Galle', 'Galle', 'Southern', 'Retailer'),
('3B', 'Agro Lanka', '35 Harvest St', 'Kandy', 'Kandy', 'Central', 'Distributor'),
('4B', 'Sunrise Exporters', '47 Sunrise Lane', 'Kurunegala', 'Kurunegala', 'North Western', 'Exporter'),
('5B', 'Palm & Co', '59 Palmyrah Rd', 'Jaffna', 'Jaffna', 'Northern', 'Retailer'),
('6B', 'Ceylon Roots', '71 Root Lane', 'Anuradhapura', 'Anuradhapura', 'North Central', 'Wholesaler'),
('7B', 'Nature’s Best', '83 Natural Ave', 'Matale', 'Matale', 'Central', 'Retailer'),
('8B', 'Spice World', '96 Aroma Street', 'Batticaloa', 'Batticaloa', 'Eastern', 'Distributor'),
('9B', 'Green World', '105 Forest Road', 'Ratnapura', 'Ratnapura', 'Sabaragamuwa', 'Retailer'),
('10B', 'Island Agro', '118 Island Circle', 'Trincomalee', 'Trincomalee', 'Eastern', 'Wholesaler');


-- Insert Data into BuyerContact

INSERT INTO BuyerContact (BuyerID, ContactNumber) VALUES
('1B', '0771234567'),
('1B', '0712345678'),
('2B', '0758765432'),
('3B', '0789988776'),
('4B', '0701111222'),
('5B', '0763333444'),
('6B', '0725555666'),
('7B', '0737777888'),
('8B', '0749999000'),
('9B', '0716666777');

-- Create Table Orders

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    BuyerID VARCHAR(10), 
    OrderDate DATE,
    Status VARCHAR(20), 
    FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID)
);
-- Insert Data into Orders

INSERT INTO Orders (OrderID, BuyerID, OrderDate, Status) VALUES
(1001, '1B', '2025-06-15', 'Pending'),
(1002, '2B', '2025-06-20', 'Completed'),
(1003, '3B', '2025-06-25', 'Pending'),
(1004, '4B', '2025-06-28', 'Shipped'),
(1005, '5B', '2025-07-01', 'Pending'),
(1006, '6B', '2025-07-02', 'Cancelled'),
(1007, '7B', '2025-07-03', 'Completed'),
(1008, '8B', '2025-07-04', 'Shipped'),
(1009, '9B', '2025-07-05', 'Pending'),
(1010, '10B', '2025-07-06', 'Completed');

-- Create Table OrderDetail (Weak Entity)

CREATE TABLE OrderDetail (
    OrderDetailID INT,
    OrderID INT ,
    BatchID INT,
    QuantityOrdered INT,
    PricePerUnit DECIMAL(10, 2),
    PRIMARY KEY (OrderDetailID, OrderID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BatchID) REFERENCES Batch(BatchID)
);

-- Insert Data into OrderDetail

INSERT INTO OrderDetail VALUES
(2, 1002, 3, 1500, 52.00),
(3, 1001, 4, 800, 47.50),
(1, 1003, 2, 1200, 46.00),
(2, 1003, 5, 600, 55.00),
(3, 1002, 6, 900, 49.50),
(1, 1004, 3, 1800, 51.00),
(2, 1004, 7, 700, 53.00),
(3, 1003, 8, 1100, 48.50),
(4, 1001, 9, 400, 56.00),
(1, 1005, 10, 1300, 47.00);

-- Create Table Shipment

CREATE TABLE Shipment (
    ShipmentID INT PRIMARY KEY,
    OrderID INT,
    ShipmentDate DATE,
    Carrier VARCHAR(100),
    TrackingNumber VARCHAR(50),
    Status VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert Data into Shipment

INSERT INTO Shipment VALUES
(5001, 1001, '2025-06-18', 'Carrier A', 'TRK123456', 'In Transit'),
(5002, 1002, '2025-06-22', 'Carrier B', 'TRK654321', 'Delivered'),
(5003, 1003, '2025-06-26', 'Carrier C', 'TRK789012', 'Shipped'),
(5004, 1004, '2025-06-29', 'Carrier A', 'TRK345678', 'Pending'),
(5005, 1005, '2025-07-02', 'Carrier D', 'TRK901234', 'In Transit'),
(5006, 1006, '2025-07-03', 'Carrier B', 'TRK567890', 'Cancelled'),
(5007, 1007, '2025-07-04', 'Carrier E', 'TRK234567', 'Delivered'),
(5008, 1008, '2025-07-05', 'Carrier F', 'TRK890123', 'Returned'),
(5009, 1009, '2025-07-06', 'Carrier C', 'TRK678901', 'Shipped'),
(5010, 1010, '2025-07-07', 'Carrier A', 'TRK012345', 'Delivered');

-- Create Table Payment

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(12, 2),
    PaymentMethod VARCHAR(50),
    Status VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert Data into Payment

INSERT INTO Payment VALUES
(9001, 1001, '2025-06-16', 75000.00, 'Bank Transfer', 'Paid'),
(9002, 1002, '2025-06-21', 96000.00, 'Cash', 'Paid'),
(9003, 1003, '2025-06-26', 55200.00, 'Credit Card', 'Pending'),
(9004, 1004, '2025-06-29', 87500.00, 'Mobile Payment', 'Paid'),
(9005, 1005, '2025-07-01', 64300.00, 'Bank Transfer', 'Failed'),
(9006, 1006, '2025-07-02', 72000.00, 'Credit Card', 'Cancelled'),
(9007, 1007, '2025-07-03', 81000.00, 'Cash', 'Paid'),
(9008, 1008, '2025-07-04', 92500.00, 'Credit Card', 'Paid'),
(9009, 1009, '2025-07-05', 69800.00, 'Mobile Payment', 'Pending'),
(9010, 1010, '2025-07-06', 87000.00, 'Bank Transfer', 'Paid');

-- Create Table Warehouse

CREATE TABLE Warehouse (
    WarehouseID INT PRIMARY KEY,
    Location VARCHAR(100),
    Capacity INT
);

-- Insert Data into Warehouse

INSERT INTO Warehouse VALUES
(1, 'Kurunegala Central Warehouse', 10000),
(2, 'Gampaha Warehouse', 8000),
(3, 'Colombo Main Storage', 15000),
(4, 'Kandy Distribution Center', 7000),
(5, 'Anuradhapura Depot', 9000),
(6, 'Matara Agricultural Store', 8500),
(7, 'Jaffna Northern Storage', 6000),
(8, 'Trincomalee East Warehouse', 7500),
(9, 'Ratnapura Rubber Storage', 9500),
(10, 'Batticaloa Spice Depot', 6800);


-- Create Table Inventory

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    WarehouseID INT,
    BatchID INT,
    QuantityAvailable INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouse(WarehouseID),
    FOREIGN KEY (BatchID) REFERENCES Batch(BatchID)
);
-- Insert Data into Inventory

INSERT INTO Inventory VALUES
(1001, 1, 1, 3000),
(2001, 2, 2, 1500),
(3001, 1, 3, 2500),
(4001, 2, 4, 1800),
(5001, 3, 5, 2200),
(6001, 3, 6, 2000),
(7001, 4, 7, 1600),
(8001, 4, 8, 1400),
(9001, 5, 9, 1900),
(10001, 5, 10, 2100);

-- Create Table Transporter

CREATE TABLE Transporter (
    TransporterID INT PRIMARY KEY,
    Name VARCHAR(100),
    VehicleType VARCHAR(50)
);
-- Insert Data into Transporter

INSERT INTO Transporter (TransporterID, Name, VehicleType) VALUES
(1, 'Fast Logistics', 'Truck'),
(2, 'Safe Transport', 'Van'),
(3, 'Express Movers', 'Truck'),
(4, 'Green Transport', 'Electric Van'),
(5, 'Speedy Delivery', 'Motorbike'),
(6, 'Reliable Haulers', 'Truck'),
(7, 'Eco Transporters', 'Bicycle'),
(8, 'Urban Freight', 'Van'),
(9, 'Coastal Carriers', 'Boat'),
(10, 'Mountain Movers', 'Truck');

-- Create Table TransporterContact

CREATE TABLE TransporterContact (
    TransporterID INT,
    ContactNumber VARCHAR(20),
    PRIMARY KEY (TransporterID, ContactNumber),
    FOREIGN KEY (TransporterID) REFERENCES Transporter(TransporterID)
);
-- Insert Data into TransporterContact

INSERT INTO TransporterContact (TransporterID, ContactNumber) VALUES
(1, '0713344556'),
(1, '0771122334'),
(2, '0725566778'),
(3, '0709988776'),
(4, '0714455667'),
(5, '0765544332'),
(6, '0712233445'),
(7, '0756677889'),
(8, '0719988776'),
(9, '0723344556'),
(10, '0734455667');

-- Create Table QualityInspection

CREATE TABLE QualityInspection (
    InspectionID INT PRIMARY KEY,
    BatchID INT,
    InspectionDate DATE,
    QualityScore INT,
    InspectorName VARCHAR(100),
    FOREIGN KEY (BatchID) REFERENCES Batch(BatchID)
);

-- Insert Data into QualityInspection

INSERT INTO QualityInspection (InspectionID, BatchID, InspectionDate, QualityScore, InspectorName) VALUES
(1001, 1, '2025-06-05', 95, 'Inspector A'),
(1002, 2, '2025-06-12', 88, 'Inspector B'),
(1003, 1, '2025-06-20', 92, 'Inspector C'),
(1004, 3, '2025-06-22', 85, 'Inspector D'),
(1005, 4, '2025-06-25', 90, 'Inspector E'),
(1006, 5, '2025-06-28', 87, 'Inspector F'),
(1007, 6, '2025-07-01', 93, 'Inspector G'),
(1008, 7, '2025-07-03', 89, 'Inspector H'),
(1009, 8, '2025-07-05', 91, 'Inspector I'),
(1010, 9, '2025-07-07', 94, 'Inspector J');
--select quarys
SELECT Name AS EstateName, Location, Area, CropType
FROM Estate
WHERE CropType = 'Coconut';

SELECT BatchID, Quantity, Grade, HarvestDate
FROM Batch
WHERE EstateID = 'e001';

SELECT O.OrderID, O.OrderDate, O.Status, B.Name AS BuyerName
FROM Orders O
JOIN Buyer B ON O.BuyerID = B.BuyerID
WHERE B.BuyerID = '1B'; 

SELECT ShipmentID, ShipmentDate, Carrier, TrackingNumber, Status
FROM Shipment
WHERE OrderID = 1001; 

-- having and JOIN GROUP BY  ORDER BY
SELECT QI.InspectionID, QI.BatchID, QI.InspectionDate, QI.QualityScore, QI.InspectorName
FROM QualityInspection QI
JOIN Batch B ON QI.BatchID = B.BatchID
WHERE B.HarvestDate BETWEEN '2024-07-01' AND '2024-07-03';

-- get the total qyt  Batches per Estate and Estates More Than 100 Units

SELECT E.Name AS EstateName, SUM(B.Quantity) AS TotalQuantity
FROM Batch B
JOIN Estate E ON B.EstateID = E.EstateID
GROUP BY E.Name
HAVING SUM(B.Quantity) > 100
ORDER BY TotalQuantity DESC;
 

SELECT InspectorName, 
AVG(QualityScore) AS AvgQualityScore, 
COUNT(InspectionID) AS InspectionCount
FROM QualityInspection
GROUP BY InspectorName
ORDER BY AvgQualityScore DESC;





-- Create Stored Procedure to get batches by EstateID
CREATE PROCEDURE GetBatchesByEstate
    @EstateID VARCHAR(10)
AS
BEGIN
    
    SELECT BatchID, Quantity, Grade, HarvestDate, ExpiryDate
    FROM Batch
    WHERE EstateID = @EstateID;
END;
GO

-- Execute the procedure for estate id
EXEC GetBatchesByEstate @EstateID = 'e001';


-- Create function to get total batch quantity for an estate
CREATE FUNCTION dbo.GetTotalBatchQuantity(@EstateID VARCHAR(10))
RETURNS INT
AS
BEGIN
    DECLARE @TotalQuantity INT;

    SELECT @TotalQuantity = SUM(Quantity)
    FROM Batch
    WHERE EstateID = @EstateID;

    RETURN @TotalQuantity;
END;
GO



-- Use the function in a SELECT statement
SELECT dbo.GetTotalBatchQuantity('e001') AS TotalQuantityForEstate;




CREATE TABLE BatchHistory (
    HistoryID INT IDENTITY(1,1) PRIMARY KEY,
    BatchID INT,
    Operation CHAR(1), -- 'I' = Insert,  'D' = Delete
    OperationDate DATETIME DEFAULT GETDATE(),
    Quantity INT NULL,
    Grade NVARCHAR(20) NULL,
    HarvestDate DATE NULL
);


CREATE TRIGGER trg_Batch_Audit_Simple
ON Batch
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- DELETE
    INSERT INTO BatchHistory (BatchID, Operation, Quantity, Grade, HarvestDate)
    SELECT BatchID, 'D', Quantity, Grade, HarvestDate
    FROM deleted;

    -- INSERT
    INSERT INTO BatchHistory (BatchID, Operation, Quantity, Grade, HarvestDate)
    SELECT BatchID, 'I', Quantity, Grade, HarvestDate
    FROM inserted;


END;


SELECT * FROM Estate;
SELECT * FROM Supplier;
SELECT * FROM SupplierContact;
SELECT * FROM Batch;
SELECT * FROM Buyer;
SELECT * FROM BuyerContact;
SELECT * FROM Orders;
SELECT * FROM OrderDetail;
SELECT * FROM Shipment;
SELECT * FROM Payment;
SELECT * FROM Warehouse;
SELECT * FROM Inventory;
SELECT * FROM Transporter;
SELECT * FROM TransporterContact;
SELECT * FROM QualityInspection;
SELECT * FROM BatchHistory;  

INSERT INTO Batch (BatchID, EstateID, SupplierID, Quantity, Grade, HarvestDate, ExpiryDate)
VALUES (11, 'e001', 'S001', 400, 'A', '2025-07-08', '2026-07-08');