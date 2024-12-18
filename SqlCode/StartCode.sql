DROP DATABASE IF EXISTS TRANSIT;
CREATE DATABASE TRANSIT; 
USE TRANSIT;

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(
    EmployeeID INT PRIMARY KEY,
    FName VARCHAR(20) NOT NULL,
    LName VARCHAR(20) NOT NULL,
    Address VARCHAR(125) NOT NULL,
    Salary VARCHAR(20) NOT NULL
);

INSERT INTO Employee (EmployeeID, FName, LName, Address, Salary) VALUES
    (1, 'Doug', 'Nolan', '123 Main St', '50000'),
    (2, 'Abdulrahman', 'Abduljabar', '456 Oak St', '100'),
    (3, 'Bob', 'Johnson', '789 Pine St', '55000'),
    (4, 'Alice', 'Williams', '987 Maple St', '65000'),
    (5, 'Charlie', 'Brown', '654 Birch St', '70000'),
    (6, 'Eva', 'Miller', '321 Cedar St', '60000'),
    (7, 'Frank', 'Davis', '876 Pine St', '55000'),
    (8, 'Grace', 'Lee', '234 Elm St', '75000'),
    (9, 'Harry', 'Wilson', '567 Oak St', '80000'),
    (10, 'Ivy', 'Johnson', '890 Maple St', '70000'),
    (11, 'Jack', 'Moore', '432 Cedar St', '60000'),
    (12, 'Karen', 'Clark', '765 Pine St', '55000'),
    (13, 'Leo', 'Hall', '987 Birch St', '60000'),
    (14, 'Mia', 'Anderson', '321 Elm St', '65000'),
    (15, 'Nathan', 'Garcia', '654 Oak St', '70000'),
    (16, 'Olivia', 'Turner', '876 Cedar St', '75000'),
    (17, 'Paul', 'Parker', '234 Pine St', '55000'),
    (18, 'Quinn', 'Carter', '567 Maple St', '60000'),
    (19, 'Riley', 'Evans', '890 Elm St', '70000'),
    (20, 'Sam', 'White', '432 Birch St', '80000'),
    (21, 'Taylor', 'Hughes', '765 Oak St', '65000'),
    (22, 'Uma', 'Lopez', '987 Cedar St', '70000'),
    (23, 'Victor', 'Fisher', '321 Pine St', '55000'),
    (24, 'Wendy', 'Baker', '654 Maple St', '60000'),
    (25, 'Xavier', 'Ward', '876 Elm St', '75000'),
    (26, 'Yara', 'Adams', '234 Birch St', '60000'),
    (27, 'Zane', 'Morris', '567 Cedar St', '55000'),
    (28, 'Emma', 'Bell', '890 Pine St', '70000'),
    (29, 'Dylan', 'Cooper', '432 Maple St', '80000'),
    (30, 'Ava', 'Stewart', '765 Elm St', '65000'),
    (31, 'Logan', 'Lopez', '987 Birch St', '60000'),
    (32, 'Sophia', 'Fisher', '321 Elm St', '65000'),
    (33, 'Mason', 'Baker', '654 Oak St', '70000'),
    (34, 'Isabella', 'Ward', '876 Cedar St', '75000'),
    (35, 'Jackson', 'Adams', '234 Pine St', '55000'),
    (36, 'Ella', 'Morris', '567 Maple St', '60000'),
    (37, 'Liam', 'Bell', '890 Elm St', '70000'),
    (38, 'Aria', 'Cooper', '432 Birch St', '80000'),
    (39, 'Noah', 'Stewart', '765 Cedar St', '65000'),
    (40, 'Avery', 'Lopez', '987 Pine St', '60000'),
    (41, 'Elijah', 'Fisher', '321 Maple St', '65000'),
    (42, 'Grace', 'Baker', '654 Elm St', '70000'),
    (43, 'Lily', 'Ward', '876 Oak St', '75000'),
    (44, 'Carter', 'Adams', '234 Cedar St', '55000'),
    (45, 'Hazel', 'Morris', '567 Pine St', '60000'),
    (46, 'Oliver', 'Bell', '890 Maple St', '70000'),
    (47, 'Charlotte', 'Cooper', '432 Elm St', '80000'),
    (48, 'Lucas', 'Stewart', '765 Birch St', '65000'),
    (49, 'Luna', 'Lopez', '987 Oak St', '60000'),
    (50, 'Ethan', 'Fisher', '321 Cedar St', '65000');

