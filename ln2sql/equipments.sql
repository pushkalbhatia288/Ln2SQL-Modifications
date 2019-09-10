
CREATE TABLE `Equipments` (
	`Id` int NOT NULL IDENTITY(1,1),
	`Notes` nvarchar(1073741823),
	`Quantity` int,
	`Name` nvarchar(1073741823),
	`NavigationCode` nvarchar(1073741823),
	`EquipmentType_Id` int NOT NULL,
	`Room_Id` int,
	`Active` bit,
	`SerialNumber` varchar(2147483647),
	`InstalledDate` datetime,
	`ModifiedOn` datetime DEFAULT (getdate()) NOT NULL,
	`ModifiedById` int DEFAULT ((0)) NOT NULL,
	`CreatedOn` datetime DEFAULT (getdate()) NOT NULL,
	`CreatedById` int DEFAULT ((0)) NOT NULL,
	`DeactivatedOn` datetime,
	`DeactivatedById` int,

ALTER TABLE `Equipments`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `EquipmentType_Id` (`EquipmentType_Id`);

