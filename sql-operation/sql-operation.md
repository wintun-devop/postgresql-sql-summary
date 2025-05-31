## Create Table

- Installing UUID Extension

```
CREATE DATABASE "my_erp";
```
```
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```
```
CREATE TABLE Employee (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    age INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

```
INSERT INTO "employee" (name,email,age) VALUES ('Win Tun','wintun.hlaing@outlook.com',37);
INSERT INTO "employee" (name,email,age) VALUES ('Kyaw Kyaw','kyawkyaw@outlook.com',31);