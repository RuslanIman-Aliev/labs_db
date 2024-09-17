--1 Отримати список міст-мільйонерів України
 select * from cities where population >=1000000;
--2 Отримати список міст з регіону E та W відсортований за кількістю населення
select * from cities 
where region = "E" or region = "W" 
order by population;
--3 Отримати список міст з населенням більше ніж 50000 з регіонів S, C та N (вікористовуючи оператор IN)
 select * from cities 
 where population >50000 and region in ('S','C','N');
--4 Отримати перші 20 міст (за назвою) у яких населення більше ніж 150000 але не більше ніж 350000 та які знаходяться в регіонах E,W,N
 select * from cities  
 where region in ('E', 'W', 'N') and population > 150000 and population < 350000 
 order by name 
 limit 20;
--5 Отримати другу десятку міст за кількістю населення які не входять до регіонів E та W
select * from cities 
where not region = "E" and not region = "W" 
order by population
limit 10 offset 10;