#!/bin/bash

MYSQL=`which mysql`

DB_NAME=zabbix
TABLE_NAMES=(
history
history_log
history_str
history_text
history_uint
#trends
#trends_uint
)

for X in ${TABLE_NAMES[@]}; do
        #$MYSQL -e "CALL create_partition('$X')" $DB_NAME
        $MYSQL -e "CALL delete_partition('$X')" $DB_NAME
done

exit 0
