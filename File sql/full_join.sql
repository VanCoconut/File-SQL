/*
  FULL OUTER JOIN, Inequality JOINs
*/

each account who has a sales rep
and each sales rep that has an account
(all of the columns in these returned rows will be full)

SELECT a.name acc_name, s.name rep_name
FROM accounts a
         FULL JOIN sales_reps  s
         ON a.sales_rep_id = s.id

but also each account that does not have a sales rep
and each sales rep that does not have an account
(some of the columns in these returned rows will be empty)
/*PRENDO TUTTO TRANNE L'INTERSEZIONE*/

SELECT a.name acc_name, s.name rep_name
FROM accounts a
    FULL JOIN sales_reps s
    ON s.id=a.sales_rep_id
WHERE a.sales_rep_id IS NULL OR s.id IS NULL

Inequality JOINs

SELECT a.name acc_name, a.primary_poc, s.name rep_name
FROM accounts a
	LEFT JOIN sales_reps s
    ON a.sales_rep_id=s.id AND a.primary_poc < s.name

change the interval to 1 day to find those web events
that occurred after, but not more than 1 day after, another web event
// in piu conta quanti sono i programmi entroi 1 giorno
SELECT COUNT(t.w2_occurred_at)
FROM(SELECT w1.account_id AS w1_account_id,
        w1.channel AS w1_channel,
       w1.occurred_at AS w1_occurred_at,
       w2.account_id AS w2_account_id,
               w2.channel AS w2_channel,
              w2.occurred_at AS w2_occurred_at
  FROM web_events w1
 LEFT JOIN web_events w2
   ON w1.account_id = w2.account_id
  AND w2.occurred_at > w1.occurred_at
  AND w2.occurred_at <= w1.occurred_at + INTERVAL '1 days'
ORDER BY w1.account_id, w2.occurred_at) t
