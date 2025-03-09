# Database Backup and Recovery

## Overview
This repository provides a step-by-step guide to backing up and restoring databases in **MySQL** and **PostgreSQL**. The repository includes:
- **Backup and recovery scripts**
- **Commands for database dump and restore**
- **Automation techniques for scheduled backups**

## Prerequisites
Ensure you have the following installed on your system:
- [MySQL](https://dev.mysql.com/downloads/)
- [PostgreSQL](https://www.postgresql.org/download/)

---

## Step 1: Backup MySQL Database
To create a backup of a MySQL database:
```bash
mysqldump -u root -p mydb > mydb_backup.sql
```
- Replace `mydb` with your database name.
- This generates a SQL dump file with table structures and data.

---

## Step 2: Restore MySQL Database
To restore from the backup file:
```bash
mysql -u root -p mydb < mydb_backup.sql
```
- Ensure `mydb` exists before restoring.

---

## Step 3: Backup PostgreSQL Database
To back up a PostgreSQL database:
```bash
pg_dump -U postgres -F c -b -v -f mydb_backup.pgsql mydb
```
- `-F c` creates a custom-format backup.
- `-b` includes large objects.
- `-v` enables verbose mode.
- `-f` specifies the output file.

---

## Step 4: Restore PostgreSQL Database
To restore the backup:
```bash
pg_restore -U postgres -d mydb -v mydb_backup.pgsql
```
- Ensure `mydb` exists before restoring.

---

## Step 5: Automate Backup (Optional)
To automate backups using a cron job (Linux/macOS):
```bash
crontab -e
```
Add the following line to back up every day at midnight:
```bash
0 0 * * * pg_dump -U postgres -F c -b -v -f /backups/mydb_$(date +\%F).pgsql mydb
```

---

