select name, party
from members natural join memberInKnesset
where number = 1
order by name, party;