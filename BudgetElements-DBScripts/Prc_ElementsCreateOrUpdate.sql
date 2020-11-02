USE [CRUDDB]
GO

/****** Object:  StoredProcedure [dbo].[ElementsCreateOrUpdate]    Script Date: 11/2/2020 2:52:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ElementsCreateOrUpdate]
@ElementID int,
@Name varchar(50),
@Comments varchar(50),
@Amount int,
@CreatedUser varchar(50),
@ModifiedUser varchar(50)
AS
BEGIN
IF(@ElementID=0)
	BEGIN
	INSERT INTO BudgetElements(Name,Comments,Amount,CreatedUser,ModifiedUser)
	VALUES(@Name,@Comments,@Amount,@CreatedUser,@ModifiedUser)
	END
ELSE
	BEGIN
	UPDATE BudgetElements
	SET
		Name = @Name,
		Comments = @Comments,
		Amount = @Amount,
		ModifiedUser = @ModifiedUser
	WHERE ElementID= @ElementID
	END

END


GO


