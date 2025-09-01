BEGIN;

-- USERS table
CREATE TABLE IF NOT EXISTS sss_users(
  id        TEXT   PRIMARY KEY,
  email     VARCHAR(255) UNIQUE NOT NULL,
  password  VARCHAR(255) NOT NULL
);

-- INVENTORY table
CREATE TABLE IF NOT EXISTS sss_inventory (
  id          TEXT PRIMARY KEY,
  sku_code    VARCHAR(255) UNIQUE,
  description TEXT
);

-- ORDERS table (One-to-Many from users to orders)
CREATE TABLE IF NOT EXISTS sss_order(
  id          TEXT PRIMARY KEY,
  user_id     TEXT, 
  -- Foreign key: Each order belongs to a user
  FOREIGN KEY (user_id) REFERENCES sss_users(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS sss_order_details(
   id           TEXT PRIMARY KEY,
   order_id     TEXT, 
   inventory_id TEXT,
  -- Composite unique: Prevent duplicate inventory items in the same order
  UNIQUE (order_id, inventory_id),
   -- Foreign keys
  FOREIGN KEY (order_id) REFERENCES sss_order(id) ON DELETE CASCADE,
  FOREIGN KEY (inventory_id) REFERENCES sss_inventory(id) ON DELETE CASCADE
);

COMMIT;
