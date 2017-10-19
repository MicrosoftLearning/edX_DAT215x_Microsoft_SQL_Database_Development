--Challenge 1
--Create Reports.GetProductColors Procedure

CREATE PROCEDURE Reports.GetProductColors
AS
SET NOCOUNT ON;
BEGIN
SELECT DISTINCT p.Color
FROM SalesLT.Product AS p
WHERE p.Color IS NOT NULL
ORDER BY p.Color;
END
GO

--Execute Procedure

EXEC Reports.GetProductColors;
GO

--Create Reports.GetProductAndModels Procedure

CREATE PROCEDURE Reports.GetProductsAndModels
AS
SET NOCOUNT ON;
BEGIN
SELECT p.ProductID,
       p.Name,
       p.ProductNumber,
       p.SellStartDate,
       p.SellEndDate,
       p.Color,
       pm.ProductModelID,
       pd.Description
FROM SalesLT.Product AS p
LEFT JOIN SalesLT.ProductModel AS pm
ON p.ProductModelID = pm.ProductModelID
LEFT JOIN SalesLT.ProductModelProductDescription AS pmpd
ON pm.ProductModelID = pmpd.ProductModelID 
LEFT JOIN SalesLT.ProductDescription AS pd
ON pm.ProductModelID = pmpd.ProductModelID 
ORDER BY p.ProductID,pm.ProductModelID;
END
GO

--Execute Procedure


EXEC Reports.GetProductsAndModels;
GO

--Challenge 2
--Create the Reports.GetProductsByColor Procedure

CREATE PROCEDURE Reports.GetProductsByColor
@Color nvarchar(16)
AS
SET NOCOUNT ON;
BEGIN
SELECT p.ProductID,
p.Name,
p.ListPrice AS Price,
p.Color,
p.Size
FROM SalesLT.Product AS p
WHERE (p.Color = @Color) OR (p.Color IS NULL AND @Color IS NULL)
ORDER BY Name;
END
GO

--Execute Procedure

EXEC Reports.GetProductsByColor 'Blue';
GO
EXEC Reports.GetProductsByColor NULL;
GO
