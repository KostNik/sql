SELECT *
from study_guru.tasks;


#INDEXIES
CREATE TABLE test
(
  id         INT      NOT NULL,
  last_name  CHAR(30) NOT NULL,
  first_name CHAR(30) NOT NULL,
  PRIMARY KEY (id),
  INDEX name (last_name, first_name)
);

#Therefore, the name index is used for lookups in the following queries:

SELECT *
FROM test
WHERE last_name = 'Widenius';

SELECT *
FROM test
WHERE last_name = 'Widenius'
  AND (first_name = 'Michael' OR first_name = 'Monty');

#However, the name index is not used for lookups in the following queries:
SELECT *
FROM test
WHERE first_name = 'Michael';

