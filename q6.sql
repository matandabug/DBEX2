-- select distinct name
-- from (members natural join 
-- (select * 
-- from (select number
-- from members natural join (select number, uid
-- from memberInKnesset
-- where party = 'Mapai') MapaiMembers1
-- where name = 'David Ben-Gurion') BenGurionKnessets natural join 
-- (select number, uid
-- from memberInKnesset
-- where party = 'Mapai') MapaiMembers) MapaiBenGurionKnessets) membersWithBenGurion
-- order by name;

select name
from (select distinct * 
from members 
natural join (select number, uid
from memberInKnesset
where party = 'Mapai')) M
where not exists ((select number
from members natural join (select number, uid
from memberInKnesset
where party = 'Mapai') MapaiMembers1
where name = 'David Ben-Gurion')
except 
(select number
from memberInKnesset M1
where M1.uid = M.uid))
order by name;
