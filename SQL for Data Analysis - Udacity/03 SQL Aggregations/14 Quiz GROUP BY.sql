/*
 Questions: GROUP BY
 Use the SQL environment below to assist with answering the following questions. 
 Whether you get stuck or you just want to double check your solutions, my answers can be found at the top of the next concept.
 
 One part that can be difficult to recognize is when it might be easiest to use an aggregate or one of the other SQL functionalities. 
 Try some of the below to see if you can differentiate to find the easiest solution.
 */
/*
 1. Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
 alternative simplier solution
 SELECT a.name, o.occurred_at
 FROM accounts a
 JOIN orders o
 ON a.id = o.account_id
 ORDER BY occurred_at
 LIMIT 1;
 
 */
SELECT a.name AS name,
    MIN(o.occurred_at) AS date
FROM accounts AS a
    JOIN orders AS o ON o.account_id = a.id
GROUP BY name
ORDER BY date
LIMIT 1;
/*
 2. Find the total sales in usd for each account. 
 You should include two columns - the total sales for each company's orders in usd and the company name.
 */
SELECT a.name AS name,
    SUM(o.total_amt_usd) AS total_sales
FROM accounts a
    JOIN orders o ON o.account_id = a.id
GROUP BY name
ORDER BY name;
/*
 3. Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? 
 Your query should return only three values - the date, channel, and account name.
 */
SELECT w.occurred_at AS date,
    w.channel as channel,
    a.name as name
FROM web_events w
    JOIN accounts a ON a.id = w.account_id
ORDER BY date DESC
LIMIT 1;
/*
 4. Find the total number of times each type of channel from the web_events was used. 
 Your final table should have two columns - the channel and the number of times the channel was used.
 */
SELECT w.channel AS channel,
    COUNT(w.channel)
FROM web_events AS w
GROUP BY channel
ORDER BY channel;
/*
 5. Who was the primary contact associated with the earliest web_event?
 */
SELECT a.primary_poc AS primary_contact,
    MIN(w.occurred_at) AS date
FROM accounts AS a
    JOIN web_events AS w ON w.account_id = a.id
GROUP BY primary_contact
ORDER BY date
LIMIT 1;
/*
 6. What was the smallest order placed by each account in terms of total usd. 
 Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.
 */
SELECT a.name AS name,
    MIN(o.total_amt_usd) AS total_usd
FROM accounts AS a
    JOIN orders AS o ON o.account_id = a.id
GROUP BY name
ORDER BY total_usd;
/*
 7. Find the number of sales reps in each region. 
 Your final table should have two columns - the region and the number of sales_reps. 
 Order from fewest reps to most reps.
 */
SELECT r.name AS region,
    COUNT(s.name) AS reps
FROM region AS r
    JOIN sales_reps AS s ON s.region_id = r.id
GROUP BY region
ORDER BY reps;