CREATE TABLE institution_accounts (
  id SERIAL PRIMARY KEY,

  institution_id INT NOT NULL,
  currency_id INT NOT NULL,
  
  name VARCHAR(255),
  CONSTRAINT unique_name_for_institution UNIQUE (institution_id, name)
);