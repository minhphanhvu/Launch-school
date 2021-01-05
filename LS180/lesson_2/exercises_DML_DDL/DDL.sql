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