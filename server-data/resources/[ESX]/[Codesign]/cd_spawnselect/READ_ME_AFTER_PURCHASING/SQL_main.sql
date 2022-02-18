CREATE TABLE IF NOT EXISTS `spawnselect` (
	`identifier` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
	`personal_spawn` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;