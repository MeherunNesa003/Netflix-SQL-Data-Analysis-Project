CREATE DATABASE netflix;
USE netflix;

CREATE TABLE netflix (
   show_id VARCHAR(10),
   type VARCHAR(20),
   title VARCHAR(255),
   director VARCHAR(255),
   cast TEXT,
   country VARCHAR(200),
   date_added VARCHAR(50),
   release_year INT,
   rating VARCHAR(20),
   duration VARCHAR(30),
   listed_in VARCHAR(255),
   description TEXT
);

DROP TABLE netflix;
SELECT * FROM netflix LIMIT 8000;

#1. Count the number of Movies vs TV Shows
SELECT type, COUNT(*) AS total_number FROM netflix
GROUP BY type;

#2. Find the most common rating for movies and TV shows
SELECT type ,rating 
 FROM(
SELECT rating, type, COUNT(*),
RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
FROM netflix
 GROUP BY 1,2 )AS r1
 WHERE ranking = 1;

#3. List all movies released in a specific year (e.g., 2020)
SELECT * FROM netflix 
WHERE type = 'Movie' AND release_year = '2020';

#4. Find the top 5 countries with the most content on Netflix
SELECT 
    TRIM(j.country_name) AS country,
    COUNT(*) AS total_content
FROM netflix n,
     JSON_TABLE(
         CONCAT('["', REPLACE(n.country, ',', '","'), '"]'),
         '$[*]' COLUMNS (country_name VARCHAR(100) PATH '$')
     ) AS j
WHERE n.country IS NOT NULL
GROUP BY TRIM(j.country_name)
ORDER BY total_content DESC
LIMIT 5;


#5. Identify the longest movie
SELECT * FROM netflix 
WHERE type = 'Movie' 
ORDER BY CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) DESC LIMIT 1;

#6. Find content added in the last 5 years
SELECT * FROM netflix
WHERE YEAR(date_added) >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

#7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT * FROM netflix
WHERE director = 'Rajiv Chilaka';

#8. List all TV shows with more than 5 seasons
SELECT * FROM netflix
WHERE type = 'TV Show' AND
CAST(SUBSTRING_INDEX(duration,' ',1) AS UNSIGNED) >=5;

#9. Count the number of content items in each genre
SELECT 
    TRIM(j.genre) AS genre,
    COUNT(*) AS total_content
FROM netflix n,
     JSON_TABLE(
         CONCAT('["', REPLACE(n.listed_in, ',', '","'), '"]'),
         '$[*]' COLUMNS (genre VARCHAR(100) PATH '$')
     ) AS j
WHERE n.listed_in IS NOT NULL
GROUP BY genre
ORDER BY total_content DESC;


#10.Find each year and the average numbers of content release in India on netflix. 
#return top 5 year with highest avg content release!
SELECT 
    YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS release_year,
    COUNT(*) AS total_content
FROM netflix
WHERE country LIKE '%India%'
GROUP BY YEAR(STR_TO_DATE(date_added, '%M %d, %Y'))
ORDER BY release_year;




#11. List all movies that are documentaries
SELECT title, type, listed_in
FROM netflix
WHERE listed_in LIKE '%Documentaries%'
  AND type = 'Movie';

#12. Find all content without a director
SELECT *
FROM netflix
WHERE director IS NULL OR director = '';

#13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT COUNT(*) AS total_movies
FROM netflix
WHERE cast LIKE '%Salman Khan%'
  AND type = 'Movie'
  AND release_year >= YEAR(CURDATE()) - 10;
#14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT actor, COUNT(*) AS total_movies
FROM (
    SELECT n.title, TRIM(j.actor) AS actor
    FROM netflix n,
         JSON_TABLE(
             CONCAT('["', REPLACE(n.cast, ',', '","'), '"]'),
             '$[*]' COLUMNS (actor VARCHAR(255) PATH '$')
         ) AS j
    WHERE n.country LIKE '%India%'
      AND n.type = 'Movie'
) AS actor_list
GROUP BY actor
ORDER BY total_movies DESC
LIMIT 10;

#15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
#the description field. Label content containing these keywords as 'Bad' and all other 
#content as 'Good'. Count how many items fall into each category.

SELECT 
  CASE 
    WHEN description LIKE '%kill%' OR description LIKE '%violence%' THEN 'Bad'
    ELSE 'Good'
  END AS content_type,
  COUNT(*) AS total_content
FROM netflix
GROUP BY content_type;


