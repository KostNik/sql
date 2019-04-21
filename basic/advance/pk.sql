drop table IF EXISTS users;



create table users
(
  id   int primary key auto_increment,
  name varchar(255) default 'DUMMY_NAME'
);

create index user_name ON users (name);

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