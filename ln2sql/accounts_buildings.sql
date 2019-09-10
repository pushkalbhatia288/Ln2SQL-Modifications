CREATE TABLE `Accounts` (
	`Id` int NOT NULL IDENTITY(1,1),
	`[Number]` nvarchar(1073741823),
	`Name` nvarchar(1073741823),
	`Description` nvarchar(1073741823),
	`Active` bit DEFAULT ((1)),
	`Notes` nvarchar(1073741823),
	`ReportLogo` nvarchar(1073741823),
	`AllowNegativeInventory` bit DEFAULT ((1)) NOT NULL,
	`RequireCompletedWorkOrderEffort` bit DEFAULT ((0)) NOT NULL,
	`RequireWorkOrderGroup` bit DEFAULT ((0)) NOT NULL,
	`RequireWorkOrderRequestorPhoneEmail` bit DEFAULT ((0)) NOT NULL,
	`AllowWorkOrderTaskCustomOrderLabels` bit NOT NULL,
	`DisplayRoomInteriors` bit DEFAULT ((1)) NOT NULL,
	`AllowMonitorWorkOrderCreateNotification` bit DEFAULT ((1)) NOT NULL,
	`BasEnabled` bit DEFAULT ((0)) NOT NULL,
	`BasEmailedAlarmEmailPrefix` nvarchar(1073741823),
	`BasCloudKey` uniqueidentifier,
	`BasCloudPassword` nvarchar(1073741823),
	`PasswordAgeLimit` int,
	`InvalidPasswordAttemptLimit` int,
	`PastActivityPasswordLimit` int,
	`PasswordRule` nvarchar(1073741823),
	`AllowWorkOrderRequestorUrgentOption` bit DEFAULT ((0)) NOT NULL,
	`ModifiedOn` datetime DEFAULT (getdate()) NOT NULL,
	`ModifiedById` int DEFAULT ((0)) NOT NULL,
	`CreatedOn` datetime DEFAULT (getdate()) NOT NULL,
	`CreatedById` int DEFAULT ((0)) NOT NULL,
	`AllowWorkOrderRequestorImageCustomProperty` bit DEFAULT ((0)) NOT NULL,
	`RoomView1` nvarchar(50),
	`RoomView2` nvarchar(50),
	`RoomView3` nvarchar(50),
	`RoomView5` nvarchar(1073741823),
	`RoomView6` nvarchar(1073741823),
	`RoomView4` nvarchar(1073741823),

ALTER TABLE `Accounts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`);

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
  ADD KEY `Account_Id` (`Account_Id`);

ALTER TABLE `Buildings`
  ADD CONSTRAINT `Buildings_ibfk_1` FOREIGN KEY (`Account_Id`) REFERENCES `Accounts` (`Id`);
