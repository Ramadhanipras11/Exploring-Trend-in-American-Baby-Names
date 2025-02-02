# Exploring-Trend-in-American-Baby-Names
## Introduction

![Image](https://github.com/user-attachments/assets/b883363a-589c-4966-bf11-cc14c4a4cadb)

How have American baby name tastes changed since 1920? Which names have remained popular for over 100 years, and how do those names compare to more recent top baby names? These are considerations for many new parents, but the skills you'll practice while answering these queries are broadly applicable. After all, understanding trends and popularity is important for many businesses, too!

You'll be working with data provided by the United States Social Security Administration, which lists first names along with the number and sex of babies they were given to in each year. For processing speed purposes, the dataset is limited to first names which were given to over 5,000 American babies in a given year. The data spans 101 years, from 1920 through 2020.

## Data

<img src="https://github.com/user-attachments/assets/e1ff2fa2-6476-456a-a0f8-8057b2fa3053" alt="Deskripsi Gambar" width="800">

you can download full dataset in : [here](https://github.com/user-attachments/files/18631657/baby_names.csv)

## A. Popularity Name
Before you proceed, consider the assumption that a name is considered "Classic" if it appears in 50 or more years, and "Trendy" otherwise.

### 1. List the first five names in alphabetical order and find out if each name is "Classic" or "Trendy".
````sql
select first_name,
	   sum(num),
	   case when count(year) > 50 then 'Classic'
	   else 'Trendy' end as popularity_type
from baby_names
group by first_name 
order by first_name
limit 5;
````

**Answer**

<img src="https://github.com/user-attachments/assets/92267535-5827-4c88-b81f-5553a6a2c453" alt="Deskripsi Gambar" width="400">

- The name Aaron has the highest number (530,592) and is categorized as Classic.
- The name Aaliyah has the lowest number (15,870) and is categorized as Trendy.
- Most of the names in this table are categorized as Trendy, except Aaron.
### 2. What were the top 20 male names overall, and how did the name name Paul rank ?
````sql
select rank() over(order by sum(num) desc) as rank_name,
	   first_name,
	   sum(num) as total
from baby_names bn 
where sex = 'M'
group by first_name 
order by rank_name
limit 20;
````

**Answer**

<img src="https://github.com/user-attachments/assets/018d029a-fd15-4ac7-af3f-fd002abeabf8" alt="Deskripsi Gambar" width="400">

- The number 1 ranking for most baby boy names is James with a total of 4,748,138
- While the number 20 ranking is Andrew with 1,157,548
- Paul is ranked 17th with a total of 1,218,996
### 3. Which females names appeared in both 1920 and 2020 ?
````sql
SELECT a.first_name, (a.num + b.num) AS total_occurrences
FROM baby_names AS a
JOIN baby_names AS b
ON a.first_name = b.first_name
WHERE a.year = 1920 AND
	  b.year = 2020 AND
	  a.sex = 'F' AND b.sex = 'F'
````

**Answer**

<img src="https://github.com/user-attachments/assets/49586ba4-63b3-4a14-b61d-cd2b7b59f8cf" alt="Deskripsi Gambar" width="400">

- There are 6 baby girl names that are still frequently used in the 1920s and 2020s, namely Emma, ​​Evelyn, Elizabeth, Eleanor, Grace, and Hazel.
