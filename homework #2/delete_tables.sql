IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Courier_orders') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Courier_orders;

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Customer_orders') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Customer_orders;

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Processed_orders') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Processed_orders;

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Customers') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Customers;

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Couriers') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Couriers;

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Orders') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Orders;

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Documents') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Documents;