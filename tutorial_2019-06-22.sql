# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.40-MariaDB)
# Database: tutorial
# Generation Time: 2019-06-22 04:57:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Content` mediumtext,
  `Image` varchar(255) DEFAULT NULL,
  `StatId` int(11) DEFAULT NULL,
  `Remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(18) NOT NULL DEFAULT '0',
  `Authkey` varchar(32) NOT NULL DEFAULT '0',
  `Password` varchar(255) NOT NULL DEFAULT '0',
  `PasswordResetToken` varchar(255) NOT NULL DEFAULT '0',
  `Email` varchar(255) NOT NULL DEFAULT '0',
  `Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LastUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `LastIP` varchar(24) NOT NULL DEFAULT '0',
  `LastLogin` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `PrivId` int(11) NOT NULL DEFAULT '0',
  `Remark` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Authkey` (`Authkey`),
  UNIQUE KEY `Email` (`Email`),
  KEY `FK_user_user_priviledges` (`PrivId`),
  CONSTRAINT `FK_user_user_priviledges` FOREIGN KEY (`PrivId`) REFERENCES `user_priviledges` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`Id`, `Username`, `Authkey`, `Password`, `PasswordResetToken`, `Email`, `Created`, `LastUpdate`, `LastIP`, `LastLogin`, `Enabled`, `PrivId`, `Remark`)
VALUES
	(1,'admin','fuRlpoMTiOAq-8yoErh2VwWB7bmXIOB8','$2y$13$HB4sUmrDWqRgGeUJ9uAYs.vmfxiDq5a9rJLEPPIYuT5PxruNxCYVa','0','quantumbenny@gmail.com','2018-07-06 03:29:16','2019-06-18 21:16:06','0','2019-06-18 21:16:06',1,1,'');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_priviledges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_priviledges`;

CREATE TABLE `user_priviledges` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Priviledges` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `user_priviledges` WRITE;
/*!40000 ALTER TABLE `user_priviledges` DISABLE KEYS */;

INSERT INTO `user_priviledges` (`Id`, `Priviledges`)
VALUES
	(1,'Super Admin'),
	(2,'Admin'),
	(3,'User');

/*!40000 ALTER TABLE `user_priviledges` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
