IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Documents') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE Documents(
    id          INT             NOT NULL PRIMARY KEY,
    type        VARCHAR(80)     NOT NULL  CHECK (type in ('passport', 'driver license')),
    number      VARCHAR(80)     NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Customers') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE Customers(
    id		    INT             NOT NULL PRIMARY KEY,
    name	    VARCHAR(200)    NOT NULL,
    age		    INT             NOT NULL,
    document_id INT             NOT NULL,
    rating      FLOAT           NOT NULL  DEFAULT 0.0,
    comment     TEXT            NULL,

    CONSTRAINT Customer_Document_id_FK FOREIGN KEY (document_id) REFERENCES Documents(id)
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Couriers') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE Couriers(
    id          INT             NOT NULL PRIMARY KEY,
    name        VARCHAR(200)    NOT NULL,
    age         INT             NOT NULL,
    document_id INT             NOT NULL,
    rating      FLOAT           NOT NULL  DEFAULT 0.0,
    comment     TEXT            NULL,

    CONSTRAINT Courier_Document_id_FK FOREIGN KEY (document_id) REFERENCES Documents(id) 
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Orders') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE Orders(
    id          INT             NOT NULL PRIMARY KEY,
    name        VARCHAR(100)    NOT NULL,
    departure   TEXT            NOT NULL,
    destination TEXT            NOT NULL,
    height      FLOAT           NOT NULL,
    width       FLOAT           NOT NULL,
    depth       FLOAT           NOT NULL,
    weight      FLOAT           NOT NULL,
    comment     TEXT            NULL,
    status      VARCHAR(20)     NOT NULL  DEFAULT 'in queue' CHECK (status IN('in queue', 'in progress', 'done', 'canceled')),
    timestamp   DATETIME  DEFAULT GETDATE()
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Courier_orders') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE Courier_orders(
    courier_id  INT             NOT NULL,
    order_id    INT             NOT NULL,

    CONSTRAINT Courier_id_FK FOREIGN KEY (courier_id) REFERENCES Couriers(id),
    CONSTRAINT Courier_Order_id_FK FOREIGN KEY (order_id) REFERENCES Orders(id)
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Customer_orders') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE Customer_orders(
    customer_id  INT            NOT NULL,
    order_id     INT            NOT NULL,

    CONSTRAINT Customer_id_FK FOREIGN KEY (customer_id) REFERENCES Customers(id),
    CONSTRAINT Customer_Order_id_FK FOREIGN KEY (order_id) REFERENCES Orders(id)
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'Processed_orders') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE Processed_orders(
    order_id    INT             NOT NULL,
    courier_id  INT             NOT NULL,
    customer_id INT             NOT NULL,

    CONSTRAINT Processed_Order_id_FK FOREIGN KEY (order_id) REFERENCES Orders(id),
    CONSTRAINT Processed_Courier_id_FK FOREIGN KEY (courier_id) REFERENCES Couriers(id),
    CONSTRAINT Processed_Customer_id_FK FOREIGN KEY (customer_id) REFERENCES Customers(id)
);
