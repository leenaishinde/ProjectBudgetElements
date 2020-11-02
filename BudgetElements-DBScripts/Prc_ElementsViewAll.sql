USE [CRUDDB]
GO

/****** Object:  StoredProcedure [dbo].[ElementsViewAll]    Script Date: 11/2/2020 2:53:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ElementsViewAll]
AS
	BEGIN
	SELECT ElementID,Name,Comments,Amount,ModifiedUser
	FROM BudgetElements
	END

GO


