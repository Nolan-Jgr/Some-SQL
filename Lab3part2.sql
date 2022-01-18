/************************/
/* Name: Nolan Jaeger   */
/* Class: CS3410        */
/* Term: Fall 2020      */
/* Lab #: 3 part2       */
/************************/

/* List the name of all products for which an order was placed */
SELECT Pname
FROM products, orders
WHERE products.Pid = orders.Pid

/* List the name of customers that ordered product ‘p07’ */
SELECT Cname
FROM customers, orders
WHERE orders.Pid = 'p07';

/* List the name of agents that place an order for customer c003 or customer c006 */
SELECT Aname
FROM agents, orders
WHERE orders.Cid = 'c003'
SELECT Aname
FROM agents, orders
WHERE orders.Cid = 'c006';

/* List the name customers that ordered product 'p01' through agent 'a01' */
SELECT Cname
FROM customers, orders
WHERE (customers.Cid = orders.Cid) AND (orders.Pid = 'p01') AND (orders.Aid = 'a01');

/* List the name of each customer that placed an order, the pid of what they ordered. */
SELECT Cname, Pid
FROM customers, orders
WHERE (customers.Cid = orders.Cid);

/* List the name of each customer that placed an order and the product name for each product they
ordered */
SELECT Cname, Pname
FROM customers,orders,products
WHERE (customers.Cid = orders.Cid) AND (products.Pid = orders.Pid);

/* List the name of each customer and the total amount ordered by the customer */
SELECT Cname, SUM(Dollars)
FROM customers LEFT OUTER JOIN orders
   ON customers.Cid = orders.Cid 
   GROUP BY Cid;

/* List the name and the sum of dollars for each customer that ordered more than $1,000 */
SELECT Cname, Dollars
FROM customes, orders
WHERE (customers.Cid = orders.Cid) 
HAVING orders.Dollars > 1000;
ORDER BY orders.Dollars;

/* List the agent name, product name and customer name for each product ordered */
SELECT Aname, Cname, Pname
FROM customers, orders, agents, products
WHERE (customers.Cid = orders.Cid) AND (products.Pid = orders.Pid) AND (agents.Aid = orders.Aid);

/* What would be the result of the following SQLStatement:
SELECT * from CUSTOMERS, PRODUCTS */
/* A table that contains all the information from both customers and products tables would be created */