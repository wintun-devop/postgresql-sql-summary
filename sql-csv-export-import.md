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

### Export CSV
- Export with Specific Columns Headers
```
COPY (SELECT id, name, price FROM products)
TO '/path/to/products.csv'
WITH (FORMAT csv, HEADER true);
```
- Export with Column Headers
```
COPY your_table
TO '/path/to/output.csv'
WITH (FORMAT csv, HEADER true);
```
```
COPY tc_category
TO 'D:/python-servers/twincats-server/docs/e-commerce/category.csv'
WITH (FORMAT csv, HEADER true);
```

