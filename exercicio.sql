/* mudou o arquivo */
create database diet;
use diet;
create table user(
  id bigint not null auto_increment,
  name varchar(55) not null,
  user_age int not null,
  userbirth date not null,
  user_height double not null,
  user_weight int not null,
 primary key(id)
);

create table day(
 idDay bigint not null auto_increment,
 data date not null,
 idUser bigint not null,
 primary key (idDay),
 foreign key (idUser) references user(id)


);

create table meal(
mealId int  not null auto_increment,
calories bigint not null,
fat int not null,
carboydrates int not null,
fibre int not null,
protein int not null,
day bigint not null,
primary key(mealId),
foreign key(day) references day(idDay)
);

insert into user (name , user_age, userbirth, user_height, user_weight ) values("Joao", 10, '2013-10-12' , 1.57, 67 );
insert into user (name , user_age, userbirth, user_height, user_weight ) values("Cleber", 20, '2003-05-02' , 1.80, 80 );
insert into user (name , user_age, userbirth, user_height, user_weight ) values("Junior", 30, '1993-03-02' , 1.90, 70 );

insert into day(data,idUser) values ("2023-01-22",1);
insert into day(data,idUser) values ("2023-01-23",2);
insert into day(data,idUser) values("2023-01-19",3);


select *from user;

insert into meal(calories, fat, carboydrates, fibre,protein,day) values (158,33,44,67,88,5);
insert into meal(calories, fat, carboydrates, fibre,protein,day) values (120,200,59,99,100,6);

select *from day;
select *from meal;


