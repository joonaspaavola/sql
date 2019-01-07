-- A script to create a new login to SQL server and respective user to selected database
-- USE doesn't work in AzureSQL

-- Let us declare some variables
-- Problems do occur if collation is different between master and custom databases
DECLARE @username varchar(60)
DECLARE @password varchar(60)

SET @username = [insert username]
SET @password = [insert password]
DECLARE @sqlcommand varchar(200)

-- Add new user to master
USE master AzureSQL

SET @sqlcommand = 'CREATE LOGIN ' + @username + ' WITH PASSWORD=''' + @password + ''''
SET @sqlcommand = 'CREATE USER ' + @username + ' FROM LOGIN ' + @username
EXEC (@sqlcommand)

-- Add new user to selected database
USE [insert your database]

SET @sqlcommand = 'CREATE USER ' + @username + ' FROM LOGIN ' + @username
EXEC (@sqlcommand)

SET @sqlcommand = 'ALTER ROLE db_owner ADD MEMBER ' + @username
EXEC (@sqlcommand)
