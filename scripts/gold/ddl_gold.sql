/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create View: gold.trips_2021
-- =============================================================================

IF OBJECT_ID('gold.trips_2021', 'V') IS NOT NULL
    DROP VIEW gold.trips_2021;
GO

CREATE VIEW gold.trips_2021 AS
SELECT 
    t.trip_start_date,
    t.trip_end_date,
    t.trip_duration_sec,
    t.trip_is_member,

    t.trip_emplacement_pk_start,
    s_start.stations_name       AS start_station_name,
    s_start.stations_latitude   AS start_station_lat,
    s_start.stations_longitude  AS start_station_lng,

    t.trip_emplacement_pk_end,
    s_end.stations_name         AS end_station_name,
    s_end.stations_latitude     AS end_station_lat,
    s_end.stations_longitude    AS end_station_lng

FROM 
    silver.trips_2021 t
LEFT JOIN 
    silver.stations s_start ON t.trip_emplacement_pk_start = s_start.stations_pk
LEFT JOIN 
    silver.stations s_end   ON t.trip_emplacement_pk_end   = s_end.stations_pk;
GO

