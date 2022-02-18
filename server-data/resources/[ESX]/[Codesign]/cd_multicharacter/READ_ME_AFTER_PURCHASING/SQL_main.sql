CREATE TABLE IF NOT EXISTS `user_lastcharacter` (
	`steamid` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`charid` INT(11) NOT NULL,
	`max_chars` INT(10) NULL DEFAULT '5'
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

ALTER TABLE `user_lastcharacter` ADD COLUMN IF NOT EXISTS `max_chars` INT(10) NULL DEFAULT '5';
ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `phone_number` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb4_bin';