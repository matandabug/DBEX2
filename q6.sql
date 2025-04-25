select distinct name
from (members natural join 
(select * 
from (select number
from members natural join (select number, uid
from memberInKnesset
where party = 'Mapai') MapaiMembers1
where name = 'David Ben-Gurion') BenGurionKnessets natural join 
(select number, uid
from memberInKnesset
where party = 'Mapai') MapaiMembers) MapaiBenGurionKnessets) membersWithBenGurion
order by name;

-- select * 
-- from (
--     select number, name
-- from members natural join (select number, uid
-- from memberInKnesset
-- where party = 'Mapai') MapaiMembers1;
-- where name = 'David Ben Gurion';
-- )
--  BenGurionKnessets natural join 
-- (select number, uid
-- from memberInKnesset
-- where party = 'Mapai') MapaiMembers;