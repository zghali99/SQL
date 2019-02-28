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
select distinct last_name from actor, count(last_name) as "count";
-- same but only for names that are shared by at least two actors
select distinct last_name from actor, count(last_name) as "count" group by last_name having count >= 2;
-- The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. Write a query to fix the record.
update actor set first_name = "harpo" where first_name = "groucho" and last_name = "williams";
-- change Harpo back to Groucho
update actor set first_name = "GROUCHO" where first_name = "harpo" and last_name = "williams";
-- You cannot locate the schema of the address table. Which query would you use to re-create it?
describe sakila.address;
-- Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address;
select first_name, last_name, address_id from staff join address on staff.address_id = address.address_id;
-- Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment
select staff_id, amount from payment join staff on staff.staff_id = payment.staff_id;

-- List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
select film_id, title from film join film_actor on film.film_id = film_actor.film_id;

-- How many copies of the film Hunchback Impossible exist in the inventory system?

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name

-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English

-- Use subqueries to display all actors who appear in the film Alone Trip

-- You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information

-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films

-- Display the most frequently rented movies in descending order

-- Write a query to display how much business, in dollars, each store brought in

-- Write a query to display for each store its store ID, city, and country

-- List the top five genres in gross revenue in descending order

-- In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view

-- How would you display the view that you created in 8a

-- You find that you no longer need the view top_five_genres. Write a query to delete it.alter
