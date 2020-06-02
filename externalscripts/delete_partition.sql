DROP PROCEDURE IF EXISTS delete_partition;

DELIMITER //

CREATE PROCEDURE delete_partition(IN tbl VARCHAR(255))
BEGIN
        DECLARE partitionName VARCHAR(255);

        SELECT partition_name INTO partitionName
                FROM information_schema.partitions
                        WHERE table_name = tbl
                        AND partition_name != ''
                        AND table_schema = DATABASE()
        ORDER BY PARTITION_ORDINAL_POSITION LIMIT 1;

        SET @s = CONCAT('ALTER TABLE ', tbl,' DROP PARTITION ', partitionName);
        PREPARE stmt FROM @s;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        SELECT partitionName;
END//

DELIMITER ;
