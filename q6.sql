select distinct name
from (members M natural join memberInKnesset MIK) as MEMS
where MEMS.party = 'Mapai' and name <> 'David Ben-Gurion' and not exists (
    (select number
from members Mem1 join memberInKnesset MIK1 on MIK1.uid = Mem1.uid
where Mem1.name = 'David Ben-Gurion' and MIK1.party = 'Mapai')
except 
(select number
from memberInKnesset M1
where M1.uid = MEMS.uid))
order by name;
