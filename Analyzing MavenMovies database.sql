use mavenmovies;

/*
1. List of all staff members, including their first and last names, 
email addresses, and the store identification number of where they work. 
*/ 

SELECT 
store_id AS staff_identification_number,
first_name AS staff_first_name,
last_name AS staff_last_name,
email AS staff_email_address
 
FROM staff;



/*
2.	Counts of inventory items held at each of your two stores. 
*/ 
SELECT
store_id AS stores, 
COUNT(inventory_id) AS count_of_inventory_items
FROM inventory 
GROUP BY 
store_id;

/*
3.	Count of active customers for each of your stores. Separately, please. 
*/
SELECT store_id,
COUNT(customer_id) AS Count_of_active_Customers
FROM customer
WHERE active = 1
GROUP BY store_id;


/* For inactive customers*/
SELECT store_id,
COUNT(customer_id) AS Count_of_active_Customers
FROM customer
WHERE active = 0
GROUP BY store_id;


/*
4.	In order to assess the liability of a data breach, provide a count 
of all customer email addresses stored in the database. 
*/

SELECT
COUNT(email) As Count_of_Email_Addresses
from CUSTOMER;



/*
5.	We are interested in how diverse your film offering is as a means of understanding how likely 
you are to keep customers engaged in the future. Please provide a count of unique film titles 
you have in inventory at each store and then provide a count of the unique categories of films you provide. 
*/


SELECT 
	store_id, 
    COUNT(DISTINCT film_id) AS unique_films
FROM inventory
GROUP BY 
	store_id; 
	
SELECT 
	COUNT(DISTINCT name) AS unique_categories
FROM category;


/*
6.	Understanding the replacement cost of your films. 
Showing the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry. ``	
*/

SELECT 
MIN(replacement_cost) AS Least_expensive,
MAX(replacement_cost) AS Most_expensive,
AVG(replacement_cost) AS Average_cost
FROM film;

/*
7.Put payment monitoring systems and maximum payment 
processing restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you process, as well as the maximum payment you have processed.
*/
SELECT 
AVG(amount) AS average_payment ,
MAX(amount) AS maximum_payment
FROM payment;




/*
8.	Better understanding of what your customer base looks like. 
List of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/

SELECT customer_id,
COUNT(rental_id)
 FROM Rental
 GROUP BY customer_id 
 ORDER BY COUNT(rental_id)DESC;

