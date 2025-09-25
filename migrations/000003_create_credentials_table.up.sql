CREATE TABLE credentials (
  id SERIAL PRIMARY KEY,

  user_id INT NOT NULL,
  institution_id INT NOT NULL,

  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (institution_id) REFERENCES institutions (id) ON DELETE CASCADE
);