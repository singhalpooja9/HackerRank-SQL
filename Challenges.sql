select c.hacker_id, h.name, count(c.hacker_id) as total_challenges from hackers h
inner join challenges c on h.hacker_id = c.hacker_id
group by c.hacker_id, h.name 
having 
total_challenges = 
(select max(a.cnt) 
from 
(select count(hacker_id) as cnt from challenges 
group by hacker_id
order by hacker_id) a )
or
total_challenges IN
( select t.cnt from
(select count(*) as cnt from challenges
group by hacker_id) t
group by t.cnt
having count(t.cnt) = 1 )
order by total_challenges desc, h.hacker_id asc;