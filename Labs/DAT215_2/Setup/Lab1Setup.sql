CREATE SCHEMA Reports;
GO

/*Challenge 1 */
CREATE PROC Reports.GetProductColors
AS
BEGIN
     
      SELECT DISTINCT Color
      FROM SalesLT.Product
      WHERE Color is NOT NULL


END



CREATE PROC Reports.GetProductsAndModels
AS
BEGIN
       SELECT ProductID, Name, ProductNumber, SellStartDate,SellEndDate,Color  
       FROM SalesLT.Product
       Order by ProductID
       
       SELECT ProductModelID 
       FROM SalesLT.ProductModel
       Order by ProductModelID
       
       SELECT Description  
       FROM SalesLT.ProductDescription



END


/* Challenge 2 */

CREATE PROC Reports.GetProductsByColor @Color nvarchar(10)
AS
BEGIN
      
         
		    SELECT ProductID, Name, ListPrice  as Price, Color, Size 
		    FROM SalesLT.Product
		     WHERE Color = @Color
		    Order by Name
        

	 if( @Color is NULL)
		 BEGIN
		      SELECT ProductID, Name, ListPrice  as Price, Color, Size 
		      FROM SalesLT.Product
		      WHERE Color is NULL
		      Order by Name
    END

END

