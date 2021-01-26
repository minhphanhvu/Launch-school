DROP TABLE IF EXISTS public.customers;
DROP TABLE IF EXISTS public.services;
DROP TABLE IF EXISTS public.customers_services;

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name varchar(255) NOT NULL,
  payment_token varchar(8) NOT NULL UNIQUE CHECK (length(payment_token) = 8)
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description varchar(255) NOT NULL,
  price numeric(10, 2) NOT NULL CHECK (price > 0.00)
);

INSERT INTO customers (name, payment_token)
VALUES
  ('Pat Johnson', 'XHGOAHEQ'),
  ('Nancy Monreal', 'JKWQPJKL'),
  ('Lynn Blake', 'KLZXWEEE'),
  ('Chen Ke-Hua', 'KWETYCVX'),
  ('Scott Lakso', 'UUEAPQPS'),
  ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
VALUES
  ('Unix Hosting', 5.95),
  ('DNS', 4.95),
  ('Whois Registration', 1.95),
  ('High Bandwidth', 15.00),
  ('Business Support', 250.00),
  ('Dedicated Hosting', 50.00),
  ('Bulk Email', 250.00),
  ('One-to-one Training', 999.00);

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id integer REFERENCES customers(id) ON DELETE CASCADE NOT NULL,
  service_id integer REFERENCES services(id) NOT NULL,
  UNIQUE (customer_id, service_id)
);

INSERT INTO customers_services (customer_id, service_id)
VALUES
  (1, 1), 
  (1, 2), 
  (1, 3), 
  (3, 1), 
  (3, 2), 
  (3, 3), 
  (3, 4), 
  (3, 5), 
  (4, 1), 
  (4, 4), 
  (5, 1), 
  (5, 2), 
  (5, 6), 
  (6, 1), 
  (6, 6), 
  (6, 7); 

SELECT c.id, c.name, c.payment_token 
FROM customers AS c 
WHERE c.id IN (SELECT DISTINCT customer_id FROM customers_services);

SELECT customers.* FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
WHERE service_id IS NULL;

SELECT description FROM customers_services
RIGHT OUTER JOIN services
              ON services.id = service_id
WHERE service_id IS NULL;

SELECT customers.name,
       string_agg(services.description, ', ') AS services
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id
GROUP BY customers.id;

SELECT s.description, count(cs.service_id) AS count 
FROM services AS s 
  JOIN customers_services AS cs ON s.id = cs.service_id 
    GROUP BY description 
    HAVING count(cs.service_id) >= 3;

SELECT SUM(price) as gross
FROM services
INNER JOIN customers_services
        ON service_id = services.id;

INSERT INTO customers (name, payment_token)
VALUES ('John Doe',  'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id)
VALUES (7, 1),
(7, 2),
(7, 3);

SELECT SUM(price) AS sum 
FROM services 
  JOIN customers_services ON service_id = services.id WHERE price >= 100;

SELECT sum(price)
  FROM customers
    CROSS JOIN services
    WHERE price > 100;

DELETE FROM customers_services
WHERE service_id = 7;

DELETE FROM services
WHERE description = 'Bulk Email';

DELETE FROM customers
WHERE name = 'Chen Ke-Hua';