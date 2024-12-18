use[sell laptop]
-- Tạo cơ sở dữ liệu
CREATE DATABASE ASM_SE07203;
GO

-- Sử dụng cơ sở dữ liệu



-- Tạo bảng Category (Danh mục sản phẩm)
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL
);

-- Tạo bảng Product (Sản phẩm)
CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductCode NVARCHAR(50) NOT NULL,
    ProductName NVARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    InventoryQuantity INT NOT NULL,
    ProductImage NVARCHAR(MAX),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Tạo bảng Employee (Nhân viên)
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeCode NVARCHAR(50) NOT NULL,
    EmployeeName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    AuthorityLevel NVARCHAR(50),
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    PasswordChanged BIT DEFAULT 0
);

-- Tạo bảng Customer (Khách hàng)
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerCode NVARCHAR(50) NOT NULL,
    CustomerName NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(255)
);

-- Tạo bảng Orders (Đơn hàng)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATETIME NOT NULL,
    EmployeeID INT,
    CustomerID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Tạo bảng OrderDetail (Chi tiết đơn hàng)
CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    QuantitySold INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Tạo bảng Import (Nhập hàng)
CREATE TABLE Import (
    ImportID INT PRIMARY KEY IDENTITY(1,1),
    ImportDate DATETIME NOT NULL,
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Tạo bảng ImportDetail (Chi tiết nhập hàng)
CREATE TABLE ImportDetail (
    ImportDetailID INT PRIMARY KEY IDENTITY(1,1),
    ImportID INT,
    ProductID INT,
    QuantityImported INT NOT NULL,
    ImportCost DECIMAL(10, 2),
    FOREIGN KEY (ImportID) REFERENCES Import(ImportID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
-- Thêm dữ liệu vào bảng Employee
INSERT INTO Employee (EmployeeCode, EmployeeName, Position, AuthorityLevel, Username, Password, PasswordChanged)
VALUES
    ('Emp1', 'Nguyen dang tuyen', 'Admin', 'Admin', 'admin1', '123456', 1),
    ('Emp2', 'pham minh hieu', 'Warehouse Manager', 'Warehouse Manager', 'warehousemanager1', '123456', 1),
    ('Emp3', 'bui da dui', 'Sale', 'Sale', 'sale1', '123456', 0);

	-- Thêm dữ liệu vào bảng Category
INSERT INTO Category (CategoryName)
VALUES ('Laptop');

-- Thêm dữ liệu vào bảng Product
INSERT INTO Product (ProductCode, ProductName, Price, InventoryQuantity, ProductImage, CategoryID)
VALUES 
    ('LAP001', 'Dell XPS 13', 35000000.00, 10, 'dell_xps13.jpg', (SELECT CategoryID FROM Category WHERE CategoryName = 'Laptop')),
    ('LAP002', 'MacBook Air M2', 32000000.00, 15, 'macbook_air_m2.jpg', (SELECT CategoryID FROM Category WHERE CategoryName = 'Laptop')),
    ('LAP003', 'HP Spectre x360', 30000000.00, 8, 'hp_spectre_x360.jpg', (SELECT CategoryID FROM Category WHERE CategoryName = 'Laptop'));




-- Thêm dữ liệu vào bảng Customer
INSERT INTO Customer (CustomerCode, CustomerName, PhoneNumber, Address)
VALUES 
    ('C001', 'Tran Thi D', '0901234567', 'Hanoi'),
    ('C002', 'Le Van E', '0912345678', 'Ho Chi Minh City'),
    ('C003', 'Pham Thi F', '0923456789', 'Da Nang');

-- Thêm dữ liệu vào bảng Orders (Đơn hàng)
INSERT INTO Orders (OrderDate, EmployeeID, CustomerID)
VALUES 
    ('2024-12-01 10:00:00', 3, 1),
    ('2024-12-02 11:00:00', 3, 2),
    ('2024-12-03 12:00:00', 3, 3);

-- Thêm dữ liệu vào bảng OrderDetail (Chi tiết đơn hàng)
INSERT INTO OrderDetail (OrderID, ProductID, QuantitySold)
VALUES 
    (1, (SELECT ProductID FROM Product WHERE ProductCode = 'LAP001'), 2),
    (2, (SELECT ProductID FROM Product WHERE ProductCode = 'LAP002'), 1),
    (3, (SELECT ProductID FROM Product WHERE ProductCode = 'LAP003'), 1);

-- Thêm dữ liệu vào bảng Import (Nhập hàng)
INSERT INTO Import (ImportDate, EmployeeID)
VALUES 
    ('2024-11-25 08:00:00', 2),
    ('2024-11-26 09:00:00', 2),
    ('2024-11-27 10:00:00', 2);

-- Thêm dữ liệu vào bảng ImportDetail (Chi tiết nhập hàng)
INSERT INTO ImportDetail (ImportID, ProductID, QuantityImported, ImportCost)
VALUES 
    (1, (SELECT ProductID FROM Product WHERE ProductCode = 'LAP001'), 5, 34000000.00),
    (2, (SELECT ProductID FROM Product WHERE ProductCode = 'LAP002'), 10, 31000000.00),
    (3, (SELECT ProductID FROM Product WHERE ProductCode = 'LAP003'), 4, 29000000.00);

	select*from [dbo].[Category]
	select*from[dbo].[Customer]
	select*from[dbo].[Employee]
	select*from[dbo].[Import]
	select*from[dbo].[ImportDetail]
	select*from[dbo].[OrderDetail]
	select*from[dbo].[Orders]
	select*from[dbo].[Product]

	select*from [dbo].[Employee]

