
-- Activity 1

DELIMITER //

CREATE PROCEDURE procedure1()
BEGIN
	select first_name, last_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = "Action"
  group by first_name, last_name, email;
END //

DELIMITER ;

call procedure1();

-- Activity 2

DELIMITER //
create procedure procedure2 (in param1 varchar(100))
begin
  select first_name, last_name, email, category.name
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name COLLATE utf8mb4_general_ci = param1
  group by first_name, last_name, email, name;
end //
DELIMITER ;

call procedure2("Action");

-- Activity 3

DELIMITER //
create procedure procedure3 (in param3 int)
begin
  select count(film.film_id) as number_of_movies, category.name from film
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  group by category.name
  having count(film.film_id) > param3
  order by count(film.film_id) desc
  ;
end //
DELIMITER ;

call procedure3 (68) ;



  
  