PRINT (N'Executing Migration-Vocabulary')
GO

BEGIN TRANSACTION [MigrationVocabulary]

    CREATE TABLE [#tVocabulary]
    (
        [Id]      INT           NOT NULL,
        [English] VARCHAR(512)  NOT NULL,
        [Kana]    NVARCHAR(512) NOT NULL,
        [Kanji]   NVARCHAR(512) NULL
    )

    INSERT INTO [#tVocabulary] ([Id], [English], [Kana], [Kanji])
    VALUES (1, 'Book', N'ほん', N'本'),
    (2, 'Alcohol', N'さけ', N'酒');

    MERGE [dbo].[Vocabulary] [destination]
    USING [#tVocabulary] [source]
    ON [source].[Id] = [destination].[Id]
    WHEN NOT MATCHED
        THEN
        INSERT ([Id], [English], [Kana], [Kanji], [CreatedBy], [CreatedDate])
        VALUES ([source].[Id], [source].[English], [source].[Kana], [source].[Kanji], 'system', GETUTCDATE());

    DROP TABLE [#tVocabulary]

COMMIT TRANSACTION [MigrationVocabulary]