DROP TABLE IF EXISTS Manager;
CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    NumberOfEmployers INT,
    FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);

INSERT INTO Manager (ManagerID, NumberOfEmployers) VALUES
    (1, 9),  -- ManagerID 1 manages 9 employees
    (5, 7),   -- ManagerID 5 manages 7 employees
    (12, 5),  -- ManagerID 12 manages 5 employees
    (20, 11), -- ManagerID 20 manages 11 employees
    (35, 13); -- ManagerID 35 manages 13 employees

DROP TABLE IF EXISTS Driver;
CREATE TABLE Driver (
    DriverID INT PRIMARY KEY,
    License VARCHAR(10) NOT NULL,
    ManagerID INT NOT NULL,
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID),
    FOREIGN KEY (DriverID) REFERENCES Employee(EmployeeID)
);

INSERT INTO Driver (DriverID, License, ManagerID) VALUES
    (2, 'DEF456', 1),
    (3, 'GHI789', 1),
    (4, 'JKL012', 1),
    (6, 'PQR678', 1),
    (7, 'STU901', 1),
    (8, 'VWX234', 1),
    (9, 'YZA678', 1),
    (10, 'BCD345', 1),
    (11, 'EFG678', 1),
    (13, 'HIJ012', 5),
    (14, 'KLM345', 5),
    (15, 'NOP678', 5),
    (16, 'QRS012', 5),
    (17, 'TUV345', 5),
    (18, 'WXY678', 5),
    (19, 'ZAB012', 5),
    (21, 'CDE345',12),
    (22, 'FGH678', 12),
    (23, 'IJK012', 12),
    (24, 'LMN345', 12),
    (25, 'OPQ678', 12),
    (26, 'RST012', 20),
    (27, 'UVW345', 20),
    (28, 'XYZ678', 20),
    (29, 'ABC012', 20),
    (30, 'DEF345', 20),
    (31, 'GHI678', 20),
    (32, 'SFC471', 20),
    (33, 'MNO345', 20),
    (34, 'PQR678', 20),
    (36, 'STU901', 20),
    (37, 'VWX234', 20),
    (38, 'YZA678', 35),
    (39, 'BCD345', 35),
    (40, 'EFG678', 35),
    (41, 'HIJ012', 35),
    (42, 'KLM345', 35),
    (43, 'NOP678', 35),
    (44, 'QRS012', 35),
    (45, 'TUV345', 35),
    (46, 'WXY678', 35),
    (47, 'ZAB012', 35),
    (48, 'CDE345', 35),
    (49, 'FGH678', 35),
    (50, 'IJK012', 35);	

DROP TABLE IF EXISTS Facility;
CREATE TABLE Facility(
    F_Name VARCHAR(15) PRIMARY KEY
);

INSERT INTO Facility (F_Name) VALUES
    ('Bus Garage NW'),
    ('Bus Garage SW'),
    ('Bus Garage SE'),
    ('Bus Garage NE');

INSERT INTO Facility (F_Name) VALUES
    ('Train Depot'),
    ('Train Yard');

DROP TABLE IF EXISTS Vehicle;
CREATE TABLE Vehicle (
	VehicleID INT PRIMARY KEY,
	Model VARCHAR(20) NOT NULL,
	Year YEAR,
	UseFlag BOOLEAN NOT NULL,
	F_Name VARCHAR(15),
	FOREIGN KEY (F_Name) REFERENCES Facility (F_Name)
);

