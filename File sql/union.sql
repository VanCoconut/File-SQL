

SELECT *
FROM accounts a1
WHERE name = 'Walmart'

UNION ALL

SELECT *
FROM accounts a2
WHERE name = 'Disney'

Perform the union in a common table expression and name it double_accounts.
Then do a COUNT the number of times a name appears in the double_accounts table.
If you do this correctly, your query results should have a count of 2 for each name.

WITH double_accounts  AS (SELECT a1.name a1_name
        FROM accounts a1

        UNION ALL

        SELECT a2.name a2_name
        FROM accounts a2)

SELECT  d.a1_name, COUNT(*),
        CASE WHEN COUNT(*)= 2 THEN 'Right' END AS c
FROM double_accounts AS d
GROUP BY 1
