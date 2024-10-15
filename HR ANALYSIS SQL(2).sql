use hranalysis;
desc hr2;
select count(*) from hr1;
select count(*) from hr2;
alter table hr2 change column  ï»¿EmployeeID EmployeeId int;
----- KPI1 -----

SELECT department, AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_rate
FROM hr1
GROUP BY department;

-- KPI2 ----

select jobrole,gender,round(avg(hourlyrate),2) as avg_hourly_rate
from hr1
where gender = "Male" and jobrole = "Research Scientist";

----- KPI3 -----

SELECT
    h1.Attrition,
    COUNT(*) AS CountOfEmployees,
    AVG(h2.MonthlyIncome) AS AverageMonthlyIncome,
    MAX(h2.MonthlyIncome) AS MaxMonthlyIncome,
    MIN(h2.MonthlyIncome) AS MinMonthlyIncome,
    SUM(h2.MonthlyIncome) AS TotalMonthlyIncome
FROM hr1 h1
INNER JOIN hr2 h2 ON h1.Employeenumber = h2.EmployeeID
GROUP BY h1.Attrition;

---- KPI4 ------

select h1.department, avg(h2.totalworkingyears) as avg_working_years
from hr1 h1 inner join hr2 h2 on h1.EmployeeNumber= h2.EmployeeId
group by h1.department;

--- KPI5 -------

select h1.jobrole, avg(h2.worklifebalance) as avg_worklife_balance
from hr1 h1 inner join hr2 h2 on h1.employeenumber = h2.EmployeeId
group by h1.jobrole
order by avg_worklife_balance desc;

---- KPI6 ----

SELECT h2.YearsSinceLastPromotion, 
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritedEmployees,
       (SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS AttritionRatePercent
FROM hr1 h1 inner join hr2 h2 on h1.employeenumber = h2.EmployeeId
GROUP BY h2.YearsSinceLastPromotion
ORDER BY h2.YearsSinceLastPromotion;

-- *******************************************************************************************************************************