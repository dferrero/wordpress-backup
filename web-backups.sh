#!/bin/bash
WEBPATH=/var/www/html
BACKUP_LOCATION=/home/backups
KEEPDAYS=8

for webdir in `find $WEBPATH -maxdepth 1 -mindepth 1 -type d`; do 
    currentdir=`echo $webdir | cut -d'/' -f5`
    echo "Starting backup from $WEBPATH/$currentdir"
    wp_config=$webdir/wp-config.php
    # BackupName Date and time
    backupname=$(date +%y%m%d)-$currentdir

    # Creates a Backup Directory if one does not exist.
    mkdir -p ${BACKUP_LOCATION}/${currentdir}/

    # Make Backup location the current directory
    cd ${BACKUP_LOCATION}/${currentdir}

    # Verifing wp_config exists
    if [ -f "$wp_config" ]; then
        # Pulls Database info from WP-config
        db_name=$(grep DB_NAME "${wp_config}" | cut -f4 -d"'")
        db_user=$(grep DB_USER "${wp_config}" | cut -f4 -d"'")
        db_pass=$(grep DB_PASSWORD "${wp_config}" | cut -f4 -d"'")
        table_prefix=$(grep table_prefix "${wp_config}" | cut -f2 -d"'")

        # MySQL Takes a Dump and compress the Home Directory
        mysqldump -u ${db_user} -p${db_pass} ${db_name} | gzip > ./${backupname}-DB.sql.gz 
        tar zcPf ./${backupname}-FILES.tar.gz ${webdir}

        # Compresses the MySQL Dump and the Home Directory
        tar zcPf ./${backupname}.tar.gz ./${backupname}-FILES.tar.gz ./${backupname}-DB.sql.gz
        chmod 600 ./${backupname}.tar.gz

        # Generates the Backup Size
        #FILENAME=${BACKUP_LOCATION}/${currentdir}/${backupname}.tar.gz
        #FILESIZE=$(du -h "$FILENAME")

        #Removes the SQL dump and Home DIR to conserve space
        rm -rf ./${backupname}-FILES.tar.gz ./${backupname}-DB.sql.gz
    else
        echo "No wp-config.php found; saving full folder";
        tar zcPf ./${backupname}.tar.gz ${webdir}
    fi

    #Deletes any Backup older than X days
    find ${BACKUP_LOCATION}/${currentdir}/ -type f -mtime +${KEEPDAYS} -exec rm {} \;
done
