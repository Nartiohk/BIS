--Tạo Stage
use master 
go
if DB_ID('NDS') IS NOT NULL
	ALTER DATABASE NDS SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE NDS;
GO
CREATE DATABASE NDS
GO
USE NDS
GO

SELECT * FROM SYS.TABLES

DROP TABLE IF EXISTS AirQualityData_NDS
DROP TABLE IF EXISTS Counties_NDS
DROP TABLE IF EXISTS State_NDS

CREATE TABLE State_NDS (
	State_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    State_code INT,
    StateName NVARCHAR(100),
    State_id NVARCHAR(5),
	Created DATETIME,
    LastUpdated DATETIME,
	SourceID INT,
	Status INT,
);
GO
SELECT * FROM State_NDS


CREATE TABLE Counties_NDS (
	County_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    County_fips CHAR(5),
    County NVARCHAR(255),
    County_ascii NVARCHAR(255),
    County_full NVARCHAR(255),
    State INT,
    Lat DECIMAL(10, 6),
    Lng DECIMAL(10, 6),
    population INT,
	Created DATETIME,
    LastUpdated DATETIME,
	SourceID INT,
	Status INT,

	--KHOA NGOAI 
	CONSTRAINT FK_Counties_NDS_State FOREIGN KEY(State) REFERENCES State_NDS(State_SK)
);
GO

CREATE TABLE AirQualityData_NDS (
	AQI_SK INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	AQI_ID INT,
    County INT,
    AQI INT,
    Category NVARCHAR(50),
	Date DATETIME,
    DefiningParameter NVARCHAR(100),
    DefiningSite NVARCHAR(100),
    NumberOfSitesReporting INT,
    Created DATETIME,
    LastUpdated DATETIME,
	SourceID INT,
	Status INT
	--KHOA NGOAI
	CONSTRAINT FK_AirQualityData_NDS_Counties FOREIGN KEY (County) REFERENCES Counties_NDS(County_SK),
);

CREATE TABLE AQI_TEMP (
    [Row_ID] int,
    [AQI] int,
    [Category] nvarchar(50),
    [DefiningParameter] nvarchar(100),
    [DefiningSite] nvarchar(100),
    [NumberOfSitesReporting] int,
    [County_fips] CHAR(5),
    [Status] int,
    [Date] date
)

-------------------------------------------------------------------------
SELECT * FROM SYS.TABLES

select * from AirQualityData_NDS
SELECT * FROM State_NDS
SELECT * FROM Counties_NDS
