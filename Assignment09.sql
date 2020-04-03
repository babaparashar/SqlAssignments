CREATE TABLE [dbo].[NewStudent](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[AdmitDate] [date] NOT NULL,
 CONSTRAINT [PK_NewStudent] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

1. 
SELECT * FROM NewStudent WHERE Surname="Shah";


2. 
SELECT * FROM NewStudent WHERE Gender="Male";


3. 
SELECT * FROM NewStudent WHERE Gender="Female" and Surname="Patel" or AdmitDate > 01/01/2006;


4. 
SELECT * FROM NewStudent WHERE MiddleName LIKE '%Bhai';


5. 
SELECT * FROM NewStudent WHERE FirstName LIKE 'M%' AND MiddleName LIKE '%ant%';


6. 
SELECT * FROM NewStudent WHERE Surname LIKE"__c%";


7. 
SELECT CONCAT(FirstName," ", SUBSTRING(MiddleName, 1, 1),'.'," ",Surname) AS FullNames FROM NewStudent;

8. 
SELECT FirstName,LENGTH(FirstName) as FirstNameLength FROM NewStudent;


9. 
UPDATE NewStudent SET FirstName=CONCATE(FirstName,"bhai") WHERE Gender="Male" AND FirstName=(SELECT FirstName FROM NewStudent WHERE FirstName not like '%bhai');

10. 
SELECT CONCATE("Mr.",FristName) FROM NewStudent WHERE Gender="Male";


11. 
SELECT FirstName FROM NewStudent WHERE FirstName="Mira";