/*
 Practice
 Let's get some practice using ORDER BY:
 
 Write a query to return the 10 earliest orders in the orders table. 
 Include the id, occurred_at, and total_amt_usd.
 
 
 Write a query to return the top 5 orders in terms of largest total_amt_usd. 
 Include the id, account_id, and total_amt_usd.
 
 
 Write a query to return the lowest 20 orders in terms of smallest 
 total_amt_usd. Include the id, account_id, and total_amt_usd.
 
 
 Remember, just because a query successfully runs, does not mean you have 
 the correct results. To see if your query worked like you wanted it to, 
 you need to examine your output to see if it satisfies the problem or the 
 question. You can also compare your query and results with the solution 
 on the following page (concept).
 */
SELECT id,
    occurred_at,
    total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;
SELECT id,
    account_id,
    total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;
SELECT id,
    account_id,
    total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;