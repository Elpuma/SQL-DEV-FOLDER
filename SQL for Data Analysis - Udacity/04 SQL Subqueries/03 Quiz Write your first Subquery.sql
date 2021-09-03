/*Task List:
 
1. Use the test environment below to find the number of events that occur for each day 
for each channel.*/
SELECT DATE_TRUNC('day', occurred_at),
	channel,
	COUNT(*) AS num_events
FROM web_events AS w
GROUP BY 1, 2
ORDER BY 1
;

/*2. Now create a subquery that simply provides all of the data from your first query.*/
SELECT *
FROM
	(SELECT DATE_TRUNC('day', occurred_at),
		channel,
		COUNT(*) AS num_events
	FROM web_events AS w
	GROUP BY 1, 2
	ORDER BY 1) AS sub
	;
/*3. Now find the average number of events for each channel. 
Since you broke out by day earlier, this is giving you an average per day.*/
SELECT channel,
	AVG(num_events)
FROM
	(SELECT DATE_TRUNC('day', occurred_at),
		channel,
		COUNT(*) AS num_events
	FROM web_events AS w
	GROUP BY 1, 2
	ORDER BY 1) AS sub
GROUP BY 1
ORDER BY 2 
;
/*Quiz 1
On which day-channel pair did the most events occur. (Mark all that are true)*/
"2016-12-21 00:00:00" direct
"2017-01-01 00:00:00" direct;

/*Quiz 2
Mark all of the below that are true regarding writing your subquery.*/
The original query goes in the **FROM** statement.
An `*` is used in the **SELECT** statement to pull all of the data from the original query.
You **MUST** use an alias for the table you nest within the outer query.
;
/*QUIZ QUESTION::

Match each channel to its corresponding average number of events per day.*/
1.32 = twitter
4.90 = direct
1.67 = organic
1.60 = facebook
