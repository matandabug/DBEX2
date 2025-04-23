select name
from (select *
    from members
    except
    select *
    from (select m1.uid as uid
        from memberInKnesset m1, memberInKnesset m2
        where m1.uid = m2.uid and m1.number <> m2.number) T natural join members
) T1
where birthPlace = 'Jerusalem'
order by name;