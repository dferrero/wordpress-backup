#!/bin/bash
WEBPATH=/var/www/html
BACKUP_LOCATION=/home/backups
KEEPBACKUPS=5

function apacheBackup {
    echo "Work in progress"
}

function daysBackup {
    echo "Work in progress"
}

function hashBackup {
    echo "Work in progress"
}

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

    # Command to keep last X backups based on days instead of hashes
    # find ${BACKUP_LOCATION}/${currentdir}/ -type f -mtime +${KEEPBACKUPS} -exec rm {} \;
    # TO DO: Move to procedure
    
    # Keeps last $KEEPBACKUPS backups, based on sha256. If they are more, they'll be deleted
    # TO DO: Move to procedure
    previousHash="0"
    count=0
    backupPath="${BACKUP_LOCATION}/${currentdir}"
    for currentFile in `ls -t $backupPath`; do
	currentHash=`sha256sum $currentFile | cut -d' ' -f1`
	if [ $count -lt $KEEPBACKUPS ] ; then
	    if [ $currentHash = $previousHash ]; then
	    	echo "rm -f $backupPath/$currentFile"
	    else
	    	previousHash=$currentHash
		echo "Saved hash $currentHash from file $backupPath/$currentFile"
	    fi
	    count=$((count+1))
	    echo "Count current value: $count"
	else
	    echo "rm -f $backupPath/$currentFile"
	fi
    done
done
