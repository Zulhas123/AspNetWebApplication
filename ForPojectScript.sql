GO
USE master;

IF DB_ID ('SalesInvoices') IS NOT NULL
DROP DATABASE SalesInvoices;
GO
CREATE DATABASE SalesInvoices
GO


use SalesInvoices;
Go
CREATE TABLE Customers
  (
    CustomerID		INT		IDENTITY PRIMARY KEY,
	
	CustomerName	VARCHAR(50),
	CustomerBIN		VARCHAR(50)
  );
  
   GO
    INSERT INTO Customers VALUES

	( 'Anders','23454365'),
	( 'Maria','65756432'),
	('Trujillo','87965498'),
	('Ana', '45327612'),
	( 'Moreno','65789043'),
	('Momen','43215645'),
	( 'Antonio','76898765'),
	( 'Hardy','54565654'),
	('Thomas','78767656'),
	('Berglund','99887655'),
	('Christina','88776699'),
	( 'Moos','23232455'),
	('Han','55445467'),
	('Citeaux','89878770'),
	('Fred','99877654');
	

	Go
	
	CREATE TABLE Vehicles
  (
    VehicleId INT  IDENTITY PRIMARY KEY,
	CustomerID       INT REFERENCES Customers(CustomerID),
	VehicleName		VARCHAR(100),
	UnitPrice		MONEY,
	MadeYear     Date,
	ImageUrl     varchar(500)
  );

GO
insert into Vehicles values
(1,'X_8888', 700000,'2019-01-02','~/Image/Car1.jpg'),
(3,'R_9999', 600000,'2019-01-05','~/Image/Car2.jpg'),
(5,'XZZ_7788', 200000,'2018-01-05','~/Image/Car3.jpg'),
(7,'XKK_8888', 800000,'2019-05-06','~/Image/Car4.jpg'),
(9,'WWM_8888', 300000,'2014-01-05','~/Image/Car5.jpg'),
(4,'X_0088', 800000,'2017-07-05','~/Image/Car6.jpg'),
(10,'X_8999', 100000,'2014-01-08','~/Image/Car2.jpg'),
(2,'PP_8999', 7700000,'2014-01-08','~/Image/Car5.jpg'),
(6,'MMM_8999', 550000,'2013-01-08','~/Image/Car3.jpg'),
(8,'UYT_8999', 990000,'2012-01-08','~/Image/Car2.jpg');

Go




CREATE TABLE OrderDetails
  (
   --OrderDetailsID INT IDENTITY PRIMARY KEY,
   
   VehicleId INT REFERENCES Vehicles(VehicleID),
   CustomerID INT REFERENCES Customers(CustomerID),
   QTY		INT,
  TotalPrice	money,
   primary key ( VehicleID ,CustomerID)
  );


  Go
  insert into OrderDetails values
 (1,1,3,7000000), (2,3,5,7000000),
(3,5,7,8000000),
(4,7,6,5000000),
(5,9,3,3000000),
(6,4,9,9000000),
(7,10,2,6000000);

Go

CREATE TABLE UserIdentity
  (
    ID		INT		IDENTITY PRIMARY KEY,	
	userName	VARCHAR(50),
	Password		VARCHAR(50)
  );


  go

      INSERT INTO UserIdentity VALUES

	( 'user','user');

select * from Vehicles;

