DROP TABLE IF EXISTS public.films;
CREATE TABLE films (title varchar(255), year integer, genre varchar(100), director varchar(255), duration integer);

INSERT INTO films(title, year, genre, director, duration) VALUES ('Die Hard', 1988, 'action', 'John McTiernan', 132);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('Casablanca', 1942, 'drama', 'Michael Curtiz', 102);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('The Conversation', 1974, 'thriller', 'Francis Ford Coppola', 113);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127);  
INSERT INTO films(title, year, genre, director, duration) VALUES ('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

ALTER TABLE films
ALTER COLUMN title SET NOT NULL,
ALTER COLUMN year SET NOT NULL,
ALTER COLUMN genre SET NOT NULL,
ALTER COLUMN director SET NOT NULL,
ALTER COLUMN duration SET NOT NULL;

ALTER TABLE films
ADD CONSTRAINT title_unique
UNIQUE (title);

ALTER TABLE films
DROP CONSTRAINT title_unique;

ALTER TABLE films
ADD CONSTRAINT title_length
CHECK (LENGTH(title) >= 1);

-- INSERT violates CHECK constraint
INSERT INTO films
VALUES('', 1999, 'action', 'Michael Bay', 100);

ALTER TABLE films
DROP CONSTRAINT title_length;

ALTER TABLE films
ADD CONSTRAINT year_period
CHECK (year >= 1900 AND year <= 2100);

ALTER TABLE films
ADD CONSTRAINT director_name
CHECK (LENGTH(director) >= 3 AND POSITION(' ' IN director) > 0);

-- produce error for constraint direct_name
UPDATE films
  SET director = 'Johnny'
  WHERE title = 'Die Hard';

-- ways to restrict: data type and length, NOT NULL, ADD CHECK, ADD PRIMARY KEY

-- define a default for a column that has a constraint (director)

ALTER TABLE films
ALTER COLUMN director DROP NOT NULL; -- drop not null constraint

ALTER TABLE films
ALTER COLUMN director SET DEFAULT 'Johnny'; -- set default to 'Johnny' to violate constraint

INSERT INTO films (title, year, genre, duration) -- error expected
VALUES ('Die Hard', 1988, 'action', 100);

-- print films table schema
\d films
-- print all columns to inspect
SELECT * FROM films;