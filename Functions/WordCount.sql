CREATE FUNCTION dbo.WordCount (@String NVARCHAR(MAX))
RETURNS INT
AS
BEGIN
    RETURN LEN(@String) - LEN(REPLACE(@String, ' ', '')) + 1
END;
-- SELECT dbo.WordCount('This is a test string'); -- Результат: 5
