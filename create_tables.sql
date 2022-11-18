CREATE TABLE  immigrations(
	immigration_id INTEGER NOT NULL PRIMARY KEY,
    immigration_year INTEGER NOT NULL,
    immigration_month INTEGER NOT NULL,
    origin_city VARCHAR(256) NOT NULL,
    origin_res VARCHAR(256) NOT NULL,
    arrival_city VARCHAR(256) NOT NULL,
    arrival_state VARCHAR(256) NOT NULL,
    arrival_date TIMESTAMP  REFERENCES time(dt),
    travel_mode VARCHAR(256),
    address VARCHAR(256),
    departial_date TIMESTAMP NOT NULL REFERENCES time(dt),
    age INTEGER,
    visa_class VARCHAR(256),
    birth_year INTEGER,
    gender VARCHAR(256),
    airline VARCHAR(256),
    visa_type VARCHAR(256)

);

CREATE TABLE  city(
	city_id INTEGER NOT NULL PRIMARY KEY,
    city VARCHAR(256) NOT NULL,
    state VARCHAR(256) NOT NULL,
    state_code VARCHAR(256) NOT NULL,
    median_age FLOAT NOT NULL,
    male_population INTEGER,
    female_population INTEGER ,
    total_population INTEGER ,
    number_of_veterans INTEGER ,
    foreign_born INTEGER ,
    average_household_size FLOAT

);

CREATE TABLE  city_races(
    city_race_id INTEGER NOT NULL PRIMARY KEY,
    city_id INTEGER NOT NULL REFERENCES city(city_id),
    race VARCHAR(256) NOT NULL,
    race_count INTEGER NOT NULL
);

CREATE TABLE  temperature(
    temperature_date TIMESTAMP NOT NULL REFERENCES time(dt),
    city_id INTEGER NOT NULL REFERENCES city(city_id),
    average_temperature FLOAT NOT NULL,
    average_temperature_uncertainty FLOAT
);


CREATE TABLE  airport(
    airport_id VARCHAR(256) NOT NULL,
    name VARCHAR(256) NOT NULL,
    type VARCHAR(256) NOT NULL,
    city_id INTEGER NOT NULL REFERENCES city(city_id),

);


CREATE TABLE  time (
	dt TIMESTAMP NOT NULL PRIMARY KEY,
	hour int4,
	day int4,
	week int4,
	month varchar(256),
	year int4 ,
	weekday varchar(256),
);