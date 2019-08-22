PRINT (N'Executing Migration-Vocabulary')
GO

BEGIN TRANSACTION [MigrationVocabulary]

    CREATE TABLE [#tVocabulary]
    (
        [English] VARCHAR(512)  NOT NULL,
        [Kana]    NVARCHAR(512) NOT NULL,
        [Kanji]   NVARCHAR(512) NULL
    )

    INSERT INTO [#tVocabulary] ([English], [Kana], [Kanji])
    VALUES ('Book', N'ほん', N'本');

    MERGE [dbo].[Vocabulary] [destination]
    USING [#tVocabulary] [source]
    ON [source].[English] = [destination].[English]
    WHEN NOT MATCHED BY TARGET
        THEN
        INSERT ([English], [Kana], [Kanji], [CreatedBy], [CreatedDate])
        VALUES ([source].[English], [source].[Kana], [source].[Kanji], 'system', GETUTCDATE());

    DROP TABLE [#tVocabulary]

COMMIT TRANSACTION [MigrationVocabulary]