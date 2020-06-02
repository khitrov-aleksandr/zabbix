#!/bin/bash

DBNAME=zabbix
BACKUP_DIR=/backup

# Dump schema only without data
mysqldump --no-data $DBNAME > $BACKUP_DIR/${DBNAME}_schema.sql

# Dump data
mysqldump \
        --ignore-table=${DBNAME}.history \
        --ignore-table=${DBNAME}.history_log \
        --ignore-table=${DBNAME}.history_str \
        --ignore-table=${DBNAME}.history_text \
        --ignore-table=${DBNAME}.history_uint \
        --ignore-table=${DBNAME}.trends \
        --ignore-table=${DBNAME}.trends_uint \
        $DBNAME > $BACKUP_DIR/${DBNAME}.sql

exit 0
