create database Company０３１４;

use Company０３１４;

create table Department (
		DeptNo int not null,
		DeptName char(10),
		Floor int,
		primary key(DeptNo)
);

Insert Into Department values (1, '영업', 8);
Insert Into Department values (2, '기획', 10);
Insert Into Department values (3, '개발', 9);

Select *
From Department;

create table Employee (
		EmpNo int not null,
		EmpName char(10),
		Title char(10),
		Dno int,
		Salary int,
		primary key(EmpNo)
);

Insert Into Employee values (2106, '김창섭', '대리', 2, 2000000);
Insert Into Employee values (3426, '박영권', '과장', 3, 2500000);
Insert Into Employee values (3011, '이수민', '부장', 1, 3000000);
Insert Into Employee values (1003, '조민희', '대리', 1, 2000000);
Insert Into Employee values (3427, '최종철', '사원', 3, 1500000);

Select *
From Employee;