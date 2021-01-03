CREATE TABLE people (
    id serial PRIMARY KEY,
    name varchar(255),
    age integer,
    occupation varchar(255)
);

INSERT INTO people (name, age, occupation) VALUES ('Abby', 34, 'biologist');
INSERT INTO people (name, age) VALUES ('Mu''nisah', 26);
INSERT INTO people(name, age, occupation) VALUES ('Mirabelle', 40, 'contractor');

SELECT * FROM people LIMIT 1 OFFSET 1;

SELECT * FROM people WHERE occupation IS NULL;

SELECT * FROM people WHERE name = 'Mu''nisah';


CREATE TABLE birds (
    name varchar(255),
    length decimal(3, 1),
    wingspan decimal(3, 1),
    family varchar(255),
    extinct boolean DEFAULT false
);

INSERT INTO birds (name, length, wingspan, family, extinct)
VALUES ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false),
('American Robin', 25.5, 36.0, 'Turdidae', false),
('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
('Corolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
('Common Kestrel', 35.5, 73.5, 'Falconidae', false);

SELECT name, family
FROM birds
WHERE extinct = false
ORDER BY length ASC;

SELECT ROUND(AVG(wingspan), 1) AS wingspan_average,
MIN(wingspan) AS wingspan_min,
MAX(wingspan) AS wingspan_max 
FROM birds;

