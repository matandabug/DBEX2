select number as k, name as n
from members natural join (
    select * 
    from membersInKnesset
    except
    select *
    from membersInKnesset natural join (select m1.number as number, m1.uid as uid
    from (membersInKnesset natural join (select uid, birthYear from members) m11) m1 JOIN
    (membersInKnesset natural join (select uid, birthYear from members) m21) m2 on m1.number = m2.number
    where m1.birthYear > m2.birthYear) T1
)
order by k, n;
