/*
 SUB OR NESTER OR WHATEVER
*/

Use the test environment below to find the number
of events that occur for each day for each channel.

SELECT DATE_TRUNC('day',occurred_at), channel, COUNT(*)
FROM web_events
GROUP BY 1,2
ORDER BY 3 DESC;

// IS THE SAME AS

SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
          FROM web_events
          GROUP BY 1,2
          ORDER BY 3 DESC) sub;

Now find the average number of events for each channel.
Since you broke out by day earlier, this is giving you an average per day.

SELECT  channel,AVG(events)
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
          FROM web_events
          GROUP BY 1,2
          ORDER BY 3 DESC) sub
GROUP BY 1
ORDER BY 2 DESC;

/* Trova il mese, relativo ad un anno, con l'ordine più antico
  diverse opzioni
*/

1)
SELECT DATE_TRUNC('month',o.occurred_at)
FROM orders AS o
ORDER BY 1
LIMIT 1;

2)
SELECT DATE_TRUNC('month',MIN(o.occurred_at))
FROM orders AS o

3) /* Queri innestate dove però trovi tutti gli ordini di quel mese, se metti il MIN trovi solo il primo*/

SELECT MIN(DATE_TRUNC('month',o.occurred_at))
FROM orders AS o

4) /* Queri innestate dove però trovi tutti gli ordini di quel mese*/

SELECT DATE_TRUNC('month',o.occurred_at)
FROM orders AS o
WHERE DATE_TRUNC('month',o.occurred_at)<= ALL(SELECT DATE_TRUNC('month',o.occurred_at)
                                              FROM orders AS o)


Use the result of the previous query to find only the orders
that took place in the same month and year as the first order,
and then pull the average for each type of paper

diverse opzioni
1)
SELECT AVG(standard_qty) AS std,AVG(gloss_qty) AS gloss,
AVG(poster_qty) AS pst,SUM(total_amt_usd)
FROM orders AS o
WHERE DATE_TRUNC('month',o.occurred_at)<= ALL(SELECT DATE_TRUNC('month',o.occurred_at)
FROM orders AS o)

2)
SELECT AVG(standard_qty) avg_std, AVG(gloss_qty) avg_gls, AVG(poster_qty) avg_pst
FROM orders
WHERE DATE_TRUNC('month', occurred_at) =
     (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);
SELECT SUM(total_amt_usd)
FROM orders
WHERE DATE_TRUNC('month', occurred_at) =
     (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);
