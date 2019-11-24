WordPress Backup
===============

This script is based on jamesrascal/wordpress-backup script, with a lot of changes to suit my personal environment.

## Features

- Just a single file. Nothing more needed.
- Backup all websites stored in folders under `/var/www/html` (by default; it could be changed).
- Profiles has been removed.
- Custom variables are at the beginning of the script, identified by CAPSLOCKS.

# jamesrascal's README

This script is designed to backup any number of WordPress sites without the use of a plugin. 

Features:

- Server Level Backups.
- Easy to intergrate RSync or FTP to transfer to remote server.
- Combines SQL Database and Only the WordPress files for easy restores.
- Can be set on a cron job.


You currently need two scripts downloaded to the server.

1. WordPressBackup.sh
2. Backup.profile

WordPressBackup.sh is the main script that does all the heavy lifting.
Backup.profile is what tells the script which directory to backup and how long to keep those backups.


How to use:

1. Download the script.
2. Copy and Modify the backup.profile.
3. Place backup.profile in the directory above your WordPress install or /home/username/
4. chmod +x WordPress-Backup
5. ./WordPress-Backup 
    Depending on where you put your backup.profile you may need to modify the main script's FINDDIR.

