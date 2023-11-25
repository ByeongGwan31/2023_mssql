create database Company;

use Company;

create table Department (
		DeptNo int not null,
		DeptName char(10),
		Floor int,
		primary key(DeptNo)
);

Select *
From Department;

Insert into Department values (1, '����', 8);
Insert Into Department values (2, '��ȹ', 10);
Insert Into Department values (3, '����', 9);

create table Employee (
		EmpNo int not null,
		EmpName char(10),
		Title char (10),
		Dno int,
		Salary int,
		primary key(EmpNo),
		foreign key(Dno) references Department(DeptNo)
);

Insert Into Employee Values (2106, '��â��', '�븮', 2, 2000000);
Insert Into Employee Values (3426, '�ڿ���', '����', 3, 2500000);
Insert Into Employee Values (3011, '�̼���', '����', 1, 3000000);
Insert Into Employee Values (1003, '������', '�븮', 1, 2000000);
Insert Into Employee Values (3427, '����ö', '���', 3, 1500000);

Select *
From Employee;

-- �븮�� ������ �̸��� �ҼӺμ� ��ȣ��?
Select Empname, Dno
From Employee
Where Title = '�븮';


/* ��â�� ������ ��� ������ �˻��Ͻÿ�. */
Select *
From Employee
Where Empname = '��â��';



/* �����μ��� ��ġ (Floor)��? */
Select *
-- Ȥ�� floor�� �ص� �ȴ�.
From Department
Where DeptName = '����';


/* �޿��� 2500000 �̻��� ������ �̸��� �޿��� �˻��Ͻÿ�. */
Select EmpName, Salary
From Employee
Where Salary >= '2500000';


/* ���� �Ǵ� �븮�� ������ �̸��� �޿�, ��å��? */
Select EmpName, Salary, Title
From Employee
Where Title = '����' OR Title = '�븮';

/* 2�� �μ��� �ƴ� ������ �̸��� ��å, �ҼӺμ� ��ȣ��? */
Select EmpName, Title, Dno
From Employee
Where Dno <> 2;

-- <>


/* �޿��� 2000000 �̻� 2500000 �̻��� ������ �̸��� �޿��� �˻��Ͻÿ�. */
Select EmpName, Salary
From Employee
Where Salary >= 2000000 AND Salary >= 2500000;

-- Salary >= 200000 AND Salary <= 2500000


/* �达 ���� ���� ������ �̸��� �ҼӺμ� ��ȣ��? */
Select EmpName, Dno
From Employee
Where EmpName Like '��%';

/* 1 �Ǵ� 3�� �μ��� ���ϴ� ������ �̸��� �ҼӺμ� ��ȣ��? */
Select EmpName, Dno
From Employee
-- Where Dno = 1 OR Dno = 3;
Where Dno in (1,3);


/* ��� ������ ���Ͽ� �޿��� ������������ �̸��� �޿��� �˻��Ͻÿ�. */
Select EmpName, Salary
From Employee
Order By Salary Asc;
-- ��� �����̶� where�� �� �ʿ䰡 ����.


/* 1�� �μ��� �ٹ��ϴ� ������ ���Ͽ� �޿��� ������������ �̸��� �޿��� �˻��Ͻÿ�. */
Select EmpName, Salary
From Employee
Where Dno = 1
Order By Salary Desc;