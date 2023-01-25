USE SAKILA;
/*-- 1. How many films are there for each of the categories 
in the category table. Use appropriate join to write this query. */

SELECT c.category_id as films_number_per_category, count(f.film_id) from film as f join film_category as c on f.film_id = c.film_id group by c.category_id;
           -- Note: Here is asked the number of films on each category, but don't ask the name of each category. For that, we would need to do a 3rd join with the category table --

-- 2. Display the total amount rung up by each staff member in August of 2005 --

SELECT staff_id, sum(amount) as total_sells from payment where monthname(payment_date) = 'August' and year(payment_date) = '2005' group by staff_id; -- Same result as previous line --

SELECT distinct month(payment_date),payment_date from payment where month(payment_date) = 8 order by payment_date desc; -- To check if the previou line was correct; We have payments only for the year 2005 --

-- 3. Which actor has appeared in the most films? --

SELECT f.actor_id, sum(f.film_id) as total_appearances, a.first_name, a.last_name from film_actor as f join actor as a on f.actor_id = a.actor_id  group by actor_id order by total_appearances desc limit 1;

-- 4. Most active customer (the customer that has rented the most number of films) --

SELECT p.customer_id, c.first_name, c.last_name, count(p.rental_id) as Total_rented_films from payment as p join customer as c on p.customer_id = c.customer_id group by customer_id order by Total_rented_films desc limit 1;

-- 5. Display the first and last names, as well as the address, of each staff member -- 

SELECT s.first_name, s.last_name, a.address, a.district, a.postal_code from staff as s join address as a on s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film --

SELECT i.title, f.film_id, count(f.actor_id) as number_of_actors from film_actor as f join film as i on f.film_id = i.film_id group by film_id;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name --

SELECT c.first_name, c.last_name, p.customer_id, sum(p.amount) as total_paid from payment as p join customer as c on p.customer_id = c.customer_id group by customer_id order by c.last_name asc;

-- 8. List number of films per category. --
-- R: repeated question; Already solved on question 1. --

