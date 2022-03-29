CREATE TABLE IF NOT EXISTS `boosting` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
	`vehicle` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
	`type` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
	`owner` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
	`expires` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
    `units` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
    `coords` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `boosting_users` (
	`identifier` VARCHAR(255) NULL DEFAULT '' COLLATE 'utf8mb4_bin',
	`level` VARCHAR(255) NULL DEFAULT 0 COLLATE 'utf8mb4_bin',
	`gne` VARCHAR(255) NULL DEFAULT 0 COLLATE 'utf8mb4_bin',
	`cooldown` VARCHAR(255) NULL DEFAULT 0 COLLATE 'utf8mb4_bin'
)
 