CREATE FUNCTION dbo.IsPalindrome (@String NVARCHAR(MAX))
RETURNS BIT
AS
BEGIN
    DECLARE @Reversed NVARCHAR(MAX) = REVERSE(@String)
    RETURN CASE WHEN @String = @Reversed THEN 1 ELSE 0 END
END;

-- SELECT dbo.IsPalindrome('level'); -- Результат: 1 (истина)
-- SELECT dbo.IsPalindrome('test');  -- Результат: 0 (ложь)
