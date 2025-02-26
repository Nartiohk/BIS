--Tạo metadata
use master 
go
if DB_ID('METADATA') IS NOT NULL
	DROP DATABASE  METADATA
GO
CREATE DATABASE METADATA
GO
USE METADATA
GO

---------------------------------------------------------------
CREATE TABLE DATA_FLOW (
    FLOW_ID INT IDENTITY(1, 1) PRIMARY KEY,
    DESCRIPTION VARCHAR(255),
    SOURCE VARCHAR(50),
    TARGET VARCHAR(50),
    TRANSFORMATION VARCHAR(255),
    STATUS VARCHAR(30) DEFAULT 'UNDEFINED',
	ROW_INSERT INT DEFAULT 0,
	ROW_UPDATE INT DEFAULT 0,
    LSET DATETIME,
    CET DATETIME,
);

TRUNCATE TABLE DATA_FLOW


INSERT INTO DATA_FLOW (DESCRIPTION, SOURCE, TARGET, TRANSFORMATION, LSET, CET)
VALUES 
	('Load counties data from excel source to Stage table', 'file excel uscounties', 'Counties_Stage', 'Add Created, LastUpdated, Status SourceID columns, convert county_fips datatype to String', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load air quality data from excel source to Stage table', 'file excel state_aqi 2021, 2022, 2023', 'AirQualityData_Stage', 'Add Created, LastUpdated, Status, SourceID, county_fips column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load state data from Stage to NDS', 'Counties_Stage', 'State_NDS', 'Add Created, LastUpdated, Status, SourceID column, convert StateCode to integer', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load counties data from Stage to NDS', 'Counties_Stage', 'Counties_NDS', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load air quality data from Stage to NDS', 'AirQualityData_Stage', 'AirQualityData_NDS', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load state data from NDS to DDS', 'State_NDS', 'Dim_State', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load counties data from NDS to county dimension in DDS', 'Counties_NDS', 'Dim_Counties', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load category data from NDS to category dimension in DDS', 'AirQualityData_NDS', 'Dim_Category', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load defining parameter data from NDS to defining parameter dimension in DDS', 'AirQualityData_NDS', 'Dim_DefiningParameter', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Hierarchize day dimension from NDS to DDS', 'AirQualityData_NDS', 'Dim_Day', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Hierarchize month dimension from NDS to DDS', 'AirQualityData_NDS', 'Dim_Month', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Hierarchize month dimension from NDS to DDS', 'AirQualityData_NDS', 'Dim_Quarter', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Hierarchize month dimension from NDS to DDS', 'AirQualityData_NDS', 'Dim_Year', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load AQI data from NDS to DDS fact table', 'AirQualityData_NDS', 'Fact_AirQualityData', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load data from nds to dds for next day aqi prediction', 'AirQualityData_NDS', 'DataMining_Day', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load data from nds to dds for next month aqi prediction', 'AirQualityData_NDS', 'DataMining_Month', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00'),
	('Load data from nds to dds for next year aqi prediction', 'AirQualityData_NDS', 'DataMining_Year', 'Add Created, LastUpdated, Status, SourceID column', '2015-01-01 00:00:00', '2015-01-01 00:00:00')
GO

SELECT * FROM DATA_FLOW