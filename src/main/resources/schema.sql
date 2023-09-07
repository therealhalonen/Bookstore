-- Create the category table
CREATE TABLE category (
    categoryid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

-- Create the book table
CREATE TABLE book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    publication_year INT,
    isbn VARCHAR(255),
    price DECIMAL(10, 2),
    categoryid INT,
    FOREIGN KEY (categoryid) REFERENCES category(categoryid)
);

-- Insert initial categories
INSERT INTO category (name) VALUES ('Bad');
INSERT INTO category (name) VALUES ('Good');
INSERT INTO category (name) VALUES ('Ugly');

-- Insert some initial books
INSERT INTO book (title, author, publication_year, isbn, price, categoryid)
VALUES ('GoodBook', 'Me', 1985, '1234567890', 66.6, 2);
INSERT INTO book (title, author, publication_year, isbn, price, categoryid)
VALUES ('BadBook', 'Teacher', 2023, '0987654321', 6.66, 1);
INSERT INTO book (title, author, publication_year, isbn, price, categoryid)
VALUES ('UglyBook', 'SomeOne', 2024, '69', 666.0, 3);