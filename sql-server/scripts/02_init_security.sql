-- Script for Access controls including
-- Adding new user
-- Granting necessary permissions

USE AdventureWorks; -- Replace YourDatabaseName with the name of your database

-- Create login
CREATE LOGIN dat WITH PASSWORD = 'StrongPassword1'; -- Replace YourLoginName and YourPassword with desired values

-- Create user
CREATE USER dat FOR LOGIN dat; -- Replace YourUserName with desired value

-- Grant privileges

GRANT VIEW DEFINITION TO dat;

GRANT SELECT, INSERT, UPDATE, DELETE TO dat; -- Grant privileges on all tables

-- Optionally, grant privileges on specific schema
-- GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::YourSchemaName TO YourUserName; -- Replace YourSchemaName with desired schema



--- Create user for application 
-- Create login
CREATE LOGIN test WITH PASSWORD = 'StrongPassword1'; -- Replace YourLoginName and YourPassword with desired values

-- Create user
CREATE USER test FOR LOGIN test; -- Replace YourUserName with desired value

-- Grant privileges

GRANT VIEW DEFINITION TO test;

GRANT SELECT, INSERT, UPDATE, DELETE TO test; -- Grant privileges on all tables