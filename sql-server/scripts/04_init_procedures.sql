-- Create a stored procedure to update the change tracking version

USE AdventureWorks;
GO

CREATE PROCEDURE SalesLT.Update_ChangeTracking_Version @CurrentTrackingVersion BIGINT, @TableName varchar(50)
AS

BEGIN

UPDATE SalesLT.table_store_ChangeTracking_version
SET [SYS_CHANGE_VERSION] = @CurrentTrackingVersion
WHERE [TableName] = @TableName

END;
GO

-- Grant permission to excute this to the user
GRANT EXECUTE ON SalesLT.Update_ChangeTracking_Version TO dat;
GO