use ȸ��DB;

select *
from Department;

select *
from Employee;

-- #1. �̾� ���� ���� ������ �̸�, ��å, �ҼӺμ��� �̸���?
Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName Like '��%';

Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND  EmpName Like '��__';

-- # ��â���� �ٹ��ϴ� �μ��̸���? [��ø] 
Select DeptName
From Department
Where DeptNo =(
				Select Dno
				From Employee
				Where EmpName = '��â��'
				);



-- #�����μ��� �ٹ��ϴ� �������� �̸��� ��å��? (��ø ����) :
Select EmpName, Title
From Employee
Where Dno		=(
				Select DeptNo
				From Department
				Where DeptName = '����'
				);


-- # 9���� �ٹ��ϴ� �������� �̸��� �޿�, �ٹ��μ��� �̸���? (��ø���� ����) -> X �Ұ����ϴ�.
-- #[��������] 9���� �ٹ��ϴ� �������� �̸��� �޿���? (��ø���� ����) -> O ����

-- ��ø���Ƿδ� �����̺� �ִ°� �Ұ����ϴ�.
Select EmpName, Salary
From Employee
Where Dno	=(
			Select DeptNo
			From Department
			Where Floor = 9
			);

-- ������ �������� �ٹ��μ��̸���? (��ø����)
Select DeptName
From Department
Where DeptNo	In(
				Select Dno
				From Employee
				Where Title = '����'
				);

-- �Ŵ����� ���� ������ �ٹ��μ��̸���? (��ø����)
Select DeptName
From Department
Where DeptNo	=(
				Select Dno
				From Employee
				Where Manager is null
				);

Select *
From Employee;


-- ��ȹ�μ��� �ٹ��ϴ� �������� �̸��� �޿��� (��ø����)
Select EmpName, Salary
From Employee
Where Dno			=(
					Select DeptNo
					From Department
					Where DeptName = '��ȹ'
					);

-- ���� �Ǵ� ��ȹ�μ��� �ٹ��ϴ� �������� �̸��� ��å��? (��ø����)
Select EmpName, Title
From Employee
Where Dno		In(
				Select DeptNo
				From Department
				Where DeptName = '����' OR DeptName = '��ȹ'
				);

Select EmpName, Title
From Employee
Where Dno		In(
				Select DeptNo
				From Department
				Where DeptName  In ('����', '��ȹ')
				);

-- #��ȹ �μ��� �ٹ��ϴ� �������� �̸��� ��å��? (��������)
Select EmpName, Title, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '��ȹ';

-- #���� �Ǵ� ��ȹ �μ��� �ٹ��ϴ� �������� �̸��� ��å��? (��������)
Select EmpName, Title, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND (DeptName = '��ȹ' OR DeptName = '����');

-- #���� �Ǵ� ��ȹ �μ��� �ٹ��ϴ� �������� �̸��� ��å��? (��������)
Select EmpName, Title, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName In ('����', '��ȹ');


-- #�ڿ��ǰ� ���� �μ��� �ٹ��ϴ� �������� �̸���?
Select EmpName
From Employee
Where Dno = 1;
-- �� ����� Ʋ�ȴ�.

-- #�ڿ��ǰ� ���� �μ��� �ٹ��ϴ� �������� �̸���?
Select EmpName
From Employee
Where Dno  In (
			Select Dno
			From Employee
			Where EmpName = '�ڿ���'
			);

-- #�ڿ��ǰ� ���� ��å�� �������� �̸��� ��å��?
Select EmpName, Title
From Employee
Where Title  =(
		Select Title
		From Employee
		Where EmpName = '�ڿ���'
		);

-- #�������� ��ձ޿���?
Select AVG(Salary) AS '�������� ��� �޿�'
From Employee;

-- #������ ��ձ޿����� ���� �޿��� �޴� �������� �̸�. ��å, ������? (��ø���θ�)
Select Empname, Title, Salary
From Employee
Where Salary		>(
					Select AVG(Salary)
					From Employee
					);

Select *
From Department;

Select Empname, Title, Salary
From Employee
Where Salary		>(
					Select AVG(Salary)
					From Employee
					);


Select *
From Employee;

-- #�̼��� ������ ��å�� �ٹ��μ� �̸���? (����)
Select Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '�̼���';

-- #�̼��� ������ ���� �μ��� �ٹ��ϴ� ������ �̸��� �μ���ȣ��? (��ø����)
Select EmpName, Dno
From Employee
Where Dno	=(
			Select Dno
			From Employee
			Where EmpName = '�̼���'
			);