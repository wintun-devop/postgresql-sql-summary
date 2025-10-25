### Postgresql Timezone Management
- Check Timezone
```
SELECT current_setting('TIMEZONE');
```
```
SHOW timezone;
```

### Server Level
- edit postgresql.conf
```
timezone = 'UTC'
```
```
sudo systemctl restart postgresql-17
```
