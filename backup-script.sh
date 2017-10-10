#!/bin/bash

BACKUP_DIR=/backup/orocrm

if [ !-d $BACKUP_DIR ]; then
  mkdir -p $BACKUP_DIR
fi

## backup main orocrm container
docker commit -p orocrm magestore/orocrm

## backup orocrm database
docker commit -p orodatabase magestore/orocrm_database

DATE=$( date +%Y%m%d_%H%M%S )

docker save -o $BACKUP_DIR/magestore_orocrm_$DATE.tar magestore/orocrm
docker save -o $BACKUP_DIR/magestore_orodatabase_$DATE.tar magestore/orocrm_database

