/*
 Questions: GROUP BY Part II
 Use the SQL environment below to assist with answering the following questions. Whether you get stuck or you just want to double check your solutions, 
 my answers can be found at the top of the next concept. */
/* 1. For each account, determine the average amount of each type of paper they purchased across their orders. 
 Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account. */
SELECT a.name AS name,
    AVG(o.standard_qty) AS avg_std,
    AVG(o.poster_qty) AS avg_pst,
    AVG(o.gloss_qty) AS avg_gls
FROM accounts AS a
    JOIN orders AS o ON o.account_id = a.id
GROUP BY name
ORDER BY name;
/* 2. For each account, determine the average amount spent per order on each paper type. Your result should have four columns 
 - one for the account name and one for the average amount spent on each paper type. */
SELECT a.name AS name,
    AVG(o.standard_amt_usd) AS avg_std_usd,
    AVG(o.poster_amt_usd) AS avg_pst_usd,
    AVG(o.gloss_amt_usd) AS avg_gls_usd
FROM accounts AS a
    JOIN orders AS o ON o.account_id = a.id
GROUP BY name
ORDER BY name;
/* 3. Determine the number of times a particular channel was used in the web_events table for each sales rep. 
 Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest 
 number of occurrences first. */
SELECT s.name AS nombre,
    w.channel AS channel,
    COUNT(w.channel) AS occurrences
FROM sales_reps AS s
    JOIN accounts AS a ON a.sales_rep_id = s.id
    JOIN web_events AS w ON w.account_id = a.id
GROUP BY nombre,
    channel
ORDER BY nombre,
    channel;
/*4. Determine the number of times a particular channel was used in the web_events table for each region. 
 Your final table should have three columns - the region name, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.*/
SELECT r.name AS region,
    w.channel AS channel,
    COUNT(w.channel) AS occurrences
FROM region AS r
    JOIN sales_reps AS s ON r.id = s.region_id
    JOIN accounts AS a ON s.id = a.sales_rep_id
    JOIN web_events AS w ON w.account_id = a.id
GROUP BY region,
    channel
ORDER BY occurrences DESC;