drop table IF EXISTS users;



create table users
(
  id   int primary key auto_increment,
  name text default 'DUMMY_NAME'
);

desc users;

insert into users (name)
values ('Bob');
insert into users (name)
values ('Bob');
insert into users (name)
values ('Bob');

insert into users (id, name)
values (0, '0Bob'); #no 0 id

select *
from users;