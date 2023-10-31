-- Создаем базу данных
CREATE DATABASE db_hospital;

-- Используем созданную базу данных
\c db_hospital;

-- Создание таблицы Station
CREATE TABLE Station (
    StatNr serial PRIMARY KEY,
    Name varchar(255)
);

-- Создание таблицы StationsPersonal
CREATE TABLE StationsPersonal (
    PersNr serial PRIMARY KEY,
    Name varchar(255),
    StatNr integer,
    FOREIGN KEY (StatNr) REFERENCES Station(StatNr)
);

-- Создание таблицы Doctor
CREATE TABLE Doctor (
    PersNr integer,
    Name varchar(255),
    StatNr integer,
    Area varchar(255),
    Rang varchar(255),
    FOREIGN KEY (PersNr, Name) REFERENCES StationsPersonal (PersNr, Name),
    FOREIGN KEY (StatNr) REFERENCES Station(StatNr)
);

-- Создание таблицы Caregivers
CREATE TABLE Caregivers (
    PersNr integer,
    Name varchar(255),
    StatNr integer,
    Qualification varchar(255),
    FOREIGN KEY (PersNr, Name) REFERENCES StationsPersonal (PersNr, Name),
    FOREIGN KEY (StatNr) REFERENCES Station(StatNr)
);

-- Создание таблицы Room
CREATE TABLE Room (
    StatNr integer,
    RoomNr serial PRIMARY KEY,
    Beds integer,
    FOREIGN KEY (StatNr) REFERENCES Station(StatNr)
);

-- Создание таблицы Patient
CREATE TABLE Patient (
    PatientNr serial PRIMARY KEY,
    Name varchar(255),
    Disease varchar(255),
    RoomNr integer,
    DateFrom date,
    DateTo date,
    FOREIGN KEY (RoomNr) REFERENCES Room(RoomNr)
);



-- Создание таблицы Treats
CREATE TABLE Treats (
    PatientNr integer,
    PersNr integer,
    FOREIGN KEY (PatientNr) REFERENCES Patient(PatientNr),
    FOREIGN KEY (PersNr) REFERENCES Doctor(PersNr)
);



-- Вставка 5 записей в таблицу Station
INSERT INTO Station (Name)
VALUES
    ('Cardiology Ward'),
    ('Surgery Ward'),
    ('Pediatrics Ward'),
    ('Orthopedics Ward'),
    ('Neurology Ward');

-- Вставка 5 записей в таблицу StationsPersonal
INSERT INTO StationsPersonal (Name, StatNr)
VALUES
    ('Nurse Johnson', 1),
    ('Nurse Smith', 2),
    ('Nurse Lee', 1),
    ('Nurse Garcia', 3),
    ('Nurse Williams', 2),
    ('Dr. Anderson', 1),
    ('Dr. Patel', 2),
    ('Dr. Brown', 1),
    ('Dr. Wilson', 2),
    ('Dr. Davis', 3);

-- Вставка 5 записей в таблицу Doctor
INSERT INTO Doctor (Name, StatNr, Area, Rang)
VALUES
    ('Dr. Anderson', 1, 'Cardiology', 'Senior Physician'),
    ('Dr. Patel', 2, 'Surgery', 'Surgeon'),
    ('Dr. Brown', 1, 'Cardiology', 'Junior Physician'),
    ('Dr. Wilson', 2, 'Surgery', 'Senior Surgeon'),
    ('Dr. Davis', 3, 'Pediatrics', 'Pediatrician');

-- Вставка 5 записей в таблицу Caregivers
INSERT INTO Caregivers (Name, StatNr, Qualification)
VALUES
    ('Nurse Johnson', 1, 'Registered Nurse'),
    ('Nurse Smith', 2, 'Licensed Practical Nurse'),
    ('Nurse Lee', 1, 'Certified Nursing Assistant'),
    ('Nurse Garcia', 3, 'Registered Nurse'),
    ('Nurse Williams', 2, 'Certified Nursing Assistant');


-- Вставка 5 записей в таблицу Room
INSERT INTO Room (StatNr, RoomNr, Beds)
VALUES
    (1, 101, 10),
    (2, 201, 8),
    (1, 102, 12),
    (2, 202, 7),
    (3, 103, 9);

-- Вставка 5 записей в таблицу Patient
INSERT INTO Patient (Name, Disease, RoomNr, DateFrom, DateTo)
VALUES
    ('Mary White', 'Hypertension', 101, '2023-10-01', '2023-10-15'),
    ('James Miller', 'Appendicitis', 201, '2023-10-05', '2023-10-10'),
    ('Susan Robinson', 'Asthma', 102, '2023-10-02', '2023-10-18'),
    ('Daniel Wilson', 'Fractured Arm', 202, '2023-10-07', '2023-10-12'),
    ('Linda Hall', 'Migraine', 103, '2023-10-03', '2023-10-20');

-- Вставка 5 записей в таблицу Treats
INSERT INTO Treats (PatientNr, PersNr)
VALUES
    (1, 1),
    (2, 4),
    (3, 5),
    (4, 2),
    (5, 3);

