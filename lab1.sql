/*1 Написати запит на отримання другої десятки міст України за кількістю населення*/ 
select * from cities 
order by population desc 
limit 10 offset 10;
/*2 Отримати список міст відсортованим за назвою в зворотньому порядку (від Я до А). Обмежити запит 30 запасами.*/ 
 select * from cities 
 order by name desc 
 limit 30;
/*3 Отримати список міст відсортованих за регіоном та кількістю населення (спочатку найнаселеніші міста регіону).*/ 
select * from cities 
order by region , population desc;
/*4 Отримати список регіонів вказаних в таблиці.*/ 
select distinct region from cities; /*Унікальні регіони*/
select  region from cities; /*Усі регіони, які є в таблиці*/
/*5 Отримати список міст відсортованих за регіоном у зворотньому порядку та за назвою у межах регіону також у зворотньому порядку*/
 select * from cities 
 order by region desc, name desc;
