create database hw5db;
use hw5db;
create table salesmen (id int PRIMARY KEY AUTO_INCREMENT NOT NULL, 
snum int, 
sname varchar(45), 
city varchar (50), 
comm varchar(10));
select * from salesmen;

Insert into salesmen (snum, sname, city, comm) 
values (1001, "Peel", "London", ".12"), 
(1002, "Serres", "San Jose", ".13"), 
(1003, "Motika", "London", ".11"), 
(1004, "Rifkin", "Barcelona", ".15"), 
(1005, "Axelrod", "New York", ".10");



create table customers 
(id int PRIMARY KEY auto_increment not null, 
cnum int, 
cname varchar (100), 
city varchar(100),
rating int,
snum int);

truncate table customers;
insert into customers 
(cnum, cname, city, rating, snum)
values (2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "SanJose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "SanJose", 300, 1007),
(2007, "Pereria", "Rome", 100, 1004);
select* from customers;

create table orders (id int PRIMARY KEY auto_increment not null, 
onum int, 
amt float, 
odate date, 
cnum int, 
snum int);

insert into orders (onum, amt, odate, cnum, snum) 
values (3001, 18.69, "1990-03-10", 2008, 1007),
(3003, 767.19, "1990-03-10", 2001, 1001),
(3002, 1900.10, "1990-03-10", 2007, 1004),
(3005, 5160.45, "1990-03-10", 2003, 1002),
(3006, 1098.16, "1990-03-10", 2008, 1007),
(3009, 1713.23, "1990-04-10", 2002, 1003),
(3007, 75.75, "1990-04-10", 2004, 1002),
(3008, 4723.00, "1990-05-10", 2006, 1001),
(3010, 1309.95, "1990-06-10", 2004, 1002),
(3011, 9891.88, "1990-06-10", 2006, 1001);


-- 1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)

select city, sname, snum, comm from salesmen;
-- 2.	 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
select rating, cname from customers where city = "SanJose";


-- 3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений.
--  (уникальные значения в  “snum“ “Продавцы”
select distinct snum from salesmen;
-- 4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
-- Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
select cname from customers where cname LIKE 'G%';

-- 5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
select * from orders where amt > 1000;
-- 6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
 -- (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
 select min(amt) "сумма заказа" from orders;
-- 7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
select * from customers where rating>100 and city != "Rome";

create table employee
(id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
name varchar(100),
surname varchar(100),
speciality varchar(100),
 seniority int,
 salary int,
 age int);
 Insert into employee (name, surname, speciality, seniority, salary, age) 
 values ('Вася', 'Васькин', 'начальник', 40, 10000, 60),
 ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
 ('Катя', 'Каткина', 'инженер', 8, 70000, 25),
 ('Вася', 'Петькин', 'начальник', 2, 50000, 35),
 ('Саша', 'Сашкин', 'инженер', 12, 30000, 59),
 ('Иван', 'Иванов', 'начальник', 40, 25000, 40),
 ('Петр', 'Петров', 'рабочий', 20, 20000, 35),
 ('Сидор', 'Сидоров', 'рабочий', 10, 19000, 28),
 ('Антон', 'Антонов', 'рабочий', 8, 15000, 25),
 ('Юра', 'Галкин', 'рабочий', 5, 11000, 22),
 ('Леся', 'Леськин', 'рабочий', 2, 12000, 24),
 ('Максим', 'Воронин', 'рабочий', 3, 10000, 49);
 
 -- 1.	Отсортируйте поле “зарплата” в порядке убывания и возрастания
select * from employee order by salary;
select * from employee order by salary DESC;
-- 2.	Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
select * from(select * from employee order by salary DESC) AS T order by salary LIMIT 5;
-- 3.	Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
select speciality, GROUP_CONCAT(name SEPARATOR ", ") from employee group by speciality having sum(salary) > 100000;


