drop table movie_cast;
drop table movie_direction;
drop table rating;
drop table movie_genres;
drop table actor;
drop table director;
drop table reviewer;
drop table movie;
drop table genres;

create table movie
(
    mov_id          integer auto_increment,
    mov_title       char(50),
    mov_year        integer,
    mov_time        integer,
    mov_lang        char(50),
    mov_dt_rel      date,
    mov_rel_country char(5),
    constraint movie_pk
        PRIMARY KEY(mov_id)
);

create table actor
(
    act_id integer auto_increment,
    act_fname char(20),
    act_lname char(20),
    act_gender char(1),
    constraint act_pk
    PRIMARY KEY (act_id)
);

CREATE TABLE director
(
    dir_id integer auto_increment,
    dir_fname char(20),
    dir_lname char(20),
    constraint dir_pk
    PRIMARY KEY (dir_id)
);

create table movie_cast
(
    act_id integer auto_increment,
    mov_id integer,
    role char(30),
    constraint act_id
        foreign key (act_id) references actor (act_id),
    constraint mov_id
		foreign key (mov_id) references movie (mov_id)
);

CREATE TABLE reviewer
(
    rev_id integer auto_increment,
    rev_name char(30),
    constraint rev_pk
    primary key (rev_id)
);

create table genres
(
    gen_id integer auto_increment,
    gen_title char(20),
    constraint gen_pk
    primary key (gen_id)
);

create table movie_genres
(
    mov_id integer auto_increment,
    gen_id integer,
    constraint mov_idd
		foreign key (mov_id) references movie (mov_id),
    constraint gen_idd
        foreign key (gen_id) references genres (gen_id)
);

create table rating
(
    mov_id integer auto_increment,
    rev_id integer,
    rev_stars integer,
    num_o_ratings integer,
    constraint mov_ide
		foreign key (mov_id) references movie (mov_id),
	constraint rev_ide
        foreign key (rev_id) references reviewer(rev_id)
);

create table movie_direction
(
	dir_id integer null,
	mov_id integer null,
	constraint dir_idc
		foreign key (dir_id) references director (dir_id),
	constraint mov_idc
		foreign key (mov_id) references movie (mov_id)
);


insert into actor (act_fname, act_lname, act_gender)
values ('Robert','DeNiro','M'),
       ('Jack','Nicholson','M'),
       ('Al','Pacino','M'),
       ('Clint','Eastwood','M'),
       ('Sean','Connery', 'M'),
       ('Audrey','Hepburn','F'),
       ('Julia','Roberts','F'),
       ('Natalie','Portman','F'),
       ('Kate','Winslet','F'),
       ('Nicole','Kidman','F');

insert into director(dir_fname, dir_lname)
values  ('Martin','Scorcese'),
        ('Steven','Spielberg'),
        ('Christopher','Nolan'),
        ('Ridley','Scott'),
        ('Quentin','Tarantino'),
        ('Stanley','Kubrick'),
        ('Woody','Allen'),
        ('James','Cameron'),
        ('Roman','Polanski'),
        ('David','Lynch');

