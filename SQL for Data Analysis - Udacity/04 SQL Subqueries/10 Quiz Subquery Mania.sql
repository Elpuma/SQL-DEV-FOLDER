/*More Subqueries Quizzes
	1. Provide the name of the sales_rep in each region with the largest amount of 
	total_amt_usd sales.*/
SELECT t3.rep_name, t3.region_name, t3.total_amt
FROM (SELECT region_name, MAX(total_amt) AS total_amt
    FROM (SELECT s.name AS rep_name, r.name AS region_name, SUM(o.total_amt_usd) AS total_amt
        FROM orders AS o
        JOIN accounts AS a
        ON a.id = o.account_id
        JOIN sales_reps AS s
        ON s.id = a.sales_rep_id
        JOIN region AS r
        ON s.region_id = r.id
        GROUP BY 1,2
        ORDER BY 3 DESC) AS t1
	GROUP BY 1) t2
JOIN (SELECT s.name AS rep_name, r.name AS region_name, SUM(o.total_amt_usd) AS total_amt
    FROM orders AS o
    JOIN accounts AS a
    ON a.id = o.account_id
    JOIN sales_reps AS s
    ON s.id = a.sales_rep_id
    JOIN region AS r
    ON s.region_id = r.id
    GROUP BY 1,2
    ORDER BY 3 DESC) t3
ON t3.region_name = t2.region_name AND t3.total_amt = t2.total_amt
;
/*More Subqueries Quizzes
	2. For the region with the largest sales total_amt_usd, how many total orders were placed?*/
SELECT r.name AS region_name, COUNT(o.total) AS total
	FROM orders AS o
	JOIN accounts AS a
	ON a.id = o.account_id
	JOIN sales_reps AS s
	ON s.id = a.sales_rep_id
	JOIN region AS r
	ON s.region_id = r.id
	GROUP BY 1
	HAVING SUM(o.total_amt_usd) = (SELECT MAX(total_amt)--outputs the MAX total_amt
									FROM (SELECT r.name AS region_name, SUM(o.total_amt_usd) AS total_amt
										FROM orders AS o
										JOIN accounts AS a
										ON a.id = o.account_id
										JOIN sales_reps AS s
										ON s.id = a.sales_rep_id
										JOIN region AS r
										ON s.region_id = r.id
										GROUP BY 1
										ORDER BY 2 DESC) t1)
;

/*For the account that purchased the most (in total over their lifetime as a customer) standard_qty paper, how many accounts still had more in total purchases?*/
SELECT COUNT(*) AS amt_of_accs
FROM (SELECT acc, total_qty --lists accounts with totals > t1
		FROM (SELECT a.name AS acc, SUM(o.total) AS total_qty
				FROM accounts a
				JOIN orders o
				ON a.id = o.account_id
				GROUP BY 1
				ORDER BY 2 DESC) AS t2
		WHERE total_qty > (SELECT MAX(sum_std_qty) --returns the max amt of std_qty
							FROM (SELECT a.name, SUM(o.standard_qty) AS sum_std_qty -- accounts with standard_qty amt
									FROM accounts a
									JOIN orders o
									ON a.id = o.account_id
									GROUP BY 1
									ORDER BY 2 DESC) AS t1)
		GROUP BY 1, 2) AS t3
;
/*More Subqueries Quizzes
	4. For the customer that spent the most (in total over their lifetime as a customer) 
	total_amt_usd, how many web_events did they have for each channel?
	a - customers that spent the most total_amt_usd
	b - web_events for each channel
	*/

SELECT a.name, channel, COUNT(*)
FROM web_events AS w
JOIN accounts AS a
ON w.account_id = a.id AND a.id = (SELECT id
									FROM (SELECT a.id, a.name, SUM(o.total_amt_usd)
										FROM accounts a
										JOIN orders o
										ON a.id = o.account_id
										GROUP BY 1, 2
										ORDER BY 3 DESC
										LIMIT 1 -- returns the top spender
										)AS t1)
GROUP BY 1, 2
;
/*   5. What is the lifetime average amount spent in terms of total_amt_usd for the 
		top 10 total spending accounts?*/

SELECT AVG(spent)
FROM (SELECT a.id, a.name AS acc_name, SUM(o.total_amt_usd) AS spent
		FROM accounts AS a
		JOIN orders AS o
		ON a.id = o.account_id
		GROUP BY 1, 2
		ORDER BY 3 DESC
		LIMIT 10) AS t1
;
/*   6. What is the lifetime average amount spent in terms of total_amt_usd, 
		including only the companies that spent more per order, on average, 
		than the average of all orders.
		a. average of all orders
		b. companies that spent(on average) more than the average of all the orders*/

SELECT AVG(avg_spent)
FROM (SELECT a.name AS acc_name, AVG(o.total_amt_usd) AS avg_spent
		FROM accounts AS a
		JOIN orders AS o
		ON a.id = o.account_id
		GROUP BY 1
		ORDER BY 2 DESC
		) AS t1
WHERE avg_spent > (SELECT AVG(total_amt_usd) AS avg_orders
					FROM orders AS o)
;
