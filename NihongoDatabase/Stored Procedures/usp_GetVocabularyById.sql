CREATE PROCEDURE [dbo].[usp_GetVocabularyById]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [Id],
           [English],
           [Kana],
           [Kanji],
           [CreatedBy],
           [CreatedDate],
           [ModifiedBy],
           [ModifiedDate],
           [IsDeleted]
    FROM [Vocabulary]
    WHERE [Id] = @Id
      AND [IsDeleted] = 0;
END
