/*
part 1:
  - Data Definition Language(DDL): what the schems is -> define the structure of the database.
  examples: CREATE, DROP, ALTER
  - Data Manipulation Language(DML): use RUD part of CRUD (Create, Read, Update, Delete),
  to alter the data in the database.

part 2:
  SELECT column_name FROM my_table;
  - SELECT is art of DML.

part 3:
  CREATE TABLE things (
    id serial PRIMARY KEY,
    item text NOT NULL UNIQUE,
    material text NOT NULL
  );
  - The statement uses DDL -> define table name, columns of the database

part 4:
  ALTER TABLE things
  DROP CONSTRAINT things_item_key;
  - DDL: does not alter the data, it changes the definition of data type of the column

part 5:
  INSERT INTO things VALUES (3, 'Scissors', 'Metal');\
  - DML: it adds data (a new row) to the tables 'things' -> changes the data in the database

part 6:
  UPDATE things
  SET material = 'plastic'
  WHERE item = 'Cup';
  - DML: change the data in row(s) where item values changes from 'Cup' to 'plastic'
part 7:
  \d things
  - a meta-command, psql line to see details, schema of the table things

part 8:
  DELETE FROM things WHERE item = 'Cup';
  - DML: delete row(s) -> manipulates the data in the database

part 9:
  DROP DATABASE xyzzy;
  - DDL: does not change the data in the database, however, it drop the entires database -> still
  belongs to DDL

part 10:
  CREATE SEQUENCE part_number_sequence;
  - DDL: creates a sequence schema. A sequence cycle automatically generates
/*