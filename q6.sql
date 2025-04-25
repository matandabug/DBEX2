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
from members M join memberInKnesset MIK on MIK.uid = M.uid
where MIK.party = 'Mapai' and not exists (
    (select number
from members Mem1 join memberInKnesset MIK1 on MIK1.uid = Mem1.uid
where Mem1.name = 'David Ben-Gurion' and MIK1.party = 'Mapai')
except 
(select number
from memberInKnesset M1
where M1.uid = M.uid))
order by name;
