--1 Повернути другу п'ятірку міст України (за алфавітом) назву повернути у верхньому регістрі.
select upper(name) from cities 
order by name
limit 5 offset 5;
--2 Отримати назву міста і в окремому стовпчику довжину назви. У результат не повинні потрапити міста з довжиною назва 8,9 та 10 символів.
  select name, char_length(name) as length_name from cities; -- пробував використовувати звичайну функцію length , але довжина була в 2 рази більша, тому використав char_length
--3 Отримати кількість населення у регіоні C та S
 select  sum(population) as total_population from cities where region in("C", "S");
--4 Отримати середню кількість населення у містах з регіону W.
 select avg(population) as averange_population from cities where region = "W";
--5 Отримати кількість міст у регіоні E.
 select count(name) from cities where region = "E";
