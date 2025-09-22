/*SQL Script for Group 66 (Using the Alternative Schema provided for CW3)

Students: 
- Ishita Rajesh Karamchandani Bhagchandani: 220482002
- Ilai Pinhas Horman: 220398839
- Stine Kopp: 220623937
- Daryna Tsvykh: 220530680 

This script is designed for Oracle Live SQL*/


--First table called agency including an ID Primary Key, (Using value INT), Name of the agency and its PhoneNumber (Varchar2). 
--'NOT NULL' constraints to maintain data integrity.
CREATE TABLE agency (                                                       
    agencyId INT PRIMARY KEY,
    Name VARCHAR2(255) NOT NULL, 
    PhoneNumber VARCHAR2(20) NOT NULL
);
--Inserting values into the agency table.
INSERT INTO agency VALUES (1657, 'Covent Garden', '07077718800');
INSERT INTO agency VALUES (0901, 'Shoreditch', '07123456789');
INSERT INTO agency VALUES (4511, 'Wembley', '07344555000');
INSERT INTO agency VALUES (9870, 'Camden Town', '07909080580');
INSERT INTO agency VALUES (3434, 'Mile End', '07333389054');
INSERT INTO agency VALUES (2100, 'Paddington', '07515112098');
INSERT INTO agency VALUES (1119, 'Hyde Park', '07662611004');
INSERT INTO agency VALUES (7777, 'Hendon', '07340000901');
INSERT INTO agency VALUES (8001, 'Stratford', '07712061739');
INSERT INTO agency VALUES (6626, 'Soho', '07989033333');

--Second table called office including an ID Primary Key (Using value INT), the Postcode, the office's PhoneNumbers (value Varchar2).
--Foreign key which includes the agencyID from the agency table. 
CREATE TABLE office (
    OfficeID INT PRIMARY KEY,
    AgencyId INT,
    --Composite attribute for the postcode (including: Area, District, Sector and Unit)
    Area VARCHAR2(255) NOT NULL,                    
    District VARCHAR2(255) NOT NULL,
    Sector VARCHAR2(255) NOT NULL,
    Unit VARCHAR2(255) NOT NULL,
    PhoneNumber VARCHAR2(20) NOT NULL,        
    FOREIGN KEY (AgencyId) REFERENCES agency (agencyId)
);
--Inserting values into the office table.
INSERT INTO office VALUES (101, 1657, 'Central', 'Westminster', 'W1', 'A', '07071234567');
INSERT INTO office VALUES (102, 0901, 'East', 'Hackney', 'E2', 'B', '07122334455');
INSERT INTO office VALUES (103, 4511, 'Northwest', 'Brent', 'NW10', 'C', '07333445566');
INSERT INTO office VALUES (104, 9870, 'North', 'Camden', 'N1', 'D', '07987654321');
INSERT INTO office VALUES (105, 3434, 'East', 'Tower Hamlets', 'E3', 'E', '07321234567');
INSERT INTO office VALUES (106, 2100, 'West', 'Westminster', 'W2', 'F', '07554321098');
INSERT INTO office VALUES (107, 1119, 'West', 'Westminster', 'W1', 'G', '07661234567');
INSERT INTO office VALUES (108, 7777, 'Northwest', 'Barnet', 'NW4', 'H', '07340000123');
INSERT INTO office VALUES (109, 8001, 'East', 'Newham', 'E15', 'I', '07712061234');
INSERT INTO office VALUES (110, 6626, 'Central', 'Westminster', 'W1', 'J', '07989033000');

--Third table called property including an ID Primary Key, Price, NumBedrooms (all with value INT).
--City, Type and PostCode(including: Area, District, Sector and Unit) are value VARCHAR2. 
--Usage of 'CLOB' for 'Description' in order to handle possible large text.
CREATE TABLE property( 
    PropertyID INT PRIMARY KEY, 
    --Composite attribute for the postcode (including: Area, District, Sector and Unit)
    Area VARCHAR2(255) NOT NULL, 
    District VARCHAR2(255) NOT NULL, 
    Sector VARCHAR2(255) NOT NULL, 
    Unit VARCHAR2(255) NOT NULL, 
    City VARCHAR2(255) NOT NULL, 
    Price DECIMAL(10, 2) NOT NULL, 
    Type VARCHAR2(10) CHECK (Type IN ('house', 'flat')) NOT NULL, --Utilisation of 'CHECK': To verify a specific condition. In this case, to confirm if the property is a house or a flat.
    NumBedrooms INT NOT NULL, 
    Description CLOB    
);

