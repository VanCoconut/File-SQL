/*
  use of ORDER BY for ordering only th result and not the table
*/

SELECT id, occurred_at,total_amt_usd
FROM orders
ORDER BY id
LIMIT 10;

SELECT id, occurred_at,total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

SELECT id, occurred_at,total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;
