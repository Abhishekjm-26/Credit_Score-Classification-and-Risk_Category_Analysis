create database Risk_Score;
use Risk_Score;

select * from Risk_Score;
ALTER TABLE Risk_Score
CHANGE `Credit Score` CreditScore VARCHAR(20);


-- 1. Show Age, Gender and Income for Individuals with high credit score
SELECT Age, Gender, Income
FROM Risk_score
WHERE CreditScore = 'High';

-- 2. Show Education, Avg income grouping by education level and ordered by average income
SELECT Education, AVG(Income) AS Avg_Income, COUNT(*) AS Total_People
FROM Risk_score
GROUP BY Education
ORDER BY Avg_Income DESC;

-- 3. avg income > 100000
SELECT Education, AVG(Income) AS Avg_Income
FROM Risk_Score
GROUP BY Education
HAVING AVG(Income) > 100000;

# Rank and Dense_Rank based on type of education and Income
select Education, Income,
Rank() over(
partition by Education order by Income DESC)as Ranking from Risk_Score;

select Education, Income ,
DENSE_Rank() over(
partition by Education order by Income DESC)as Ranking from Risk_Score;


