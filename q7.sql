select number as k, name as n
from members natural join (
    select * 
    from memberInKnesset
    except
    select *
    from memberInKnesset natural join (select m1.number as number, m1.uid as uid
    from (memberInKnesset natural join (select uid, birthYear from members) m11) m1 JOIN
    (memberInKnesset natural join (select uid, birthYear from members) m21) m2 on m1.number = m2.number
    where m1.birthYear > m2.birthYear) T1
) T2
order by k, n;

