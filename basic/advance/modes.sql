select @@GLOBAL.SQL_MODE, @@SESSION.SQL_MODE;

drop table if exists users;

create table users
(
  id   INT          not null,
  name VARCHAR(255) not null,
  primary key (id)
);

desc users;

select *
from users;

insert into users (id)
values (1);


set @@SESSION.SQL_MODE = 'STRICT_ALL_TABLES';
set @@SESSION.SQL_MODE = 'NO_ENGINE_SUBSTITUTION'; #allow nulls

