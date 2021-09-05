/* Your First WITH (CTE)
The same question as you saw in your first subquery is provided here along with the solution.

QUESTION: You need to find the average number of events for each channel per day.*/

WITH events AS (
          SELECT DATE_TRUNC('day',occurred_at) AS day, 
                        channel, COUNT(*) as events
          FROM web_events 
          GROUP BY 1,2)

SELECT channel, AVG(events) AS average_events
FROM events
GROUP BY channel
ORDER BY 2 DESC
;

--Select all of the below that are true regarding WITH statements.
X When creating multiple tables using **WITH**, you add a comma after every table except the last table leading to your final query.
X The new table name is always aliased using `table_name AS`, which is followed by your query nested between parentheses.

