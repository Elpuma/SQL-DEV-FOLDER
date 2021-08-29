/*Questions: DISTINCT
 Use the SQL environment below to assist with answering the following questions. Whether you get stuck or you just want to double check your solutions, my answers can be found at the top of the next concept.
 
 1. Use DISTINCT to test if there are any accounts associated with more than one region.*/
SELECT DISTINCT id,
    name
FROM accounts;
/*SELECT DISTINCT a.id,
 r.name
 FROM accounts AS a
 JOIN sales_reps AS s ON a.sales_rep_id = s.id
 JOIN region as r ON s.region_id = r.id
 ORDER BY a.id*/
/* 2. Have any sales reps worked on more than one account?*/
SELECT DISTINCT id,
    name
FROM sales_reps
    /*SELECT s.id,
     s.name,
     COUNT(*) num_accounts
     FROM accounts a
     JOIN sales_reps s ON s.id = a.sales_rep_id
     GROUP BY s.id,
     s.name
     ORDER BY num_accounts;*/