DROP DATABASE IF EXISTS dealership;
CREATE DATABASE IF NOT EXISTS dealership;
USE dealership;
 -- create tables for data
CREATE TABLE DEALERSHIPS(
dealership_id int auto_increment primary key,
name varchar(50),
address varchar(50),
phone varchar(12)
);
CREATE TABLE Vehicles(
vin int primary key,
sold boolean,
make varchar(20),
model varchar(20),
color varchar(20),
vehicleYear int,
odometer int,
price int
);
CREATE TABLE Inventory(
    dealership_id int,
    vin int,
    PRIMARY KEY(dealership_id, vin),
	FOREIGN KEY(vin) REFERENCES VEHICLES(vin),
	FOREIGN KEY(dealership_id) REFERENCES DEALERSHIPS(dealership_id)
);

CREATE TABLE Sales_Contracts(
    sale_id int auto_increment primary key,
    vin int,
    FOREIGN KEY(vin) REFERENCES VEHICLES(vin)
);

CREATE TABLE Lease_Contracts(
    lease_id int auto_increment primary key,
    vin int,
    FOREIGN KEY(vin) REFERENCES VEHICLES(vin)
);

INSERT INTO DEALERSHIPS (NAME, ADDRESS, PHONE) VALUES
('D & B Used Cars', '1207 N caldwell st', '555-5555'),
('Beaches Honda',' 1999 Beach Blvd', '888-988-1234'),
('Mecklenburg Ford', '12184 mantle dr', '888-555-0100');

INSERT INTO VEHICLES (vin, vehicleYear, make, model, color, odometer, price, sold) VALUES
(10112,1993,'Ford','Explorer','Red',525123,995.00, false),
(49011,2012,'Honda','Civic','Gray',03221,6995.00, true),
(10223,2017,'Ford','Escape','Blue',106500,10500.00, false),
(35678,2021,'Honda','CR-V','Gray',40100,24999.00, false)
;

INSERT INTO INVENTORY (dealership_id, vin) VALUES
(1,10112),
(2,49011),
(2,35678),
(3,10223);
INSERT INTO SALES_CONTRACTS (vin) VALUES
(49011);

-- Insert seed data into LEASE_CONTRACTS
INSERT INTO lease_contracts (vin) VALUES
(35678);