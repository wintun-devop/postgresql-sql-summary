CREATE TABLE sss_users(
  id        TEXT   PRIMARY KEY,
  email     VARCHAR(255) UNIQUE NOT NULL,
  password  VARCHAR(255) NOT NULL
);
  
CREATE TABLE sss_inventory (
  id          TEXT PRIMARY KEY,
  sku_code    VARCHAR(255) UNIQUE,
  description TEXT
);


CREATE TABLE sss_order(
  id          TEXT PRIMARY KEY,
  user_id     TEXT  
);

CREATE TABLE sss_order_details(
   id           TEXT PRIMARY KEY,
   order_id     TEXT 
   inventory_id TEXT
);
