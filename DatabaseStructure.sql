-- --------------------------------------------------------
-- Host:                         msd4da06-1.sgw1.de1-1.stackit.de
-- Server Version:               10.1.48-MariaDB - Source distribution
-- Server Betriebssystem:        Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Exportiere Struktur von Tabelle msd4da06.Bearbeitungszentrum
CREATE TABLE IF NOT EXISTS `Bearbeitungszentrum` (
  `ID` int(11) NOT NULL,
  `ID_Halle` int(11) DEFAULT NULL,
  `Maschine` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Maschine Nr.` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Baujahr` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Reinigungsverfahren_ID` int(11) DEFAULT NULL,
  `Material` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KSS-Typ` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `FK_BZ_Halle` (`ID_Halle`),
  KEY `FK_BZ_Reinigungsverfahren` (`Reinigungsverfahren_ID`),
  CONSTRAINT `FK_BZ_Halle` FOREIGN KEY (`ID_Halle`) REFERENCES `Halle` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle msd4da06.Halle
CREATE TABLE IF NOT EXISTS `Halle` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `Bezeichnung` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle msd4da06.Messung_genau
CREATE TABLE IF NOT EXISTS `Messung_genau` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Sensor_ID` bigint(20) DEFAULT NULL,
  `Zeitstempel` datetime DEFAULT NULL,
  `Messwert` double DEFAULT NULL,
  `Flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `FK_MG_Sensor` (`Sensor_ID`),
  CONSTRAINT `FK_MG_Sensor` FOREIGN KEY (`Sensor_ID`) REFERENCES `Sensor` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=268374 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle msd4da06.Objekt
CREATE TABLE IF NOT EXISTS `Objekt` (
  `﻿ID` int(11) NOT NULL,
  `ID_Original` int(11) NOT NULL,
  `Objekt_Typ` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle msd4da06.Reinigungsanlage
CREATE TABLE IF NOT EXISTS `Reinigungsanlage` (
  `ID` int(11) NOT NULL,
  `Bearbeitungszentrum_ID` int(11) NOT NULL,
  `Bezeichnung` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Wannengröße (Liter)` int(11) DEFAULT NULL,
  `Systemmenge` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_RA_Bearbeitungszentrum` (`Bearbeitungszentrum_ID`),
  CONSTRAINT `FK_RA_Bearbeitungszentrum` FOREIGN KEY (`Bearbeitungszentrum_ID`) REFERENCES `Bearbeitungszentrum` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle msd4da06.Reinigungsverfahren
CREATE TABLE IF NOT EXISTS `Reinigungsverfahren` (
  `ID` int(11) NOT NULL,
  `Reinigungsverfahren` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle msd4da06.Sensor
CREATE TABLE IF NOT EXISTS `Sensor` (
  `ID` bigint(20) NOT NULL,
  `Objekt_ID` int(11) NOT NULL,
  `Messgröße` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Einheit` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Flag_Manuell` tinyint(4) DEFAULT NULL,
  `Gerät_ID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Daten Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle msd4da06.Speicher
CREATE TABLE IF NOT EXISTS `Speicher` (
  `﻿ID` int(11) NOT NULL,
  `Halle_ID` int(11) NOT NULL,
  `Bezeichnung` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Volumen (L)` float NOT NULL,
  `KSS-Typ` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Hoehe (cm)` int(11) DEFAULT NULL,
  `Breite (cm)` int(11) DEFAULT NULL,
  `Tiefe (cm)` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Daten Export vom Benutzer nicht ausgewählt

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
