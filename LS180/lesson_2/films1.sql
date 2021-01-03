DROP TABLE IF EXISTS public.films;
CREATE TABLE films (title varchar(255), "year" integer, genre varchar(100));

INSERT INTO films(title, "year", genre) VALUES ('Die Hard', 1988, 'action');  
INSERT INTO films(title, "year", genre) VALUES ('Casablanca', 1942, 'drama');  
INSERT INTO films(title, "year", genre) VALUES ('The Conversation', 1974, 'thriller');

SELECT * FROM films;

SELECT * FROM films WHERE LENGTH(title) < 12;

ALTER TABLE films
ADD COLUMN director varchar(255),
ADD COLUMN duration INTEGER;

UPDATE films
  SET director = 'John McTiernan', duration = 132
  WHERE title = 'Die Hard';

UPDATE films
  SET director = 'Michael Curtiz', duration = 102
  WHERE title = 'Casablanca';

UPDATE films
  SET director = 'Francis Ford Coppola', duration = 113
  WHERE title = 'The Conversation';

INSERT INTO films (title, "year", genre, director, duration)
VALUES ('1984', 1956, 'scifi', 'Michael Anderson', 90),
('Tinker Tailor Soldier Spy', 2011, 'espionage', 'Tomas Alfredson', 127),
('The Birdcage', 1996, 'comedy', 'Mike Nichols', 118);

-- NOW() is timestamp datatype, or use CURRENT_DATE
SELECT title, (EXTRACT(YEAR FROM NOW()) - year) AS age
FROM films
ORDER BY age ASC;

SELECT title, duration
FROM films
ORDER BY duration DESC
LIMIT 2;

SELECT title FROM films ORDER BY duration DESC LIMIT 1;