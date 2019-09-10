
CREATE TABLE `EquipmentTypes` (
	`Id` int NOT NULL IDENTITY(1,1),
	`Make` nvarchar(1073741823),
	`Model_` nvarchar(1073741823),
	`Description` nvarchar(1073741823),
	`Warranty` nvarchar(1073741823),
	`Notes` nvarchar(1073741823),
	`SpecSheet` nvarchar(1073741823),
	`Vendor_Id` int,
	`SubContractor_Id` int,
	`ServiceProvider_Id` int,
	`Code` nvarchar(1073741823),
	`Category` nvarchar(1073741823),
	`SystemType` nvarchar(1073741823),
	`Active` bit,
	`AccountId` int,
	`ExpectedLife` float,
	`ReplacementCost` float,
	`ModifiedOn` datetime DEFAULT (getdate()) NOT NULL,
	`ModifiedById` int DEFAULT ((0)) NOT NULL,
	`CreatedOn` datetime DEFAULT (getdate()) NOT NULL,
	`CreatedById` int DEFAULT ((0)) NOT NULL,

ALTER TABLE `EquipmentTypes`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`);

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

ALTER TABLE `Equipments`
  ADD CONSTRAINT `Equipments_ibfk_1` FOREIGN KEY (`EquipmentType_Id`) REFERENCES `EquipmentTypes` (`Id`);
