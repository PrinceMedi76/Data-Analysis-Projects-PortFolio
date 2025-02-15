SELECT * FROM top_youtubers;

--We are going to extract channel_names from NOMBRE
--we used charindex and substring to get names
SELECT CHARINDEX('@',NOMBRE), NOMBRE 
FROM top_youtubers

--I used cast to make sure that everything entered is a string and everything there
SELECT CAST(SUBSTRING(NOMBRE,1,CHARINDEX('@',NOMBRE)-1) as VARCHAR(100)) as Channel_name,
total_subscribers,total_views,total_videos
FROM top_youtubers

--We will create a view fro our combined data
CREATE VIEW view_top_youtubers AS
SELECT CAST(SUBSTRING(NOMBRE,1,CHARINDEX('@',NOMBRE)-1) as VARCHAR(100)) as Channel_name,
total_subscribers,total_views,total_videos
FROM top_youtubers;

--we show our View created
SELECT * FROM view_top_youtubers;

--We will check our Data if
--1 Has all columns required for analysis(4)
--2 all data types are correct in specific columns
--3 we have 100 rows in the table
--Check for duplicates in Data

--1
SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME = 'view_top_youtubers'

--2
SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME = 'view_top_youtubers'

--3
SELECT COUNT(*) as NumberOfRows FROM view_top_youtubers

--4
SELECT Channel_name,COUNT(*) as NumberOfDuplicates 
FROM view_top_youtubers
GROUP BY Channel_name
HAVING COUNT(*) > 1