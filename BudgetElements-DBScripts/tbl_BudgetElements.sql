USE [CRUDDB]
GO

/****** Object:  Table [dbo].[BudgetElements]    Script Date: 11/2/2020 2:50:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BudgetElements](
	[ElementID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Comments] [varchar](50) NULL,
	[Amount] [int] NOT NULL,
	[CreatedUser] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedUser] [varchar](50) NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_BudgetElements] PRIMARY KEY CLUSTERED 
(
	[ElementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[BudgetElements] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[BudgetElements] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO


