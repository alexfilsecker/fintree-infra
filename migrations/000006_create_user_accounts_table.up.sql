CREATE TABLE user_accounts (
  id SERIAL PRIMARY KEY,

  user_id INT NOT NULL,
  institution_account_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  Foreign Key (institution_account_id) REFERENCES institution_accounts (id) ON DELETE RESTRICT
);