CREATE TABLE IF NOT EXISTS `users` (
	`firstname` VARCHAR(50) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
	`lastname` VARCHAR(50) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
	`dateofbirth` VARCHAR(25) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
	`sex` VARCHAR(10) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
	`cd_identity` LONGTEXT NULL DEFAULT '{"placeofbirth":"Los Santos","dateofissue":"01/01/2021","dateofexpiry":"01/01/2031","nationality":"USA"}' COLLATE 'utf8mb4_bin'
)
COLLATE='utf8mb4_bin'
ENGINE=InnoDB
;

ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `firstname` VARCHAR(50) NULL DEFAULT '' COLLATE 'utf8mb4_bin';
ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `lastname` VARCHAR(50) NULL DEFAULT '' COLLATE 'utf8mb4_bin';
ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `dateofbirth` VARCHAR(25) NULL DEFAULT '' COLLATE 'utf8mb4_bin';
ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `sex` VARCHAR(10) NULL DEFAULT '' COLLATE 'utf8mb4_bin';
ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `cd_identity` LONGTEXT NULL DEFAULT '{"placeofbirth":"Los Santos","dateofissue":"01/01/2021","dateofexpiry":"01/01/2031","nationality":"USA"}' COLLATE 'utf8mb4_bin';