INSERT INTO Vehicle (VehicleID, Model, Year, UseFlag, F_Name) VALUES
    (1, 'xd60', 2007, TRUE, 'Bus Garage NE'),
    (2, 'd60lfr', 2008, TRUE, 'Bus Garage NW'),
    (3, 'd40lf', 2009, TRUE, 'Bus Garage SE'),
    (4, 'lfs4102', 2010, TRUE, 'Bus Garage SW'),
    (5, 'xd60', 2011, TRUE, 'Bus Garage NE'),
    (6, 'd60lfr', 2012, TRUE, 'Bus Garage NW'),
    (7, 'd40lf', 2013, TRUE, 'Bus Garage SE'),
    (8, 'lfs4102', 2014, TRUE, 'Bus Garage SW'),
    (9, 'xd60', 2015, TRUE, 'Bus Garage NE'),
    (10, 'd60lfr', 2016, TRUE, 'Bus Garage NW'),
    (11, 'd40lf', 2017, TRUE, 'Bus Garage SE'),
    (12, 'lfs4102', 2018, TRUE, 'Bus Garage SW'),
    (13, 'xd60', 2019, TRUE, 'Bus Garage NE'),
    (14, 'd60lfr', 2020, TRUE, 'Bus Garage NW'),
    (15, 'd40lf', 2021, TRUE, 'Bus Garage SE'),
    (16, 'lfs4102', 2022, TRUE, 'Bus Garage SW'),
    (17, 'xd60', 2023, TRUE, 'Bus Garage NE'),
    (18, 'd60lfr', 2007, TRUE, 'Bus Garage NW'),
    (19, 'd40lf', 2008, TRUE, 'Bus Garage SE'),
    (20, 'lfs4102', 2009, TRUE, 'Bus Garage SW'),
    (21, 'xd60', 2010, TRUE, 'Bus Garage NE'),
    (22, 'd60lfr', 2011, TRUE, 'Bus Garage NW'),
    (23, 'd40lf', 2012, TRUE, 'Bus Garage SE'),
    (24, 'lfs4102', 2013, TRUE, 'Bus Garage SW'),
    (25, 'xd60', 2014, TRUE, 'Bus Garage NE');

INSERT INTO Vehicle (VehicleID, Model, Year, UseFlag, F_Name) VALUES
    (26, 'sd160', 2007, TRUE, 'Train Depot'),
    (27, 's200', 2008, TRUE, 'Train Depot'),
    (28, 'u2', 2009, TRUE, 'Train Yard'),
    (29, 'u2-ac', 2010, TRUE, 'Train Yard'),
    (30, 'sd160', 2011, TRUE, 'Train Depot'),
    (31, 's200', 2012, TRUE, 'Train Depot'),
    (32, 'u2', 2013, TRUE, 'Train Yard'),
    (33, 'u2-ac', 2014, TRUE, 'Train Yard'),
    (34, 'sd160', 2015, TRUE, 'Train Depot'),
    (35, 's200', 2016, TRUE, 'Train Depot'),
    (36, 'u2', 2017, TRUE, 'Train Yard'),
    (37, 'u2-ac', 2018, TRUE, 'Train Yard'),
    (38, 'sd160', 2019, TRUE, 'Train Depot'),
    (39, 's200', 2020, TRUE, 'Train Depot'),
    (40, 'u2', 2021, TRUE, 'Train Yard');

DROP TABLE IF EXISTS Train;
CREATE TABLE Train (
    VID INT PRIMARY KEY,
    no_of_Cars INT NOT NULL,
    FOREIGN KEY (VID) REFERENCES Vehicle (VehicleID)
);

INSERT INTO Train(VID, no_of_cars) VALUES
    (26, 3),
    (27, 5),
    (28, 1),
    (29, 2),
    (30, 5),
    (31, 4),
    (32, 3),
    (33, 4),
    (34, 2),
    (35, 2),
    (36, 3),
    (37, 3),
    (38, 3),
    (39, 4),
    (40, 3);

DROP TABLE IF EXISTS Bus;
CREATE TABLE Bus (
	VID INT PRIMARY KEY,
	Type VARCHAR(20),
	FOREIGN KEY (VID) REFERENCES Vehicle (VehicleID)
);

INSERT INTO Bus(VID, Type) VALUES
    (1, 'short'),
    (2, 'extension'),
    (3, 'reg'),
    (4, 'extension'),
    (5, 'reg'),
    (6, 'short'),
    (7, 'reg'),
    (8, 'short'),
    (9, 'extension'),
    (10, 'short'),
    (11, 'reg'),
    (12, 'reg'),
    (13, 'extenstion'),
    (14, 'short'),
    (15, 'reg'),
    (16, 'extenstion'),
    (17, 'reg'),
    (18, 'reg'),
    (19, 'short'),
    (20, 'extenstion'),
    (21, 'short'),
    (22, 'reg'),
    (23, 'short'),
    (24, 'extenstion'),
    (25, 'short');

DROP TABLE IF EXISTS Route;
CREATE TABLE Route (
    RouteName VARCHAR(50) PRIMARY KEY,
    RouteNameLong VARCHAR(50)
);

