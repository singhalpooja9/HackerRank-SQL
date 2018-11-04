select h.hacker_id, h.name, total_score 
 from (
     select hacker_id, sum(max_score) as total_score from 
        ( select hacker_id, max(score) as max_score from submissions 
            group by hacker_id, challenge_id) c
         group by hacker_id
     ) c1
JOIN hackers h
     ON h.hacker_id = c1.hacker_id
     where c1.total_score <> 0
     order by total_score desc, hacker_id;