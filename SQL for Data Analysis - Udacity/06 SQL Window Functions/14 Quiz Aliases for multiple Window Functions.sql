/*Shorten Your Window Function Queries by Aliasing
Window Function Alias

QUIZ QUESTION::

Using Derek's example in the previous window, deconstruct the window function alias into its two parts: the alias part and the window function part.

ANSWER CHOICES:*/

(PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at))              = window function part
WINDOW main_window AS                                                           = alias part

/*Now, create and use an alias to shorten the following query (which is different than the one in Derek's previous video) that 
has multiple window functions. Name the alias account_year_window, which is more descriptive than main_window in the example above.*/
SELECT id,
       account_id,
       DATE_TRUNC('year',occurred_at) AS year,
       DENSE_RANK() OVER account_year_window AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER account_year_window AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER account_year_window AS count_total_amt_usd,
       AVG(total_amt_usd) OVER account_year_window AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER account_year_window AS min_total_amt_usd,
       MAX(total_amt_usd) OVER account_year_window AS max_total_amt_usd
FROM orders
WINDOW account_year_window AS (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at));
