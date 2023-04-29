/* Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır? */
SELECT COUNT(*) AS num_films_above_avg_length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

/* En yüksek rental_rate değerine sahip kaç tane film vardır? */
SELECT COUNT(*) AS num_films_highest_rental_rate
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);

/* En düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri sıralayınız. */
SELECT title, rental_rate, replacement_cost
FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film)
AND replacement_cost = (SELECT MIN(replacement_cost) FROM film);

/* En fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız. */
SELECT customer.first_name, customer.last_name, COUNT(*) AS num_payments
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY num_payments DESC;
