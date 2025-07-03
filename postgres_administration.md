### Access to Postgresql Database
```
sudo su - postgres
```
```
psql
```

### Create Database User
```
CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpass';
```
### Change database user permission
```
ALTER USER youruser WITH SUPERUSER;
```
```
ALTER USER youruser WITH CREATEDB;
```
```
ALTER USER youruser WITH REPLICATION;
```
```
ALTER USER youruser WITH createrole;
```
```
ALTER USER youruser WITH bypassrls;
```
### Database Create
```
CREATE DATABASE yourdbname;
```
```
GRANT ALL PRIVILEGES ON DATABASE yourdbname TO youruser;
```
test
## Check the Database Server Staus
- List Running Processes
```
ps aux | grep postgres
```
- Check Lising Port
```
netstat -tulnp | grep postgres
```
```
ss -tulnp | grep postgres
```
###
```
sudo firewall-cmd --add-port=5432/tcp --permanent
```
- Verify PostgreSQL Connection
```
sudo -u postgres psql -c "SELECT version();"
```
- Check the Service Type
```
sudo systemctl list-units --type=service | grep postgres
```

### Backup and Restore (Plain Format -Fp)
- Backup
```
pg_dump -h your_db_endpoint -U your_username -d your_database_name -Fp -f your_database_name_bk.sql
```
- Restore
```
psql -h our_db_endpoint -U your_username -d your_database_name -f your_database_name_bk.sql
```

### Backupp and Restore (Custom Compressing)
- Backup
```
pg_dump -h your_db_endpoint -U your_username -d your_database_name -Fc -Z 9 -f your_database_name_bk.dump
```
- Restore
```
pg_restore -h your_db_endpoint -U your_username -d your_database_name -v your_database_name_bk.dump
```

### Drop existing objects before restoring
```
pg_restore -h your_db_endpoint -U your_username -d your_database_name --clean --if-exists -v your_database_name_bk.dump
```

### Restore only schema (without data)
```
pg_restore -h your_db_endpoint -U your_username -d your_database_name --schema-only -v your_database_name_bk.dump
```

### Restore only data (without schema)
```
pg_restore -h your_db_endpoint -U your_username -d your_database_name --data-only -v your_database_name_bk.dump
```

### List all databases with respective size
```
SELECT datname, pg_size_pretty(pg_database_size(datname)) FROM pg_database;
```
### Current databse size in raw Bytes
```
SELECT pg_database_size(current_database());
```
### Get current database size in human-readable format
```
SELECT pg_size_pretty(pg_database_size(current_database()));
```
### Query to get List of Existing Databases
```
SELECT datname FROM pg_database WHERE datistemplate = false;
```
