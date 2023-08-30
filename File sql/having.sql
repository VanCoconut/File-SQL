/*
  HAVING
*/


How many of the sales reps have more than 5 accounts that they manage?

SELECT s.name, COUNT(*) AS num_acc_mana
FROM accounts AS a
  JOIN sales_reps AS s
  ON s.id=a.sales_rep_id
GROUP BY s.name
HAVING COUNT(*) > 5
ORDER BY num_acc_mana DESC;

//return only one row with the count of the rows of the FROM clause

SELECT COUNT(*) num_reps_above5
FROM(SELECT s.id, s.name, COUNT(*) num_accounts
        FROM accounts a
        JOIN sales_reps s
        ON s.id = a.sales_rep_id
        GROUP BY s.id, s.name
        HAVING COUNT(*) > 5
        ORDER BY num_accounts) AS Table1;

Which account has the most orders?

SELECT a.name, COUNT(*)
FROM accounts AS a
  JOIN orders AS o
  ON a.id=o.account_id
GROUP BY a.name
HAVING COUNT(*) >= ALL ( SELECT COUNT(*)
                        FROM accounts AS a
                          JOIN orders AS o
                          ON a.id=o.account_id
                          GROUP BY a.name)

// OR SHORTER WAY
SELECT a.name,COUNT(*) num_orders
FROM accounts AS a
  JOIN orders AS o
  ON a.id=o.account_id
GROUP BY a.name
ORDER BY 2 DESC
LIMIT 1;


Which accounts spent more than 30,000 usd total across all orders?

SELECT a.name, SUM(total_amt_usd) AS tot
FROM accounts AS a
  JOIN orders AS o
  ON a.id=o.account_id
GROUP BY a.name
HAVING SUM(total_amt_usd) > 30,000
ORDER BY tot DESC;

Which account has spent the least with us?

SELECT a.name, MIN(total_amt_usd)
FROM accounts AS a
  JOIN orders AS o
  ON a.id=o.account_id
GROUP BY a.name
HAVING MIN(total_amt_usd) <= ALL ( SELECT MIN(total_amt_usd)
                        FROM accounts AS a
                          JOIN orders AS o
                          ON a.id=o.account_id
                          GROUP BY a.name)

Which accounts used facebook as a channel to contact customers more than 6 times?

SELECT a.name, COUNT(*) AS tot
FROM accounts AS a
  JOIN web_events AS w
  ON a.id=w.account_id
  AND channel='facebook'
GROUP BY a.name
HAVING COUNT(*) > 6
ORDER BY tot DESC;

Which account used facebook most as a channel?

SELECT a.name, COUNT(*) AS tot
FROM accounts AS a
  JOIN web_events AS w
  ON a.id=w.account_id
  AND channel='facebook'
GROUP BY a.name
HAVING COUNT(*) >= ALL ( SELECT COUNT(*)
                          FROM accounts AS a
                            JOIN web_events AS w
                            ON a.id=w.account_id
                            AND channel='facebook'
                          GROUP BY a.name)

Which channel was most frequently used by most accounts?

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;
