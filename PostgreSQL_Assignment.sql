-- Active: 1747649093508@@127.0.0.1@5432@conservation_db

-- database create for postgreSQL
CREATE DATABASE conservation_db;


-- create table
CREATE Table rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(100)
);

CREATE Table species(
    species_id SERIAL PRIMARY key,
    common_name VARCHAR(100),
    scientific_name VARCHAR(100),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

CREATE Table sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id),
    species_id INTEGER REFERENCES species( species_id ),
    sighting_time TIMESTAMP,
    location VARCHAR(100),
    notes TEXT
);

INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

SELECT * FROM rangers;

INSERT INTO species(common_name,scientific_name,discovery_date,conservation_status)VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

SELECT * FROM species;

INSERT INTO sightings(species_id, ranger_id,location,sighting_time,notes)VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

 SELECT * FROM sightings;

--problem-1- Register a new ranger
 INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

--problem-2-Count unique species ever sighted.
SELECT COUNT (DISTINCT species_id)as unique_species_count FROM sightings;

--problem-3-Find all sightings where the location includes "Pass"
SELECT * FROM sightings
    WHERE LOCATION ILIKE '%Pass%';

--problem-4- ranger's name and their total sightings
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
    LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
    GROUP BY r.NAME;


--problem-5- species  never sighted
SELECT common_name 
    from species
    WHERE species_id NOT IN (SELECT DISTINCT species_id FROM sightings)

--problem-6-most recent 2 sightings
SELECT sp.common_name, s.sighting_time, r.NAME
    FROM sightings s
    join species sp ON s.species_id = sp.species_id
    JOIN rangers r ON s.ranger_id = r.ranger_id
    ORDER BY s.sighting_time DESC
    LIMIT 2;

--problem-7- Update all species  status 'Historic'
update species 
SET conservation_status = 'Historic'
    WHERE discovery_date < '2025-05-24';

--problem-8-time of day Label
SELECT  sighting_id,
    CASE 
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 and 17 then 'Afternoon'
        ELSE 'Evening' 
    END AS time_of_day
    FROM  sightings;

--problem-9- Delete rangers who have never sighted any species
DELETE FROM rangers
WHERE ranger_id not IN (SELECT DISTINCT ranger_id FROM  sightings);