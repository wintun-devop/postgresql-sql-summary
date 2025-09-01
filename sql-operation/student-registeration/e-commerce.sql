
CREATE TABLE sss_inventory(
  id         TEXT PRIMARY KEY,
  email      VARCHAR(255) UNIQUE,
  password   VARCHAR(255) UNIQUE
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
