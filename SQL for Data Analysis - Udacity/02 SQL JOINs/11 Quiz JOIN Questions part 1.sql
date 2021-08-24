/* Provide a table for all web_events associated with account name of Walmart. There should be three columns. 
Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, 
you might choose to add a fourth column to assure only Walmart events were chosen.
*/

SELECT w.*, a.name
FROM web_events AS w
JOIN accounts AS a
ON w.account_id = a.id
WHERE a.name IN ('Walmart');

/* Provide a table that provides the region for each sales_rep along with their associated accounts. 
Your final table should include three columns: the region name, the sales rep name, and the account name. 
Sort the accounts alphabetically (A-Z) according to account name.
*/

SELECT r.name region_name, s.name rep_name, a.name account
FROM region AS r
JOIN sales_reps AS s
ON r.id = s.region_id
JOIN accounts AS a
ON s.id = a.sales_rep_id
ORDER BY account

/* Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) 
for the order. Your final table should have 3 columns: region name, account name, and unit price. 
A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
*/
SELECT r.name region, a.name account, o.total_amt_usd/(o.total+0.01) unit_price
FROM orders as o
JOIN accounts as a
ON o.account_id = a.id
JOIN sales_reps as s
ON s.id = a.sales_rep_id
JOIN region as r
ON r.id = s.region_id

/*Mark all the below that are true.
1. The ON statement should always occur with the foreign key being equal to the primary key.
2. JOIN statements allow us to pull data from multiple tables in a SQL database.
3. You can use all of the commands we saw in the first lesson along with JOIN statements.
*/

/*Select all of the below statements that are true.
1. Aliasing is common to shorten table names when we start JOINing multiple tables together.
*/

