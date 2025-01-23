CREATE FUNCTION dbo.SplitString
(
    @String NVARCHAR(MAX),
    @Delimiter CHAR(1)
)
RETURNS @ResultTable TABLE (Value NVARCHAR(MAX))
AS
BEGIN
    DECLARE @Start INT, @End INT
    SET @Start = 1

    WHILE CHARINDEX(@Delimiter, @String, @Start) > 0
    BEGIN
        SET @End = CHARINDEX(@Delimiter, @String, @Start)
        INSERT INTO @ResultTable(Value) VALUES(SUBSTRING(@String, @Start, @End - @Start))
        SET @Start = @End + 1
    END

    INSERT INTO @ResultTable(Value) VALUES(SUBSTRING(@String, @Start, LEN(@String) - @Start + 1))
    RETURN
END
