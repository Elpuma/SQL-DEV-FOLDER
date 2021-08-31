/*
 Often there is confusion about the difference between WHERE and HAVING. Select all the statements that are true regarding HAVING and WHERE statements.
 **WHERE** subsets the returned data based on a logical condition.
 **WHERE** appears after the **FROM**, **JOIN**, and **ON** clauses, but before **GROUP BY**.
 **HAVING** appears after the **GROUP BY** clause, but before the **ORDER BY** clause.
 **HAVING** is like **WHERE**, but it works on logical statements involving aggregations.
 
 Questions: HAVING
 Use the SQL environment below to assist with answering the following questions. 
 Whether you get stuck or you just want to double check your solutions, my answers can be found at the top of the next concept.
 */
--1. How many of the sales reps have more than 5 accounts that they manage?-------------------
SELECT s.id,
  s.name AS reps,
  COUNT(a.name) as total_accounts
FROM sales_reps AS s
  JOIN accounts AS a ON s.id = a.sales_rep_id
GROUP BY s.id,
  s.name
HAVING COUNT(a.name) > 5
ORDER BY total_accounts
;
--2. How many accounts have more than 20 orders?----------------------------------------------
SELECT a.id,
  a.name,
  COUNT(o.id) AS num_orders
FROM accounts AS a
  JOIN orders AS o ON a.id = o.account_id
GROUP BY a.id,
  a.name
HAVING COUNT(o.id) > 20
;
--3. Which account has the most orders?--------------------------------------------------------
SELECT a.id,
  a.name,
  COUNT(o.id) AS num_orders
FROM accounts AS a
  JOIN orders AS o ON a.id = o.account_id
GROUP BY a.id,
  a.name
HAVING COUNT(o.id) > 20
ORDER BY num_orders DESC
--answer: leucadia national
;
--4. Which accounts spent more than 30,000 usd total across all orders?------------------------
SELECT a.id,
  a.name,
  SUM(o.total_amt_usd) AS total_amt_usd_sum
FROM accounts AS a
  JOIN orders AS o ON a.id = o.account_id
GROUP BY a.id,
  a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total_amt_usd_sum
--answer: 204 accounts
;
--5. How many accounts spent less than 1,000 usd total across all orders?;
SELECT a.id, a.name, SUM(o.total_amt_usd) AS total_spent
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent
;
--6. Which account has spent the most with us?
SELECT a.id, a.name, SUM(o.total_amt_usd) AS total_spent
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 1
;
--7. Which account has spent the least with us?
SELECT a.id, a.name, SUM(o.total_amt_usd) AS total_spent
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent ASC
LIMIT 1
;
--8. Which accounts used facebook as a channel to contact customers more than 6 times?
SELECT a.name AS acc_name, w.channel, COUNT(w.channel) AS counter
FROM accounts AS a
JOIN web_events AS w
ON a.id = w.account_id
GROUP BY a.name, w.channel
HAVING COUNT(w.channel) > 6 AND w.channel LIKE ('facebook')
ORDER BY counter DESC
;
--9. Which account used facebook most as a channel?
SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel DESC
LIMIT 1
;
--10. Which channel was most frequently used by most accounts?
SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
--HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel DESC
LIMIT 10
;


