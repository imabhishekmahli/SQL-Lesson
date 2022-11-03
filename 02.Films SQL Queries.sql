show databases;
use lco_films;

show tables;

-- Q1) Which categories of movies released in 2018? Fetch with the number of movies. 
select * from film_category;
select * from film;
select * from category;

select category.category_id,category.name,film.film_id,film.release_year,count(category.category_id) as no_of_films from category
left join film_category on category.category_id = film_category.category_id
right join film on film.film_id = film_category.film_id
where film.release_year=2018 group by category_id;

-- SELECT category.name, category.category_id,film.release_year, film.film_id, COUNT(category.category_id) AS number_of_films FROM category 
-- LEFT JOIN film_category ON film_category.category_id = category.category_id 
-- RIGHT JOIN film ON film.film_id = film_category.film_id 
-- WHERE film.release_year = "2018" GROUP BY category.category_id;



-- Q2) Update the address of actor id 36 to “677 Jazz Street”.
select * from address;
select * from actor;

update address join actor on actor.address_id = address.address_id set
address.address ='677 jazz street' where actor.actor_id = 36;

-- select * from address join actor on actor.address_id = address.address_id
-- where actor.actor_id = 36;



-- Q3) Add the new actors (id : 105 , 95) in film  ARSENIC INDEPENDENCE (id:41)
-- Q4) Get the name of films of the actors who belong to India.
select * from film;
select * from actor;
select * from address;
select * from city;
select * from country;
-- actor->address->city->country

select actor.actor_id,actor.first_name,actor.last_name,address.address,city.city_name,country.country
from actor join address on actor.address_id = address.address_id
join city on city.city_id = address.city_id 
join country on country.country_id = city.country_id
where country.country='india';

-- SELECT DISTINCT film.title FROM film 
-- INNER JOIN film_actor ON film_actor.film_id = film.film_id 
-- INNER JOIN actor ON actor.actor_id = film_actor.actor_id 
-- INNER JOIN address on address.address_id = actor.address_id 
-- INNER JOIN city ON city.city_id = address.city_id 
-- INNER JOIN country ON country.country_id=city.country_id 
-- WHERE country.country = "India"; 



-- Q5) How many actors are from the United States?
select count(*) from actor 
join address on actor.address_id = address.address_id
join city on city.city_id = address.city_id 
join country on country.country_id = city.country_id
where country.country='united states';



-- Q6) Get all languages in which films are released in the year between 2001 and 2010
select * from film;
select * from language;

select l.language_id,l.name,film.release_year,count(film.film_id) as no_of_films from language as l 
right join film on film.language_id = l.language_id
where film.release_year between 2001 and 2010 group by name;

-- SELECT language.name,film.release_year, COUNT(language.language_id) AS number_of_films FROM language 
-- LEFT JOIN film ON film.language_id = language.language_id 
-- WHERE film.release_year BETWEEN 2001 AND 2010 GROUP BY language.language_id;



-- Q7) The film ALONE TRIP (id:17) was actually released in Mandarin, update the info.
select * from film where film_id = 17;
select * from language;

update film set language_id = 4 where film_id = 17;



-- Q8) Fetch cast details of films released during 2005 and 2015 with PG rating.
select * from film
where release_year between 2005 and 2015 and rating = 'PG';
select * from actor;
select * from film_actor;

select a.actor_id,concat(a.first_name,"  ",a.last_name) as actor_name,film.title,film.release_year from actor as a
join film_actor on film_actor.actor_id = a.actor_id
join film on film.film_id = film_actor.film_id
where film.rating='PG' and film.release_year between 2005 and 2015;




-- Q9) In which year most films were released?
select * from film;
select film.release_year,count(film.release_year) from film group by release_year order by count(release_year) desc limit 1;

-- SELECT film.title,film.release_year, COUNT(film.release_year) AS no_of_films FROM `film` GROUP BY (film.release_year) ORDER BY COUNT(film.release_year) DESC LIMIT 1;



-- Q10) In which year least number of films were released?
select film.release_year,count(film.release_year) from film group by release_year order by count(release_year) asc limit 1;

-- SELECT film.title,film.release_year, COUNT(film.release_year) AS no_of_films FROM `film` GROUP BY (film.release_year) ORDER BY COUNT(film.release_year) ASC LIMIT 1;



-- Q11) Get the details of the film with maximum length released in 2014 .
select *, max(length) from film where release_year = 2014;

SELECT *, language.name as language FROM `film` 
LEFT JOIN language ON language.language_id = film.language_id 
WHERE film.release_year = "2014" AND film.length = (SELECT MAX(film.length) FROM film);



-- Q12) Get all Sci- Fi movies with NC-17 ratings and language they are screened in.
select * from film;
select * from language;
select * from film_category;
select * from category;

select f.film_id,f.title,f.release_year,f.rating,l.name as language,c.name as category from film as f
join film_category on film_category.film_id = f.film_id 
join category as c on c.category_id = film_category.category_id
join language as l on l.language_id = f.language_id
where f.rating = 'NC-17' and c.name = 'sci-fi';

-- SELECT film.film_id, film.title, film.description, film.release_year, film.length, film.rating,category.name, language.name FROM film 
-- LEFT JOIN language ON language.language_id=film.language_id 
-- RIGHT JOIN film_category ON film_category.film_id = film.film_id 
-- LEFT JOIN category ON category.category_id=film_category.category_id  
-- WHERE film.rating="NC-17" AND category.name="Sci-Fi";



-- Q18) Which actor acted in most movies?
select * from actor;
select * from film;
select * from film_actor;

select concat(a.first_name," ",a.last_name) as actor_name , count(a.actor_id) as no_of_film from actor as a
join film_actor on film_actor.actor_id = a.actor_id
join film on film.film_id = film_actor.film_id group by a.actor_id order by no_of_film desc limit 1;

SELECT actor_id, COUNT(actor_id) FROM `film_actor` GROUP BY actor_id ORDER BY COUNT(actor_id) DESC LIMIT 1;

