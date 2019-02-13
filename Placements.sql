select s.name from students s
inner join friends f on s.id = f.id
inner join packages p on s.id = p.id
inner join packages pk on pk.id = f.friend_id
where pk.salary > p.salary
order by pk.salary;