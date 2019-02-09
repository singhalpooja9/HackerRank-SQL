select concat(name ,'(' , substr(Occupation, 1,1) , ')') from occupations order by name asc;

select concat('There are a total of' , ' ' , count(*) , ' ' , lower(occupation) , 's.' )
from occupations group by occupation order by count(occupation), occupation asc;