--Inserting values into the property table.
--Insertion of 30 properties to have more values divided between the 3 generalized entities: forSale,forRent and sold
INSERT INTO property VALUES (201, 'Central', 'Westminster', 'W1', 'A', 'London', 500000.00, 'house', 3, 'A house in Central London');
INSERT INTO property VALUES (202, 'East', 'Hackney', 'E2', 'B', 'London', 450000.00, 'flat', 2, 'Modern flat in East London');
INSERT INTO property VALUES (203, 'Northwest', 'Brent', 'NW10', 'C', 'London', 550000.00, 'house', 4, 'Spacious house in Northwest London');
INSERT INTO property VALUES (204, 'North', 'Camden', 'N1', 'D', 'London', 400000.00, 'flat', 1, 'A flat in North London');
INSERT INTO property VALUES (205, 'East', 'Tower Hamlets', 'E3', 'E', 'London', 600000.00, 'house', 5, 'A luxurious house in East London');
INSERT INTO property VALUES (206, 'West', 'Westminster', 'W2', 'F', 'London', 350000.00, 'flat', 1, 'A compact flat in West London');
INSERT INTO property VALUES (207, 'North', 'Islington', 'N1', 'N', 'London', 700000.00, 'flat', 4, 'Fully furnished flat in North London');
INSERT INTO property VALUES (208, 'Northwest', 'Barnet', 'NW4', 'H', 'London', 300000.00, 'flat', 1, 'A flat in Northwest London');
INSERT INTO property VALUES (209, 'East', 'Newham', 'E15', 'I', 'London', 650000.00, 'house', 4, 'Family house in East London');
INSERT INTO property VALUES (210, 'Central', 'Westminster', 'W1', 'J', 'London', 400000.00, 'flat', 2, 'A stylish flat in Central London');
INSERT INTO property VALUES (211, 'Central', 'Westminster', 'W1', 'K', 'London', 550000.00, 'house', 3, '3 Bedroom House in Central London');
INSERT INTO property VALUES (212, 'Southwest', 'Wandsworth', 'SW18', 'L', 'London', 550000.00, 'house', 3, 'Semi-detached house in Southwest London');
INSERT INTO property VALUES (213, 'Northwest', 'Brent', 'NW10', 'M', 'London', 560000.00, 'house', 4, 'House in Northwest London');
INSERT INTO property VALUES (214, 'North', 'Camden', 'N1', 'N', 'London', 410000.00, 'flat', 1, 'A cosy flat in North London');
INSERT INTO property VALUES (215, 'East', 'Tower Hamlets', 'E3', 'O', 'London', 610000.00, 'house', 5, '3 floored house in East London');
INSERT INTO property VALUES (216, 'West', 'Westminster', 'W2', 'P', 'London', 360000.00, 'flat', 1, 'Studio flat in West London');
INSERT INTO property VALUES (217, 'Southeast', 'Greenwich', 'SE10', 'Q', 'London', 400000.00, 'flat', 2, 'Shared accommodation in Southeast London');
INSERT INTO property VALUES (218, 'East', 'Shoreditch', 'E1', 'X', 'London', 549950.00, 'flat', 1, 'Newly renovated flat in Shoreditch');
INSERT INTO property VALUES (219, 'East', 'Newham', 'E15', 'S', 'London', 660000.00, 'house', 4, 'A family house in East London');
INSERT INTO property VALUES (220, 'Central', 'Westminster', 'W1', 'T', 'London', 1410000.00, 'flat', 9, 'A mansion in Central London');
INSERT INTO property VALUES (221, 'East', 'Hoxton', 'E2', 'U', 'London', 500000.00, 'flat', 2, 'Student-Friendly flat ');
INSERT INTO property VALUES (222, 'East', 'Hackney', 'E2', 'B', 'London', 450000.00, 'house', 3, 'A modern house in East London');
INSERT INTO property VALUES (223, 'Northwest', 'Brent', 'NW10', 'C', 'London', 250000.00, 'house', 4, 'Old house needs renovation');
INSERT INTO property VALUES (224, 'North', 'Camden', 'N1', 'D', 'London', 400000.00, 'flat', 2, 'Small flat in a nice zone');
INSERT INTO property VALUES (225, 'East', 'Tower Hamlets', 'E3', 'E', 'London', 600000.00, 'house', 5, 'High standard house');
INSERT INTO property VALUES (226, 'West', 'Westminster', 'W2', 'F', 'London', 100000.00, 'flat', 1, 'A small studio');
INSERT INTO property VALUES (227, 'East', 'Mile End', 'E3', 'V', 'London', 365000.00
, 'house', 1, '1 Bedroom flat newly renovated');
INSERT INTO property VALUES (228, 'Northwest', 'Wembley', 'HA9', 'Y', 'London', 585000.00, 'house', 3, 'A semi-detached house in Wembley');
INSERT INTO property VALUES (229, 'East', 'Newham', 'E15', 'I', 'London', 650000.00, 'house', 4, 'A family house');
INSERT INTO property VALUES (230, 'Central', 'Westminster', 'W1', 'J', 'London', 350000.00, 'flat', 3, 'Nice semi-detached apartment');


