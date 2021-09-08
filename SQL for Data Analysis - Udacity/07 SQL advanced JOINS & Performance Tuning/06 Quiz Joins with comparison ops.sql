/*Inequality JOINs
		The query in Derek's video was pretty long. Let's now use a shorter query to showcase the power of joining with 
		comparison operators.

		Inequality operators (a.k.a. comparison operators) don't only need to be date times or numbers, they also work 
		on strings! You'll see how this works by completing the following quiz, which will also reinforce the concept of 
		joining with comparison operators.

		In the following SQL Explorer, write a query that left joins the accounts table and the sales_reps tables on 
		each sale rep's ID number and joins it using the < comparison operator on accounts.primary_poc and sales_reps.name, 
		like so:*/
SELECT a.name AS acc_name, a.primary_poc AS pri_poc, s.name AS rep_name
FROM accounts AS a
LEFT JOIN sales_reps AS s
ON a.sales_rep_id = s.id
AND a.primary_poc < s.name
;
--What is the relationship between accounts.primary_poc and sales_reps.name?
--ANSWER = The primary point of contact's full name comes *before* the sales representative's name alphabetically
