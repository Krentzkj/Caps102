CREATE TABLE [dbo].[Amenities] (
    [AmenityId]       INT             IDENTITY (1, 1) NOT NULL,
    [BoardinghouseId] INT             NOT NULL,
    [Name]            NVARCHAR (255)  NOT NULL,
    [Price]           DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_Amenities] PRIMARY KEY CLUSTERED ([AmenityId] ASC),
    CONSTRAINT [FK_Amenities_BoardingHouses_BoardinghouseId] FOREIGN KEY ([BoardinghouseId]) REFERENCES [dbo].[BoardingHouses] ([BoardinghouseId])
);


GO
CREATE NONCLUSTERED INDEX [IX_Amenities_BoardinghouseId]
    ON [dbo].[Amenities]([BoardinghouseId] ASC);

