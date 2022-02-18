/* Q1. How many rows are in the data_analyst_jobs table?

SELECT COUNT (*)
FROM data_analyst_jobs;

A1: 1793

Q2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

A2: ExxonMobil 

Q3: How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE (location = 'TN' OR location = 'KY');

A3: 21 in TN, 27 in either TN or KY

Q4: How many postings in Tennessee have a star rating above 4?

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE location = 'TN' 
AND star_rating > 4;

A4: 3 postings

Q5: How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT (*)
FROM data_analyst_jobs
WHERE review_count
BETWEEN 500 AND 1000;

A5: 151

Q6: Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT AVG(star_rating) AS avg_rating, location AS state
FROM data_analyst_jobs
GROUP BY state
ORDER BY avg_rating DESC;

A6: Nebraska

Q7: Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs;

A7: 881 unique job titles

Q8: How many unique job titles are there for California companies?

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

A8: 230 unique job titles in CA

Q9: Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;

SELECT COUNT (company)
FROM data_analyst_jobs
WHERE review_count > 5000

A9: 184 companies with more than 5000 reviews

Q10: Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_star_rating DESC;

A10: General Motors with an average star rating of ~4.2

Q11: Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

SELECT COUNT (title)
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%';

A11: 1636 different job titles containing 'Analyst'

Q12: How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common? */

SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%'
AND title NOT LIKE '%Analytics%';

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%'
AND title NOT LIKE '%Analytics%';

A12: 26, have 'Data' in common

BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 

SELECT COUNT (title), domain
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
GROUP BY domain;

Disregard any postings where the domain is NULL.

SELECT COUNT (title), domain
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain;

Order your results so that the domain with the greatest number of hard to fill jobs is at the top.

SELECT COUNT (title), domain
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY count(title) DESC;

Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

SELECT COUNT (title), domain
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY count(title) DESC
LIMIT 4;

SELECT COUNT (title), domain
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY count(title) DESC
LIMIT 4;

A: Internet and Software, Banks and Financial Services, Consulting and Business Services, Health Care