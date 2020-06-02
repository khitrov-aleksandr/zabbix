DROP PROCEDURE IF EXISTS create_partition;

DELIMITER //

CREATE PROCEDURE create_partition(IN tbl VARCHAR(255))
BEGIN
        DECLARE curTime INT DEFAULT 0;
        DECLARE newTime INT DEFAULT 0;
        DECLARE delta INT DEFAULT 604800; 
        DECLARE partitionName VARCHAR(255);

        SELECT partition_description INTO curTime
                FROM information_schema.partitions
                        WHERE table_name = tbl
                        AND partition_name != ''
                        AND table_schema = DATABASE()
        ORDER BY PARTITION_ORDINAL_POSITION DESC LIMIT 1;

        SET newTime = curTime + delta;
        SET partitionName = CONCAT('p', newTime);

        SET @s = CONCAT('ALTER TABLE ', tbl,' ADD PARTITION ( PARTITION ', partitionName, ' VALUES LESS THAN(', newTime, '))' );
        PREPARE stmt FROM @s;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        SELECT partitionName;
END//

DELIMITER ;
