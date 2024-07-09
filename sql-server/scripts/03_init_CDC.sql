USE AdventureWorks; -- Replace YourDatabaseName with the name of your database

-- Enable change tracking
ALTER DATABASE AdventureWorks
SET CHANGE_TRACKING = ON  
(CHANGE_RETENTION = 2 DAYS, AUTO_CLEANUP = ON);

ALTER TABLE SalesLT.Address
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON);

ALTER TABLE SalesLT.Customer
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON);

ALTER TABLE SalesLT.CustomerAddress
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON);

ALTER TABLE SalesLT.Product
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON);

ALTER TABLE SalesLT.ProductCategory
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON);

ALTER TABLE SalesLT.ProductDescription
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON);

ALTER TABLE SalesLT.ProductModel
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON);

ALTER TABLE SalesLT.ProductModelProductDescription
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON);

ALTER TABLE SalesLT.SalesOrderDetail
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON);

ALTER TABLE SalesLT.SalesOrderHeader
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON);


-- Create a table to store change tracking version
create table SalesLT.table_store_ChangeTracking_version
(
    TableName varchar(255),
    SYS_CHANGE_VERSION BIGINT,
);

DECLARE @ChangeTracking_version BIGINT
SET @ChangeTracking_version = CHANGE_TRACKING_CURRENT_VERSION();  

INSERT INTO SalesLT.table_store_ChangeTracking_version
VALUES 
('Address', @ChangeTracking_version),
('Customer', @ChangeTracking_version),
('CustomerAddress', @ChangeTracking_version),
('Product', @ChangeTracking_version),
('ProductCategory', @ChangeTracking_version),
('ProductDescription', @ChangeTracking_version),
('ProductModel', @ChangeTracking_version),
('ProductModelProductDescription', @ChangeTracking_version),
('SalesOrderDetail', @ChangeTracking_version),
('SalesOrderHeader', @ChangeTracking_version);


-- Grant view object tracking on tables
GRANT VIEW CHANGE TRACKING ON OBJECT::SalesLT.Address TO dat;
GRANT VIEW CHANGE TRACKING ON OBJECT::SalesLT.Customer TO dat;
GRANT VIEW CHANGE TRACKING ON OBJECT::SalesLT.CustomerAddress TO dat;
GRANT VIEW CHANGE TRACKING ON OBJECT::SalesLT.Product TO dat;
GRANT VIEW CHANGE TRACKING ON OBJECT::SalesLT.ProductCategory TO dat;
GRANT VIEW CHANGE TRACKING ON OBJECT::SalesLT.ProductDescription TO dat;
GRANT VIEW CHANGE TRACKING ON OBJECT::SalesLT.ProductModel TO dat;
GRANT VIEW CHANGE TRACKING ON OBJECT::SalesLT.ProductModelProductDescription TO dat;
GRANT VIEW CHANGE TRACKING ON OBJECT::SalesLT.SalesOrderDetail TO dat;
GRANT VIEW CHANGE TRACKING ON OBJECT::SalesLT.SalesOrderHeader TO dat;
GO