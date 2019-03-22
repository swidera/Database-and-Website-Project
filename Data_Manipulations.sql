-- Project Group 19
-- Alexander Swider & Bradford Witt
-- February 10, 2019
-- Data Manipulation Queries

-- NOTE: ANYTHING DENOTED BY A “:” IS TO BE REPLACED TO MAKE THE STATEMENTS EXECUTE

-- INSERT New Team
INSERT INTO Team 
	(Abbreviation, Name, City, State, Country, Stadium) 
VALUES (:abbreviation, :name, :city, :state, :country, :stadium);

-- INSERT New Player
INSERT INTO Player
	(ID_Player, First_Name, Last_Name, College, Number, Team, Team_Player)
VALUES (:autoID_Player, :first_name, :last_name, :college, :number, :team, :team_player);

-- INSERT New Position
INSERT INTO Position
	(ID_Position, Position_Type, Position_Group)
VALUES (:autoID_Position, :position_type, :position_group);

-- INSERT New Coach
INSERT INTO Coach
	(ID_Coach, First_Name, Last_Name, Team, Team_Coach)
VALUES (:autoID_Coach, :first_name, :last_name, :team, :team_coach);

-- INSERT New Front Office
INSERT INTO Front_Office
	(ID_Front_Office, First_Name, Last_Name, Roll, Team, Team_Front_Office)
VALUES (:autoID_Front_Office, :first_name, :last_name, :roll, :team, :team_front_office);

-- In order to use these queries, replace “:condition” with the desired parts of a table you wish 
-- to delete. “:condition” is a placeholder variable in this syntax meant to be replaced 
-- by a specific statement

-- DELETE Team
DELETE FROM Team 
WHERE :condition;

-- DELETE Player
DELETE FROM Player
WHERE :condition;

-- DELETE Position
DELETE FROM Position
WHERE :condition;

-- DELETE Coach
DELETE FROM Coach
WHERE :condition;

-- DELETE Front Office
DELETE FROM Front_Office
WHERE :condition;

-- “:change” refers to the column of the table you wish to change, and “:value” is what 
-- the column will be set to. The last part of the statement “WHERE :condition” is meant to 
-- be used to specify what rows you want changed. For instance, if you want only one 
-- object to be changed, you can specify the primary keys (Abbreviation, ID_Front_Office, 
-- ID_Coach, ID_Player, ID_Position) and use them with their respective tables

-- UPDATE Team
UPDATE Team
SET :change = :value


-- UPDATE Player
UPDATE Player
SET :change = :value

-- UPDATE Position
UPDATE Position
SET :change = :value

-- UPDATE Coach
UPDATE Coach
SET :change = :value

-- UPDATE Front Office
UPDATE Front_Office
SET :change = :value

--If the tables are already created and there are values within them, the statements can be 
-- copied and pasted as they are to display the desired table

-- Display Team Attributes + Front Office + Coach + Players
	-- Separate Queries
	SELECT *
	FROM Team
	WHERE Team.abbreviation = :value;
	SHOW TABLES;


	SELECT *
	From Front_Office
	WHERE Front_Office.team = :value;
	SHOW TABLES;

	SELECT *
	FROM Coach
	WHERE Coach.team = :value;
	SHOW TABLES;

	SELECT *
	FROM Player
	WHERE Player.team = :value;
	SHOW TABLES;

	-- Combined
	SELECT Team.Abbreviation, Team.Name, Team.City, Team.State, Team.Country, Team.Stadium, Front_Office.First_Name AS Front_Office_First_Name, 
			Front_Office.Last_Name AS Front_Office_Last_Name, Front_Office.Role, Coach.First_Name AS Coach_First_Name, Coach.Last_Name AS Coach_Last_Name
	From Team, Front_Office, Coach
	WHERE Team.Abbreviation = :value
		AND Front_Office.Team = :value
		AND Coach.Team = :value;
	SHOW TABLES;


-- Display Player Attributes + Position
SELECT * 
FROM Player, Player_Position
WHERE Player.ID_Player = :value
	AND Player.ID_Player = Player_Position.ID_Player;
SHOW TABLES;
