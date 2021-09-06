/*LEFT & RIGHT Quizzes
		1. In the accounts table, there is a column holding the website for each company. 
		The last three digits specify what type of web address they are using. A list of 
		extensions (and pricing) is provided here. Pull these extensions and provide how 
		many of each website type exist in the accounts table.*/

SELECT RIGHT(website,3) AS ext, COUNT(*) AS numb
FROM accounts
GROUP BY 1
;
/*LEFT & RIGHT Quizzes
		2. There is much debate about how much the name (or even the first letter of a 
		company name) matters. Use the accounts table to pull the first letter of each 
		company name to see the distribution of company names that begin with each 
		letter (or number).*/

SELECT LEFT(name,1) AS initial, COUNT(*) AS numb
FROM accounts
GROUP BY 1
ORDER BY 1
;
/*LEFT & RIGHT Quizzes
		3. Use the accounts table and a CASE statement to create two groups: 
		one group of company names that start with a number and a second group of 
		those company names that start with a letter. What proportion of company 
		names start with a letter?*/
SELECT MAX(numba)/SUM(numba)*100 AS proportion
FROM (SELECT type, COUNT(*) AS numba
		FROM (SELECT LEFT(name,1) AS initial, --returns a list of initials
				CASE WHEN LEFT(name,1) IN ('0','1','2','3','4','5','6','7','8','9') THEN 'number'
				ELSE 'letter'
				END AS type
				FROM accounts)AS t1
		GROUP BY 1
		ORDER BY 2 DESC)AS t2
;
/*LEFT & RIGHT Quizzes
		4. Consider vowels as a, e, i, o, and u. What proportion of company names start with 
		a vowel, and what percent start with anything else?*/

WITH initials_table AS (SELECT LEFT(name,1) AS initial --returns a list of initials
					FROM accounts
					ORDER BY 1),
	type_list AS (SELECT CASE WHEN LOWER(initial) IN ('a','e','i','o','u') THEN 'vowel'
					ELSE 'other' END AS type
					FROM initials_table)

SELECT amount
FROM (SELECT type, COUNT(*) AS amount
		FROM type_list
		GROUP BY 1)sub
;