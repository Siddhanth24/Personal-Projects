CREATE TABLE Table1
(ID INT);
 
INSERT INTO Table1
VALUES
(1),(5),(3),(6),(7);
CREATE TABLE Table2
(ID INT PRIMARY KEY CLUSTERED)
 
INSERT INTO Table2
VALUES
(1),(2),(5),(6),(3),(8),(7)

SELECT * FROM Table1	
INNER JOIN Table2 ON Table1.ID = Table2.ID  option (merge JOIN)

CREATE TABLE Meals(MealName VARCHAR(100))
CREATE TABLE Drinks(DrinkName VARCHAR(100))
INSERT INTO Drinks
VALUES('Orange Juice'), ('Tea'), ('Cofee')
INSERT INTO Meals
VALUES('Omlet'), ('Fried Egg'), ('Sausage')
SELECT * FROM Meals 
CROSS JOIN Drinks

CREATE TABLE countries(country_id INT PRIMARY KEY,country_name varchar(20));
INSERT INTO countries
VALUES ((1), ('Sausage'));
INSERT INTO countries
VALUES((2),('sage'));
INSERT INTO countries
VALUES((3),('ge'));
CREATE TABLE persons(country_id INT PRIMARY KEY,given_name VARCHAR(100))
Insert into persons
VALUES((1), ('Fried Egg'))
Insert into persons
VALUES((2), ('gg'))
Insert into persons
VALUES((3), ('g'))

SELECT given_name, country_name FRom
persons JOIN countries ON persons.country_id = countries.country_id;

