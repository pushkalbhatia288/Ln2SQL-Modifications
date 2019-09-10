CREATE TABLE `Buildings` (
	`Id` int NOT NULL IDENTITY(1,1),
	`Name` nvarchar(1073741823),
	`Description` nvarchar(1073741823),
	`ProjectCode` nvarchar(1073741823),
	`Notes` nvarchar(1073741823),
	`BuildingCode` nvarchar(1073741823),
	`Account_Id` int,
	`Address_Id` int,
	`[Image]` nvarchar(1073741823),
	`SqFootage` int,
	`Active bit`,
	`ModifiedOn` datetime DEFAULT (getdate()) NOT NULL,
	`ModifiedById` int DEFAULT ((0)) NOT NULL,
	`CreatedOn` datetime DEFAULT (getdate()) NOT NULL,
	`CreatedById` int DEFAULT ((0)) NOT NULL)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `Buildings`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`);
