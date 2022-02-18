-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.17-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para es_extended
CREATE DATABASE IF NOT EXISTS `es_extended` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `es_extended`;

-- Volcando estructura para tabla es_extended.character_current
CREATE TABLE IF NOT EXISTS `character_current` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `steamid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `model` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drawables` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `props` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drawtextures` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proptextures` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4646 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.character_current: ~1 rows (aproximadamente)
DELETE FROM `character_current`;
/*!40000 ALTER TABLE `character_current` DISABLE KEYS */;
INSERT INTO `character_current` (`Id`, `steamid`, `model`, `drawables`, `props`, `drawtextures`, `proptextures`) VALUES
	(4645, 'Char1:4661697235f69697ed35515eb573362304c5dc30', '1885233650', '{"11":["jackets",3],"10":["decals",-1],"1":["masks",0],"0":["face",0],"3":["torsos",1],"2":["hair",14],"5":["bags",-1],"4":["legs",0],"7":["neck",-1],"6":["shoes",1],"9":["vest",-1],"8":["undershirts",0]}', '{"7":["braclets",-1],"6":["watches",-1],"1":["glasses",-1],"0":["hats",8],"3":["mouth",-1],"2":["earrings",-1],"5":["rhand",-1],"4":["lhand",-1]}', '[["face",0],["masks",0],["hair",0],["torsos",0],["legs",0],["bags",0],["shoes",2],["neck",0],["undershirts",0],["vest",0],["decals",0],["jackets",0]]', '[["hats",0],["glasses",-1],["earrings",-1],["mouth",-1],["lhand",-1],["rhand",-1],["watches",-1],["braclets",-1]]');
/*!40000 ALTER TABLE `character_current` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.character_face
CREATE TABLE IF NOT EXISTS `character_face` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `steamid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hairColor` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headBlend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headOverlay` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headStructure` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3868 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.character_face: ~1 rows (aproximadamente)
DELETE FROM `character_face`;
/*!40000 ALTER TABLE `character_face` DISABLE KEYS */;
INSERT INTO `character_face` (`Id`, `steamid`, `hairColor`, `headBlend`, `headOverlay`, `headStructure`) VALUES
	(3867, 'Char1:4661697235f69697ed35515eb573362304c5dc30', '[41,1]', '{"hasParent":false,"skinThird":0,"shapeThird":0,"skinFirst":15,"shapeFirst":1,"thirdMix":0.0,"shapeMix":0.0,"shapeSecond":4,"skinMix":0.0,"skinSecond":0}', '[{"colourType":0,"firstColour":0,"name":"Blemishes","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"colourType":1,"firstColour":0,"name":"FacialHair","overlayOpacity":0.0,"overlayValue":255,"secondColour":0},{"colourType":1,"firstColour":0,"name":"Eyebrows","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"colourType":0,"firstColour":0,"name":"Ageing","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"colourType":2,"firstColour":0,"name":"Makeup","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"colourType":2,"firstColour":0,"name":"Blush","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"colourType":0,"firstColour":0,"name":"Complexion","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"colourType":0,"firstColour":0,"name":"SunDamage","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"colourType":2,"firstColour":0,"name":"Lipstick","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"colourType":0,"firstColour":0,"name":"MolesFreckles","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"colourType":1,"firstColour":0,"name":"ChestHair","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"colourType":0,"firstColour":0,"name":"BodyBlemishes","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"colourType":0,"firstColour":0,"name":"AddBodyBlemishes","overlayOpacity":1.0,"overlayValue":255,"secondColour":0},{"name":"eyecolor","val":65535}]', '[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]');
/*!40000 ALTER TABLE `character_face` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.character_outfits
CREATE TABLE IF NOT EXISTS `character_outfits` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `steamid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slot` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `model` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drawables` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `props` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drawtextures` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proptextures` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hairColor` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12385 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.character_outfits: ~2 rows (aproximadamente)
DELETE FROM `character_outfits`;
/*!40000 ALTER TABLE `character_outfits` DISABLE KEYS */;
INSERT INTO `character_outfits` (`Id`, `steamid`, `name`, `slot`, `model`, `drawables`, `props`, `drawtextures`, `proptextures`, `hairColor`) VALUES
	(12383, 'Char1:4661697235f69697ed35515eb573362304c5dc30', 'Normal', '1', '1885233650', '{"1":["masks",0],"2":["hair",14],"3":["torsos",15],"4":["legs",0],"5":["bags",-1],"6":["shoes",1],"7":["neck",-1],"8":["undershirts",15],"9":["vest",-1],"10":["decals",-1],"11":["jackets",-1],"0":["face",0]}', '{"1":["glasses",-1],"2":["earrings",-1],"3":["mouth",-1],"4":["lhand",-1],"5":["rhand",-1],"6":["watches",-1],"7":["braclets",-1],"0":["hats",8]}', '[["face",0],["masks",0],["hair",0],["torsos",0],["legs",0],["bags",0],["shoes",2],["neck",0],["undershirts",0],["vest",0],["decals",0],["jackets",0]]', '[["hats",0],["glasses",-1],["earrings",-1],["mouth",-1],["lhand",-1],["rhand",-1],["watches",-1],["braclets",-1]]', '[41,1]'),
	(12384, 'Char1:4661697235f69697ed35515eb573362304c5dc30', 'Otro', '2', '1885233650', '{"1":["masks",0],"2":["hair",14],"3":["torsos",1],"4":["legs",0],"5":["bags",-1],"6":["shoes",1],"7":["neck",-1],"8":["undershirts",0],"9":["vest",-1],"10":["decals",-1],"11":["jackets",3],"0":["face",0]}', '{"1":["glasses",-1],"2":["earrings",-1],"3":["mouth",-1],"4":["lhand",-1],"5":["rhand",-1],"6":["watches",-1],"7":["braclets",-1],"0":["hats",8]}', '[["face",0],["masks",0],["hair",0],["torsos",0],["legs",0],["bags",0],["shoes",2],["neck",0],["undershirts",0],["vest",0],["decals",0],["jackets",0]]', '[["hats",0],["glasses",-1],["earrings",-1],["mouth",-1],["lhand",-1],["rhand",-1],["watches",-1],["braclets",-1]]', '[41,1]');
/*!40000 ALTER TABLE `character_outfits` ENABLE KEYS */;

-- Volcando estructura para tabla es_extended.playerstattoos
CREATE TABLE IF NOT EXISTS `playerstattoos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tattoos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4969 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla es_extended.playerstattoos: ~1 rows (aproximadamente)
DELETE FROM `playerstattoos`;
/*!40000 ALTER TABLE `playerstattoos` DISABLE KEYS */;
INSERT INTO `playerstattoos` (`id`, `identifier`, `tattoos`) VALUES
	(4968, 'Char1:4661697235f69697ed35515eb573362304c5dc30', '[[-1201369729,-1897002095],[-1201369729,-869824793],[-1201369729,-1820191335],[-240234547,-1431574022]]');
/*!40000 ALTER TABLE `playerstattoos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
