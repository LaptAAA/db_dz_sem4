CREATE DATABASE lapteva_215_train;

\c tasktrain;

CREATE TABLE cities (
    region varchar,
    city_name varchar,
    PRIMARY KEY (region, city_name)
);

CREATE TABLE stations (
    station_name varchar PRIMARY KEY,
    tracks_count integer,
    region varchar,
    city_name varchar,
    FOREIGN KEY (region, city_name) REFERENCES cities(region, city_name)
);

CREATE TABLE trains (
    train_nr serial PRIMARY KEY,
    length integer,
    start_station_name varchar,
    end_station_name varchar,
    FOREIGN KEY (start_station_name, end_station_name) REFERENCES cities(city_name, city_name)
);

CREATE TABLE connecteds (
    train_nr integer,
    from_station varchar,
    to_station varchar,
    arrival date,
    departure date,
    FOREIGN KEY (train_nr) REFERENCES trains(train_nr),
    FOREIGN KEY (from_station) REFERENCES stations(station_name),
    FOREIGN KEY (to_station) REFERENCES stations(station_name)
);



-- Вставка тестовых записей в таблицу "cities"
INSERT INTO cities (region, city_name) VALUES
    ('Region A', 'City A'),
    ('Region A', 'City B'),
    ('Region B', 'City C'),
    ('Region B', 'City D'),
    ('Region C', 'City E');

-- Вставка тестовых записей в таблицу "stations"
INSERT INTO stations (station_name, tracks_count, region, city_name) VALUES
    ('Station 1', 4, 'Region A', 'City A'),
    ('Station 2', 3, 'Region A', 'City B'),
    ('Station 3', 2, 'Region B', 'City C'),
    ('Station 4', 4, 'Region B', 'City D'),
    ('Station 5', 3, 'Region C', 'City E');

-- Вставка тестовых записей в таблицу "trains"
INSERT INTO trains (length, start_station_name, end_station_name) VALUES
    (10, 'City A', 'City E'),
    (11, 'City C', 'City B'),
    (12, 'City D', 'City A'),
    (13, 'City B', 'City D'),
    (14, 'City E', 'City A');

-- Вставка тестовых записей в таблицу "connecteds"
INSERT INTO connecteds (train_nr, from_station, to_station, arrival, departure) VALUES
    (1, 'Station 1', 'Station 2', '2023-11-15', '2023-11-16'),
    (2, 'Station 3', 'Station 2', '2023-11-16', '2023-11-17'),
    (3, 'Station 4', 'Station 1', '2023-11-15', '2023-11-16'),
    (4, 'Station 2', 'Station 4', '2023-11-17', '2023-11-18'),
    (5, 'Station 5', 'Station 1', '2023-11-16', '2023-11-17');
