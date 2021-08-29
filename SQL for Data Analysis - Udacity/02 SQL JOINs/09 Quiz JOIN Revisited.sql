/*JOIN Revisited
Let's look back at the first JOIN you wrote.*/
    SELECT orders.*
    FROM orders
    JOIN accounts
    ON orders.account_id = accounts.id;

/*Practice
Use the image above to assist you. If we wanted to join the sales_reps and region tables together, how would you do it*/
    SELECT sales_reps.*
    FROM sales_reps
    JOIN region
    ON sales_reps.region_id = region.id

/*JOIN More than Two Tables
This same logic can actually assist in joining more than two tables together. Look at the three tables below.
The Code
If we wanted to join all three of these tables, we could use the same logic. The code below pulls all of the data from all of the joined tables.
*/
SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id



