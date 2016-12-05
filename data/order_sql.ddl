DROP VIEW Report;
DROP VIEW invView
DROP TRIGGER replaceInvTrig
DROP TRIGGER newProductTrig;
DROP TABLE OrderedProduct;
DROP TABLE Stores;
DROP TABLE Orders;
DROP TABLE ProductReview;
DROP TABLE Product;
DROP TABLE HasPaymentMethod;
DROP TABLE PaymentMethod;
DROP TABLE Users;
DROP TABLE ShippingOption;
DROP TABLE ProductCategory;
DROP TABLE Warehouse;
DROP TABLE UserGroup;


CREATE TABLE UserGroup (
	GroupID int,
	name varchar(50),
	PRIMARY KEY (GroupID)
);


CREATE TABLE Warehouse (
	wname varchar(50),
	address varchar(50),
	city varchar(50),
	province varchar(3),
	PRIMARY KEY (wname)
);


CREATE TABLE ProductCategory (
	catID int IDENTITY,
	catName varchar(50),
	catURL varchar(50),
	PRIMARY KEY (catID)
);


CREATE TABLE ShippingOption (
	TypeID int,
	TypeName varchar(50),
	discount decimal(4,2),
	PRIMARY KEY (TypeID)
);


CREATE TABLE Users (
	UserID int IDENTITY,
	GroupID int NOT NULL DEFAULT 2,
	fname varchar(50) NOT NULL,
	lname varchar(50) NOT NULL,
	address varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	province varchar(3) NOT NULL,
	postalcode char(7) NOT NULL,
	email varchar(254) UNIQUE,
	password varchar(50) NOT NULL,
	PRIMARY KEY (UserID),
	FOREIGN KEY (GroupID) REFERENCES UserGroup (GroupID)
		ON DELETE NO ACTION ON UPDATE CASCADE
);


CREATE TABLE PaymentMethod (
	creditcardcompany varchar(50),
	creditnumber bigint,
	PRIMARY KEY (creditnumber)
);


