/*
1. Find the total amount of poster_qty paper ordered in the orders table.
2. Find the total amount of standard_qty paper ordered in the orders table.
3. Find the total dollar amount of sales using the total_amt_usd in the orders table.*/

SELECT SUM(poster_qty) as total_amt_poster,
	   SUM(standard_qty) as total_amt_standard,
	   SUM(total_amt_usd) as total_dollar,
	   SUM(standard_qty) as total_amt_standard
FROM orders;

/*
4. Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. 
   This should give a dollar amount for each order in the table.*/
SELECT standard_amt_usd, gloss_amt_usd, standard_amt_usd+gloss_amt_usd as dollar_amt_std_gls
FROM orders;

/*
5. Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both an aggregation and a mathematical operator.
*/
SELECT SUM(standard_amt_usd)/SUM(standard_qty) as per_unit_two
FROM orders