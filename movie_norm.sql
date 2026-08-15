create table lang_mast(
lang_id int auto_increment,
lang varchar(20),
primary key(lang_id));

insert into lang_mast(lang)
select distinct(lang) from movies;

create table act_mast(
act_id int auto_increment,
act_name varchar(50),
primary key(act_id));

insert into act_mast(act_name)
select distinct(act_name) from movies;

create table dir_mast(
dir_id int auto_increment,
dir_name varchar(50),
primary key(dir_id));

insert into dir_mast(dir_name)
select distinct(dir_name) from movies;

create table mov_details(
rel_year int,
mov_name varchar(100),
lang_id int,
dir_id int,
act_id int,
foreign key(lang_id) references lang_mast(lang_id),
foreign key(dir_id) references dir_mast(dir_id),
foreign key(act_id) references act_mast(act_id));

insert into mov_details (rel_year,mov_name,act_id,lang_id,dir_id)
select 
m.rel_year,
m.mov_name,
a.act_id,
l.lang_id,
d.dir_id
from movies m
join act_mast a on m.act_name=a.act_name
join dir_mast d on m.dir_name=d.dir_name
join lang_mast l on m.lang=l.lang;


/*A. Basic SELECT Queries*/
/* 1.	Display all movie details from the table. */

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id;

/*2.Display only the movie_name and actor_name for all movies.*/

select m.mov_name,a.act_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id;

/*3.Show all movies released in the year 2020.*/

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id
where m.rel_year=2020;

/*4.Retrieve all movies acted by a specific actor (e.g., “Vijay”). */

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id
where a.act_name='Vijay';

/*5.List movies directed by a particular director.*/

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id
where d.dir_name='Bharathan';

/*6.Show all movies in the Tamil language.*/

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id
where l.lang='Tamil';

/*7.Display distinct movie release languages.*/

select distinct l.lang
from mov_details m
inner join lang_mast as l on l.lang_id=m.lang_id;

/*8.Show unique actor names from the table.*/

select distinct a.act_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id;

/*9.Show all movies whose name starts with the letter ‘K’. */

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id
where m.mov_name like 'k%';

/*10.Display all movies released between 2010 and 2020.*/

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id
where m.rel_year between 2010 and 2020;

/*B. Filtering & Sorting*/
/*11.Show all movies sorted by release_year in ascending order.*/

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id
order by m.rel_year;

/*12.Show all movies sorted by movie_name in alphabetical order.*/

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id
order by m.mov_name;

/*13.List the latest 10 movies based on release_year.*/

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id
order by m.rel_year desc limit 10;

/*14.List old (earliest) 10 movies.*/

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id
order by m.rel_year limit 10;

/*15.Show movies where actor_name contains the word “vijay”.*/

select m.rel_year,m.mov_name,a.act_name,l.lang,d.dir_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
inner join dir_mast as d on d.dir_id=m.dir_id
where a.act_name like '%vijay%';

/*C. Aggregate Functions*/
/*16.Count the total number of movies in the table.*/

select count(*) as 'no_of_movies'
from mov_details;

/*17.Count how many movies are released in each language.*/

select l.lang,count(m.mov_name) as 'No_of_movies'
from mov_details m
inner join lang_mast as l on l.lang_id=m.lang_id
group by l.lang;

/*18.Find the number of movies acted by each actor.*/

select a.act_name,count(m.mov_name) as 'No_of_movies'
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
group by a.act_name;

/*19.Find the number of movies directed by each director.*/

select d.dir_name,count(m.mov_name) as 'No_of_movies'
from mov_details m
inner join dir_mast as d on d.dir_id=m.dir_id
group by d.dir_name;

/*20.Find how many movies were released each year.*/

select m.rel_year,count(m.mov_name) as 'No_of_movies'
from mov_details m
group by rel_year;

/*21.Identify the year with the highest number of movie releases.*/

select m.rel_year,count(*) as 'No_of_movies'
from mov_details m
group by m.rel_year
order by No_of_movies desc limit 1;

/*22.Find the actor who acted in the most movies.*/

select a.act_name
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
group by a.act_name
order by count(a.act_name) desc 
limit 1;

/*23.Find the director with the maximum number of films.*/

select d.dir_name,count(d.dir_name)
from mov_details m
inner join dir_mast as d on d.dir_id=m.dir_id
group by d.dir_name
order by count(d.dir_name)
desc limit 3;

/*D. GROUP BY + HAVING*/
/*24.List languages that have more than 100 movies.*/

select l.lang from mov_details m
inner join lang_mast as l on l.lang_id=m.lang_id
group by l.lang
having count(*)>100;

/*25.List actors who acted in more than 10 movies.*/

select a.act_name from mov_details m
inner join act_mast as a on a.act_id=m.act_id
group by a.act_name
having count(*) >10;

/*26.List directors who directed at least 5 movies.*/

select d.dir_name
from mov_details m
inner join dir_mast as d on d.dir_id=m.dir_id
group by d.dir_name
having count(*)>=5;

/*27.Find years where more than 50 movies were released.*/

select m.rel_year 
from mov_details m 
group by m.rel_year
having count(*) >50;

/*28.List actors who have worked in more than 3 languages.*/

select a.act_name,count(distinct l.lang)
from mov_details m
inner join act_mast as a on a.act_id=m.act_id
inner join lang_mast as l on l.lang_id=m.lang_id
group by a.act_name
having count(distinct l.lang)>3
order by count(distinct l.lang) desc;