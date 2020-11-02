USE [CRUDDB]
GO

/****** Object:  StoredProcedure [dbo].[ElementsDeleteByID]    Script Date: 11/2/2020 2:52:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ElementsDeleteByID]
@ElementID int
AS
	BEGIN
	DELETE FROM BudgetElements
	WHERE ElementID = @ElementID
	END

GO


