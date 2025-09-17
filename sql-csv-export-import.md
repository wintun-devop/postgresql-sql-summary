### Product (Product Table import CSV with Upsert)
```
CREATE TEMP TABLE "Temp_Product" (LIKE "Product" INCLUDING INDEXES);
```
```
\COPY "Temp_Product" ("id","name","qty","price","description","createdAt","updatedAt") FROM '/home/ubuntu/csv_files/Product.csv' WITH CSV HEADER;
```
```
INSERT INTO "Role" ("id","name","qty","price","description","createdAt","updatedAt")
SELECT * FROM "Temp_Product"
ON CONFLICT ON CONSTRAINT "Product_pkey" DO UPDATE
SET
    name=EXCLUDED.name,
    qty=EXCLUDED.qty,
    price=EXCLUDED.price,
    description=EXCLUDED.description,
    "createdAt"=EXCLUDED."createdAt",
    "updatedAt"=EXCLUDED."updatedAt";
```

### Product (Product Table import CSV with Only Insert)
```
CREATE TEMP TABLE "Temp_Product" (LIKE "Product" INCLUDING INDEXES);
```
```
\COPY "Temp_Product" ("id","name","qty","price","description","createdAt","updatedAt") FROM '/home/ubuntu/csv_files/Product.csv' WITH CSV HEADER;
```
```
INSERT INTO "Role" ("id","name","qty","price","description","createdAt","updatedAt")
SELECT * FROM "Temp_Product"
ON CONFLICT ON CONSTRAINT "Product_pkey" DO NOTHING;
```