INSERT INTO Route(RouteName, RouteNameLong) VALUES
    ('59', 'Savanna'),
    ('61', 'Martindale'),
    ('85', 'Martin Crossing'),
    ('55', 'Falconridge'),
    ('43', 'McKnight - Westwinds Station/Chinook Station'),
    ('866', 'All Saints High/Cranston'),
    ('58', 'Erin Woods/44 St SE'),
    ('87', 'Applewood/17 Av SE'),
    ('135', 'Erin Woods/36 St SE'),
    ('869', 'All Saints High/ Somerset Bridlewood LRT'),
    ('149', 'Point Trotter Industrial'),
    ('779', 'WiseWood/Riverbend'),
    ('848', 'Lady of the Rockies / New Brighton'),
    ('718', 'Beaverbrook/Douglasdale'),
    ('877', 'Father James Whelihan/Walden'),
    ('147', 'Starfield Industrial'),
    ('300', 'BRT Airport/City Centre'),
    ('835', 'St Bonaventure / Anderson'),
    ('821', 'Bishop OByrne/McKenzie/Mountain Park'),
    ('719', 'Beaverbrook/McKenzie'),
    ('106', 'Southland/Deerfoot Meadows'),
    ('746', 'Crescent Heights/ Coventry Hills'),
    ('20', 'Heritage Station/Northmount Dr N'),
    ('440', 'Chateau Estates/Franklin Station'),
    ('845', 'Msgr J S Smith School/ Mahogany');

DROP TABLE IF EXISTS Line;
CREATE TABLE Line (
	LineName VARCHAR(50) PRIMARY KEY
);

INSERT INTO Line (LineName) VALUES
	('Blue'),
	('Red');

DROP TABLE IF EXISTS Station;
CREATE TABLE Station(
	StationID INT PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	End BOOLEAN,
	FreeFare BOOLEAN,
	LineName  VARCHAR(50)
);

INSERT INTO Station(StationID, Name, End, FreeFare, LineName) VALUES
	('1', 'Tuscany', TRUE, FALSE, 'RED'),
	('2', 'Crowfoot', FALSE, FALSE, 'RED'),
	('3', 'Dalhousie', FALSE, FALSE, 'RED'),
	('4', 'Brentwood', FALSE, FALSE, 'RED'),
	('5', 'University', FALSE, FALSE, 'RED'),
	('6', 'Banff Trail', FALSE, FALSE, 'RED'),
	('7', 'Lions Park', FALSE, FALSE, 'RED'),
	('8', 'SAIT', FALSE, FALSE, 'RED'),
	('9', '7 Street', FALSE, TRUE, 'RED'),
	('10', '4 Street', FALSE, TRUE, 'RED'),
	('11', '1 Street', FALSE, TRUE, 'RED'),
	('12', 'City Hall', FALSE, TRUE, 'RED'),
	('13', '8 Street', FALSE, TRUE, 'RED'),
	('14', '6 Street', FALSE, TRUE, 'RED'),
	('15', '3 Street', FALSE, TRUE, 'RED'),
	('16', 'Centre Street', FALSE, TRUE, 'RED'),
	('17', 'Victoria Park', FALSE, FALSE, 'RED'),
	('18', 'Erlton', FALSE, FALSE, 'RED'),
	('19', '39 Avenue', FALSE, FALSE, 'RED'),
	('20', 'Chinook', FALSE, FALSE, 'RED'),
	('21', 'Heritage', FALSE, FALSE, 'RED'),
	('22', 'Southland', FALSE, FALSE, 'RED'),
	('23', 'Anderson', FALSE, FALSE, 'RED'),
	('24', 'Canyon Meadows', FALSE, FALSE, 'RED'),
	('25', 'Fish Creer-Lacombe', FALSE, FALSE, 'RED'),
	('26', 'Shawnessy', FALSE, FALSE, 'RED'),
	('27', 'Somerset-Bridlewood', TRUE, FALSE, 'RED'),
	('28', '69 Street', TRUE, FALSE, 'BLUE'),
	('29', 'Sirocco', FALSE, FALSE, 'BLUE'),
	('30', '45 Street', FALSE, FALSE, 'BLUE'),
	('31', 'Westbrook', FALSE,FALSE, 'BLUE'),
	('32', 'Shaganappi Point', FALSE, FALSE, 'BLUE'),
	('33', 'Sunalta', FALSE, FALSE, 'BLUE'),
	('34', 'Downtown West', FALSE, FALSE, 'BLUE'),
	('35', '7 Street', FALSE, TRUE, 'BLUE'),
	('36', '4 Street', FALSE, TRUE, 'BLUE'),
	('37', '1 Street', FALSE, TRUE, 'BLUE'),
	('38', 'City Hall', FALSE, TRUE, 'BLUE'),
	('39', '8 Street', FALSE, TRUE, 'BLUE'),
	('40', '6 Street', FALSE, TRUE, 'BLUE'),
	('41', '3 Street', FALSE, TRUE, 'BLUE'),
	('42', 'Centre Street', FALSE, TRUE, 'BLUE'),
	('43', 'Bridgeland', FALSE, FALSE, 'BLUE'),
	('44', 'Zoo', FALSE, FALSE, 'BLUE'),
	('45', 'Barlow', FALSE, FALSE, 'BLUE'),
	('46', 'Franklin', FALSE, FALSE, 'BLUE'),
	('47', 'Marlborough', FALSE, FALSE, 'BLUE'),
	('48', 'Rundle', FALSE, FALSE, 'BLUE'),
	('49', 'Whitehorn', FALSE, FALSE, 'BLUE'),
	('50', 'McKinght-Westwinds', FALSE, FALSE, 'BLUE'),
	('51', 'Martindale', FALSE, FALSE, 'BLUE'),
	('52', 'Saddletowne', TRUE, FALSE, 'BLUE');

