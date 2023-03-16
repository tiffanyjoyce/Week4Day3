-- back t the same erd as before

-- multi join

SELECT *
FROM actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id

-- second join
SELECT title, film.film_id
FROM film_actor
INNER JOIN film
ON film.film_id = film_actor.film_id

-- lets put all of this together

SELECT first_name, last_name, title
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id

-- lets change the view make the movie first

SELECT title, first_name, last_name
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id

-- now lets add constraints

SELECT title, first_name, last_name
FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
WHERE title LIKE 'C%'
ORDER BY title;

-- sub queries

-- 2 queries split apart that become one

-- 1x1 example
-- find people that recieved the most $ from us
-- query through payment table

SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id
HAVING sum(amount) < -15000
ORDER BY sum(amount)

SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING sum(amount) < -15000
ORDER BY sum(amount)

-- 2nd query
-- lets figure out their name and email

SELECT first_name, last_name, email
FROM customer;

-- sub queries can occur in 3 places
-- from clause --> very common
-- where clause --> very common
-- select clause --> not very helpful 

SELECT first_name, last_name, email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING sum(amount) < -15000
    ORDER BY sum(amount) -- NO ; INSIDE PARANTHESIS
)

-- FROM CLAUSE SUBQUERY
-- GET ALL ACTORS IN MULAN MOON

SELECT first_name, last_name
FROM(
    SELECT title, first_name, last_name
    FROM film_actor
    INNER JOIN actor
    ON film_actor.actor_id = actor.actor_id
    INNER JOIN film
    ON film.film_id = film_actor.film_id
)AS multijoiner
WHERE title = 'Mulan Moon';

-- select clause subq
-- not much use
-- creating a new column that doesn't exist

SELECT first_name, last_name,(
    SELECT COUNT(*)
    FROM rental
)
FROM customer