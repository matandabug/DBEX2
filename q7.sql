select number as k, name as n
from members natural join (
    select * 
    from membersInKnesset
    except
    select *
    from membersInKnesset natural join (select m1.number as number, m1.uid as uid
    from ((membersInKnesset natural join (select uid, birthYear from members) m11) m1 JOIN
    (membersInKnesset natural join (select uid, birthYear from members) m21) m2)
    where m1.number = m2.number and m1.birthYear > m2.birthYear)
)
order by k, n;
