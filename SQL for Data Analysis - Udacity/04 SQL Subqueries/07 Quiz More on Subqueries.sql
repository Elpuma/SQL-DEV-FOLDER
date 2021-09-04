/*Quiz: Working Through the Previous Video
		Use the task list below to work through the previous example.
		
		1. Use DATE_TRUNC to pull month level information about the first order ever placed 
		in the orders table.*/
SELECT DATE_TRUNC('month', MIN(occurred_at)) AS month
FROM orders
ORDER BY 1
;
/*		2. Use the result of the previous query to find only the orders that took place 
		   in the same month and year as the first order, and then pull the average for each 
		   type of paper qty in this month.*/

SELECT *
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = (SELECT DATE_TRUNC('month', MIN(occurred_at)) AS month 
										 FROM orders)
ORDER BY 
;
/* What was the month/year combo for the first order placed?
December 2013*/
;
/*Match each value to the corresponding description.*/
SELECT DATE_TRUNC('month', occurred_at),
	SUM(standard_qty + gloss_qty + poster_qty) AS amt,
	SUM(total_amt_usd) AS amt_usd,
	AVG(standard_qty) AS std,
	AVG(gloss_qty) AS gls,
	AVG(poster_qty) AS pst
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = (SELECT DATE_TRUNC('month', MIN(occurred_at)) AS month 
										 FROM orders)
GROUP BY 1
ORDER BY 1
/*answers:
377331 = The total amount spent on all orders on the first month that any order was placed in the orders table (in terms of usd)
268    = The average amount of standard paper sold on the first month that any order was placed in the orders table (in terms of quantity)
209    = The average amount of gloss paper sold on the first month that any order was placed in the orders table (in terms of quantity)
112    = The average amount of poster paper sold on the first month that any order was placed in the orders table (in terms of quantity)*/
;