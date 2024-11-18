CREATE TABLE [dbo].[services] (
    [Id]       INT             IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (MAX)  NOT NULL,
    [Price]    DECIMAL (18, 2) NOT NULL,
    [TenantId] NVARCHAR (450)  NOT NULL,
    CONSTRAINT [PK_services] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_services_AspNetUsers_TenantId] FOREIGN KEY ([TenantId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_services_TenantId]
    ON [dbo].[services]([TenantId] ASC);

