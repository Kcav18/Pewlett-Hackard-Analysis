# Pewlett-Hackard-Analysis

## Overview of Analysis

The purpose of this analysis for Pewlett Hackard was to determine the number of retiring employees per title and to identify employees who are eligible to participate in a mentorship program. This will help management prepare for the “silver tsunami” as many current employees reach retirement age.

This Analysis has 3 Deliverables that will be summarized below.

***Deliverable 1 (Part 1 of 3):***

A query was written and executed that created a Retirement Titles table for employees who are born between January 1, 1952 and December 31, 1955: 
```
SELECT e.emp_no, e.first_name, e.last_name,
      `t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees e
INNER JOIN titles t on (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no
```

Snippet of above queries results:

![Deliverable 1 A](https://github.com/Kcav18/Pewlett-Hackard-Analysis/blob/main/Queries/Deliverable1a_results.png)

The Retirement Titles table is exported as retirement_titles.csv. View the CSV here: [Retirement Titles](Pewlett-Hackard-Analysis/Data/retirement_titles.csv)

***Deliverable 1 (Part 2 of 3):***

A query was written and executed to create a Unique Titles table that contains the employee number, first and last name, and most recent title:

```
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date='9999-01-01'
ORDER BY emp_no, to_date DESC;
```

Snippet of above queries results:

![Deliverable 1 B](https://github.com/Kcav18/Pewlett-Hackard-Analysis/blob/main/Queries/Deliverable1b_results.png)

The Unique Titles table is exported as unique_titles.csv. View the CSV here: [Unique Titles](data/unique_titles.csv)

***Deliverable 1 (Part 3 of 3):***

A query was written and executed to create a Retiring Titles table that contains the number of titles filled by employees who are retiring:
```
SELECT COUNT(*) AS COUNT, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(*) DESC;
```
Screenshot of above query results:


![Deliverable 1 C](https://github.com/Kcav18/Pewlett-Hackard-Analysis/blob/main/Queries/Deliverable1c_results.png)

The Retiring Titles table is exported as retiring_titles.csv. View the CSV here: [Retiring Titles](data/retiring_titles.csv)

***Deliverable 2***

Create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965:

```
SELECT DISTINCT ON (t.emp_no) t.emp_no, e.first_name, e.last_name, e.birth_date,
	   de.from_date, de.to_date, t.title
INTO mentorship_eligibilty
FROM employees e 
INNER JOIN dept_emp de on (e.emp_no = de.emp_no)
INNER JOIN titles t on (e.emp_no = t.emp_no)
WHERE de.to_date='9999-01-01' 
AND t.to_date='9999-01-01' 
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY t.emp_no;
```
Snippet of above query result:

![Mentorship Eligibility Results](https://github.com/Kcav18/Pewlett-Hackard-Analysis/blob/main/Queries/Deliverable2_results.png)

The Mentorship Eligibility table is exported as mentorship_eligibility.csv. View the CSV here: [Mentorship Eligibility](data/mentorship_eligibilty.csv)

***Deliverable 3:***
*This full readme is the requirement for deliverable 3.*

## Results

- There are 300,024 employees in the Pewlett-Hackard Employee Database.
- There are currently 72,548 positions that will soon be eligible for retirement!
- The majority of the positions that will be vacant after the employees retire are senior level positions. This includes Senior Engineers, Senior Staff, and Engineer roles.
- Only 1,549 current employees will qualify for the mentorship program.

## Summary

**1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?** There will be a total of 72,548 roles that need to be filled as this tsunami takes place.

**2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?** Yes. From the data, it appears that there are many senior level soon to be retirees that will be able to mentor the next generation of senior level employees. And then those employees can mentor the other staff and new staff who take over their positions. The mentorship eligibility parameters may need to be expanded though because based on the current standard, there will only be 1,549 employees who qualify for the mentorship program. Lots of retirees and very few employees to be mentored.

**Additional Analysis/ Queries**

1. Expand the age range for the mentorship program eligibility. By only choosing employees who were born in the year 1965, PH is severely limiting their ability to adequately fill all the soon to be vacant positions. If PH expands those parameters to include birthdates between 1960 and 1965, 93,756 employees would be eligible (compared to the original 1,549). Having this many eligibile employees would provide some flexibility to management for filling the anticipated position openings. This could definitely help Pewlett-Hackard better prepare for the "silver tsunami". See the code and data snippet below:

![Additional Query 1](https://github.com/Kcav18/Pewlett-Hackard-Analysis/blob/main/Queries/Additional_Query1.png)

2. Although the PH Employee database contains 300,024 employees, I was curious how many of those employees are active employees. The query below shows that of those 300,024 employees, only 240,124 are actually active. So, 20% of the records in this database are "outdated". My thoughts would be to drop the past employees from this database and archive them into their own database. See the query below used for this additional analysis.

![Additional Query 2](https://github.com/Kcav18/Pewlett-Hackard-Analysis/blob/main/Queries/Additional_Query2.png)