CREATE TABLE HasPaymentMethod (
	UserID int,
	creditnumber bigint,
	PRIMARY KEY (UserID, creditnumber),
	FOREIGN KEY (UserID) REFERENCES Users (UserID)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (creditnumber) REFERENCES PaymentMethod (creditnumber)
		ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Product (
	pid int IDENTITY,
	pname varchar(50),
	price decimal(9,2),
	catID int,
	picURL varchar(50),
	currentlySelling bit DEFAULT 0,
	PRIMARY KEY (pid), 
	FOREIGN KEY (catID) REFERENCES ProductCategory (catID)
		ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Orders (
	oid int IDENTITY,
	odate datetime,
	sdate datetime,
	address varchar(50),
	city varchar(50),
	province varchar(3),
	postalcode char(7),
	TypeID int,
	creditnumber bigint,
	UserID int,
	TotalAmount decimal(12,2),
	AfterDiscount decimal(12,2),
	PRIMARY KEY (oid),
	FOREIGN KEY (TypeID) REFERENCES ShippingOption (TypeID)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (creditnumber) REFERENCES  PaymentMethod (creditnumber)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (UserID) REFERENCES Users (UserID)
		ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE ProductReview (
	pid int,
	UserID int,
	rating int,
	description varchar(max),
	rDate datetime,
	PRIMARY KEY (pid,UserID),
	FOREIGN KEY (pid) REFERENCES Product (pid)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (UserID) REFERENCES Users (UserID)
		ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Stores (
	wname varchar (50),
	pid int,
	inventory int,
	PRIMARY KEY (wname, pid),
	FOREIGN KEY (wname) REFERENCES Warehouse (wname)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (pid) REFERENCES Product (pid)
		ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE OrderedProduct (
	oid int,
	pid int,
	quantity int,
	price float,
	PRIMARY KEY (oid, pid),
	FOREIGN KEY (oid) REFERENCES Orders (oid)
		ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (pid) REFERENCES Product (pid)
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO ProductCategory VALUES ('Soccer', 'images/Mike Soccer.png');
INSERT INTO ProductCategory VALUES ('Rugby', 'images/Mike Rugby.png');
INSERT INTO ProductCategory VALUES ('Basketball', 'images/Mike Basketball.png');
INSERT INTO ProductCategory VALUES ('Curling', 'images/Mike Curling.png');
INSERT INTO ProductCategory VALUES ('Baseball', 'images/Mike Baseball.png');
INSERT INTO ProductCategory VALUES ('Hockey', 'images/Mike Hockey.png');


INSERT INTO Product VALUES ('Soccer Ball', 10, 1, 'images/soccer ball1.png', 1);
INSERT INTO Product VALUES ('Soccer Cleats', 10, 1, 'images/soccer cleats.jpg', 1);
INSERT INTO Product VALUES ('Soccer Shin Guards', 10, 1, 'images/soccer shin pads.jpg', 1);
INSERT INTO Product VALUES ('Rugby Ball', 10, 2, 'images/rugby ball.jpg', 1);
INSERT INTO Product VALUES ('Rugby Body Armor', 10, 2, 'images/rugby body armor.jpg', 1);
INSERT INTO Product VALUES ('Rugby Helmet', 10, 2, 'images/rugby helmet.jpg', 1);
INSERT INTO Product VALUES ('Basketball', 10, 3, 'images/basketball.jpe', 1);
INSERT INTO Product VALUES ('Basketball Shoes', 10, 3, 'images/basketball shoes.JPG', 1);
INSERT INTO Product VALUES ('Basketball Hoop', 10, 3, 'images/basketball hoop.jpe', 1);
INSERT INTO Product VALUES ('Curling Rock', 10, 4, 'images/curling rock.jpe', 1);
INSERT INTO Product VALUES ('Curling Shoes', 10, 4, 'images/curlingshoes.jpg', 1);
INSERT INTO Product VALUES ('Curling Broom', 10, 4, 'images/curling broom.jpg', 1);
INSERT INTO Product VALUES ('Baseball', 10, 5, 'images/baseball.jpg', 1);
INSERT INTO Product VALUES ('Baseball Glove', 10, 5, 'images/baseball glove.jpg', 1);
INSERT INTO Product VALUES ('Baseball Bat', 10, 5, 'images/baseball bat.png', 1);
INSERT INTO Product VALUES ('Hockey Puck', 10, 6, 'images/hockey puck.jpg', 1);
INSERT INTO Product VALUES ('Hockey Stick', 10, 6, 'images/hockey stick.jpg', 1);
INSERT INTO Product VALUES ('Hockey Skates', 10, 6, 'images/hockey skates.jpg', 1);


INSERT INTO UserGroup VALUES (1, 'Manager');
INSERT INTO UserGroup VALUES (2, 'Customer');


INSERT INTO Warehouse VALUES ('Warehouse A', ' 1234 SomePlaceInTown Street', 'Kelowna', 'BC');
INSERT INTO Warehouse VALUES ('Warehouse B', ' 4321 SomePlaceInPEI Street', 'Charlottetown', 'PEI');


INSERT INTO ShippingOption VALUES (1, 'Moose', 0);
INSERT INTO ShippingOption VALUES (2, 'Goose', 25);
INSERT INTO ShippingOption VALUES (3, 'Canoe/Portage', 50);


INSERT INTO Users VALUES (1, 'Drew', 'Swan', '413431531698043 Quebec Street', 'Vancouver', 'BC', 'V2I Q8S', 'drewswan@drew.swan', 'a');
INSERT INTO Users VALUES (2, 'Swan', 'Drew', '413431531698043 Vancouver Street', 'Quebec City', 'QB', 'Q8S V2I', 'swandrew@swan.drew', 'b');
INSERT INTO Users VALUES (1, 'Akshay', 'Sapra', '4abcd', 'Quebec City', 'QB', 'Q8S V2I', 'ilikegirl@google.ca', 'p');
INSERT INTO Users VALUES (1, 'Kai', 'Neubauer', '1234 My Street', 'Some Place', 'BC', 'V1V 1V7', 'kai@neubauer.ca', 'password');
INSERT INTO Users VALUES (1, 'Akshay', 'Sapra', '4abcd', 'Quebec City', 'QB', 'Q8S V2I', 'ilikegirls@google.ca', 'p');
INSERT INTO Users VALUES (1, 'Akshay', 'Sapra', '4abcd', 'Quebec City', 'QB', 'Q8S V2I', 'ilikegirlss@google.ca', 'p');
INSERT INTO Users VALUES (1, 'Akshay', 'Sapra', '4abcd', 'Quebec City', 'QB', 'Q8S V2I', 'ilikegirlsss@google.ca', 'p');
INSERT INTO Users VALUES (1, 'Akshay', 'Sapra', '4abcd', 'Quebec City', 'QB', 'Q8S V2I', 'ilikegirlssss@google.ca', 'p');
INSERT INTO Users VALUES (1, 'Akshay', 'Sapra', '4abcd', 'Quebec City', 'QB', 'Q8S V2I', 'ilikegirlsssss@google.ca', 'p');
INSERT INTO Users VALUES (1, 'Akshay', 'Sapra', '4abcd', 'Quebec City', 'QB', 'Q8S V2I', 'ilikegirlssssss@google.ca', 'p');


INSERT INTO PaymentMethod VALUES ('Drew''s Super Legit Credit Company', 1234567890);
INSERT INTO PaymentMethod VALUES ('Visa', 5648820384);
INSERT INTO PaymentMethod VALUES ('MasterCard', 5648820383);

INSERT INTO HasPaymentMethod VALUES (1, 1234567890);
INSERT INTO HasPaymentMethod VALUES (4, 5648820384);
INSERT INTO HasPaymentMethod VALUES (2, 5648820383);

INSERT INTO Stores VALUES ('Warehouse A', 1, 67);
INSERT INTO Stores VALUES ('Warehouse A', 2, 123);
INSERT INTO Stores VALUES ('Warehouse A', 3, 45);
INSERT INTO Stores VALUES ('Warehouse A', 4, 345);
INSERT INTO Stores VALUES ('Warehouse A', 5, 567);
INSERT INTO Stores VALUES ('Warehouse A', 6, 32);
INSERT INTO Stores VALUES ('Warehouse A', 7, 67);
INSERT INTO Stores VALUES ('Warehouse A', 8, 123);
INSERT INTO Stores VALUES ('Warehouse A', 9, 45);
INSERT INTO Stores VALUES ('Warehouse A', 10, 67);
INSERT INTO Stores VALUES ('Warehouse A', 11, 123);
INSERT INTO Stores VALUES ('Warehouse A', 12, 45);
INSERT INTO Stores VALUES ('Warehouse A', 13, 345);
INSERT INTO Stores VALUES ('Warehouse A', 14, 567);
INSERT INTO Stores VALUES ('Warehouse A', 15, 32);
INSERT INTO Stores VALUES ('Warehouse A', 16, 67);
INSERT INTO Stores VALUES ('Warehouse A', 17, 123);
INSERT INTO Stores VALUES ('Warehouse A', 18, 45);
INSERT INTO Stores VALUES ('Warehouse B', 1, 67);
INSERT INTO Stores VALUES ('Warehouse B', 2, 123);
INSERT INTO Stores VALUES ('Warehouse B', 3, 45);
INSERT INTO Stores VALUES ('Warehouse B', 4, 345);
INSERT INTO Stores VALUES ('Warehouse B', 5, 567);
INSERT INTO Stores VALUES ('Warehouse B', 6, 32);
INSERT INTO Stores VALUES ('Warehouse B', 7, 67);
INSERT INTO Stores VALUES ('Warehouse B', 8, 123);
INSERT INTO Stores VALUES ('Warehouse B', 9, 45);
INSERT INTO Stores VALUES ('Warehouse B', 10, 67);
INSERT INTO Stores VALUES ('Warehouse B', 11, 123);
INSERT INTO Stores VALUES ('Warehouse B', 12, 45);
INSERT INTO Stores VALUES ('Warehouse B', 13, 345);
INSERT INTO Stores VALUES ('Warehouse B', 14, 567);
INSERT INTO Stores VALUES ('Warehouse B', 15, 32);
INSERT INTO Stores VALUES ('Warehouse B', 16, 67);
INSERT INTO Stores VALUES ('Warehouse B', 17, 123);
INSERT INTO Stores VALUES ('Warehouse B', 18, 45);


INSERT INTO Orders VALUES ('2015-10-04', '2015-10-06', '1234 Fun Street', 'Edmonton', 'AB', 'T6L 4S4', 1, 1234567890, 1, 30, 30);
INSERT INTO Orders VALUES ('2016-11-04', '2015-11-06', '1234 Fun Street', 'Edmonton', 'AB', 'T6L 4S4', 1, 1234567890, 2, 100, 75);

INSERT INTO OrderedProduct VALUES (1, 1, 2, 7.5);
INSERT INTO OrderedProduct VALUES (1, 2, 1, 15.0);
INSERT INTO OrderedProduct VALUES (2, 3, 2, 20.0);
INSERT INTO OrderedProduct VALUES (2, 6, 2, 30.0);

INSERT INTO ProductReview VALUES (9,2,4,'hahahKai SUcks','2015-04-12');
INSERT INTO ProductReview VALUES (8,2,4,'hahahKai SUcks','2015-04-12 05:09:34');
INSERT INTO ProductReview VALUES (7,2,4,'hahahKai SUcks','2015-04-12 05:09:34');
INSERT INTO ProductReview VALUES (6,2,4,'hahahKai SUcks','2015-04-12 05:09:34');
INSERT INTO ProductReview VALUES (5,2,4,'hahahKai SUcks','2015-04-12 05:09:34');
INSERT INTO ProductReview VALUES (4,2,4,'hahahKai SUcks','2015-04-12 05:09:34');
INSERT INTO ProductReview VALUES (3,2,4,'hahahKai SUcks','2015-04-12 05:09:34');
INSERT INTO ProductReview VALUES (2,2,4,'hahahKai SUcks','2015-04-12 05:09:34');
INSERT INTO ProductReview VALUES (1,1,4,'hahahKai SUcks','2015-04-12 05:09:34');
INSERT INTO ProductReview VALUES (1,4,5,'hahahKai SUcks','2015-04-12 05:09:34');
INSERT INTO ProductReview VALUES (1,2,4,'hahahKai SUcks','2015-04-12 05:09:34');


CREATE VIEW Report
AS
SELECT O.oid, odate, sdate, O.UserID, fname, lname, O.province, TotalAmount, AfterDiscount, P.pid, pname, quantity, OP.price
FROM Orders O, OrderedProduct OP, Users U, Product P
WHERE O.oid = OP.oid AND U.UserID = O.UserID AND P.pid = OP.pid;

CREATE VIEW InvView
AS
SELECT A.inventory as Ainventory, B.inventory AS Binventory, (A.inventory + B.inventory) AS TotalInventory, A.pid
FROM (Select inventory, pid FROM Stores WHERE wname = 'Warehouse A') as A, (Select inventory, pid FROM Stores WHERE wname = 'Warehouse B') as B
WHERE A.pid = B.pid;

CREATE TRIGGER newProductTrig
ON Product
FOR INSERT
AS
INSERT INTO Stores (wname, pid, inventory) SELECT 'Warehouse A', pid, 0 FROM inserted
INSERT INTO Stores (wname, pid, inventory) SELECT 'Warehouse B', pid, 0 FROM inserted
GO;

CREATE TRIGGER replaceInvTrig
ON OrderedProduct
AFTER DELETE AS
BEGIN
DECLARE @quantity int, @pid int
SELECT @quantity = d.quantity, @pid = d.pid
FROM deleted d
UPDATE Stores
SET inventory = inventory + @quantity WHERE wname = 'Warehouse A' AND stores.pid = @pid
END;