DROP TABLE IF EXISTS Stop;
CREATE TABLE Stop(
    StopID INT PRIMARY KEY,
	Start BOOLEAN NOT NULL,
	StationID INT,
	FOREIGN KEY(StationID) REFERENCES STATION(StationID)
);

INSERT INTO Stop (StopID, Start, StationID) VALUES
    (1, TRUE, NULL),
    (2, FALSE, NULL),
    (3, TRUE, NULL),
    (4, FALSE, NULL),
    (5, TRUE, NULL),
    (6, FALSE, NULL),
    (7, TRUE, NULL),
    (8, FALSE, NULL),
    (9, TRUE, NULL),
    (10, FALSE, NULL),
    (11, TRUE, 1),   -- Tuscany
    (12, FALSE, 2),  -- Crowfoot
    (13, TRUE, 3),   -- Dalhousie
    (14, FALSE, 4),  -- Brentwood
    (15, TRUE, 5),   -- University
    (16, FALSE, 6),  -- Banff Trail
    (17, TRUE, 7),   -- Lions Park
    (18, FALSE, 8),  -- SAIT
    (19, TRUE, 9),   -- 7 Street
    (20, FALSE, 10), -- 4 Street
    (21, TRUE, NULL),
    (22, FALSE, NULL),
    (23, TRUE, NULL),
    (24, FALSE, NULL),
    (25, TRUE, 27),  -- Somerset-Bridlewood
    (26, FALSE, 28), -- 69 Street
    (27, TRUE, 29),  -- Sirocco
    (28, FALSE, 30), -- 45 Street
    (29, TRUE, 31),  -- Westbrook
    (30, FALSE, 32), -- Shaganappi Point
    (31, TRUE, 33),  -- Sunalta
    (32, FALSE, 34), -- Downtown West
    (33, TRUE, NULL),
    (34, FALSE, NULL),
    (35, TRUE, NULL),
    (36, FALSE, NULL),
    (37, TRUE, NULL),
    (38, FALSE, NULL),
    (39, TRUE, NULL),
    (40, FALSE, NULL),
    (41, TRUE, 43),  -- Bridgeland
    (42, FALSE, 44), -- Zoo
    (43, TRUE, 45),  -- Barlow
    (44, FALSE, 46), -- Franklin
    (45, TRUE, 47),  -- Marlborough
    (46, FALSE, 48), -- Rundle
    (47, TRUE, 49),  -- Whitehorn
    (48, FALSE, 50), -- McKinght-Westwinds
    (49, TRUE, 51),  -- Martindale
    (50, FALSE, 52); -- Saddletowne

