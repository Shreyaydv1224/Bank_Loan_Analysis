USE bank_loan_analysis;
SHOW TABLES;
SELECT COUNT(*)
FROM bank_loan_cleaning_workbook;
SELECT * FROM bank_loan_cleaning_workbook
LIMIT 10; -- (Isse table ke columns aur data dikh jayenge.) 
DESCRIBE bank_loan_cleaning_workbook;  -- (Isse pata chalega ki table mein kaun-kaun se columns hain, jaise loan amount, income, loan status, interest rate, etc.) 

SELECT COUNT(*) AS Total_Applications
FROM bank_loan_cleaning_workbook; -- (Isse total records/applications ki sankhya milegi.) 

SELECT Loan_Status, COUNT(*) AS Total_Loans FROM bank_loan_cleaning_workbook
GROUP BY Loan_Status; -- (Isse pata chalega ki har Loan_Status category mein kitne records hain). 

SELECT
    COUNT(*) AS Total_Applications,
    ROUND(SUM(Loan_Amount), 2) AS Total_Loan_Amount,
    ROUND(AVG(Loan_Amount), 2) AS Average_Loan_Amount,
    ROUND(AVG(Interest_Rate), 2) AS Average_Interest_Rate
FROM bank_loan_cleaning_workbook; -- (Isse pata chalega: Total loan applications kitni hain.,Total loan amount kitna hai., Average loan amount kitna hai., Average interest rate kitni hai. )

SELECT
    Loan_Purpose,
    COUNT(*) AS Total_Applications,
    ROUND(SUM(Loan_Amount), 2) AS Total_Loan_Amount
FROM bank_loan_cleaning_workbook
GROUP BY Loan_Purpose
ORDER BY Total_Applications DESC; -- (Isse pata chalega ki kis purpose ke liye sabse zyada loan applications aayi hain.)

 SELECT
    Credit_Grade,
    COUNT(*) AS Total_Applications,
    ROUND(AVG(Interest_Rate), 2) AS Average_Interest_Rate
FROM bank_loan_cleaning_workbook
GROUP BY Credit_Grade
ORDER BY Credit_Grade; -- (Isse har credit grade mein applications aur average interest rate dikhegi.) )

SELECT
    Loan_Status,
    COUNT(*) AS Total_Applications,
    ROUND(AVG(Loan_Amount), 2) AS Average_Loan_Amount
FROM bank_loan_cleaning_workbook
GROUP BY Loan_Status
ORDER BY Total_Applications DESC; -- Isse har loan status mein applications ki sankhya aur average loan amount pata chalega.

SELECT
    Region,
    COUNT(*) AS Total_Applications,
    ROUND(SUM(Loan_Amount), 2) AS Total_Loan_Amount
FROM bank_loan_cleaning_workbook
GROUP BY Region
ORDER BY Total_Applications DESC;  -- Isse pata chalega ki kis region se sabse zyada loan applications aayi hain aur har region mein total loan amount kitna hai.  
 
 SELECT
    COUNT(*) AS Total_Records,
    ROUND(AVG(Annual_Income), 2) AS Average_Annual_Income,
    ROUND(AVG(Loan_Amount), 2) AS Average_Loan_Amount,
    ROUND(AVG(DTI_Percent), 2) AS Average_DTI,
    ROUND(AVG(Interest_Rate), 2) AS Average_Interest_Rate
FROM bank_loan_cleaning_workbook;  -- Isse annual income aur loan amount ka summary milega. 
 
 SELECT
    SUM(Loan_Amount IS NULL) AS Missing_Loan_Amount,
    SUM(Annual_Income IS NULL) AS Missing_Annual_Income,
    SUM(Loan_Status IS NULL) AS Missing_Loan_Status,
    SUM(Credit_Grade IS NULL) AS Missing_Credit_Grade
FROM bank_loan_cleaning_workbook; -- pata chale important columns mein missing values kitni hain: 
	