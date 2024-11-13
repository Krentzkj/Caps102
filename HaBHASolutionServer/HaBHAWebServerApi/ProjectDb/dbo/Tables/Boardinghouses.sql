CREATE TABLE [dbo].[Boardinghouses] (
    [BoardinghouseId] INT             IDENTITY (1, 1) NOT NULL,
    [RoomNumber]      INT             NULL,
    [RoomSize]        INT             NULL,
    [PricePerMonth]   DECIMAL (18, 2) NULL,
    [Descriptions]    NVARCHAR (MAX)  NULL,
    [Amenities]       NVARCHAR (MAX)  NULL,
    [ByteBase64]      NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_Boardinghouses] PRIMARY KEY CLUSTERED ([BoardinghouseId] ASC)
);