DROP TABLE IF EXISTS Schedule;
CREATE TABLE Schedule(
	ManagerID INT NOT NULL,
	DriverID INT NOT NULL,
	VID INT NOT NULL,
	RouteName VARCHAR(50),
	LineName VARCHAR(50) ,
	Date DATE,
    startTime TIME,
    endTime TIME,
    PRIMARY KEY(ManagerID, DriverID, Date),
	FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID),
	FOREIGN KEY (DriverID) REFERENCES Driver (DriverID),
	FOREIGN KEY (VID) REFERENCES Vehicle (VehicleID)
);

INSERT INTO Schedule (ManagerID, DriverID, VID, RouteName, LineName, Date, startTime, endTime) VALUES
    (1, 2, 25, '59', NULL, '2023-12-01', '08:00:00', '10:00:00'),
    (1, 3, 24, '61', NULL, '2023-12-01', '09:00:00', '11:00:00'),
    (1, 4, 23, '85', NULL, '2023-12-01', '10:00:00', '12:00:00'),
    (1, 6, 22, '55', NULL, '2023-12-01', '11:00:00', '13:00:00'),
    (1, 7, 21, '43', NULL, '2023-12-01', '12:00:00', '14:00:00'),
    (1, 8, 20, '866', NULL, '2023-12-01', '13:00:00', '15:00:00'),
    (1, 9, 19, '58', NULL, '2023-12-01', '14:00:00', '16:00:00'),
    (1, 10, 18, '87', NULL, '2023-12-01', '15:00:00', '17:00:00'),
    (1, 11, 17, '135', NULL, '2023-12-01', '16:00:00', '18:00:00'),
    (5, 13, 16, '869', NULL, '2023-12-01', '17:00:00', '19:00:00'),
    (5, 14, 15, '149', NULL, '2023-12-01', '18:00:00', '20:00:00'),
    (5, 15, 14, '779', NULL, '2023-12-01', '19:00:00', '21:00:00'),
    (5, 16, 13, '848', NULL, '2023-12-01', '20:00:00', '22:00:00'),
    (5, 17, 12, '718', NULL, '2023-12-01', '21:00:00', '23:00:00'),
    (5, 18, 11, '877', NULL, '2023-12-01', '22:00:00', '00:00:00'),
    (5, 19, 10, '147', NULL, '2023-12-01', '23:00:00', '01:00:00'),
    (12, 21, 9, '300', NULL, '2023-12-01', '00:00:00', '02:00:00'),
    (12, 22, 8, '835', NULL, '2023-12-01', '01:00:00', '03:00:00'),
    (12, 23, 7, '821', NULL, '2023-12-01', '02:00:00', '04:00:00'),
    (12, 24, 6, '719', NULL, '2023-12-01', '03:00:00', '05:00:00'),
    (12, 25, 5, '106', NULL, '2023-12-01', '04:00:00', '06:00:00'),
    (20, 26, 4, '746', NULL, '2023-12-01', '05:00:00', '07:00:00'),
    (20, 27, 3, '20', NULL, '2023-12-01', '06:00:00', '08:00:00'),
    (20, 28, 2, '440', NULL, '2023-12-01', '07:00:00', '09:00:00'),
    (20, 29, 1, '845', NULL, '2023-12-01', '08:00:00', '10:00:00'),
    (20, 30, 1, '59', NULL, '2023-12-02', '09:00:00', '11:00:00'),
    (20, 31, 2, '61', NULL, '2023-12-02', '10:00:00', '12:00:00'),
    (20, 32, 3, '85', NULL, '2023-12-02', '11:00:00', '13:00:00'),
    (20, 33, 4, '55', NULL, '2023-12-02', '12:00:00', '14:00:00'),
    (20, 34, 5, '43', NULL, '2023-12-02', '13:00:00', '15:00:00'),
    (20, 36, 6, '866', NULL, '2023-12-02', '14:00:00', '16:00:00'),
    (20, 37, 7, '58', NULL, '2023-12-02', '15:00:00', '17:00:00'),
    (35, 38, 8, '87', NULL, '2023-12-02', '16:00:00', '18:00:00'),
    (35, 39, 9, '135', NULL, '2023-12-02', '17:00:00', '19:00:00'),
    (35, 40, 10, '869', NULL, '2023-12-02', '18:00:00', '20:00:00'),
    (35, 41, 11, '149', NULL, '2023-12-02', '19:00:00', '21:00:00'),
    (35, 42, 12, '779', NULL, '2023-12-02', '20:00:00', '22:00:00'),
    (35, 43, 13, '848', NULL, '2023-12-02', '21:00:00', '23:00:00'),
    (35, 44, 14, '718', NULL, '2023-12-02', '22:00:00', '00:00:00'),
    (35, 45, 15, '877', NULL, '2023-12-02', '23:00:00', '01:00:00'),
    (35, 46, 16, '147', NULL, '2023-12-02', '00:00:00', '02:00:00'),
    (35, 47, 17, '300', NULL, '2023-12-02', '01:00:00', '03:00:00'),
    (35, 48, 18, '835', NULL, '2023-12-02', '02:00:00', '04:00:00'),
    (35, 49, 19, '821', NULL, '2023-12-02', '03:00:00', '05:00:00'),
    (35, 50, 20, '719', NULL, '2023-12-02', '04:00:00', '06:00:00'),
    (1, 2, 21, '106', NULL, '2023-12-02', '05:00:00', '07:00:00'),
    (1, 3, 22, '746', NULL, '2023-12-02', '06:00:00', '08:00:00'),
    (1, 4, 23, '20', NULL, '2023-12-02', '07:00:00', '09:00:00'),
    (1, 6, 24, '440', NULL, '2023-12-02', '08:00:00', '10:00:00'),
    (1, 7, 25, '845', NULL, '2023-12-02', '09:00:00', '11:00:00'),
    (1, 8, 25, '59', NULL, '2023-12-03', '10:00:00', '12:00:00'),
    (1, 9, 24, '61', NULL, '2023-12-03', '11:00:00', '13:00:00'),
    (1, 10, 23, '85', NULL, '2023-12-03', '12:00:00', '14:00:00'),
    (1, 11, 22, '55', NULL, '2023-12-03', '13:00:00', '15:00:00'),
    (1, 13, 21, '43', NULL, '2023-12-03', '14:00:00', '16:00:00'),
    (1, 14, 20, '866', NULL, '2023-12-03', '15:00:00', '17:00:00'),
    (1, 15, 19, '58', NULL, '2023-12-03', '16:00:00', '18:00:00'),
    (1, 16, 18, '87', NULL, '2023-12-03', '17:00:00', '19:00:00'),
    (1, 17, 17, '135', NULL, '2023-12-03', '18:00:00', '20:00:00'),
    (1, 18, 16, '869', NULL, '2023-12-03', '19:00:00', '21:00:00'),
    (1, 19, 15, '149', NULL, '2023-12-03', '20:00:00', '22:00:00'),
    (1, 21, 14, '779', NULL, '2023-12-03', '21:00:00', '23:00:00'),
    (1, 22, 13, '848', NULL, '2023-12-03', '22:00:00', '00:00:00'),
    (1, 23, 12, '718', NULL, '2023-12-03', '23:00:00', '01:00:00'),
    (1, 24, 11, '877', NULL, '2023-12-03', '00:00:00', '02:00:00'),
    (1, 25, 10, '147', NULL, '2023-12-03', '01:00:00', '03:00:00'),
    (1, 26, 9, '300', NULL, '2023-12-03', '02:00:00', '04:00:00'),
    (1, 27, 8, '835', NULL, '2023-12-03', '03:00:00', '05:00:00'),
    (1, 28, 7, '821', NULL, '2023-12-03', '04:00:00', '06:00:00'),
    (1, 29, 6, '719', NULL, '2023-12-03', '05:00:00', '07:00:00'),
    (1, 30, 5, '106', NULL, '2023-12-03', '06:00:00', '08:00:00'),
    (1, 36, 4, '746', NULL, '2023-12-03', '07:00:00', '09:00:00'),
    (1, 37, 3, '20', NULL, '2023-12-03', '08:00:00', '10:00:00'),
    (1, 38, 2, '440', NULL, '2023-12-03', '09:00:00', '11:00:00'),
    (1, 39, 1, '845', NULL, '2023-12-03', '10:00:00', '12:00:00'),
    (1, 30, 26, NULL, 'Red', '2023-12-01', '11:00:00', '13:00:00'),
    (1, 31, 27, NULL, 'Blue', '2023-12-01', '12:00:00', '14:00:00'),
    (1, 9, 28, NULL, 'Red', '2023-12-02', '13:00:00', '15:00:00'),
    (1, 10, 29, NULL, 'Blue', '2023-12-02', '14:00:00', '16:00:00'),
    (1, 40, 30, NULL, 'Red', '2023-12-03', '15:00:00', '17:00:00'),
    (1, 41, 31, NULL, 'Blue', '2023-12-03', '16:00:00', '18:00:00');

