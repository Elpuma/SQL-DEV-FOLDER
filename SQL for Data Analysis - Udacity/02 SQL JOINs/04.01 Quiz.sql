/*Try pulling all the data from the accounts table, and all the data from the orders table.*/
SELECT *
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;