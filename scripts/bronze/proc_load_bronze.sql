/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN

    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT 'Loading Bronze Layer';
        PRINT '======================================';
  

                   
       PRINT '---------------------------------------';
       SET @start_time=GETDATE();
       PRINT '>>> Inserting Data Into 2021 Trips Table';
        
      
       TRUNCATE TABLE bronze.trips_2021;

        BULK INSERT bronze.trips_2021
        FROM 'C:\BULK\trips_2021.csv'
        WITH(
	        FIRSTROW=2,
            FIELDTERMINATOR =',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT'>> Load Duration:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        


       PRINT '---------------------------------------';
       SET @start_time=GETDATE();
       PRINT '>>> Inserting Data Into Stations Table';
   
        TRUNCATE TABLE bronze.stations;

        BULK INSERT bronze.stations
        FROM 'C:\BULK\stations.csv'
        WITH(
	        FIRSTROW=2,
            FIELDTERMINATOR =',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT'>> Load Duration:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        
        SET @batch_end_time = GETDATE();
        PRINT '========================================';
        PRINT 'Loading Bronze Layer is completed';
        PRINT '    -Total Load Duration: '+ CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '========================================';

    END TRY
    BEGIN CATCH
        PRINT '===================================================='
        PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
        PRINT 'ERROR MESSAGE' + CAST (ERROR_MESSAGE() AS NVARCHAR);
        PRINT 'ERROR MESSAGE' + CAST (ERROR_NUMBER() AS NVARCHAR); 
        PRINT 'ERROR MESSAGE' + CAST (ERROR_STATE() AS NVARCHAR); 
        PRINT '===================================================='
    END CATCH

END
