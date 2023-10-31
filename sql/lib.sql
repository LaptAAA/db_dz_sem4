-- Создаем базу данных
CREATE DATABASE db_lib;

-- Используем созданную базу данных
\c db_lib;

-- Создание таблицы Publisher
CREATE TABLE Publisher (
    PubName varchar(255) PRIMARY KEY,
    Address varchar(255)
);

-- Создание таблицы Book
CREATE TABLE Book (
    ISBN varchar(255) PRIMARY KEY,
    Title varchar(255),
    Author varchar(255),
    PagesNum integer,
    PubYear integer,
    PubName varchar(255),
    FOREIGN KEY (PubName) REFERENCES Publisher (PubName)
);

-- Создание таблицы Reader
CREATE TABLE Reader (
    ID serial PRIMARY KEY,
    LastName varchar(255),
    FirstName varchar(255),
    Address text,
    BirthDate date
);

-- Создание таблицы Category
CREATE TABLE Category (
    CategoryName varchar(255) PRIMARY KEY,
    ParentCat varchar(255),
    FOREIGN KEY (ParentCat) REFERENCES Category (CategoryName)
);

-- Создание таблицы Copy
CREATE TABLE Copy (
    ISBN varchar(255),
    CopyNumber serial,
    Shelf varchar(255),
    Position integer,
    PRIMARY KEY (ISBN, CopyNumber),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN)
);

-- Создание таблицы Borrowing
CREATE TABLE Borrowing (
    ReaderNr serial,
    ISBN varchar(255),
    CopyNumber integer,
    ReturnDate date,
    PRIMARY KEY (ReaderNr, ISBN, CopyNumber),
    FOREIGN KEY (ReaderNr) REFERENCES Reader (ID),
    FOREIGN KEY (ISBN, CopyNumber) REFERENCES Copy (ISBN, CopyNumber)
);

-- Создание таблицы BookCat
CREATE TABLE BookCat (
    ISBN varchar(255),
    CategoryName varchar(255),
    PRIMARY KEY (ISBN, CategoryName),
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN),
    FOREIGN KEY (CategoryName) REFERENCES Category (CategoryName)
);

-- Вставка 5 записей в таблицу Publisher
INSERT INTO Publisher (PubName, Address)
VALUES
    ('Vintage Classics', 'Address1'),
    ('Penguin Classics', 'Address2'),
    ('Harper Perennial', 'Address3'),
    ('Harper Classics', 'Address4'),
    ('Harvest Books', 'Address5');

-- Вставка 5 записей в таблицу Book
INSERT INTO Book (ISBN, Title, Author, PagesNum, PubYear, PubName)
VALUES
    ('978-0451526531', 'Pride and Prejudice', 'Jane Austen', 279, 1813, 'Vintage Classics'),
    ('978-0141439563', 'Moby-Dick', 'Herman Melville', 704, 1851, 'Penguin Classics'),
    ('978-1983338055', 'To Kill a Mockingbird', 'Harper Lee', 324, 1960, 'Harper Perennial'),
    ('978-0307474314', 'The Great Gatsby', 'F. Scott Fitzgerald', 180, 1925, 'Harper Perennial'),
    ('978-0061120084', 'To the Lighthouse', 'Virginia Woolf', 194, 1927, 'Harvest Books');

-- Вставка 5 записей в таблицу Reader
INSERT INTO Reader (LastName, FirstName, Address, BirthDate)
VALUES
    ('Smith', 'John', '123 Main St', '1980-05-10'),
    ('Johnson', 'Alice', '456 Elm St', '1992-03-15'),
    ('Brown', 'Michael', '789 Oak St', '1975-11-20'),
    ('Davis', 'Sarah', '567 Maple St', '1988-08-02'),
    ('Wilson', 'Robert', '101 Pine St', '1995-01-25');

-- Вставка 5 записей в таблицу Category
INSERT INTO Category (CategoryName, ParentCat)
VALUES
    ('Classic Literature', NULL),
    ('Fiction', NULL),
    ('Historical Fiction', 'Fiction'),
    ('Romance', 'Fiction'),
    ('Adventure', 'Fiction');

-- Вставка 5 записей в таблицу Copy
INSERT INTO Copy (ISBN, Shelf, Position)
VALUES
    ('978-0451526531', 'A1', 1),
    ('978-0141439563', 'B2', 2),
    ('978-1983338055', 'C3', 3),
    ('978-0307474314', 'A1', 4),
    ('978-0061120084', 'D4', 5);


-- Вставка 5 записей в таблицу Borrowing
INSERT INTO Borrowing (ISBN, CopyNumber, ReturnDate)
VALUES
    ('978-0451526531', 1, '2023-11-15'),
    ('978-0141439563', 2, '2023-11-20'),
    ('978-1983338055', 3, '2023-11-25'),
    ('978-0307474314', 4, '2023-11-30'),
    ('978-0061120084', 5, '2023-12-05');


-- Вставка 5 записей в таблицу BookCat
INSERT INTO BookCat (ISBN, CategoryName)
VALUES
    ('978-0451526531', 'Classic Literature'),
    ('978-0141439563', 'Classic Literature'),
    ('978-1983338055', 'Fiction'),
    ('978-0307474314', 'Fiction'),
    ('978-0061120084', 'Fiction');
