/*Above is the ERD for the database again - it might come in handy as you tackle the quizzes below. You should write your solution as using a WITH statement, 
not by finding one solution and copying the output. The importance of this is that it allows your query to be dynamic in answering the question - 
even if the data changes, you still arrive at the right answer.

1. Provide the name of the sales_rep in each region with the largest amount of 
	total_amt_usd sales.*/
WITH t1 AS (SELECT s.name AS rep_name, r.name AS region_name, SUM(o.total_amt_usd) AS total_amt
			FROM orders AS o
			JOIN accounts AS a
			ON a.id = o.account_id
			JOIN sales_reps AS s
			ON s.id = a.sales_rep_id
			JOIN region AS r
			ON s.region_id = r.id
			GROUP BY 1,2
			ORDER BY 3 DESC),
	t2 AS (SELECT region_name, MAX(total_amt) AS total_amt
		  	FROM t1
		  	GROUP BY 1)
		  
SELECT t1.rep_name, t1.region_name, t1.total_amt
FROM t1
JOIN t2
ON t1.region_name = t2.region_name AND t1.total_amt = t2.total_amt
;
/*2. For the region with the largest sales total_amt_usd, how many total orders were placed?*/
WITH t1 AS (
			SELECT r.name AS region_name, SUM(o.total_amt_usd) AS total_amt
			FROM orders AS o
			JOIN accounts AS a
			ON a.id = o.account_id
			JOIN sales_reps AS s
			ON s.id = a.sales_rep_id
			JOIN region AS r
			ON s.region_id = r.id
			GROUP BY 1),
	t2 AS (
			SELECT MAX(total_amt)--outputs the MAX total_amt
			FROM t1)

SELECT r.name AS region_name, COUNT(o.total) AS total
	FROM orders AS o
	JOIN accounts AS a
	ON a.id = o.account_id
	JOIN sales_reps AS s
	ON s.id = a.sales_rep_id
	JOIN region AS r
	ON s.region_id = r.id
	GROUP BY 1
	HAVING SUM(o.total_amt_usd) = (SELECT * FROM t2)
;
/* 3. For the account that purchased the most (in total over their lifetime as a customer) standard_qty paper, how many accounts still had more in total purchases?*/
WITH t1 AS (
			SELECT a.name, SUM(o.standard_qty) AS sum_std_qty -- accounts with standard_qty amt
			FROM accounts a
			JOIN orders o
			ON a.id = o.account_id
			GROUP BY 1
			ORDER BY 2 DESC),
	t4 AS (
			SELECT MAX(sum_std_qty) --returns the max amt of std_qty
			FROM t1),
	t2 AS (
			SELECT a.name AS acc, SUM(o.total) AS total_qty
			FROM accounts a
			JOIN orders o
			ON a.id = o.account_id
			GROUP BY 1
			ORDER BY 2 DESC)

SELECT COUNT(*) AS amt_of_accs
FROM (SELECT acc, total_qty --lists accounts with totals > t1
		FROM t2
		WHERE total_qty > (SELECT * FROM t4)
		GROUP BY 1, 2) AS t3
;
/* 4. For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?*/
WITH t1 AS (
			SELECT a.id, a.name, SUM(o.total_amt_usd)
			FROM accounts a
			JOIN orders o
			ON a.id = o.account_id
			GROUP BY 1, 2
			ORDER BY 3 DESC
			LIMIT 1) -- returns the top spender

SELECT a.name, channel, COUNT(*)
FROM web_events AS w
JOIN accounts AS a
ON w.account_id = a.id AND a.id = (SELECT id FROM t1)
GROUP BY 1, 2
;

/*   5. What is the lifetime average amount spent in terms of total_amt_usd for the 
		top 10 total spending accounts?*/
WITH t1 AS (
			SELECT a.id, a.name AS acc_name, SUM(o.total_amt_usd) AS spent
			FROM accounts AS a
			JOIN orders AS o
			ON a.id = o.account_id
			GROUP BY 1, 2
			ORDER BY 3 DESC
			LIMIT 10)

SELECT AVG(spent)
FROM t1
;

/*   6. What is the lifetime average amount spent in terms of total_amt_usd, 
		including only the companies that spent more per order, on average, 
		than the average of all orders.
		a. average of all orders
		b. companies that spent(on average) more than the average of all the orders*/

WITH t1 AS (
			SELECT a.name AS acc_name, AVG(o.total_amt_usd) AS avg_spent
			FROM accounts AS a
			JOIN orders AS o
			ON a.id = o.account_id
			GROUP BY 1
			ORDER BY 2 DESC),
		t2 AS (
			SELECT AVG(total_amt_usd) AS avg_orders
			FROM orders AS o)

SELECT AVG(avg_spent)
FROM t1
WHERE avg_spent > (SELECT * FROM t2)
;

/*Look back through your solutions to subqueries and CTEs (WITH statements), which do you find more readable? Which is better for performance?

X CTEs are more readable.
X CTEs are more efficient, as the tables aren't recreated with each subquery portion.*/