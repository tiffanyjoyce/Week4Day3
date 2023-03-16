-- 1. List all customers who live in Texas(use JOINs)

SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district LIKE 'Texas';

-- Jennifer Davis, Kim Cruz, Richard Mccray, Bryan Hardison, Ian Still

-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT first_name, last_name, amount
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99

-- Peter M payments

-- 3. Show all customers names who have made payments over $175 (use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING amount > 175
)

SELECT first_name, last_name, email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING sum(amount) < -15000
    ORDER BY sum(amount) -- NO ; INSIDE PARANTHESIS
)
-- showing none 

-- 4. List all customers that live in Nepal (use the city table)

SELECT first_name, last_name, city
FROM city 

-- 5. Which staff member had the most transactions?

SELECT first_name, last_name, payment_id
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY 

-- 6. How many movies of each rating are there?

-- 7. Show all customers who have made a single payment above $6.99 (use subqueries)

-- 8. How may free rentals did our stores give away?