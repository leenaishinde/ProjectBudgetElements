USE [CRUDDB]
GO

/****** Object:  StoredProcedure [dbo].[ElementsViewByID]    Script Date: 11/2/2020 2:54:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ElementsViewByID]
@ElementID int
As
	BEGIN
	SELECT ElementID,Name,Comments,Amount,ModifiedUser
	FROM BudgetElements
	WHERE ElementID = @ElementID
	END


GO


