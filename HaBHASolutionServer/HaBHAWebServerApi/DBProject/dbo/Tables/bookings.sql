CREATE TABLE [dbo].[bookings] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [UserId]     NVARCHAR (450) NOT NULL,
    [ServiceId]  NVARCHAR (MAX) NOT NULL,
    [ServiceId1] INT            NOT NULL,
    [Date]       DATETIME2 (7)  NOT NULL,
    [Status]     NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_bookings] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_bookings_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_bookings_services_ServiceId1] FOREIGN KEY ([ServiceId1]) REFERENCES [dbo].[services] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_bookings_ServiceId1]
    ON [dbo].[bookings]([ServiceId1] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_bookings_UserId]
    ON [dbo].[bookings]([UserId] ASC);

