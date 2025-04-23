select name
from (select m1.uid as uid
from memberInKnesset m1, memberInKnesset m2
where m1.uid = m2.uid and m1.number = 23 and m2.number = 24) T natural join members
where occupation <> 'politician' and gender = 'female'
order by name;