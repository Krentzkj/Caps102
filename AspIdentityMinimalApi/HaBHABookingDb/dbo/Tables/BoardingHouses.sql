CREATE TABLE [dbo].[BoardingHouses] (
    [BoardinghouseId] INT             IDENTITY (1, 1) NOT NULL,
    [RoomNumber]      INT             NULL,
    [RoomSize]        INT             NULL,
    [PricePerMonth]   DECIMAL (18, 2) NULL,
    [IsAvailble]      BIT             NOT NULL,
    [Descriptions]    NVARCHAR (MAX)  NULL,
    [OwnerId]        NVARCHAR (450)  NULL,
    CONSTRAINT [PK_BoardingHouses] PRIMARY KEY CLUSTERED ([BoardinghouseId] ASC),
    CONSTRAINT [FK_BoardingHouses_AspNetUsers_UserId] FOREIGN KEY ([OwnerId]) REFERENCES [dbo].[AspNetUsers] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_BoardingHouses_UserId]
    ON [dbo].[BoardingHouses]([OwnerId] ASC);

