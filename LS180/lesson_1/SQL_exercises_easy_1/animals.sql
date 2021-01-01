/* Run createdb animals in CLI to create animals database */

CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(25),
  age integer,
  species varchar(15)
);

INSERT INTO birds (name, age, species)
VALUES ('Charlie', 3, 'Finch'),
('Allie', 5, 'Owl'),
('Jennifer', 3, 'Magpie'),
('Jamie', 4, 'Owl'),
('Roy', 8, 'Crow');

SELECT * FROM birds;

SELECT *
FROM birds
WHERE age < 5;

UPDATE birds
SET species = 'Raven'
WHERE name = 'Roy' AND
age = 8;

DELETE FROM birds
WHERE name = 'Charlie' AND
age = 3 AND
species = 'Finch';

ALTER TABLE birds
ADD CONSTRAINT age_non_negative
CHECK (age > 0);

DROP TABLE birds;

-- DROP DATABASE animals;
-- To drop database, use CLI 'dropdb animals' since the database cannot be deleted when being opened.