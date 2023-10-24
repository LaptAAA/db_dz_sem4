CREATE DATABASE lapteva_215_library;

\c tasklibrary;

CREATE TABLE readers (
    reader_number serial PRIMARY KEY,
    first_name varchar,
    last_name varchar,
    birthday date,
    address varchar
);

CREATE TABLE books (
    isbn varchar PRIMARY KEY,
    title varchar,
    year integer,
    author varchar,
    number_of_pages integer,
    publisher_name varchar,
    FOREIGN KEY (publisher_name) REFERENCES publishers(publisher_name)
);

CREATE TABLE publishers (
    publisher_name varchar PRIMARY KEY,
    address varchar
);

CREATE TABLE categories (
    category_name varchar PRIMARY KEY,
    parent_category_name varchar,
    FOREIGN KEY (parent_category_name) REFERENCES categories(category_name)
);

CREATE TABLE copy (
    copy_number serial PRIMARY KEY,
    position varchar,
    isbn varchar,
    FOREIGN KEY (isbn) REFERENCES books(isbn)
);

CREATE TABLE borrowings (
    reader_number integer,
    isbn varchar,
    copy_number integer,
    return_date date,
    FOREIGN KEY (reader_number) REFERENCES readers(reader_number),
    FOREIGN KEY (isbn) REFERENCES copy(isbn),
    FOREIGN KEY (copy_number) REFERENCES copy(copy_number)
);

CREATE TABLE bookCategories (
    isbn varchar,
    category_name varchar,
    FOREIGN KEY (isbn) REFERENCES books(isbn),
    FOREIGN KEY (category_name) REFERENCES categories(category_name)
);



-- Добавляем записи в таблицу
-- Вставка тестовых записей в таблицу "publishers"
INSERT INTO publishers (publisher_name, address) VALUES
    ('Publisher A', 'Address A'),
    ('Publisher B', 'Address B'),
    ('Publisher C', 'Address C'),
    ('Publisher D', 'Address D'),
    ('Publisher E', 'Address E');

-- Вставка тестовых записей в таблицу "categories"
INSERT INTO categories (category_name, parent_category_name) VALUES
    ('Category A', NULL),
    ('Category B', NULL),
    ('Category C', 'Category A'),
    ('Category D', 'Category A'),
    ('Category E', 'Category B');

-- Вставка тестовых записей в таблицу "readers"
INSERT INTO readers (first_name, last_name, birthday, address) VALUES
    ('Alice', 'Johnson', '1990-05-15', 'Address 1'),
    ('Bob', 'Smith', '1985-08-22', 'Address 2'),
    ('Charlie', 'Davis', '1992-03-10', 'Address 3'),
    ('David', 'Lee', '1988-11-30', 'Address 4'),
    ('Eva', 'Clark', '1995-04-25', 'Address 5');

-- Вставка тестовых записей в таблицу "books"
INSERT INTO books (isbn, title, year, author, number_of_pages, publisher_name) VALUES
    ('ISBN-001', 'Book 1', 2020, 'Author A', 300, 'Publisher A'),
    ('ISBN-002', 'Book 2', 2018, 'Author B', 250, 'Publisher B'),
    ('ISBN-003', 'Book 3', 2019, 'Author C', 400, 'Publisher C'),
    ('ISBN-004', 'Book 4', 2021, 'Author A', 350, 'Publisher A'),
    ('ISBN-005', 'Book 5', 2017, 'Author D', 280, 'Publisher D');

-- Вставка тестовых записей в таблицу "copy"
INSERT INTO copy (position, isbn) VALUES
    ('Shelf 1', 'ISBN-001'),
    ('Shelf 2', 'ISBN-002'),
    ('Shelf 3', 'ISBN-003'),
    ('Shelf 4', 'ISBN-004'),
    ('Shelf 5', 'ISBN-005');

-- Вставка тестовых записей в таблицу "borrowings"
INSERT INTO borrowings (reader_number, isbn, copy_number, return_date) VALUES
    (1, 'ISBN-001', 1, '2023-11-15'),
    (2, 'ISBN-002', 2, '2023-11-20'),
    (3, 'ISBN-003', 3, '2023-11-25'),
    (4, 'ISBN-004', 4, '2023-12-01'),
    (5, 'ISBN-005', 5, '2023-12-05');

-- Вставка тестовых записей в таблицу "bookCategories"
INSERT INTO bookCategories (isbn, category_name) VALUES
    ('ISBN-001', 'Category A'),
    ('ISBN-002', 'Category B'),
    ('ISBN-003', 'Category C'),
    ('ISBN-004', 'Category A'),
    ('ISBN-005', 'Category D');
