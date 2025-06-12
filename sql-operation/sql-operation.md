## Create Table

- Installing UUID Extension
```
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

```
CREATE DATABASE "my_erp";
```
```
CREATE TABLE employee (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    age INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

```
### Create Table with auto crete and update time
```
CREATE TABLE employee (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    age INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
### Create Update Time Function
```
CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```
### Trigger Function on Table
```
CREATE TRIGGER trigger_update_timestamp
BEFORE UPDATE ON employee
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

```
### Insert Query Sample
```
INSERT INTO "employee" (name,email,age) VALUES ('Win Tun','wintun.hlaing@outlook.com',37);
```
```
INSERT INTO "employee" (name,email,age) VALUES ('Kyaw Kyaw','kyawkyaw@outlook.com',31);
```

### Update Query Sample
```
UPDATE "employee"
SET name = 'Ko Win Tun'
WHERE id ='da799f1f-95ed-48c2-b9da-28aba35bd4a5';
```
