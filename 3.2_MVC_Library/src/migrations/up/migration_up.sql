 CREATE TABLE IF NOT EXISTS books (
     b_id INT AUTO_INCREMENT PRIMARY KEY,
     title VARCHAR(255) NOT NULL,
     link_image varchar(255) not null,
     descr varchar(255) not null,
     year INT not null,
     count_pages INT not null,
     count_search INT DEFAULT 0,
     count_click INT DEFAULT 0,
     deleted BOOLEAN DEFAULT false
     );
      CREATE TABLE IF NOT EXISTS authors(
     a_id INT AUTO_INCREMENT PRIMARY KEY,
     author VARCHAR(255) NOT NULL
     );
     CREATE TABLE IF NOT EXISTS books_authors(
          book_id INT NOT NULL,
          author_id INT NOT NULL,
          FOREIGN KEY (book_id) REFERENCES books(b_id),
          FOREIGN KEY (author_id) REFERENCES authors(a_id),
          deleted BOOLEAN DEFAULT false
          );