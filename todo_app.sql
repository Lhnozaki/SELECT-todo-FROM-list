DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks
(
  id SERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP,
  completed boolean NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks
DROP COLUMN completed;

ALTER TABLE tasks
ADD COLUMN completed_at TIMESTAMP NULL DEFAULT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at
SET
NOT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at
SET
DEFAULT now
();

INSERT INTO tasks
  (
  title,
  description,
  created_at,
  updated_at,
  completed_at
  )
VALUES
  ('Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks
  (title, description)
VALUES
  ('Study PostgreSQL', 'Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at is NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, DESCRIPTION
FROM tasks
WHERE completed_at is NULL;

SELECT *
FROM tasks
ORDER BY created_at;

INSERT INTO tasks
  (title, description)
VALUES
  ('mistake 1', 'a test try');

INSERT INTO tasks
  (title, description)
VALUES
  ('mistake 2', 'another test try');

INSERT INTO tasks
  (title, description)
VALUES
  ('third mistake', 'another test try');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;