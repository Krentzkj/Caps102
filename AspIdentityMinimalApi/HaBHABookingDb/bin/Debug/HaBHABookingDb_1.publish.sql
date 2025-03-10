﻿/*
Deployment script for HaBHABookingDb

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "HaBHABookingDb"
:setvar DefaultFilePrefix "HaBHABookingDb"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating Table [dbo].[BookingTransactions]...';


GO
CREATE TABLE [dbo].[BookingTransactions] (
    [BookingTransactionId] INT             IDENTITY (1, 1) NOT NULL,
    [BoardingHouseId]      INT             NOT NULL,
    [ClientId]             NVARCHAR (450)  NOT NULL,
    [BookingDate]          DATETIME        NOT NULL,
    [CheckInDate]          DATETIME        NULL,
    [CheckOutDate]         DATETIME        NULL,
    [Status]               NVARCHAR (50)   NOT NULL,
    [AmountPaid]           DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_BookingTransactions] PRIMARY KEY CLUSTERED ([BookingTransactionId] ASC)
);


GO
PRINT N'Creating Index [dbo].[BookingTransactions].[IX_BookingTransactions_BoardingHouseId]...';


GO
CREATE NONCLUSTERED INDEX [IX_BookingTransactions_BoardingHouseId]
    ON [dbo].[BookingTransactions]([BoardingHouseId] ASC);


GO
PRINT N'Creating Index [dbo].[BookingTransactions].[IX_BookingTransactions_ClientId]...';


GO
CREATE NONCLUSTERED INDEX [IX_BookingTransactions_ClientId]
    ON [dbo].[BookingTransactions]([ClientId] ASC);


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[BookingTransactions]...';


GO
ALTER TABLE [dbo].[BookingTransactions]
    ADD DEFAULT 'Pending' FOR [Status];


GO
PRINT N'Creating Foreign Key [dbo].[FK_BookingTransactions_BoardingHouses_BoardingHouseId]...';


GO
ALTER TABLE [dbo].[BookingTransactions] WITH NOCHECK
    ADD CONSTRAINT [FK_BookingTransactions_BoardingHouses_BoardingHouseId] FOREIGN KEY ([BoardingHouseId]) REFERENCES [dbo].[BoardingHouses] ([BoardinghouseId]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_BookingTransactions_AspNetUsers_ClientId]...';


GO
ALTER TABLE [dbo].[BookingTransactions] WITH NOCHECK
    ADD CONSTRAINT [FK_BookingTransactions_AspNetUsers_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[AspNetUsers] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[BookingTransactions] WITH CHECK CHECK CONSTRAINT [FK_BookingTransactions_BoardingHouses_BoardingHouseId];

ALTER TABLE [dbo].[BookingTransactions] WITH CHECK CHECK CONSTRAINT [FK_BookingTransactions_AspNetUsers_ClientId];


GO
PRINT N'Update complete.';


GO
