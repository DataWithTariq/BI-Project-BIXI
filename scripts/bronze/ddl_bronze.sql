/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID ('bronze.trips_2021','U') IS NOT NULL
    DROP TABLE bronze.trips_2021;
GO
CREATE TABLE bronze.trips_2021 (
    trip_start_date DATE,
    trip_emplacement_pk_start INT,
    trip_end_date DATE,
    trip_emplacement_pk_end INT,
    trip_duration_sec INT,
    trip_is_member BIT
);

GO

IF OBJECT_ID ('bronze.stations','U') IS NOT NULL
    DROP TABLE bronze.stations;
GO
CREATE TABLE bronze.stations (
    stations_pk INT,
    stations_name NVARCHAR(255),
    stations_latitude FLOAT,
    stations_longitude FLOAT
);

GO
