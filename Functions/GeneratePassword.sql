CREATE FUNCTION dbo.GeneratePassword (@Length INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Password NVARCHAR(MAX) = ''
    DECLARE @Characters NVARCHAR(MAX) = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*'
    DECLARE @Index INT

    WHILE LEN(@Password) < @Length
    BEGIN
        SET @Index = ABS(CHECKSUM(NEWID())) % LEN(@Characters) + 1
        SET @Password = @Password + SUBSTRING(@Characters, @Index, 1)
    END

    RETURN @Password
END;

--SELECT dbo.GeneratePassword(12); -- Результат: случайный пароль из 12 символов
