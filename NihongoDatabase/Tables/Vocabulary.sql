CREATE TABLE [dbo].[Vocabulary]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[English] VARCHAR(512) NOT NULL,
	[Kana] NVARCHAR(512) NOT NULL,
	[Kanji] NVARCHAR(512) NULL,
	[CreatedBy] NVARCHAR(512) NOT NULL,
	[CreatedDate] DATETIME NOT NULL,
	[ModifiedBy] NVARCHAR(512) NULL,
	[ModifiedDate] DATETIME NULL,
	[IsDeleted] BIT NOT NULL DEFAULT(0)
)
