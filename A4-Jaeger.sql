/**********************/
/* Name: Nolan Jaeger */
/* Class: CS3410      */
/* Term: Fall 2020    */
/* Assign #: 4        */
/**********************/
/*A*/
Select *
From PROJECT;
/*B*/
Select ProjectID, Name, StartDate, EndDate
From PROJECT;
/*C*/
Select *
From PROJECT
Where StartDate < #01-AUG-08#;
/*D*/
Select *
From PROJECT
Where EndDate is NULL;
/*E*/
Select ProjectID, E.EmployeeNumber, LastName, FirstName, Phone
From ASSIGNMENT as a inner join EMPLOYEE as E
	on A.EmployeeNumber = E.EmployeeNumber;
/*F*/
Select P.ProjectID, Name as ProjectName, P.Department as ProjectDepartment, E.EmployeeNumber, LastName, FirstName, Phone as EmployeePhone
From (ASSIGNMENT as a inner join EMPLOYEE as E
	on A.EmployeeNumber = E.EmployeeNumber) 
inner join PROJECT as P
	on A.ProjectID = P.ProjectID;
/*G*/
Select P.ProjectID, Name as ProjectName, D.DepartmentName as ProjectDepartment, D.Phone as DepartmentPhone, E.EmployeeNumber, Lastname, Firstname, E.Phone as EmployeePhone
From ((ASSIGNMENT as a inner join EMPLOYEE as E
		on A.EmployeeNumber = E.EmployeeNumber)
	inner join PROJECT as P 
		on A.ProjectID = P.ProjectID)
	inner join DEPARTMENT as D
		on P.Department = D.DepartmentName
Order by P.ProjectID;
/*H*/
Select P.ProjectID, Name as ProjectName, D.DepartmentName as ProjectDepartment, D.Phone as DepartmentPhone, E.EmployeeNumber, LastName, FirstName, E.Phone as EmployeePhone
From ((ASSIGNMENT as a inner join EMPLOYEE as E
		on A.EmployeeNumber = E.EmployeeNumber)
	inner join PROJECT as P
		on A.ProjectID = P.ProjectID)
	inner join DEPARTMENT as D
		on P.Department = D.DepartmentName
Where DepartmentName = 'Marketing'
Order by P.ProjectID;
/*I*/
Select COUNT(*) as NumberOfMarketingProjects
From PROJECT
Where Department = 'Marketing';
/*J*/
Select SUM(MaxHours) as TotalMaxHoursForMarketingProjects
From PROJECT
Where Department = 'Marketing';
/*K*/
Select AVG(MaxHours) as AverageMaxHoursForMarketingProjects
From PROJECT
Where Department = 'Marketing';
/*L*/
Select Department, COUNT(*) as NumberOfDepartmentProjects
From PROJECT
Group by Department;
