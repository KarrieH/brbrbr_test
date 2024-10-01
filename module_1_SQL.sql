select email, first_name, last_name, 
	case
		when first_name is not null and last_name is not null then  concat_ws(' ', first_name, last_name)
		else 'Дорогой друг'
	end full_name
from users


select email
from users
where email ilike('%.ru%') or email ilike('%gmail.com%')

select email, score,
	case
		when score between 0 and 19 then 'D'
		when score between 20 and 99 then 'C'
		when score between 100 and 499 then 'B'
		else 'A'	
	end	as class
from users


select *
from users
where date_joined between '2022-04-01' and '2022-04-11'
order by date_joined 

select date_joined::date
from users u
where date_joined::date between '2022-04-01' and '2022-04-10'
order by date_joined


select pg_typeof(date_joined::date) -- задача 4
from users u 


-- задача 5
select email, date_joined, extract(days from now() - date_joined) as diff
from users u 


-- задача 6
select username, to_char(date_joined, 'DD.MM.YYYY') as date_joined
from users u 
where coalesce(company_id, -1) != 2

-- задача 7
select id, round(complexity * 1.0/nullif(bonus, 0), 2) as coef
from problem p 

-- задача 8
select username, email, 
	split_part(email, '@', 1) as email_trunc, 
	lower(username) = lower(split_part(email, '@', 1)) as isEqual
from users

select username, email,
	left(email, position('@' in email)-1) as email_trunc,
	lower(username) = left(email, position('@' in email)-1) as isEqual
from users


select left(email, position('@' in email) - 1) as left_part,
       substr(email, position('@' in email)) as domain_part,
       email
from users


select strpos('high', 'gh')