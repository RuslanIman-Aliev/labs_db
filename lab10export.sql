-- Adminer 4.8.1 MySQL 9.1.0 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `Connection_Types`;
CREATE TABLE `Connection_Types` (
  `Connection_Type_ID` int NOT NULL AUTO_INCREMENT,
  `Type_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Connection_Type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Connection_Types` (`Connection_Type_ID`, `Type_Name`) VALUES
(1,	'Двойной'),
(2,	'Тройной');

DROP TABLE IF EXISTS `Connections`;
CREATE TABLE `Connections` (
  `Connection_ID` int NOT NULL AUTO_INCREMENT,
  `Connection_Type_ID` int DEFAULT NULL,
  PRIMARY KEY (`Connection_ID`),
  KEY `Connection_Type_ID` (`Connection_Type_ID`),
  CONSTRAINT `Connections_ibfk_1` FOREIGN KEY (`Connection_Type_ID`) REFERENCES `Connection_Types` (`Connection_Type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Connections` (`Connection_ID`, `Connection_Type_ID`) VALUES
(1,	1),
(2,	2);

DROP TABLE IF EXISTS `Connections_Stations`;
CREATE TABLE `Connections_Stations` (
  `Connection_ID` int NOT NULL,
  `Station_ID` int NOT NULL,
  `Position` int DEFAULT NULL,
  PRIMARY KEY (`Connection_ID`,`Station_ID`),
  KEY `Station_ID` (`Station_ID`),
  CONSTRAINT `Connections_Stations_ibfk_1` FOREIGN KEY (`Connection_ID`) REFERENCES `Connections` (`Connection_ID`),
  CONSTRAINT `Connections_Stations_ibfk_2` FOREIGN KEY (`Station_ID`) REFERENCES `Stations` (`Station_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Connections_Stations` (`Connection_ID`, `Station_ID`, `Position`) VALUES
(1,	1,	1),
(1,	3,	2),
(2,	2,	1),
(2,	5,	2),
(2,	6,	3);

DROP TABLE IF EXISTS `Line_Transfers`;
CREATE TABLE `Line_Transfers` (
  `Transfer_ID` int NOT NULL AUTO_INCREMENT,
  `From_Line_ID` int DEFAULT NULL,
  `To_Line_ID` int DEFAULT NULL,
  `Station_ID` int DEFAULT NULL,
  PRIMARY KEY (`Transfer_ID`),
  KEY `From_Line_ID` (`From_Line_ID`),
  KEY `To_Line_ID` (`To_Line_ID`),
  KEY `Station_ID` (`Station_ID`),
  CONSTRAINT `Line_Transfers_ibfk_1` FOREIGN KEY (`From_Line_ID`) REFERENCES `Lines` (`Line_ID`),
  CONSTRAINT `Line_Transfers_ibfk_2` FOREIGN KEY (`To_Line_ID`) REFERENCES `Lines` (`Line_ID`),
  CONSTRAINT `Line_Transfers_ibfk_3` FOREIGN KEY (`Station_ID`) REFERENCES `Stations` (`Station_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Line_Transfers` (`Transfer_ID`, `From_Line_ID`, `To_Line_ID`, `Station_ID`) VALUES
(1,	1,	2,	1),
(2,	2,	3,	3),
(3,	1,	3,	2);

DROP TABLE IF EXISTS `Lines`;
CREATE TABLE `Lines` (
  `Line_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Line_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Lines` (`Line_ID`, `Name`, `Color`) VALUES
(1,	'Линия 1',	'Red'),
(2,	'Линия 2',	'Blue'),
(3,	'Линия 3',	'Green');

DROP TABLE IF EXISTS `Stations`;
CREATE TABLE `Stations` (
  `Station_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Line_ID` int DEFAULT NULL,
  `City` varchar(100) NOT NULL,
  `Coordinates` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Station_ID`),
  KEY `Line_ID` (`Line_ID`),
  CONSTRAINT `Stations_ibfk_1` FOREIGN KEY (`Line_ID`) REFERENCES `Lines` (`Line_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `Stations` (`Station_ID`, `Name`, `Line_ID`, `City`, `Coordinates`) VALUES
(1,	'Станция 1',	1,	'Город X',	'50.4501, 30.5234'),
(2,	'Станция 2',	1,	'Город X',	'50.4511, 30.5244'),
(3,	'Станция 3',	2,	'Город X',	'50.4521, 30.5254'),
(4,	'Станция 4',	2,	'Город X',	'50.4531, 30.5264'),
(5,	'Станция 5',	3,	'Город X',	'50.4541, 30.5274'),
(6,	'Станция 6',	3,	'Город X',	'50.4551, 30.5284');

-- 2024-11-26 23:54:39