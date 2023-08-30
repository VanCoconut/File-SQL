/*
  use of GROUP BY
*/

/*
  Which account (by name) placed the earliest order?
  Your solution should have the account name and the date of the order.
*/

SELECT a.name, MIN(o.occurred_at) min_date
FROM accounts AS a
  JOIN orders AS o
  ON a.id=o.account_id
GROUP BY a.name
ORDER BY  min_date;

/*
  Via what channel did the most recent (latest) web_event occur,
  which account was associated with this web_event?
  Your query should return only three values - the date,
  channel, and account name.
*/
/*
  NON FUNZIONA IL GROUP BY DI 2 TIENE SOLO QUANDO ENTRAMBI SONO RIPETUTI
  IN QUESTO CASO OTTIENI L'ULTIMA DATA IN CUI UN ACCOUNT HA USATO UNO SPECIFICO CANALE,
  MA ESSENDO 6 CANALI DIVERSI, CI SARANNO 6 OCCORRENZE PER OGNI ACCOUNT, QUINDI QUESTO
  NON PERMETTE DI VEDERE L'UTMA DATA IN UN UN ACCOUNT HA USATO UN QUALSIASI CANALE
*/
SELECT a.name, MAX(w.occurred_at) max_date, w.channel
FROM accounts AS a
  JOIN web_events AS w
  ON a.id=w.account_id
GROUP BY a.name, w.channel
ORDER BY  max_date DESC;


For each account,
determine the average amount of each type of paper they purchased across their orders.
Your result should have four columns -
one for the account name and one for the average quantity purchased for each of the paper types for each account

SELECT a.name,AVG(o.standard_qty) avg_stand, AVG(o.gloss_qty) avg_gloss, AVG(o.poster_qty) avg_post
FROM accounts AS a
  JOIN orders AS o
  ON  a.id=o.account_id
GROUP BY a.name;


Determine the number of times a particular channel
was used in the web_events table for each sales rep.
Your final table should have three columns -
the name of the sales rep, the channel, and the number of occurrences.
Order your table with the highest number of occurrences first.

SELECT s.name,w.channel,COUNT(*) times_used
FROM accounts AS a
  JOIN web_events AS w
  ON a.id=w.account_id
  JOIN sales_reps AS s
  ON s.id=a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY  times_used DESC;

Determine the number of times a particular channel
was used in the web_events table for each region.
Your final table should have three columns -
the region name, the channel, and the number of occurrences.
Order your table with the highest number of occurrences first.

SELECT r.name,w.channel,COUNT(*) times_used
FROM accounts AS a
  JOIN web_events AS w
  ON a.id=w.account_id
  JOIN sales_reps AS s
  ON s.id=a.sales_rep_id
  JOIN region AS r
  ON r.id=s.region_id
GROUP BY r.name, w.channel
ORDER BY  times_used DESC;
