CREATE TYPE movement_kind AS ENUM ('debit', 'credit');

CREATE TABLE movements (
  id SERIAL PRIMARY KEY,

  user_account_id INT NOT NULL,
  user_category_id INT,
  movement_group_id INT,

  FOREIGN KEY (user_account_id) REFERENCES user_accounts (id) ON DELETE CASCADE,
  FOREIGN KEY (user_category_id) REFERENCES user_categories (id) ON DELETE SET NULL,
  FOREIGN KEY (movement_group_id) REFERENCES movement_groups (id) ON DELETE SET NULL,

  amount DECIMAL(10, 2) NOT NULL,
  kind movement_kind NOT NULL,
  pending BOOLEAN NOT NULL,
  description VARCHAR(255),
  user_notes VARCHAR(255),
  transaction_date TIMESTAMP NOT NULL,
  posted_date TIMESTAMP,
  balance_after DECIMAL(10, 2)
);