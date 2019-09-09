CREATE PROCEDURE [dbo].[usp_GetAllVocabularies]
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
    WHERE [IsDeleted] = 0;
END
