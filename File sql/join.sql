/*
Provide a table for all web_events associated with account name of Walmart.
There should be three columns. Be sure to include the primary_poc,
time of the event, and the channel for each event. Additionally,
you might choose to add a fourth column to assure only Walmart events were chosen.

Provide a table that provides the region for each sales_rep along with their associated accounts.
Your final table should include three columns: the region name, the sales rep name, and the account name.
Sort the accounts alphabetically (A-Z) according to account name.

Provide the name for each region for every order,
as well as the account name and the unit price they paid (total_amt_usd/total) for the order.
Your final table should have 3 columns: region name, account name, and unit price.
A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

*/


SELECT a.name,a.primary_poc, w.occurred_at,w.channel
FROM web_events AS w
	JOIN accounts AS a
	ON w.account_id=a.id
WHERE a.name = 'Walmart';

SELECT r.name AS region_name,a.name AS account_name, s.name AS sales_rep_name
FROM region AS r
	JOIN sales_reps  AS s
	ON r.id=s.region_id
    JOIN accounts AS a
    ON s.id=a.sales_rep_id
ORDER BY a.name;

SELECT r.name AS region_name,a.name AS account_name, o.total_amt_usd/(o.total+0.01) AS unit_price
FROM region AS r

SELECT r.name AS region_name,a.name AS account_name, o.total_amt_usd/(o.total+0.01) AS unit_price
FROM region AS r
	JOIN sales_reps AS s
    ON s.region_id=r.id
    JOIN accounts AS a
    ON s.id=a.sales_rep_id
    JOIN orders AS o
    ON o.account_id=a.id
