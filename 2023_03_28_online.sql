create database Comapany_230328_������;

use Comapany_230328_������;

create table Department (
		DeptNo int not null,
		DeptName char(10),
		Floor int,
		primary key(DeptNo)
);

Insert Into Department values(1, '����', 8);
Insert Into Department values(2, '��ȹ', 10);
Insert Into Department values(3, '����', 9);
Insert Into Department values(4, '�ѹ�', 7);

Select *
From Department;

create table Employee (
		EmpNo int not null,
		EmpName char(20),
		Title char(20),
		Manager int,
		Salary int,
		Dno int,
		primary key(EmpNo),
		foreign key(Dno) references Department(DeptNo),
		foreign key(Manager) references Employee(EmpNo)
);

Insert Into Employee values(4377, '�̼���', '����', null, 5000000, 2);
Insert Into Employee values(3426, '�ڿ���', '����', 4377, 3000000, 1);
Insert Into Employee values(3011, '�̼���', '����', 4377, 4000000, 3);
Insert Into Employee values(1003, '������', '����', 4377, 3000000, 2);
Insert Into Employee values(2106, '��â��', '�븮', 1003, 2500000, 2);
Insert Into Employee values(3427, '����ö', '���', 3011, 1500000, 3);
Insert Into Employee values(1365, '����', '���', 3426, 1500000, 1);

Select *
From Employee;

-- #1. �̼��� ����� ��å�� �Ҽ� �μ���ȣ��? --
Select Title, Dno
From Employee
Where EmpName = '�̼���';

-- #2. �̾� ���� ���� ����� �̸�. ��å, �ҼӺμ� ��ȣ��? --
Select EmpName, Title, Dno
From Employee
Where EmpName like '��%';

-- #3. �����̸鼭 1�� �μ��� �ƴ� ����� �̸��� ��å, �ҼӺμ���ȣ��? --
Select EmpName, Title, Dno
From Employee
Where Title = '����' AND Dno <> 1;

-- #4. �޿��� 300���� �̻��̰� 450���� ������ ����� �̸�, ��å, �޿���? --
Select EmpName, Title, Salary
From Employee
Where Salary Between 3000000 AND 4500000;

-- #5. �Ŵ����� ���� ����� �̸��� ��å��? --
Select EmpName, Title
From Employee
Where Manager is null;

-- #6. 2�� �μ��� �ٹ��ϴ� ����� �̸�, �޿�, ��å�� �޿��� ������������ �˻��Ͻÿ�. --
Select EmpName, Salary, Title
From Employee
Where Dno = 2
Order By Salary ASC;

-- #7. ����̸� �� �����ټ����� ���� ���� �̸��� �������� �̸��� �˻��Ͻÿ�. [!] --
-- ASCII �ڵ� ���
Select Min(EmpName) as '�����ټ� �� ����', Max(EmpName) as '�����ټ� �� ����'
From Employee

-- #8. ��å�� ����� ���� 2�� �̻��� ��å�� �� ��å�� ������� �˻��Ͻÿ�. [!] --
Select Title, Count(Title) AS '������ ��'
From Employee
Group By Title
Having Count(Title) >= 2;

-- #2-1. ��â���� �ٹ��ϴ� �μ���ȣ��? --
Select Dno
From Employee
Where EmpName = '��â��';


-- #2-2. ��â���� �ٹ��ϴ� �μ��̸���? --
-- ���ϴ� ���� ������ �ʰ�, ��� ���� �� ���´�. �� ���� ���� ���Ծ��� �����̴�.
-- ��â���� �μ���ȣ DeptNo, Department ���� ���÷��� DeptNo�� ���� ���ƾ��Ѵ�.
Select DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '��â��';


-- #3-1. 1�� �μ��� �ٹ��ϴ� �������� �̸���?

Select EmpName
From Employee
Where Dno = 1;

-- #3-2. ���� �μ��� �ٹ��ϴ� �������� �̸��� ��å��?
Select EmpName, Title
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '����';

-- #3-3. ��� �������� �̸��� �ٹ� �μ����� �˻��Ͻÿ�.
Select EmpName, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo

-- #4-1. ������ �������� �̸��� ��å, �ٹ��μ��� �̸���?
Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND Title = '����';

-- #4-2. 9���� �ٹ��ϴ� �������� �̸��� �޿�, �ٹ��μ��� �̸���?
Select EmpName, Salary, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND Floor = 9;