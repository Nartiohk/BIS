--Tạo Stage
use master 
go
if DB_ID('STAGE') IS NOT NULL
	ALTER DATABASE STAGE SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE  STAGE
GO
CREATE DATABASE STAGE
GO
USE STAGE
GO

SELECT * FROM SYS.TABLES

DROP TABLE IF EXISTS AirQualityData_Stage
DROP TABLE IF EXISTS Counties_Stage

CREATE TABLE AirQualityData_Stage (
	Row_ID INT IDENTITY(1, 1) NOT NULL,
    StateName NVARCHAR(100),
    CountyName NVARCHAR(100),
    StateCode NVARCHAR(10),
    CountyCode NVARCHAR(10),
    Date DATE,
    AQI INT,
    Category NVARCHAR(50),
    DefiningParameter NVARCHAR(100),
    DefiningSite NVARCHAR(100),
    NumberOfSitesReporting INT,
    Created DATETIME,
    LastUpdated DATETIME,
	SourceID INT,
	Status INT,
	County_fips CHAR(5),
);


SELECT * FROM AirQualityData_Stage

CREATE TABLE Counties_Stage (
    County_fips CHAR(5) PRIMARY KEY,
    County NVARCHAR(255),
    County_ascii NVARCHAR(255),
    County_full NVARCHAR(255),
    State_id NVARCHAR(5),
    State_name NVARCHAR(255),
    Lat DECIMAL(10, 6),
    Lng DECIMAL(10, 6),
    population INT,
	Created DATETIME,
    LastUpdated DATETIME,
	SourceID INT,
	Status INT,
);

select * from Counties_Stage
