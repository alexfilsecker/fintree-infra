CREATE TABLE user_categories (
  id SERIAL PRIMARY KEY,

  user_id INT NOT NULL,
  parent_user_category_id INT,

  name VARCHAR(255) NOT NULL,
  description VARCHAR(255),

  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (parent_user_category_id) REFERENCES user_categories (id) ON DELETE SET NULL
);