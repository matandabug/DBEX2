select name
from  members natural join 
(select number
from members natural join (select number, uid
from memberInKnesset
where party = 'Mapai')
where name = 'David Ben Gurion') natural join 
(select number, uid
from memberInKnesset
where party = 'Mapai') MapaiMembers
order by name;