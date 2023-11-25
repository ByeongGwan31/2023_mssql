create database ȸ��DB;
use ȸ��DB;

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
		Dno int
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

-- Insert Into Employee values(2106, '��â��', '�븮', 1003, 2500000, 2);
-- 


Select *
From Employee;


--#1. ��â���� ��å�� ������ �˻��Ͻÿ�.
Select Title, Salary
From Employee
Where EmpName = '��â��';

--#2. �达 ���� ���� �������� �̸�, ��å�� �˻��Ͻÿ�.
Select EmpName, Title
From Employee
Where EmpName Like '��%';

--#3. ������ 300���� �̻� 400���� ������ �������� �̸�, ������ �˻��Ͻÿ�.
Select EmpName, Salary
From Employee
Where Salary Between 3000000 AND 4000000;

--#4. �Ŵ����� ���� ������ �̸��� ��å��?
Select EmpName, Title
From Employee
Where Manager is null;

--#5. 2���μ��� �ٹ��ϴ� �������� �̸�, ������ �˻��Ͽ� ������ ������������ ������.
Select EmpName, Salary
From Employee
Where Dno = 2
Order by Salary ASC;

--#6. ��� �������� ��տ����� �˻��Ͻÿ�.
Select AVG(Salary) As '�������� ��� ����'
From Employee;

--#7. ȸ���� �������� ��� �� �� �ΰ�?
Select Count(*) AS '��ü ȸ�� ������ ��'
From Employee

--#8. ������ �������� ��� �� �� �ΰ�?
Select Count(Title) AS '������ ������ ��'
From Employee
Where Title = '����';


--#9. 2�� �μ��� �ٹ��ϴ� �������� ������ �����?
Select AVG(Salary) AS '2���μ� �������� ���� ���'
From Employee
Where Dno = 2;

--#10. ��� �����鿡 ���� �Ҽ� �μ���ȣ�� �׷�ȭ�ϰ� �μ��� ��� ������ �˻��Ͻÿ�.
Select AVG(Salary) AS '�μ��� ��� ����', Dno
From Employee
Group By Dno;

--#11. ��� �����鿡 ���� �Ҽ� �μ���ȣ�� �׷�ȭ�ϰ� �ҼӺμ��� ��տ����� 250���� �̻��� �μ��� ���� �μ���ȣ,
-- �μ��� ��� ������ �˻��Ͻÿ�.
Select AVG(Salary) AS '�μ��� ��� ����', Dno AS '�׷� ��ȣ'
From Employee
Group By Dno
Having AVG(Salary) >= 2500000;

--#12. 1�� �μ��� �ٹ��ϴ� �������� �̸��� �˻��Ͻÿ�.
Select EmpName, Dno As '�μ�'
From Employee
Where Dno = 1;

--#13. �����μ��� �ٹ��ϴ� �������� �̸��� �˻��Ͻÿ�.
Select EmpName, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '����';

--#14. ��â���� �ٹ��ϴ� �μ����� �˻��Ͻÿ�.
Select DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '��â��';

--#15. ������ �������� �̸��� �̸��� ������������ ��Ÿ���ÿ�.
Select EmpName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND TItle = '����'
Order By EmpName ASC;

-- #15. ������ �������� �̸��� �̸��� ������������ ��Ÿ���ÿ�.
Select EmpName
From Employee
Where Title = '����'
Order By EmpName ASC;

-- [����]
--#2-1. ���� �μ��� �ٹ��ϴ� �������� �̸���?
Select EmpName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '����';

Select EmpName
From Employee, Department
Where Department.DeptNo = Employee.Dno AND DeptName = '����'
Order by DeptName DESC;

--#2-2. 8���� �ٹ��ϴ� �������� �̸��� ��å, ������?
Select EmpName, Title, Salary
From Department, Employee
Where Department.DeptNo = Employee.Dno AND Floor = 8;

-- [���� 2]

-- #1. �̾� ���� ���� ������ �̸�, ��å, �ҼӺμ��� �̸���?
Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName Like '��%';

-- #2. �����̸鼭 1�� �μ��� �ƴ� ������ �̸��� ��å, �ҼӺμ�����?
Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND TItle = '����' AND Dno <> 1;

-- #3. �޿��� 300�����̻� 450���� ������ ������ �̸�, �޿�, �ҼӺμ�����?
Select EmpName, Salary, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND Salary Between 3000000 AND 4500000;

-- #4. �Ŵ����� ���� ������ �̸��� ��å, �Ҽ� �μ�����?
Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND Manager is null;

-- #5. ��ȹ�μ��� �ٹ��ϴ� ������ �̸�, �޿�, ��å�� �޿��� ������������ �˻��Ͻÿ�.
Select EmpName, Salary, Title
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '��ȹ'
Order By Salary DESC;

-- #6. �����̸� �� �����ټ����� ���� ���� �̸��� �������� �̸��� �˻��Ͻÿ�.
Select Min(EmpName) as '�����ټ� �� ����', Max(EmpName) as '�����ټ� �� ����'
From Employee

-- #7. ��å�� ������ ���� 2�� �̻��� ��å�� �� ��å�� �������� �˻��Ͻÿ�.
Select Title, Count(Title) AS '��å�� ������ ��'
From Employee
Group By Title
Having Count(Title) >= 2;


-- [����]
Select Min(Salary) AS '���� ���Թ��� ������ ����'
From Employee;

Select Min(EmpName)
From Employee;

Select Max(EmpName)
From Employee;

Select AVG(EmpName)
From Employee;

Select EmpName
From Employee
Order By EmpName;

Select Count(Manager)
From Employee;

-- �ߺ�����
Select Title, Count(*) AS '��å ������ ��'
From Employee
Group By Title
Having Count(TItle) >= 2;

-- [������ ����] ��â���� �ٹ��ϴ� �μ� �̸���?
Select Empname, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '��â��';

Select DeptName
From Department
Where DeptNo = (Select Dno
				From Employee
				Where Empname = '��â��'
				);

Select Dno
From Employee
Where Empname = '��â��'

-- [������ ���� [��ø] ���� �μ��� �ٹ��ϴ� ���� �̸���?)
Select EmpName
From Employee
Where Dno = (
Select DeptNo
From Department
Where DeptName = '����'
);