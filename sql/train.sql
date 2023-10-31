-- Создаем базу данных
CREATE DATABASE db_train;

-- Используем созданную базу данных
\c db_train;


-- Создание таблицы City
CREATE TABLE City (
    Name VARCHAR(255),
    Region VARCHAR(255),
    PRIMARY KEY (Name, Region)
);

-- Создание таблицы Station
CREATE TABLE Station (
    Name VARCHAR(255) PRIMARY KEY,
    Tracks INT,
    CityName VARCHAR(255),
    Region VARCHAR(255),
    FOREIGN KEY (CityName, Region) REFERENCES City(Name, Region)
);

-- Создание таблицы Train
CREATE TABLE Train (
    TrainNr INT PRIMARY KEY,
    Length INT,
    StartStationName VARCHAR(255),
    EndStationName VARCHAR(255),
    FOREIGN KEY (StartStationName) REFERENCES Station(Name),
    FOREIGN KEY (EndStationName) REFERENCES Station(Name)
);

-- Создание таблицы Connection
CREATE TABLE Connection (
    FromStation VARCHAR(255),
    ToStation VARCHAR(255),
    TrainNr INT,
    Departure TIMESTAMP,
    Arrival TIMESTAMP,
    PRIMARY KEY (FromStation, ToStation, TrainNr),
    FOREIGN KEY (FromStation) REFERENCES Station(Name),
    FOREIGN KEY (ToStation) REFERENCES Station(Name),
    FOREIGN KEY (TrainNr) REFERENCES Train(TrainNr)
);

-- Вставка данных в таблицу City
INSERT INTO City (Name, Region)
VALUES
    ('City1', 'Region1'),
    ('City2', 'Region2'),
    ('City3', 'Region1'),
    ('City4', 'Region3'),
    ('City5', 'Region2');

-- Вставка данных в таблицу Station
INSERT INTO Station (Name, Tracks, CityName, Region)
VALUES
    ('Station1', 4, 'City1', 'Region1'),
    ('Station2', 2, 'City2', 'Region2'),
    ('Station3', 3, 'City1', 'Region1'),
    ('Station4', 5, 'City4', 'Region3'),
    ('Station5', 2, 'City2', 'Region2');

-- Вставка данных в таблицу Train
INSERT INTO Train (TrainNr, Length, StartStationName, EndStationName)
VALUES
    (1001, 150, 'Station1', 'Station3'),
    (1002, 200, 'Station3', 'Station4'),
    (1003, 180, 'Station2', 'Station5'),
    (1004, 250, 'Station4', 'Station2'),
    (1005, 120, 'Station5', 'Station1');

-- Вставка данных в таблицу Connection
INSERT INTO Connection (FromStation, ToStation, TrainNr, Departure, Arrival)
VALUES
    ('Station1', 'Station3', 1001, '2023-10-31 08:00:00', '2023-10-31 10:00:00'),
    ('Station3', 'Station4', 1002, '2023-10-31 10:30:00', '2023-10-31 12:30:00'),
    ('Station2', 'Station5', 1003, '2023-10-31 09:30:00', '2023-10-31 11:30:00'),
    ('Station4', 'Station2', 1004, '2023-10-31 13:00:00', '2023-10-31 15:00:00'),
    ('Station5', 'Station1', 1005, '2023-10-31 14:30:00', '2023-10-31 16:30:00');
