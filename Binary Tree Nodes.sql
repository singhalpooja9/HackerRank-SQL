select  N, case when P is null then 'Root'
when (select count(*) from bst where P=b.N) > 0 then 'Inner'
Else 'Leaf'
End
from bst b
order by N;