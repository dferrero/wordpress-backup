# WordPress Backup

This script is based on `jamesrascal/wordpress-backup` repository, with a lot of changes to suit my personal environment.

## Features
- Just a single file. Nothing more needed.
- Backup all websites stored in folders under `/var/www/html` (by default; it could be changed).
- Profiles has been removed.
- Custom variables are at the beginning of the script, identified by CAPSLOCKS.
- Backups based on hashes

```
root@wp-blogs:~/scripts/wordpress-backup# bash web-backups.sh
Starting backup from /var/www/html/xxxxx
Saved hash f796be5bd7eacdd5f41b6819871792f585e932f5f5c9a281cc0c716ee0d6a318 from file /home/backups/xxxxx/200126-xxxxx.tar.gz
Count current value: 1
Saved hash 21c3d9f08463a7e99ff893a85c9f543894ac91f6c6fd83a33e6a4132c1b05b9e from file /home/backups/xxxxx/191206-xxxxx.tar.gz
Count current value: 2
Saved hash 76ceac9629599ce85fa10fda15658c3017e1a9a2954729f2cfc4dc38d89d102a from file /home/backups/xxxxx/191205-xxxxx.tar.gz
Count current value: 3
Saved hash 71a9dfc3e9cbe0b88352a26e73e67190d72dddf462a2979aff3b74fac3946ba1 from file /home/backups/xxxxx/191204-xxxxx.tar.gz
Count current value: 4
Saved hash 8c7f2c23b823ad2004c34a76eb58d356e5aa42586b18b4383b27fd909165a3ff from file /home/backups/xxxxx/191203-xxxxx.tar.gz
Count current value: 5
Saved hash 34445ca85e292e11c99ef3f320415454ed5b1ba4909448792a2d646f6a6af548 from file /home/backups/xxxxx/191202-xxxxx.tar.gz
Count current value: 6
rm -f /home/backups/xxxxx/191201-xxxxx.tar.gz
rm -f /home/backups/xxxxx/191130-xxxxx.tar.gz
rm -f /home/backups/xxxxx/191129-xxxxx.tar.gz
rm -f /home/backups/xxxxx/191128-xxxxx.tar.gz
rm -f /home/backups/xxxxx/191127-xxxxx.tar.gz
Starting backup from /var/www/html/yyyyy
Saved hash ef8203270efa2c34f57d3ddf887e07903e7e2de755879c014cb33740dd1c152d from file /home/backups/yyyyy/200126-yyyyy.tar.gz
Count current value: 1
Saved hash ffd022f26e50e3f341a7107be29c89796e93fc801717c051e22c1b7003a2b1d7 from file /home/backups/yyyyy/191206-yyyyy.tar.gz
Count current value: 2
Saved hash 58cb5324480b33c446629e736e1347d8fad0d9ef1627f166c1d36f595db1c260 from file /home/backups/yyyyy/191205-yyyyy.tar.gz
Count current value: 3
Saved hash ad81e120428629927f795e7b024fbf40a4cc44cf18ce066742b43efcaf3a4e11 from file /home/backups/yyyyy/191204-yyyyy.tar.gz
Count current value: 4
Saved hash fdb742aeae03f0bf407370b19d1c8e5ceb762b89bd1ce7979f66407b3e4eb166 from file /home/backups/yyyyy/191203-yyyyy.tar.gz
Count current value: 5
Saved hash 9922d8a0523b3e41d8c59709fc212ad0eb77270d7db47d5e51272841e3dfb288 from file /home/backups/yyyyy/191202-yyyyy.tar.gz
Count current value: 6
rm -f /home/backups/yyyyy/191201-yyyyy.tar.gz
rm -f /home/backups/yyyyy/191130-yyyyy.tar.gz
rm -f /home/backups/yyyyy/191129-yyyyy.tar.gz
rm -f /home/backups/yyyyy/191128-yyyyy.tar.gz
rm -f /home/backups/yyyyy/191127-yyyyy.tar.gz
```

## Work in Progress

- [ ] Backup of `apache2` folder
- [ ] Backup of `letsencrypt` folder
- [ ] To add params for use last X days backups or last X hashes backups
- [ ] To create a `-verbose` mode
- [ ] To add `-size` to backup info
