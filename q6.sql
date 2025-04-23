select name
from (members natural join 
((select number
from members natural join (select number, uid
from memberInKnesset
where party = 'Mapai') MapaiMembers
where name = 'David Ben Gurion') BenGurionKnessets natural join 
(select number, uid
from memberInKnesset
where party = 'Mapai') MapaiMembers) MapaiBenGurionKnessets) membersWithBenGurion
order by name;