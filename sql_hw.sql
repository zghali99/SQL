use sakila;
-- Display the first and last names of all actors from the table actor.
select * from actor;
-- Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
SELECT CONCAT(first_name, ' ', last_name) from actor AS `Actor Name`;
-- find the ID number, first name and last name of an actor knowing just first name "JOE"
select first_name, last_name, actor_id from actor where first_name = "joe";
-- Find all actors whose last name contain the letters GEN
select * from actor where last_name like %GEN%;
-- find all actors whose last names contain the letters LI ordered by last name and first name
select * from actor where last_name like %LI% order by last_name, first_name;
-- Using IN, display the country_id and country columns for Afghanistan, Bangladesh, and China
select country_id, country from country where country in ("Afghanistan", "Bangladesh", "China");
-- Create a column Description to hold a BLOB type of actor description
alter table actor ADD description blob;
-- Delete the description column
alter table actor drop column description;
-- List the last names of actors, as well as how many actors have that last name.
select last_name, count(last_name) as "last_name_count" from actor group by last_name;
-- same but only for names that are shared by at least two actors
select distinct last_name, count(last_name) as "last_name_count" from actor group by "last_name_count" >= 2;
-- The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. Write a query to fix the record.
update actor set first_name = "harpo" where first_name = "groucho" and last_name = "williams";
-- change Harpo back to Groucho
update actor set first_name = "GROUCHO" where first_name = "harpo" and last_name = "williams";
-- You cannot locate the schema of the address table. Which query would you use to re-create it?
describe sakila.address;
-- Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address;
select first_name, last_name, address from staff join address on staff.address_id = address.address_id;
-- Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment
select staff_id, sum(amount) from staff join payment on staff.staff_id = payment.staff_id group by payment.staff_id; 

-- List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
select film_id, title from film join film_actor on film.film_id = film_actor.film_id;

-- How many copies of the film Hunchback Impossible exist in the inventory system?
select title, count(inventory_id) from film join inventory on film.film_id = inventory.film_id where title = "Hunchback Impossible";
-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name
select first_name, last_name, sum(amount) from payment join customer on payment.customer_id = customer.customer_id;
-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English
select title from film where language_id in ;

-- Use subqueries to display all actors who appear in the film Alone Trip
select first_name, last_name from actor where actor_id in (select actor_id from film_actor where film_id in (select film_id from film where title="Alone Trip"));

-- You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information
select first_name, last_name, email, country from country join customer on country.country_id = customer.country_id where country = "Canada";

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films
category.name as `genre`;
select genre, category_id from category join category on category.category_id = film_category,category_id where category = "Family";

-- Display the most frequently rented movies in descending order
select film.title, count(rental_id) as "Frequency" from rental join inventory on rental.inventory_id = inventory.inventory_id) join film on (inventory.film_id = film.film_id) group by film.title; -- may need to be finished 

-- Write a query to display how much business, in dollars, each store brought in
select staff.store_id, SUM(amount) AS "Amount brought in" from payment join rental on (payment.rental_id = rental.rental_id) join inventory on (inventory.inventory_id = rental.inventory_id) join store on (store.store_id = inventory.store_id) group by store.store_id;

-- Write a query to display for each store its store ID, city, and country
select store.store_id, city.city, country.country from store join address on (store.address_id = address.address_id) join city on (city.city_id = address.city_id) join country on (country.country_id = city.country_id);

-- List the top five genres in gross revenue in descending order

-- In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view

-- How would you display the view that you created in 8a
select * FROM -- (put the name chosen in 8a);

-- You find that you no longer need the view top_five_genres. Write a query to delete it.alter
drop -- (put the name chosen in 8a);