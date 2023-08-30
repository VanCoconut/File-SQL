
Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.

/* poteva andare bene usare la query in 't' come query finale
ma non avremmo avuto in uscita il nome del rappresentanto
poiche mettendo nel GROUP BY sia la regione che il nome
avrebbe raggruppato solo quando trova lo stesso nome nella stessa regione 2 volte
cosa impossibile perchè 'sub' restituisce una somma dove i nomi sono presenti
solo una volta.
QUINDI QESTO MEDOTO SI PUO' USARE PER FAR RICOMPARIRE IL NOME FACENDO IL JOIN
DELLE TABELLE GIAì PRONTE
*/

WITH sub AS (SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
              FROM sales_reps AS s,region AS r, orders AS O, accounts AS a
              WHERE r.id=s.region_id AND s.id=a.sales_rep_id AND a.id=o.account_id
              GROUP BY 1,2),
    t AS (SELECT  sub.region_name region_name, MAX(total_amt) total_amt
          FROM sub
          GROUP BY 1)

SELECT  s.rep_name,t.region_name,s.total_amt
FROM sub s, t
WHERE s.region_name = t.region_name AND t.total_amt = s.total_amt;

/* lo stesso ma preso dalla soluzione */

WITH t1 AS (
SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
 FROM sales_reps s
 JOIN accounts a
 ON a.sales_rep_id = s.id
 JOIN orders o
 ON o.account_id = a.id
 JOIN region r
 ON r.id = s.region_id
 GROUP BY 1,2
 ORDER BY 3 DESC),
t2 AS (
 SELECT region_name, MAX(total_amt) total_amt
 FROM t1
 GROUP BY 1)
SELECT t1.rep_name, t1.region_name, t1.total_amt
FROM t1
JOIN t2
ON t1.region_name = t2.region_name AND t1.total_amt = t2.total_amt;


How many accounts had more total purchases than the account name which
has bought the most standard_qty paper throughout their lifetime as a customer?

WITH t1 AS (
            SELECT a.name , SUM(standard_qty) as std_tot, SUM(total) as tot
             FROM orders o
             JOIN accounts a
             ON a.id = o.account_id
             GROUP BY 1
             HAVING  SUM(standard_qty) >= ALL ( SELECT SUM(standard_qty)
                                                FROM orders o
                                                JOIN accounts a
                                                ON a.id = o.account_id
                                              GROUP BY a.name)
            ),

      t2 AS (
             SELECT a.name
             FROM accounts a, orders o
             WHERE a.id=o.account_id
             GROUP BY 1
             HAVING SUM(o.total) > (SELECT tot FROM t1)
             )
SELECT COUNT(*)
FROM t2

// NON FUNZIONA
WITH t1 AS  (SELECT a.name AS name,SUM(o.total) tot
            FROM accounts a, orders o
            WHERE a.id=o.account_id
            GROUP BY a.name
            HAVING SUM(o.standard_qty) >= ALL (SELECT SUM(o.standard_qty)
                                        FROM accounts a, orders o
                                        WHERE a.id=o.account_id
                                        GROUP BY a.name)
              )

SELECT a.name, COUNT(*)
FROM  accounts a, orders o
WHERE o.account_id=a.id
GROUP BY a.name
HAVING SUM(o.total) > (SELECT tot
                        FROM t1)


For the customer that spent the most
(in total over their lifetime as a customer) total_amt_usd,
how many web_events did they have for each channel?

WITH t1 AS (
            SELECT a.id , SUM(total_amt_usd) as tot
             FROM orders o
             JOIN accounts a
             ON a.id = o.account_id
             GROUP BY 1
             ORDER BY 2 DESC
             LIMIT 1
            )
SELECT channel, COUNT(*)
FROM t1, web_events w
WHERE t1.id=w.account_id
GROUP BY 1

What is the lifetime average amount spent in
terms of total_amt_usd for the top 10 total spending accounts?

WITH t1 AS (
            SELECT a.name AS name, SUM(total_amt_usd) as tot
             FROM orders o
             JOIN accounts a
             ON a.id = o.account_id
             GROUP BY 1
             ORDER BY 2 DESC
             LIMIT 10
            )
SELECT  AVG(tot)
FROM t1



What is the lifetime average amount spent in terms of total_amt_usd,
including only the companies that spent more per order,
on average, than the average of all orders
NON CAPISCO
