CREATE TABLE [dbo].[BoardingHouses] (
    [BoardinghouseId] INT             IDENTITY (1, 1) NOT NULL,
    [RoomNumber]      INT             NULL,
    [RoomSize]        INT             NULL,
    [PricePerMonth]   DECIMAL (18, 2) NULL,
    [IsAvailble]      BIT             NOT NULL,
    [Descriptions]    NVARCHAR (MAX)  NULL,
    [TenantId]        NVARCHAR (450)  NULL,
    CONSTRAINT [PK_BoardingHouses] PRIMARY KEY CLUSTERED ([BoardinghouseId] ASC),
    CONSTRAINT [FK_BoardingHouses_AspNetUsers_TenantId] FOREIGN KEY ([TenantId]) REFERENCES [dbo].[AspNetUsers] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_BoardingHouses_TenantId]
    ON [dbo].[BoardingHouses]([TenantId] ASC);

