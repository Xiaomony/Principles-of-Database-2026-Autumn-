SELECT title FROM movies WHERE title LIKE '%All %';

UPDATE people SET surname = replace(surname, 'T', 'Ttt') WHERE surname LIKE '%T%';
UPDATE people SET first_name = replace(first_name, 'T', 'Ttt') WHERE first_name LIKE '%T%';
SELECT first_name, surname FROM people WHERE first_name LIKE '%Ttt%' OR surname LIKE '%Ttt%';

UPDATE people SET surname = replace(surname, 'Ttt', 'T') WHERE surname LIKE '%Ttt%';
UPDATE people SET first_name = replace(first_name, 'Ttt', 'T') WHERE first_name LIKE '%Ttt%';
SELECT first_name, surname FROM people WHERE first_name LIKE '%T%' OR surname LIKE '%T%';
