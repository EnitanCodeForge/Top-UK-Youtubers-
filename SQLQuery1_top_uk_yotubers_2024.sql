CREATE DATABASE youtube_db;

USE youtube_db;

select * from top_uk_youtuber_2024;

SELECT  
	NOMBRE, 
	total_subscribers, 
	total_views, 
	total_videos 
FROM 
	top_uk_youtuber_2024;

--Select CHARINDEX('@', NOMBRE) NOMBRE from top_uk_youtuber_2024

CREATE VIEW view_uk_youtubers_2024 AS

Select 
	CAST (SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE) -1 ) AS varchar(100)) as channel_name, 
	total_subscribers, 
	total_views, 
	total_videos 
from top_uk_youtuber_2024


SELECT TOP (1000) [channel_name]
      ,[total_subscribers]
      ,[total_views]
      ,[total_videos]
  FROM [youtube_db].[dbo].[view_uk_youtubers_2024]


/*
	#Data quality tests 

1. The data needs to be 100 records of youtube channels(row count test)
2. The data needs 4 fields (column count test)
3. The channels name column must be string format, and the other columns must be numerical data types(data type check)
4. Each record must be unique in the dataset (duplicate count check) 

Row count - 100 


Dta Type 
channel_name = VARCHAR
total_subscrribers = INTEGER
total_views = INTEGER
total_videos = INTEGER 

Duplicate count = 0 

*/


Select Count(*) from view_uk_youtubers_2024



Select * from information_schema.columns
where table_name = 'view_uk_youtubers_2024'


SELECT *
FROM view_uk_youtubers_2024
WHERE 
	channel_name IS NULL 
	or total_subscribers is null 
	or total_views is null 
	or total_videos is null;


SELECT channel_name, 
	COUNT(*) as duplicate_count
FROM 
	view_uk_youtubers_2024
GROUP BY 
	channel_name
HAVING COUNT(*) > 1;