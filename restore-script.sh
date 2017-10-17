#!/bin/bash

BACKUP_DIR=/backup/orocrm
FILE_PREFIX="magestore_orodatabase"
VOLUME_NAME="orocrm_data"

## get the last file backup
RESTORE_FILE=$( ls $BACKUP_DIR | grep $FILE_PREFIX | sort | tail -n 1 )

if ! -z $RESTORE_FILE; then
	docker run -it -v $VOLUME_NAME:/volume -v $BACK_DIR:/backup alpine \
	       sh -c "rm -rf /volume/* ; tar -C /volume/ -xjf /backup/$RESTORE_FILE"
else
	echo "No backup file was found!"
fi

