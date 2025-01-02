CREATE TABLE [dbo].[BookingTransactions]
(
	[BookingTransactionId] INT IDENTITY (1, 1) NOT NULL,
    [BoardingHouseId] INT NOT NULL, 
    [ClientId] NVARCHAR (450) NOT NULL, 
    [BookingDate] DATETIME NOT NULL, 
    [CheckInDate] DATETIME NULL, 
    [CheckOutDate] DATETIME NULL, 
    [Status] NVARCHAR (50) NOT NULL DEFAULT 'Pending', 
    [AmountPaid] DECIMAL (18, 2) NULL, 
    CONSTRAINT [PK_BookingTransactions] PRIMARY KEY CLUSTERED ([BookingTransactionId] ASC),
    CONSTRAINT [FK_BookingTransactions_BoardingHouses_BoardingHouseId] FOREIGN KEY ([BoardingHouseId]) REFERENCES [dbo].[BoardingHouses] ([BoardinghouseId]),
    CONSTRAINT [FK_BookingTransactions_AspNetUsers_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[AspNetUsers] ([Id])
);
Go
CREATE NONCLUSTERED INDEX [IX_BookingTransactions_BoardingHouseId] 
    ON [dbo].[BookingTransactions] ([BoardingHouseId]);
    go
CREATE NONCLUSTERED INDEX [IX_BookingTransactions_ClientId] 
    ON [dbo].[BookingTransactions] ([ClientId]); 