insert into movie (mov_title,mov_year,mov_time,mov_lang,mov_dt_rel,mov_rel_country)
values
('Avatar','2009','120','English','2010-12-1','UK'),
('Avengers: Endgame film currently playing','2019','122','English','2020-12-1','UK'),
('Titanic','1997','124','French','1998-12-1','US'),
('Star Wars: The Force Awakens','2015','126','Duits','2016-12-1','US'),
('Avengers: Infinity War','2018','128','English','2019-12-1','US'),
('Jurassic World','2015','130','English','2016-12-1','GER'),
('The Avengers','2012','132','English','2013-12-1','GER'),
('Furious 7','2015','134','English','2016-12-1','GER'),
('Avengers: Age of Ultron','2015','136','English','2016-12-1','GER'),
('Black Panther','2018','138','Italian','2019-12-1','GER'),
('Harry Potter and the Deathly Hallows – Part 2','2011','140','English','2012-12-1','ITALY'),
('Star Wars: The Last Jedi','2017','142','English','2018-12-1','ITALY'),
('Jurassic World: Fallen Kingdom','2018','144','English','2019-12-1','ITALY'),
('Frozen','2013','146','Italian','2014-12-1','ITALY'),
('Beauty and the Beast','2017','148','English','2018-12-1','ITALY'),
('Incredibles 2','2018','150','English','2019-12-1','ITALY'),
('The Fate of the Furious','2017','152','English','2018-12-1','FRA'),
('Iron Man 3','2013','154','Italian','2014-12-1','FRA'),
('Minions','2015','156','English','2016-12-1','FRA'),
('Captain America: Civil War','2016','158','English','2017-12-1','UK'),
('Eyes Wide Shut','2010','160','English','2011-12-1','UK'),
('American Beauty','1999','161','English','2000-12-1','US');

insert into genres (gen_title)
values ('Sci-Fi'),
       ('Thriller'),
       ('Action'),
       ('Comedy'),
       ('Crime'),
       ('Romantic'),
       ('Horror'),
       ('Adventure'),
       ('Western'),
       ('Historical');


insert into reviewer (rev_name)
values
('Hugue Dayez'),
('Henry Chapier'),
('Michel Ciment'),
('Jean Michel Frodon'),
('Jacques Siclier'),
('Robert Brasilach'),
('Jean Luc Godart'),
('François Truffaut'),
('Thierry Jousse'),
('Eric Rohmer');


insert into rating (mov_id, rev_id, rev_stars, num_o_ratings)
values
(21,8,10,2),
(7,1,3,4),
(4,5,4,7),
(14,6,3,4),
(18,4,2,6),
(18,1,1,4),
(17,13,1,7),
(6,8,6,6),
(20,2,10,10),
(5,7,5,2),
(8,8,6,7),
(11,7,7,4),
(19,3,4,7),
(18,7,1,7),
(17,3,4,5),
(4,4,2,9),
(7,12,10,9),
(6,6,8,10),
(18,4,9,4),
(17,5,4,0),
(3,13,9,9),
(2,4,4,1),
(8,9,2,5),
(16,4,5,9),
(18,6,4,7),
(11,5,6,4),
(8,5,6,6),
(9,5,6,5),
(14,7,6,8),
(6,5,2,0),
(20,3,1,8),
(15,3,7,7),
(14,10,1,8),
(17,8,5,3),
(13,5,8,10),
(11,2,10,4),
(4,3,2,8),
(19,8,2,9),
(9,10,1,0),
(18,9,8,7),
(10,2,8,2),
(9,2,3,1),
(19,3,5,10),
(20,10,8,1),
(2,3,3,8),
(18,11,9,4),
(10,2,3,5),
(15,3,3,5),
(6,11,3,5),
(14,2,8,8);


#1
select mov_title,mov_year
from movie;

#2
select mov_year
from movie
where mov_title = 'American Beauty';

#3
select mov_title
from movie
where mov_year = '1999';

#4
select mov_title
from movie
where mov_year < '1998';

#5
select mov_title, rev_name
from movie
    join rating r on movie.mov_id = r.mov_id
join reviewer r2 on r.rev_id = r2.rev_id;

#6
select rev_name, rev_stars
from reviewer join rating r on rev_stars
where rev_stars >6;

#7
select DISTINCT mov_title
from movie join rating r on movie.mov_id = r.mov_id
where rev_stars is null;

#8
select mov_title
from movie
where mov_id in (5,7,9);

#9
select distinct act_fname, act_lname
from actor
where act_fname like 'Woody' and act_lname like 'Allen';

#10


#11
select mov_title
from movie
where mov_rel_country not like 'UK';

#12

#13
#14
#15
#16
#17
#18
#19
#20







