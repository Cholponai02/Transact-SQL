CREATE FUNCTION dbo.DateDifference (@StartDate DATE, @EndDate DATE)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @Years INT = DATEDIFF(YEAR, @StartDate, @EndDate) - 
                         CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, @StartDate, @EndDate), @StartDate) > @EndDate THEN 1 ELSE 0 END;
    DECLARE @Months INT = DATEDIFF(MONTH, DATEADD(YEAR, @Years, @StartDate), @EndDate) -
                          CASE WHEN DATEADD(MONTH, DATEDIFF(MONTH, DATEADD(YEAR, @Years, @StartDate), @EndDate), DATEADD(YEAR, @Years, @StartDate)) > @EndDate THEN 1 ELSE 0 END;
    DECLARE @Days INT = DATEDIFF(DAY, DATEADD(MONTH, @Months, DATEADD(YEAR, @Years, @StartDate)), @EndDate);

    RETURN CAST(@Years AS NVARCHAR) + ' years, ' + 
           CAST(@Months AS NVARCHAR) + ' months, ' + 
           CAST(@Days AS NVARCHAR) + ' days'
END;

-- SELECT dbo.DateDifference('2020-01-01', '2025-01-23');
-- Результат: 5 years, 0 months, 22 days
