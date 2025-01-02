CREATE TABLE [dbo].[ClientRequests]
(
	[ClientRequestId] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    [BoardinghouseId] INT NOT NULL,
    [ClientId]        NVARCHAR(450) NOT NULL,
    [RequestDate]     DATETIME NOT NULL DEFAULT GETDATE(),
    [Status]          NVARCHAR(50) NOT NULL DEFAULT 'Pending',
    [Message]         NVARCHAR(MAX) NULL,
    CONSTRAINT [FK_ClientRequests_BoardingHouses] FOREIGN KEY ([BoardinghouseId]) REFERENCES [dbo].[BoardingHouses]([BoardinghouseId]),
    CONSTRAINT [FK_ClientRequests_AspNetUsers_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[AspNetUsers]([Id])
);
go
CREATE NONCLUSTERED INDEX [IX_ClientRequests_BoardinghouseId]
    ON [dbo].[ClientRequests]([BoardinghouseId]);
go
CREATE NONCLUSTERED INDEX [IX_ClientRequests_ClientId]
    ON [dbo].[ClientRequests]([ClientId]);
