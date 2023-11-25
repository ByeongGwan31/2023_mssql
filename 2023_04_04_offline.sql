create database offline_20230404;

use offline_20230404;

create table Department (
			DeptNo int not null,
			DeptName char(20),
			Floor int,
			primary key (DeptNo)
			);

Insert Into Department values (1, '����', 8);
Insert Into Department values (2, '��ȹ', 10);
Insert Into Department values (3, '����', 9);
Insert Into Department values (4, '�ѹ�', 7);
			
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
			

Select *
From Department;

Select *
From Employee;

--#1�� �μ��� �ٹ��ϴ� �������� �̸��� �˻��Ͻÿ�.
Select EmpName, Dno AS '1�� �μ�'
From Employee
Where Dno = 1;

--#2�� �����μ��� �ٹ��ϴ� �������� �̸��� �˻��Ͻÿ�.
--#2-1) �������� �̿�

Select EmpName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '����';

--#2-2) ��ø���� �̿�
Select EmpName
From Employee
Where Dno	=(
			Select DeptNo
			From Department
			Where DeptName = '����'
			);

-- #3��. ��� ������ ���Ͽ� ������ȣ, �����̸�, �ٹ��μ����� �˻��Ͻÿ� (��������)
Select EmpNo, EmpName, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo;

Select *
From Department;

Select *
From Employee;


-- #4��. ��â���� �ٹ��ϴ� �μ����� �˻��Ͻÿ�. (�������� / ��ø����)
Select DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '��â��';


Select DeptName
From Department
Where DeptNo	=(
				Select Dno
				From Employee
				Where EmpName = '��â��'
				);

Select *
From Department;

Select *
From Employee;

-- #5��. ������ ������ �̸��� �ٹ��μ����� �˻��Ͻÿ�. (����)
Select EMpName, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND Title = '����';


-- #6��. ���� �Ǵ� ��ȹ�μ��� �ٹ��ϴ� ������ �̸��� �˻��Ͻÿ�. (�������� / ��ø����)
Select EmpName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND (DeptName = '����' OR DeptName = '��ȹ');

Select EmpName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND (DeptName IN('����', '��ȹ'));

Select EmpName
From Employee
Where Dno		In(
				Select DeptNo
				From Department
				Where DeptName IN ('����', '��ȹ')
				);


Select *
From Department;

Select *
From Employee;

-- #7��. ���� �Ǵ� ��ȹ�μ��� �ٹ��ϴ� ������ �̸��� �μ����� �˻��Ͻÿ�. (��������)
Select EmpName, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName In ('����', '��ȹ');


-- #8�� �μ���ȣ (�׷�)�� ��� �޿��� ���Ͻÿ�.
Select Dno, AVG(Salary) AS '�μ��� ��� �޿�'
From Employee
Group By Dno




-- #9�� �μ��� (�׷�)�� ��� �޿��� ���Ͻÿ�.
Select DeptName, AVG(Salary) AS '�μ��� ��� �޿�'
From Department, Employee
Where Department.DeptNo = Employee.Dno
Group By DeptName;


-- #10�� �ڿ��ǰ� ���� �μ��� �ٹ��ϴ� �������� �̸��� �˻��Ͻÿ�. (��ø����)
Select EmpName
From Employee
Where Dno  In(
			Select Dno
			From Employee
			Where EmpName = '�ڿ���'
			);

-- #��â���� ���� ��å�� ������ �̸�, ��å, ������? (��ø����)
Select EMpName, Title, Salary
From Employee
Where Title		=(
				Select Title
				From Employee
				Where EmpName = '����'
				);

-- #�����μ��� �ٹ��ϴ� �������� �̸���? (��ø����)
Select EmpName
From Employee
Where Dno		=(
				Select DeptNo
				From Department
				Where DeptName = '����'
				);

Select *
From Department;

Select *
From Employee;

-- #11�� �ڿ��ǰ� ���� ��å�� �������� �̸��� ��å�� �˻��Ͻÿ�. (��ø����)
Select EmpName, Title
From Employee
Where Title		=(
				Select Title
				From Employee
				Where EmpName = '�ڿ���'
				);

-- #12��. ��� �޿����� ���� �޿��� �޴� �������� �̸��� �޿��� �˻��Ͻÿ�. (��ø����)

Select AVG(Salary) AS '��� �޿�'
From Employee;

Select EmpName, Salary
From Employee
Where Salary		>(
					Select AVG(Salary)
					From Employee
					);


-- #13��. ���� ���� �޿��� ���� ������ �̸�, �޿�, ��å�� �˻��Ͻÿ�. (��ø����)
Select EmpName, Salary, Title
From Employee
Where Salary		=(
					Select MAX(Salary)
					From Employee
					);


-- #
Select DeptName, AVG(Salary) AS '�μ��� ��� ����'
From Employee, Department
Where Dno = DeptNo
Group By DeptName;


-- ������ �������� �ٹ��μ��̸���? (��ø����)

Select DeptName
From Department
Where DeptNo		In(
					Select Dno
					From Employee
					Where Title = '����'
					);

Select *
From Department;

Select *
From Employee;

-- �Ŵ����� ���� ������ �ٹ��μ��̸���/ (��ø����)
Select DeptName
From Department
Where DeptNo	In(
				Select Dno
				From Employee
				Where Manager is null
				);

-- �Ŵ����� ���� ����� ������ �ִ� -> = ���ٴ� In���� ǥ��.


-- ��ȹ�μ��� �ٹ��ϴ� �������� �̸��� �޿���? (��ø����)

Select EmpName, Salary
From Employee
Where Dno			In( 
					Select DeptNo
					From Department
					Where DeptName = '��ȹ'
					);
-- in�� = �� �򰥸��� �׳� �� �� In���� �ع�����.


Select *
From Department;

Select *
From Employee;


-- �ڿ��ǰ� ���� �μ��� �ٹ��ϴ� �������� �̸���? (��ø���θ�)
Select EmpName
From Employee
Where Dno			In(
					Select Dno
					From Employee
					Where EmpName = '�ڿ���'
					);

-- �̼��� ������ ��å�� �ٹ��μ��̸���? (��������)
Select Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '�̼���';

