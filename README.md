# WordPress Backup

This script is based on `jamesrascal/wordpress-backup` repository, with a lot of changes to suit my personal environment.

## Features
- Just a single file. Nothing more needed.
- Backup all websites stored in folders under `/var/www/html` (by default; it could be changed).
- Profiles has been removed.
- Custom variables are at the beginning of the script, identified by CAPSLOCKS.

## Work in Progress
- [ ] Backup of `apache2` folder
- [ ] Backup of `letsencrypt` folder
- [ ] Change last backups from X days to X number of backups (remove is based on hash)
