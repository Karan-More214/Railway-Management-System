-- Create --
-- Create a new table Station with columns: station_id (Primary Key), station_name, station_code, location.
CREATE TABLE Station (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(100) NOT NULL,
    station_code VARCHAR(10) UNIQUE NOT NULL,
    location VARCHAR(255) NOT NULL
);
select * from Station;
INSERT INTO Station (station_id, station_name, station_code, location) 
VALUES 
(1, 'New Delhi', 'NDLS', 'Delhi, India'),
(2, 'Mumbai Central', 'BCT', 'Mumbai, India'),
(3, 'Howrah Junction', 'HWH', 'Kolkata, India'),
(4, 'Chennai Central', 'MAS', 'Chennai, India'),
(5, 'Bangalore City', 'SBC', 'Bangalore, India');


-- Alter --
-- Add a new column contact_number in the Station table.
alter table Station add column contact_number varchar(15);

-- Rename --
-- Rename the station_code column in Station to station_identifier.
alter table Station rename column station_code to station_identifier;

-- Truncate --
-- Remove all records from the Station table without deleting its structure.
truncate table Station;

-- Drop --
-- Delete all records from Station Table with structure
drop table Station;