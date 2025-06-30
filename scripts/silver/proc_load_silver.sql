/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/

CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;

    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT 'Loading Silver Layer';
        PRINT '======================================';

        -- ======================================
        -- STATIONS
        -- ======================================
        PRINT '---------------------------------------';
        SET @start_time = GETDATE();
        PRINT '>>> Loading silver.stations (cleaned & merged)';

        TRUNCATE TABLE silver.stations;

        INSERT INTO silver.stations (
            stations_pk,
            stations_name,
            stations_latitude,
            stations_longitude
        )

        -- Fusion Pie-IX (1010 → 907)
        SELECT TOP 1 
            907, 'Métro Pie-IX (Pierre-de-Coubertin / De La Salle)',
            stations_latitude, stations_longitude
        FROM bronze.stations WHERE stations_pk = 907

        UNION ALL

        -- Fusion Lanaudière (1009 → 957)
        SELECT TOP 1 
            957, 'De Lanaudière / du Mont-Royal',
            stations_latitude, stations_longitude
        FROM bronze.stations WHERE stations_pk = 957

        UNION ALL

        -- Fusion de la Commune / King (421 → 947)
        SELECT TOP 1 
            947, 'De la Commune / King',
            stations_latitude, stations_longitude
        FROM bronze.stations WHERE stations_pk = 947

        UNION ALL

        -- Les autres stations
        SELECT 
            stations_pk, stations_name, stations_latitude, stations_longitude
        FROM bronze.stations
        WHERE stations_pk NOT IN (1010, 907, 1009, 957, 421, 947);

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        -- ======================================
        -- TRIPS
        -- ======================================
        PRINT '---------------------------------------';
        SET @start_time = GETDATE();
        PRINT '>>> Loading silver.trips_2021 (ID mapping applied)';

        TRUNCATE TABLE silver.trips_2021;

        INSERT INTO silver.trips_2021 (
            trip_start_date,
            trip_end_date,
            trip_emplacement_pk_start,
            trip_emplacement_pk_end,
            trip_duration_sec,
            trip_is_member
        )
        SELECT
            trip_start_date,
            trip_end_date,

            CASE 
                WHEN trip_emplacement_pk_start = 1010 THEN 907
                WHEN trip_emplacement_pk_start = 1009 THEN 957
                WHEN trip_emplacement_pk_start = 421  THEN 947
                ELSE trip_emplacement_pk_start
            END AS trip_emplacement_pk_start,

            CASE 
                WHEN trip_emplacement_pk_end = 1010 THEN 907
                WHEN trip_emplacement_pk_end = 1009 THEN 957
                WHEN trip_emplacement_pk_end = 421  THEN 947
                ELSE trip_emplacement_pk_end
            END AS trip_emplacement_pk_end,

            trip_duration_sec,
            trip_is_member
        FROM bronze.trips_2021;

        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        SET @batch_end_time = GETDATE();
        PRINT '========================================';
        PRINT 'Loading Silver Layer is completed';
        PRINT '    -Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '========================================';

    END TRY
    BEGIN CATCH
        PRINT '====================================================';
        PRINT 'ERROR OCCURRED DURING LOADING SILVER LAYER';
        PRINT 'ERROR MESSAGE: ' + CAST(ERROR_MESSAGE() AS NVARCHAR);
        PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'ERROR STATE: ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '====================================================';
    END CATCH
END;