--Fourth table called customer including an ID Primary Key (Using value INT), Name of Customer and their PhoneNumber ( value Varchar2). 
CREATE TABLE customer(
   CustomerID INT PRIMARY KEY,
   Name VARCHAR2(255) NOT NULL,
   PhoneNumber VARCHAR2(20) NOT NULL
);

--Inserting values into the customer table.
INSERT INTO customer VALUES (301, 'Patrick Mahomes', '0713356719');
INSERT INTO customer VALUES (302, 'Jane Smith', '07483315664');
INSERT INTO customer VALUES (303, 'Fernando Alonso', '07058273964');
INSERT INTO customer VALUES (304, 'Rahul Patel', '07783647092');
INSERT INTO customer VALUES (305, 'Jessica Evans', '07198233398');
INSERT INTO customer VALUES (306, 'Alba Lyon', '07288347190');
INSERT INTO customer VALUES (307, 'Cristiano Ronaldo', '07750936214');
INSERT INTO customer VALUES (308, 'Kristina Jones', '07867147205');
INSERT INTO customer VALUES (309, 'William Moore', '07118485562');
INSERT INTO customer VALUES (310, 'Max Verstappen', '07198534997');

-- Fifth table called forSale including propertyID and officeID (Both ID's are Foreign Key)
--forSale inherits attributes from property (This is also known as Generalisation).
CREATE TABLE forSale (
    PropertyID INT,
    OfficeID INT,
    PRIMARY KEY (PropertyID, OfficeID), --Both Foreign Keys are identified as composite Primary Keys. 
    FOREIGN KEY (PropertyID) REFERENCES property(PropertyID), --Reference for the Generalisation.
    FOREIGN KEY (OfficeID) REFERENCES office(OfficeID)
);

--Inserting values into the forSale table.
INSERT INTO forSale VALUES (203, 103);
INSERT INTO forSale VALUES (204, 104);
INSERT INTO forSale VALUES (208, 108);
INSERT INTO forSale VALUES (209, 109);
INSERT INTO forSale VALUES (211, 101);
INSERT INTO forSale VALUES (216, 106);
INSERT INTO forSale VALUES (218, 108);
INSERT INTO forSale VALUES (219, 109);
INSERT INTO forSale VALUES (220, 110);
INSERT INTO forSale VALUES (226, 106);

-- Sixth table called forRent including propertyID and officeID (Both ID's are Foreign Key)
--forRent inherits attributes from property (This is also known as Generalisation).
CREATE TABLE forRent(
   PropertyID INT,
   OfficeID INT,
   PRIMARY KEY (PropertyID, OfficeID),--Both Foreign Keys are identified as composite Primary Keys. 
   FOREIGN KEY (PropertyID) REFERENCES property(PropertyID), --Reference for the Generalisation.
   FOREIGN KEY (OfficeID) REFERENCES office(OfficeID)
);

--Inserting values into the forRent table.
INSERT INTO forRent VALUES (201, 101);
INSERT INTO forRent VALUES (205, 105);
INSERT INTO forRent VALUES (206, 106);
INSERT INTO forRent VALUES (214, 104);
INSERT INTO forRent VALUES (215, 105);
INSERT INTO forRent VALUES (217, 107);
INSERT INTO forRent VALUES (221, 101);
INSERT INTO forRent VALUES (222, 102);
INSERT INTO forRent VALUES (223, 103);
INSERT INTO forRent VALUES (228, 108);

-- Seventh table called sold including propertyID, officeID and CustomerID (all ID's are Foreign Key)
--sold inherits attributes from property (This is also known as Generalisation).
CREATE TABLE sold(
   PropertyID INT,
   OfficeID INT,
   CustomerID INT,
   PRIMARY KEY (PropertyID, OfficeID, CustomerID), --All Foreign Keys are identified as composite Primary Keys. Combination of values must be unique.
   FOREIGN KEY (PropertyId) REFERENCES property(PropertyID),--Reference for the Generalisation.
   FOREIGN KEY (OfficeId) REFERENCES office(OfficeID),
   FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID)
);

--Inserting values into the forSale table.
INSERT INTO sold VALUES (202, 102, 301);
INSERT INTO sold VALUES (207, 107, 302);
INSERT INTO sold VALUES (210, 110, 303);
INSERT INTO sold VALUES (212, 102, 304);
INSERT INTO sold VALUES (213, 103, 305);
INSERT INTO sold VALUES (224, 104, 306);
INSERT INTO sold VALUES (225, 105, 307);
INSERT INTO sold VALUES (227, 107, 308);
INSERT INTO sold VALUES (229, 109, 309);
INSERT INTO sold VALUES (230, 110, 310);


-- Basic Query 1
/*Calculates the average price of properties, grouped by type, for those priced over £500,000. */
/* SELECT AS used to make the names on the tables look better and more clean*/
SELECT Type, AVG(Price) AS AveragePrice
FROM property
WHERE Price > 500000
GROUP BY Type;

-- Basic Query 2
/*Lists customers who have bought properties priced over £600,000,
including the property ID, price, and type.*/
SELECT c.Name, p.PropertyID, p.Price, p.Type
FROM customer c
INNER JOIN sold s ON c.CustomerID = s.CustomerID
INNER JOIN property p ON s.PropertyID = p.PropertyID
WHERE p.Price > 600000;


-- Medium Query 1
/*Determines the average price of properties sold by each agency, grouped by agency name. */
SELECT a.Name AS AgencyName, AVG(p.Price) AS AveragePrice
FROM agency a
/* When not spesificed join is the same as INNER JOIN*/
JOIN office o ON a.agencyId = o.AgencyId
JOIN sold s ON o.OfficeID = s.OfficeID
JOIN property p ON s.PropertyID = p.PropertyID
GROUP BY a.Name;

-- Medium Query 2
/* Lists all properties, showing their details, whether they are for sale, for rent, or both. */
/*COALESCE selects the first non-null PropertyID from either the forSale or forRent tables or both*/
SELECT COALESCE(fs.PropertyID, fr.PropertyID) AS PropertyID, p.Price, p.Type
FROM forSale fs
FULL OUTER JOIN forRent fr ON fs.PropertyID = fr.PropertyID
JOIN property p ON p.PropertyID = fs.PropertyID OR p.PropertyID = fr.PropertyID;

--Medium Query 3
/*Counts how many properties each agency is selling or renting and identifies the most
expensive property each agency has. */
/* 'COUNT(DISTINCT' Counts the unique properties listed for sale and for rent by each agency,
   and finds the highest price among all their listed properties 'MAX(p.Price)'*/
SELECT a.Name AS AgencyName, COUNT(DISTINCT fs.PropertyID) + COUNT(DISTINCT fr.PropertyID) AS TotalListings,
    MAX(p.Price) AS HighestPrice
FROM agency a
JOIN office o ON a.agencyId = o.AgencyId
LEFT JOIN forSale fs ON o.OfficeID = fs.OfficeID
LEFT JOIN forRent fr ON o.OfficeID = fr.OfficeID
LEFT JOIN property p ON p.PropertyID = fs.PropertyID OR p.PropertyID = fr.PropertyID
GROUP BY a.Name;

--ADVANCED QUERY 1
/* The following query is to obtain the total number of properties for sale and for rent (separately) in different areas in London, such as Central & East, West & North, Northwest & Southwest & Southeast*/
/*The case used here is a Conditional Summation case, which means that summarise/count values are based on some conditions */

SELECT
    SUM (CASE
    WHEN p.area IN ('Central','East') AND fs.PropertyID IS NOT NULL
    THEN 1
    ELSE 0 END) AS for_Sale_Central_and_East,
    
    SUM (CASE
    WHEN p.area IN ('West','North') AND fs.PropertyID IS NOT NULL
    THEN 1
    ELSE 0 END) AS for_Sale_West_and_North,
    
    SUM (CASE
    WHEN p.area IN ('Northwest','Southwest','Southeast') AND fs.PropertyID IS NOT NULL
    THEN 1
    ELSE 0 END) AS for_Sale_Northwest_and_Southwest_Southeast,
    
    SUM (CASE
    WHEN p.area IN ('Central','East') AND fr.PropertyID IS NOT NULL
    THEN 1
    ELSE 0 END) AS forRent_Central_and_East,
    
    SUM (CASE
    WHEN p.area IN ('West','North') AND fr.PropertyID IS NOT NULL
    THEN 1
    ELSE 0 END) AS forRent_West_and_North,
    
    SUM (CASE
    WHEN p.area IN ('Northwest','Southwest','Southeast') AND fr.PropertyID IS NOT NULL
    THEN 1
    ELSE 0 END) AS forRent_Northwest_and_Southwest_Southeast
FROM Property p
LEFT JOIN forSale fs ON p.PropertyID = fs.PropertyID
LEFT JOIN forRent fr ON p.PropertyID = fr.PropertyID;

--ADVANCED QUERY 2
/*This query will show a ranking of all agencies with their most expensive properties sold, ordered by the price */
/*The case used here is Ranking Rows, based on a specific ordering criteria.
RANK() function returns each row’s position in the result set, based on the order defined in the OVER clause.*/

SELECT a.Name, p.price, p.city, p.area,
    RANK() OVER (ORDER BY p.Price DESC) as ranking
FROM agency a
JOIN office o ON a.AgencyId = o.AgencyId
JOIN sold s ON o.OfficeID = s.OfficeID
JOIN property p ON s.PropertyID = p.PropertyID;


--ADVANCED QUERY 3
/*This query will show the property bedroom-range to count how many properties are in each category for an easier user's search*/
/* Group Rows by Range. We use CASE to define bedrooms range for each appartment. 
The first CASE defines the ranges, the second one in the GROUP BY aggregates records and applies the COUNT(*) function to each group of records*/
SELECT
  CASE
    WHEN p.Numbedrooms = 1 THEN 'Studio'
    WHEN p.Numbedrooms > 1 AND p.Numbedrooms <= 3 THEN '2 or 3 bedrooms'
    WHEN p.Numbedrooms = 4 THEN '4 bedrooms'
    WHEN p.Numbedrooms > 4 THEN 'more than 4 bedrooms'
  END AS bedrooms_in_property,
  COUNT(*) AS number_of_properties
FROM property p
GROUP BY
  CASE
    WHEN p.Numbedrooms = 1 THEN 'Studio'
    WHEN p.Numbedrooms > 1 AND p.Numbedrooms <= 3 THEN '2 or 3 bedrooms'
    WHEN p.Numbedrooms = 4 THEN '4 bedrooms'
    WHEN p.Numbedrooms > 4 THEN 'more than 4 bedrooms'
END;


