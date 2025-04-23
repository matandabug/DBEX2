select name, number
from members natural join memberInKnesset natural join knessets
where (party = 'Likud' or party = 'Meretz') and (startYear - birthYear > 70)
order by name, number;