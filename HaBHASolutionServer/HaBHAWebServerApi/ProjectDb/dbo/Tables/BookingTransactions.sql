CREATE TABLE [dbo].[BookingTransactions] (
    [TransactionId]   INT             IDENTITY (1, 1) NOT NULL,
    [CheckInDate]     DATETIME2 (7)   NULL,
    [CheckOutDate]    DATETIME2 (7)   NULL,
    [AmountPaid]      DECIMAL (18, 2) NOT NULL,
    [PaymentStatus]   NVARCHAR (MAX)  NULL,
    [Status]          NVARCHAR (MAX)  NULL,
    [Paymentmethod]   NVARCHAR (MAX)  NULL,
    [BoardinghouseId] INT             NULL,
    CONSTRAINT [PK_BookingTransactions] PRIMARY KEY CLUSTERED ([TransactionId] ASC),
    CONSTRAINT [FK_BookingTransactions_Boardinghouses_BoardinghouseId] FOREIGN KEY ([BoardinghouseId]) REFERENCES [dbo].[Boardinghouses] ([BoardinghouseId])
);


GO
CREATE NONCLUSTERED INDEX [IX_BookingTransactions_BoardinghouseId]
    ON [dbo].[BookingTransactions]([BoardinghouseId] ASC);

