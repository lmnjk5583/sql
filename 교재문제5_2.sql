--4)
SELECT CONCAT(actor.first_name, actor.last_name), film.title, film.release_year
FROM actor
INNER JOIN film_actor on actor.actor_id = film_actor.actor_id
INNER JOIN film on film_actor.film_id = film.film_id
INNER JOIN film_category on film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
WHERE category.name = "Action";


--5)

SELECT payment.amount, rental., staff.staff_id, staff.username
FROM film
inner JOIN inventory on film.film_id = inventory.film_id
inner JOIN rental on inventory.inventory_id = rental.inventory_id
INNER JOIN payment on rental.rental_id = payment.rental_id
INNER JOIN staff on rental.staff_id = staff.staff_id
INNER JOIN film_category on film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
ORDER BY category.name
SELECT * from act ORDER BY total desc;



--6)

DROP Table if EXISTS emp;
CREATE Table emp (
    employee_id int NOT NULL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    manager_id int NULL
);

INSERT INTO emp VALUES(101, '이지연', NULL);
INSERT INTO emp VALUES(102, '강정훈', 101);
INSERT INTO emp VALUES(103, '임도환', 101);
INSERT INTO emp VALUES(104, '민가영', 102);
INSERT INTO emp VALUES(105, '김민찬', 102);
INSERT INTO emp VALUES(106, '장미선', 103);
INSERT INTO emp VALUES(107, '김시영', 103);
INSERT INTO emp VALUES(108, '이재윤', 105);
INSERT INTO emp VALUES(109, '오하나', 105);
INSERT INTO emp VALUES(110, '심성우', 106);

SELECT * FROM emp;

SELECT emp.manager_id as "직급", emp.employee_name
FROM emp
ORDER BY manager_id ASC;

use sakila;

SELECT a.first_name, a.last_name, c.title, c.release_year 
from actor as A
INNER JOIN film_actor as B on a.actor_id = b.actor_id
INNER JOIN film as c ON b.film_id = c.film_id
INNER JOIN film_category d on c.film_id = d.film_id
INNER JOIN category as e on d.category_id = e.category_id
where e.name='action'
ORDER BY title;

SELECT * 
from film as A 
INNER JOIN inventory as b on a.film_id = b.film_id
INNER JOIN rental as c on b.inventory_id = c.inventory_id
INNER JOIN payment as d on c.rental_id = d.rental_id
INNER JOIN category as e ON d.