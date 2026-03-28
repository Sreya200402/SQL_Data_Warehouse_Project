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


create or alter procedure bronze.load_bronze as
begin
    declare @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime;
	begin try
	    set @batch_start_time = getdate();
		print '****************************************************************************';
		print 'Loading Bronze layer';
		print '****************************************************************************';

		print '-----------------------------------------------------------------------------';
		print 'Loading CRM Tables';
		print '-----------------------------------------------------------------------------';

		set @start_time = getdate();
		print '>> Truncating Table : bronze.crm_cust_info';
		truncate table bronze.crm_cust_info;

		print '>> Inserting data into Table : bronze.crm_cust_info';
		bulk insert bronze.crm_cust_info from 
		'C:\Users\pasal\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm/cust_info.csv'
		with (
			firstrow  = 2,
			fieldterminator = ',',
			tablock
		);
	    set @end_time = getdate();
		print '>> load duration : '+ cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
		print '>> --------------------------------';



		set @start_time = getdate();
		print '>> Truncating Table : bronze.crm_prd_info';
		truncate table bronze.crm_prd_info;

		print '>> Inserting data into Table : bronze.crm_prd_info';
		bulk insert bronze.crm_prd_info from 
		'C:\Users\pasal\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm/prd_info.csv'
		with (
			firstrow  = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> load duration : '+ cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
		print '>> --------------------------------';


		set @start_time = getdate();
		print '>> Truncating Table : bronze.crm_sales_details';
		truncate table bronze.crm_sales_details;

		print '>> Inserting data into Table : bronze.crm_sales_details';
		bulk insert bronze.crm_sales_details from 
		'C:\Users\pasal\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm/sales_details.csv'
		with (
			firstrow  = 2,
			fieldterminator = ',',
			tablock
		);
	    set @end_time = getdate();
		print '>> load duration : '+ cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
		print '>> --------------------------------';


		print '-----------------------------------------------------------------------------';
		print 'Loading ERP Tables';
		print '-----------------------------------------------------------------------------';

		set @start_time = getdate();
		print '>> Truncating Table : bronze.erp_cust_az12';
		truncate table bronze.erp_cust_az12;

		print '>> Inserting data into Table : bronze.erp_cust_az12';
		bulk insert bronze.erp_cust_az12 from 
		'C:\Users\pasal\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp/cust_az12.csv'
		with (
			firstrow  = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> load duration : '+ cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
		print '>> --------------------------------';


		set @start_time = getdate();
		print '>> Truncating Table : bronze.erp_loc_a101';
		truncate table bronze.erp_loc_a101;

		print '>> Inserting data into Table : bronze.erp_loc_a101 ';
		bulk insert bronze.erp_loc_a101 from 
		'C:\Users\pasal\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp/loc_a101.csv'
		with (
			firstrow  = 2,
			fieldterminator = ',',
			tablock
		);
	    set @end_time = getdate();
		print '>> load duration : '+ cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
		print '>> --------------------------------';


 		set @start_time = getdate();
 		print '>> Truncating Table : bronze.erp_px_cat_g1v2';
		truncate table bronze.erp_px_cat_g1v2;

		print '>> Inserting data into Table : bronze.erp_px_cat_g1v2';
		bulk insert bronze.erp_px_cat_g1v2 from 
		'C:\Users\pasal\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp/px_cat_g1v2.csv'
		with (
			firstrow  = 2,
			fieldterminator = ',',
			tablock
		);
        set @end_time = getdate();
		print '>> load duration : '+ cast(datediff(second, @start_time, @end_time) as nvarchar) + ' seconds';
		print '>> --------------------------------';


		print '==========================================================';
		set @batch_end_time = getdate();
		print 'LOADING BRONZE LAYER IS COMPLETED';
		PRINT '  - TOTAL LOAD DURATION: ' +cast(datediff(second, @batch_start_time, @batch_end_time) as nvarchar) + ' seconds';
		print '==========================================================';


	end try
	begin catch
	   print '=========================================================================';
	   print 'ERROR OCCURED DURING LOADING BRONZE LAYER';
	   print 'ERROR MESSAGE' + ERROR_MESSAGE();
	   print 'ERROR MESSAGE' + Cast(ERROR_NUMBER() as nvarchar);
	   print 'ERROR MESSAGE' + Cast(ERROR_STATE() as nvarchar);
	   print '=========================================================================';
	end catch
end 



exec bronze.load_bronze;
