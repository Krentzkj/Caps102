CREATE TABLE [dbo].[Blogs] (
    [BlogId]          INT            IDENTITY (1, 1) NOT NULL,
    [BlogTitle]       NVARCHAR (MAX) NOT NULL,
    [BlogDescription] NVARCHAR (MAX) NOT NULL,
    [BlogAuthor]      NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED ([BlogId] ASC)
);

