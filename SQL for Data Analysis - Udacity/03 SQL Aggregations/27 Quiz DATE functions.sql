/*
Questions: Working With DATEs
Use the SQL environment below to assist with answering the following questions. 
Whether you get stuck or you just want to double check your solutions, my answers can be found at the top of the next concept.
*/

--1. Find the sales in terms of total dollars for all orders in each year, 
--   ordered from greatest to least. Do you notice any trends in the yearly sales totals?
SELECT DATE_PART('year', o.occurred_at) AS year,
	SUM(total_amt_usd) AS sales
FROM orders AS o
GROUP BY 1
ORDER BY 2 DESC
;
/* 2. Which month did Parch & Posey have the greatest sales in terms of total dollars? 
   Are all months evenly represented by the dataset?
   To be evenly represented we need to remove 2013 since only 99 sales
   and 2017 had only 25 sales other had >1000 verify using the following query
SELECT DATE_PART('year', o.occurred_at) AS year,
	--DATE_PART('month', o.occurred_at) AS month,
	SUM(total_amt_usd) AS earnings,
	COUNT(total_amt_usd) AS sale_count
FROM orders AS o
GROUP BY 1
ORDER BY 2 DESC;
now for the actual answer:
*/
SELECT DATE_PART('month', o.occurred_at) AS month,
	SUM(total_amt_usd) AS earnings
FROM orders AS o
WHERE o.occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC
;
/* 3. Which year did Parch & Posey have the greatest sales in terms of total number of orders? 
      Are all years evenly represented by the dataset?*/
SELECT DATE_PART('year', o.occurred_at) AS year,
	COUNT(o.total_amt_usd) total_sales
FROM orders AS o
GROUP BY 1
ORDER BY 2 DESC
;
/* 4. Which month did Parch & Posey have the greatest sales in terms of total number of orders? 
      Are all months evenly represented by the dataset?*/
SELECT DATE_PART('month', o.occurred_at) AS month,
	COUNT(o.total_amt_usd) total_sales
FROM orders AS o
WHERE o.occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC
;
/* 5. In which month of which year did Walmart spend the most on gloss paper in 
      terms of dollars? */
SELECT DATE_PART('year', occurred_at) AS year, 
	DATE_PART('month', occurred_at) AS month, 
	SUM(gloss_amt_usd) total_spent_gloss
FROM orders o
JOIN accounts a
ON o.account_id = a.id
WHERE a.name LIKE 'Walmart'
GROUP BY 1, 2
ORDER BY 3 DESC--may 2016 is the answer
; 

