/*Quizzes CONCAT
		1. Each company in the accounts table wants to create an email address for each 
		primary_poc. The email address should be the first name of the primary_poc . last name 
		primary_poc @ company name .com.*/
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ')-1)
		|| '.'
		|| RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' '))
		|| '@'
		|| name
		|| '.com'
FROM accounts AS a
;
/*Quizzes CONCAT
		2. Each company in the accounts table wants to create an email address for each 
		primary_poc. The email address should be the first name of the primary_poc . last name 
		primary_poc @ company name .com.*/
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ')-1)
		|| '.'
		|| RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' '))
		|| '@'
		|| REPLACE(name, ' ', '')
		|| '.com'
FROM accounts AS a
;
/*Quizzes CONCAT
		3. We would also like to create an initial password, which they will change after their 
		first log in. The first password will be the first letter of the primary_poc's first 
		name (lowercase), then the last letter of their first name (lowercase), the first 
		letter of their last name (lowercase), the last letter of their last name (lowercase), 
		the number of letters in their first name, the number of letters in their last name, 
		and then the name of the company they are working with, all capitalized with no spaces.*/
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ')-1)
		|| '.'
		|| RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' '))
		|| '@'
		|| REPLACE(name, ' ', '')
		|| '.com' AS email,
		LOWER(LEFT(primary_poc, 1))
		|| REPLACE(RIGHT(LEFT(primary_poc, STRPOS(primary_poc, ' ')),2),' ','')
		|| LEFT(LOWER((RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' ')))),1)
		|| RIGHT(LOWER((RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' ')))),1)
		|| LENGTH(RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc, ' ')))
		|| REPLACE(UPPER(name),' ', '') AS password
FROM accounts AS
;