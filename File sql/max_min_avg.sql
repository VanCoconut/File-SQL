/*
  brief example of usingig these COUNT,SUM,MAX,MIN,AVG
*/

//COUNT only not NULL values

SELECT COUNT(accounts.id)
FROM accounts;

//SUM only not NULL numeric values

SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;

// When was the earliest order ever placed? You only need to return the date.

SELECT MIN(occurred_at)
FROM orders

SELECT AVG(standard_qty) avg_standard,
AVG(poster_qty) avg_poster,
AVG(standard_amt_usd) avg_standard_price,
AVG(poster_amt_usd) avg_poster_amt_usd
FROM orders
