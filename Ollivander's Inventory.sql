select w.id, wp.age, w.coins_needed, w.power from wands w
full outer join wands_property wp
on w.code = wp.code
where w.coins_needed = ( select min(w2.coins_needed) from wands w2
                        Inner Join wands_property wp2
                        on w2.code = wp2.code
                        where wp2.is_evil=0 and w.power = w2.power 
                        and wp2.age = wp.age)
order by w.power desc, wp.age desc;