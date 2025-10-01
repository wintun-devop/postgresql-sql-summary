### Database Create with Unicode Normalization
```
CREATE DATABASE mydb WITH ENCODING = 'UTF8' TEMPLATE = template0 LC_COLLATE = 'und-x-icu' LC_CTYPE = 'und-x-icu';
```

### Update Current Database to Uincode Normalization
- create nfc_collation
```
CREATE COLLATION nfc_collation (
  PROVIDER = icu,
  LOCALE = 'und',
  DETERMINISTIC = false
);
```
- check and Should return true
```
SELECT 'é' = 'é' COLLATE "nfc_collation";
```
