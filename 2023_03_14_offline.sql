create database Company��������;

use Company��������;

create table Department (
		DeptNo int not null,
		DeptName char(10),
		Floor int,
		primary key(DeptNo)
);

Insert Into Department values (1, '����', 8);
Insert Into Department values (2, '��ȹ', 10);
Insert Into Department values (3, '����', 9);

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

Insert Into Employee values (2106, '��â��', '�븮', 2, 2000000);
Insert Into Employee values (3426, '�ڿ���', '����', 3, 2500000);
Insert Into Employee values (3011, '�̼���', '����', 1, 3000000);
Insert Into Employee values (1003, '������', '�븮', 1, 2000000);
Insert Into Employee values (3427, '����ö', '���', 3, 1500000);

Select *
From Employee;