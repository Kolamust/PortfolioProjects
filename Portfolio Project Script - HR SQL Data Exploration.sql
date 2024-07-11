#The first few records

SELECT TOP 10 * FROM HRDataset_v14;

#The structure of the table

EXEC sp_help 'HRDataset_v14';

#The total number of employees

SELECT COUNT(*) AS TotalEmployees FROM HRDataset_v14;

#The number of employees by department

SELECT Department, COUNT(*) AS EmployeeCount FROM HRDataset_v14 GROUP BY Department ORDER BY EmployeeCount DESC;

#The number of employees by job title
SELECT Position as JobTitle, COUNT(*) AS EmployeeCount FROM HRDataset_v14 GROUP BY Position ORDER BY EmployeeCount DESC;

#Employees average salary

SELECT AVG(Salary) AS AverageSalary FROM HRDataset_v14;

#The salary distribution

SELECT Salary, COUNT(*) AS Count FROM HRDataset_v14 GROUP BY Salary ORDER BY Salary;

#The employees average age

SELECT AVG(DATEDIFF(year, DOB, GETDATE()) - CASE WHEN MONTH(DOB) > MONTH(GETDATE()) AND DAY(DOB) > DAY(GETDATE()) THEN 1 ELSE 0 END) AS AverageAge FROM HRDataset_v14;

#Gender distribution

SELECT Sex as Gender, COUNT(*) AS Count FROM HRDataset_v14 GROUP BY Sex;

#The number of employees hired over time

SELECT YEAR(DateofHire) AS HireYear, COUNT(*) AS HireCount FROM HRDataset_v14 GROUP BY YEAR(DateofHire) ORDER BY HireYear;

#The average tenure of employees

SELECT AVG(DATEDIFF(year, DateofHire, GETDATE())) AS AverageTenure FROM HRDataset_v14;

#The list of top Performers

SELECT TOP 10 * FROM HRDataset_v14 ORDER BY PerformanceScore;

#The selection of performance score distribution

SELECT PerformanceScore, COUNT(*) AS Count FROM HRDataset_v14 GROUP BY PerformanceScore ORDER BY PerformanceScore;

#List of employees under each Manager

SELECT ManagerID, COUNT(*) AS EmployeeCount FROM HRDataset_v14 GROUP BY ManagerID ORDER BY EmployeeCount DESC;

#Average salary of employees under each Manager

SELECT ManagerID, AVG(Salary) AS AverageSalary FROM HRDataset_v14 GROUP BY ManagerID ORDER BY AverageSalary DESC;

#The correlation between salary and employee satisfaction

SELECT
    (SUM(Salary * EmpSatisfaction) - SUM(Salary) * SUM(EmpSatisfaction) / COUNT(*)) /
    (SQRT(SUM(Salary * Salary) - SUM(Salary) * SUM(Salary) / COUNT(*)) *
     SQRT(SUM(EmpSatisfaction * EmpSatisfaction) - SUM(EmpSatisfaction) * SUM(EmpSatisfaction) / COUNT(*))) AS Correlation
FROM HRDataset_v14;














