DROP TABLE IF EXISTS public.planets;
DROP TABLE IF EXISTS public.stars;

CREATE TABLE stars (
    id serial PRIMARY KEY,
    name varchar(25) UNIQUE NOT NULL,
    distance integer NOT NULL CHECK (distance > 0),
    spectral_type varchar(1) CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
    companions integer NOT NULL CHECK (companions >= 0)
);

CREATE TABLE planets (
    id serial PRIMARY KEY,
    designation varchar(1) CHECK (designation BETWEEN 'a' AND 'z'),
    mass integer
);

ALTER TABLE planets
ADD COLUMN star_id integer NOT NULL;

ALTER TABLE planets
ADD CONSTRAINT "planets_star_id_fkey"
FOREIGN KEY (star_id) REFERENCES stars(id);

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);

INSERT INTO stars (name, distance, spectral_type, companions)
VALUES ('Alpha Centauri B', 4, 'K', 3);

-- see if error happens --> change type not successful --> error
ALTER TABLE stars
ALTER COLUMN name TYPE varchar(2);

ALTER TABLE stars
ALTER COLUMN distance TYPE decimal;

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Orionis', 643.4, 'M', 9);

-- change back to integer and see what happens --> either round up or round down back to integers
ALTER TABLE stars
ALTER COLUMN distance TYPE integer;

ALTER TABLE stars
ALTER COLUMN spectral_type SET NOT NULL;

-- revert back to DROP NOT NULL and see what happens to SET NOT NULL again
ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check,
ALTER COLUMN spectral_type DROP NOT NULL;

INSERT INTO stars (name, distance, companions)
           VALUES ('Epsilon Eridani', 10.5, 0);

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Lacaille 9352', 10.68, 'X', 0);

ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M'));

ALTER TABLE stars
ALTER COLUMN spectral_type SET NOT NULL;

-- DROP bad data
DELETE FROM stars
WHERE spectral_type NOT IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')
OR spectral_type IS NULL;

-- modify spectral_type to enumerated type
CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');
ALTER TABLE stars
ALTER COLUMN spectral_type TYPE spectral_type_enum USING spectral_type::spectral_type_enum;

-- print out the tables some rows
SELECT * FROM stars LIMIT 5;
SELECT * FROM planets LIMIT 5;

-- modify mass column to decimal
ALTER TABLE planets
ALTER COLUMN mass TYPE numeric;

-- add not null and constraint to mass
ALTER TABLE planets
ALTER COLUMN mass SET NOT NULL,
ADD CHECK (mass > 0);

-- add not null to designation
ALTER TABLE planets
ALTER COLUMN designation SET NOT NULL;

-- add semi_major_axis
ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;

-- furthuer exploration -- drop column semi_major_axis
ALTER TABLE planets
DROP COLUMN semi_major_axis;

DELETE FROM stars; -- delete everything from the stars table
-- Restart the sequence -- only do this with deleting everything from the table
ALTER SEQUENCE stars_id_seq RESTART WITH 1;
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4.37, 'K', 3);
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Epsilon Eridani', 10.5, 'K', 0);

-- add data to planets
INSERT INTO planets (designation, mass, star_id)
           VALUES ('b', 0.0036, 1); -- check star_id; see note below
INSERT INTO planets (designation, mass, star_id)
           VALUES ('c', 0.1, 2); -- check star_id; see note below

-- add semi_major_axis back without not null
ALTER TABLE planets
ADD COLUMN semi_major_axis numeric;

-- add semi_major_axis data
UPDATE planets
SET semi_major_axis = 0.04 WHERE star_id = 1;
UPDATE planets
SET semi_major_axis = 40 WHERE star_id = 2;

-- give not null constraint back
ALTER TABLE planets
ALTER COLUMN semi_major_axis SET NOT NULL;


-- add moons table
CREATE TABLE moons (
    id serial PRIMARY KEY,
    designation integer NOT NULL CHECK (designation > 1),
    semi_major_axis numeric CHECK (semi_major_axis > 0.0),
    mass numeric CHECK (mass > 0.0),
    planet_id integer NOT NULL REFERENCES planets(id)
);

-- dump database
-- pg_dump --inserts extrasolar > extrasolar.dump.sql