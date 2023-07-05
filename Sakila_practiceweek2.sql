use sakila;

-- task1 Extract the data of customers who are inactive.
select *
from customer
where active = 0;

-- task2 Identify the first name, last name, and emails of inactive customers.
select concat(first_name, ' ', last_name), email, active
from customer
where active = 0;

-- task 3 Identify the store_id having the highest number of inactive customers.
select *
from customer
where active = 0
group by store_id;

-- task 4 Identify the names of movies that are rated as PG-13.
select *
from film
where rating = 'PG-13';

-- task 5 Identify the top three movies with PG-13 rating that have the longest running time.
select *
from film
where rating = 'PG-13'
order by length desc
limit 3;

-- task 6 Find the most popular PG-13 movies based on rental duration.
select *
from film;
where rating = 'PG-13';

-- task 7 Find the average rental cost of the movies.
select avg(rental_rate)
from film;

-- task 8 Find the total replacement cost of all movies.
select sum(replacement_cost)
from film;

-- task 9 Identify the number of films from the following categories: Animation, Children

-- find out what the category id of 'action' and 'children' are: 1,3
select *
from category
where name = 'Action' or name = "Children";

select category_id, count(*) 
from film_category
where category_id in (1,3)
group by category_id;

-- using join
select category.name as category, category.category_id, count(*) as total
from film_category
left join category 
on film_category.category_id = category.category_id
where category.category_id in (1,3)
group by 2;