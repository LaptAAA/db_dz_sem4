CREATE DATABASE lapteva_215_hospital;

\c lapteva_215_hospital;

CREATE TABLE stations (
    station_nr serial PRIMARY KEY,
    station_name varchar
);

CREATE TABLE stationPersonell (
    person_nr serial PRIMARY KEY,
    station_nr integer REFERENCES stations(station_nr),
    names_count integer
);

CREATE TABLE caregivers (
    person_nr serial PRIMARY KEY,
    person_name varchar,
    station_nr integer REFERENCES stationPersonell(station_nr),
    qualification varchar
);

CREATE TABLE doctors (
    person_nr serial PRIMARY KEY,
    person_name varchar,
    station_nr integer REFERENCES stationPersonell(station_nr),
    area varchar,
    rank varchar
);

CREATE TABLE patients (
    person_nr serial PRIMARY KEY,
    person_name varchar,
    disease varchar,
    doctor_reson_nr integer REFERENCES doctors(person_nr),
    room_nr integer REFERENCES rooms(room_nr),
    "from" date,
    "to" date
);

CREATE TABLE rooms (
    room_nr serial PRIMARY KEY,
    beds_count integer,
    station_nr integer REFERENCES stations(station_nr)
);

CREATE TABLE treats (
    patient_nr integer REFERENCES patients(person_nr),
    person_nr integer REFERENCES stationPersonell(person_nr)
);


-- Добавляем записи в таблицу
-- Вставка тестовых записей в таблицу "stations"
INSERT INTO stations (station_name) VALUES
    ('Station A'),
    ('Station B'),
    ('Station C'),
    ('Station D'),
    ('Station E');

-- Вставка тестовых записей в таблицу "stationPersonell"
INSERT INTO stationPersonell (station_nr, names_count) VALUES
    (1, 10),
    (2, 8),
    (3, 6),
    (1, 7),
    (4, 12);

-- Вставка тестовых записей в таблицу "caregivers"
INSERT INTO caregivers (person_name, station_nr, qualification) VALUES
    ('Caregiver 1', 1, 'RN'),
    ('Caregiver 2', 2, 'LPN'),
    ('Caregiver 3', 3, 'CNA'),
    ('Caregiver 4', 1, 'RN'),
    ('Caregiver 5', 4, 'LPN');

-- Вставка тестовых записей в таблицу "doctors"
INSERT INTO doctors (person_name, station_nr, area, rank) VALUES
    ('Doctor 1', 1, 'Cardiology', 'Specialist'),
    ('Doctor 2', 2, 'Pediatrics', 'Consultant'),
    ('Doctor 3', 3, 'Orthopedics', 'Surgeon'),
    ('Doctor 4', 1, 'Cardiology', 'Specialist'),
    ('Doctor 5', 4, 'Neurology', 'Consultant');

-- Вставка тестовых записей в таблицу "patients"
INSERT INTO patients (person_name, disease, doctor_reson_nr, room_nr, "from", "to") VALUES
    ('Patient 1', 'Heart Disease', 1, 101, '2023-01-01', '2023-01-15'),
    ('Patient 2', 'Flu', 2, 102, '2023-02-01', '2023-02-15'),
    ('Patient 3', 'Fracture', 3, 103, '2023-03-01', '2023-03-15'),
    ('Patient 4', 'Heart Disease', 4, 104, '2023-04-01', '2023-04-15'),
    ('Patient 5', 'Headache', 5, 105, '2023-05-01', '2023-05-15');

-- Вставка тестовых записей в таблицу "rooms"
INSERT INTO rooms (beds_count, station_nr) VALUES
    (10, 1),
    (8, 2),
    (6, 3),
    (7, 4),
    (12, 5);

-- Вставка тестовых записей в таблицу "treats"
INSERT INTO treats (patient_nr, person_nr) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
