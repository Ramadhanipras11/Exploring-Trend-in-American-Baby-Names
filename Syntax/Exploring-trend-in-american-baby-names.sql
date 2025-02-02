-- Before you proceed, consider the assumption that a name is considered "Classic" if it appears in 50 or more years, and "Trendy" otherwise.

-- 1. List the first five names in alphabetical order and find out if each name is "Classic" or "Trendy"
select first_name,
	   sum(num),
	   case when count(year) > 50 then 'Classis'
	   else 'Trendy' end as popularity_type
from baby_names
group by first_name 
order by first_name
limit 5;

-- 2. What were the top 20 male names overall and how did the name paul rank ?
select rank() over(order by sum(num) desc) as rank_name,
	   first_name,
	   sum(num) as total
from baby_names bn 
where sex = 'M'
group by first_name 
order by rank_name
limit 20;

-- 3. Which females names appeared in both 1920 and 2020 ?
SELECT a.first_name, (a.num + b.num) AS total_occurrences
FROM baby_names AS a
JOIN baby_names AS b
ON a.first_name = b.first_name
WHERE a.year = 1920 AND
	  b.year = 2020 AND
	  a.sex = 'F' AND b.sex = 'F'