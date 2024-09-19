--1 Отримати кількість населення в кожному регіоні.
 select region, sum(population) as region_population from cities group by region;
--2 Отримати регіони та кількість населення в цих регіонах де кількість міст в регіоні більше або дорівнює 10.
select region, sum(population), count(name) from cities 
group by region 
having count(name) >=10;
--3 Отримати третю п'ятірку міст (назва та кількість населення) за кількістю населення якщо ці міста знаходяться в регіонах з кількістю областей не меньше 5
select name, population from cities where region IN (select region  from cities group by region having count(*) >= 5) ORDER BY population DESC LIMIT 5 OFFSET 10;
--4 Отримати назви регіонів та кількістю в них населення, за умови що в підрахунку кількості населення брали участь міста з населенням більше ніж 300 000.
select region, sum(population) as population_sum from cities 
where population> 300000 
group by region;
--5 Отримати назву так кількість населення міст які знаходяться в регіонах з кількістю областей не більше 5 та кількість населення в цих містах не входить до діапазону 150 000 - 500 000
select name, population from cities 
where region IN (select region from cities group by region having count(name) <= 5) and population >=150000 and population <=500000; 
