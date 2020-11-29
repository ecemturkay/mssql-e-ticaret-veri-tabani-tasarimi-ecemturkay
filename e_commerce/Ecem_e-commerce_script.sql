--Database oluþturma
CREATE DATABASE e_commerce 

--Tablolarý oluþturma
USE e_commerce


--1
CREATE table Customers (
ID int IDENTITY PRIMARY KEY,
[First Name] nvarchar(50) NOT NULL,
[Last Name] nvarchar(50) NOT NULL,
Gender nvarchar(15),
[Birth Date] date,
Age as datediff(year, [Birth Date], getdate()),
Job nvarchar(50),
Phone nvarchar(15),
e_mail nvarchar(50) NOT NULL,
Adress1 nvarchar,
Adress2 nvarchar,
City nvarchar(50),
[Postal Code] nvarchar(50),
Country nvarchar(50),
Password nvarchar NOT NULL,
CreditCard nvarchar(16) NOT NULL,
CardExpMo int NOT NULL,
CardExpYr int NOT NULL,
[Billing Address] nvarchar NOT NULL,
[Billing City] nvarchar(50),
[Billing Postal Code] nvarchar(50),
[Shipping Address] nvarchar NOT NULL,
[Shipping City] nvarchar(50),
[Shipping Postal Code] nvarchar(50),
[Shipping Country] nvarchar(50),
[Registration Date] date
)


--2
CREATE table Products (
ID int IDENTITY(1,1) PRIMARY KEY,
[Product Name] nvarchar NOT NULL,
[Product Description] nvarchar NOT NULL,
[Category ID] int NOT NULL,
Brand nvarchar(50) NOT NULL,
[Unit Price] money NOT NULL,
[Available Sizes] varchar NOT NULL,
[Available Colors] varchar NOT NULL,
Size varchar NOT NULL,
Color varchar NOT NULL,
Discount int NOT NULL,
[Units in Stock] int NOT NULL,
[Product Available] bit,
[Discount Available] bit,
Picture nvarchar NOT NULL
)


--3
CREATE table Categories (
ID int IDENTITY(1,1) PRIMARY KEY,
[Category Name] nvarchar(50) NOT NULL,
CDescription nvarchar NOT NULL,
)


--4
CREATE table Orders (
ID int IDENTITY PRIMARY KEY,
[Customer ID] int NOT NULL,
[Order Number] varchar NOT NULL,
[Order Date] datetime NOT NULL,
[Ship Date] datetime NOT NULL,
[Shipment Fee] money NOT NULL,
Tax money NOT NULL,
FulFilled bit NOT NULL,
Deleted bit,
[Payment Date] datetime NOT NULL,
Paid money NOT NULL,
[Transaction Status] nvarchar(50) NOT NULL
)


--5
CREATE table [Order Details] (
ID int IDENTITY PRIMARY KEY,
[Order ID] int NOT NULL,
[Product ID] int NOT NULL,
[Order Number] varchar NOT NULL,
Price money NOT NULL,
Quantity int NOT NULL,
Discount int,
Total money NOT NULL,
Size nvarchar(15) NOT NULL,
Color nvarchar(15),
FulFilled bit NOT NULL,
[Shipment Status] nvarchar(50) NOT NULL,
[Shipment Date] datetime,
[Bill Date] datetime NOT NULL
)


--foreign key1
ALTER TABLE Products
ADD CONSTRAINT fk_category_id 
    FOREIGN KEY ([Category ID]) REFERENCES Categories(ID)

--foreign key2
ALTER table Orders 
ADD CONSTRAINT fk_customer_id 
    foreign key ([Customer ID]) references Customers(ID)

--foreign keys3/4
ALTER TABLE [Order Details]
ADD CONSTRAINT fk_order_id
    FOREIGN KEY ([Order ID]) REFERENCES Orders(ID)

ALTER TABLE [Order Details]
ADD CONSTRAINT fk_product_id 
    FOREIGN KEY ([Product ID]) REFERENCES Products(ID)
    