DROP TABLE IF EXISTS HasRouteStop;
CREATE TABLE HasRouteStop(
    RouteName VARCHAR(50) NOT NULL,
    StopID INT NOT NULL,
    FOREIGN KEY (RouteName) REFERENCES Route(RouteName),
    FOREIGN KEY (StopID) REFERENCES Stop(StopID),
    UNIQUE (RouteName, StopID)
);

INSERT INTO HasRouteStop (RouteName, StopID) VALUES
    ('59', 1), ('59', 2), ('59', 3), ('59', 4), ('59', 5), ('59', 6),
    ('61', 7), ('61', 8), ('61', 9), ('61', 10), ('61', 11), ('61', 12),
    ('85', 13), ('85', 14), ('85', 15), ('85', 16), ('85', 17), ('85', 18),
    ('55', 19), ('55', 20), ('55', 21), ('55', 22), ('55', 23), ('55', 24),
    ('43', 25), ('43', 26), ('43', 27), ('43', 28), ('43', 29), ('43', 30),
    ('866', 31), ('866', 32), ('866', 33), ('866', 34), ('866', 35), ('866', 36),
    ('58', 37), ('58', 38), ('58', 39), ('58', 40), ('58', 41), ('58', 42),
    ('87', 43), ('87', 44), ('87', 45), ('87', 46), ('87', 47), ('87', 48),
    ('135', 49), ('135', 50),
    ('869', 1), ('869', 2), ('869', 3), ('869', 4), ('869', 25), ('869', 26),
    ('149', 7), ('149', 8), ('149', 9), ('149', 10), ('149', 11), ('149', 12),
    ('779', 13), ('779', 14), ('779', 15), ('779', 16), ('779', 17), ('779', 18),
    ('848', 19), ('848', 20), ('848', 21), ('848', 22), ('848', 23), ('848', 24),
    ('718', 31), ('718', 32), ('718', 33), ('718', 34), ('718', 35), ('718', 36),
    ('877', 37), ('877', 38), ('877', 39), ('877', 40), ('877', 41), ('877', 42),
    ('147', 43), ('147', 44), ('147', 45), ('147', 46), ('147', 47), ('147', 48),
    ('300', 49), ('300', 50),
    ('835', 1), ('835', 2), ('835', 3), ('835', 4), ('835', 25), ('835', 26),
    ('821', 7), ('821', 8), ('821', 9), ('821', 10), ('821', 11), ('821', 12),
    ('719', 13), ('719', 14), ('719', 15), ('719', 16), ('719', 17), ('719', 18),
    ('106', 19), ('106', 20), ('106', 21), ('106', 22), ('106', 23), ('106', 24),
    ('746', 31), ('746', 32), ('746', 33), ('746', 34), ('746', 35), ('746', 36),
    ('20', 37), ('20', 38), ('20', 39), ('20', 40), ('20', 41), ('20', 42),
    ('440', 43), ('440', 44), ('440', 45), ('440', 46), ('440', 47), ('440', 48),
    ('845', 49), ('845', 50);
    
    -- Drop the table if it already exists
DROP TABLE IF EXISTS Account;

-- Create the Account table
CREATE TABLE Account (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    Username VARCHAR(50),
    Password VARCHAR(50),
    AccountType VARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Populate the Account table
-- This is a basic script. You might need to adjust it based on your SQL flavor and requirements.
INSERT INTO Account (EmployeeID, Username, Password, AccountType)
SELECT 
    Employee.EmployeeID,
    CONCAT(LEFT(Employee.FName, 1), Employee.LName) AS Username,
    Employee.LName AS Password,
    CASE 
        WHEN Manager.ManagerID IS NOT NULL THEN 'Manager'
        WHEN Driver.DriverID IS NOT NULL THEN 'Driver'
        ELSE 'Unknown'
    END AS AccountType
FROM Employee
LEFT JOIN Manager ON Employee.EmployeeID = Manager.ManagerID
LEFT JOIN Driver ON Employee.EmployeeID = Driver.DriverID;
