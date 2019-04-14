delete
from users;


select @@SESSION.SQL_SAFE_UPDATES;

set @@SESSION.SQL_SAFE_UPDATES = 0; #allow delete all
set @@SESSION.SQL_SAFE_UPDATES = 1; #prevent delete all

select *
from users;

