/*
  STRPOS, POSITION, CAST, COALESCE
*/



Each company in the accounts table wants to create an email address for each primary_poc.
The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.

SELECT LEFT(primary_poc,STRPOS(primary_poc,' ')-1)
		|| '.'||
        RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc,' '))
		|| '@' ||
        name
        || '.com'
FROM accounts

// soulzione corso
WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,
    RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
FROM t1;

//evita lo spazio nel 'name'
WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', REPLACE(name, ' ', ''), '.com')
FROM  t1;

/*
We would also like to create an initial password,
which they will change after their first log in.
The first password will be the first letter of the primary_poc's first name (lowercase),
then the last letter of their first name (lowercase),
the first letter of their last name (lowercase),
the last letter of their last name (lowercase),
the number of letters in their first name,
the number of letters in their last name,
and then the name of the company they are working with, all capitalized with no spaces.
*/
WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,
    RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com'),
        LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) ||
        LEFT(LOWER(last_name), 1) || RIGHT(LOWER(last_name), 1)
        || LENGTH(first_name) || LENGTH(last_name) || REPLACE(UPPER(name), ' ', '')
FROM t1;


// CAST

SELECT date orig_date, (SUBSTR(date, 7, 4)
      || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) new_date
FROM sf_crime_data;

// COALESCE
SELECT COALESCE(o.id, a.id) filled_id, a.name
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;
