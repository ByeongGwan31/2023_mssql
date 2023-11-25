create database Company2023_03_21_offline;
use Company2023_03_21_offline;

create table Department (
	DeptNo int not null,
	DeptName char(15),
	Floor int,
	primary key(DeptNo)
);

create table Employee (
	EmpNo int not null,
	EmpName char(15),
	Title char(15),
	Salary int,
	Dno int,
	primary key(EmpNo),
	foreign key(Dno) references Department(DeptNo)
);

Insert Into Department Values(1, '����', 8);
Insert Into Department Values(2, '��ȹ', 10);
Insert Into Department Values(3, '����', 9);
Insert Into Department Values(4, '�ѹ�', 7);
Insert Into Department Values(5, '����', null);

Select *
From Department;

Insert Into Employee Values(2106, '��â��', '�븮', 2500000, 2);
Insert Into Employee Values(3426, '�ڿ���', '����', 3000000, 1);
Insert Into Employee Values(3011, '�̼���', '����', 4000000, 3);
Insert Into Employee Values(1003, '������', '����', 3000000, 2);
Insert Into Employee Values(3427, '����ö', '���', 1500000, 3);
Insert Into Employee Values(1365, '����', '���', 1500000, 1);
Insert Into Employee Values(4377, '�̼���', '����', 5000000, 2);
Insert Into Employee Values(1212, '�̼���', '����', 1000000, null);
Insert Into Employee Values(3901, '�����', '����', 1000000, null);

Select *
From Employee;

-- #1. �����μ��� ���� ��� ������ �˻��Ͻÿ�.
Select *
From Employee
Where Dno = 2;

-- #2. �븮�� �������� �̸��� ��å�� �˻��Ͻÿ�.
Select EmpName, Title
From Employee
Where Title = '�븮';

-- #3. ������ 200���� �̻��� �������� ��� ������ �˻��Ͻÿ�. (�� ������)
Select *
From Employee
Where Salary > 2000000;

-- #3-2. �μ���ȣ�� null�� �������� �̸�, ��å��?
Select EmpName, Title, Dno
From Employee
Where Dno is null;

-- #3-3. Floor ���� nul�� �μ�����?
Select DeptName
From Department
Where Floor is null;

-- #4. ��å�� ����̰� 3�� �μ��� �ٹ��ϴ� �������� �̸��� ��å��?
Select EmpName, Title
From Employee
Where Title = '���' AND Dno = 3;

-- #5. 2�� �Ǵ� 3�� �μ��� �������� �̸���? (OR, IN)
Select EmpName, Dno
From Employee
Where Dno = 2 Or Dno = 3;

Select EmpName, Dno
From Employee
Where Dno in (2,3);

-- #6. 2�� �μ��� �ƴ� �������� �̸��� �μ���ȣ�� �˻��Ͻÿ�.
Select EmpName, Dno
From Employee
Where Dno <> 2;

-- #7. �̼����� ��å�� ������ �˻��Ͻÿ�.
Select Title, Salary
From Employee
Where EmpName = '�̼���'

-- #8. �̾� ���� ���� �������� �̸�, ��å�� �˻��Ͻÿ�. (���ڿ� �Ϻκ� �� : )
Select EmpName, Title
From Employee
Where EmpName Like '��%';

-- #9. �̾� ���� �ƴ� �������� �̸�, ��å�� �˻��Ͻÿ�.
Select EmpName, Title
From Employee
Where EmpName not Like '��%';

-- #10. �μ���ȣ�� �������� �ʾ� null ���� �������� �̸��� ��å��? (null �� �� : )
Select EmpName, Title
From Employee
Where Dno is null;

-- #11. ������ 250���� �̻� 400���� ������ �������� �̸�, ������ �˻��Ͻÿ�. (AND, ����������)
Select EmpName, Salary
From Employee
Where Salary >= 2500000 AND Salary <= 4000000;

-- #11-2. ������ 250���� �̻� 300���� ������ �������� �̸��� ������?
Select EmpName, Salary
From Employee
Where Salary >= 2500000 AND Salary <= 3000000;

-- #�������� ���� <�������� ������ ASC������ default ���̱� ������ ������ �ʴ´�.)
Select EmpName, Salary
From Employee
Where Salary BETWEEN 2500000 AND 3500000
Order by EmpName DESC;

Select EmpName, Salary
From Employee
Where Salary Between 2500000 AND 4000000;

-- #12. 1�� �μ��� �ٹ��ϴ� �������� �̸�, ������ �˻��Ͽ� �̸��� ������������ ������.
Select EmpName, Salary
From Employee
Where Dno = 1
Order By EmpName ASC;

-- #12-2. ������ ������������ ��� ������ ��� ������ �˻��Ͻÿ�.
-- �̰� Ȯ�� �� ��!
Select *
From Employee
Order By Salary ASC;

-- #12-3. ������ �������� �̸�, ��å ������ �μ���ȣ�� ������������ �˻��Ͻÿ�.
Select EmpName, Title, Salary, Dno
From Employee
Where Title = '����'
Order By Dno DESC;

-- #12-4. ��� ������ ������ 10% �λ��� �ݾ��� �˻��Ͻÿ�.
Select Salary*1.1 AS '10%�λ�� ����'
From Employee;

-- #12-5. ��� ������ �˰�ʹ�.
Select AVG(Salary) AS '��� ����'
From Employee;

-- #12-6. �ִ밪�� ã�� 
Select MAX(Salary) AS '�ִ� ����'
From Employee;

Select MIN(Salary) AS '�ּ� ����'
From Employee;

Select SUM(Salary) AS '�� �հ� ����'
From Employee;

--# Count �Լ� ���
Select Count(Distinct Title) AS '�ߺ� ���� ��å�� ��'
From Employee;

Select Count(Dno)
From Employee;
-- null�� �����Ѵ�. 

Select Count(*)
From Employee;
-- ������ �� ����, ������ ������ ���� ���� Ʋ������ ����.

-- ������ ��� ����ΰ�?
Select Count(Title) AS '���������� ��'
From Employee
Where Title = '����';

-- ������ �������� ������ �հ��?
Select Count(*) AS '���������� ��' , SUM(Salary) '������ �հ�'
From Employee
Where Title = '����';

-- ���� �Ǵ� �븮�� ������ ���� ����ΰ�?
Select Count(*) AS '���� �Ǵ� �븮 ������ ��'
From Employee
Where Title in ('����', '�븮');

-- ������
-- Delete 
Select Dno, AVG(Salary) AS '�μ��� ��ձ޿�'
From Employee
Group By Dno;

-- #0.4 - �μ���ȣ�� �ִ� ������?
Select Dno, MAX(Salary) AS '�μ��� �ִ� ����'
From Employee
Group By Dno;

-- #0.5 - �μ���ȣ�� ������ ����?
Select Dno, Count(*) AS '�μ��� ������ ��'
From Employee
Group By Dno;

-- #0.6 - ��å�� ������ ����?
Select Title, Count(*) AS '��å�� ������ ��'
From Employee
Group By Title;

-- #0.7 ������ ����
Select Title, AVG(Salary) AS '�μ��� ��� ����'
From Employee
Group By Title
Having AVG(Salary) >= 3000000
Order By AVG(Salary) DESC;

-- #���� �Լ�
-- AVG(), SUM(), MAX(), MIN(), COUNT()
-- COUNT(��) -> null�� �� count ���� �ʴ´�.
-- ���� ���� ����� Count(*) �ϴ°� ���� ȿ�����̴�.

-- #13. ��� �������� ��� ������ �˻��Ͻÿ�. (�����Լ�)
Select AVG(Salary) AS '��� ����'
From Employee;

-- #14. ȸ���� �������� ��� �� ���ΰ�?
Select Count(*) AS 'ȸ���� ���� ��'
From Employee;

-- #15. ������ �������� ��� �� ���ΰ�?
Select Count(Title) AS '���� ������ ��'
From Employee
Where Title = '����'

--# 16. 2�� �μ��� �ٹ��ϴ� �������� ������ �� �հ�� ���ΰ�?
Select Sum(Salary) AS '������ �� �հ�'
From Employee
Where Dno = 2;

-- #17. ��� �����鿡 ���� �Ҽ� �μ���ȣ�� �׷�ȭ�ϰ� �μ��� ��տ����� �˻��Ͻÿ�. (�׷�ȭ)
Select Dno, AVG(Salary) AS '�μ��� ��� ����'
From Employee
Group By Dno;

-- #18. ��� �����鿡 ���� �Ҽ� �μ���ȣ�� �׷�ȭ�ϰ� �ҼӺμ��� ��տ����� 250���� �̻��� �μ��� ���� �μ���ȣ, �μ��� ��տ����� �˻��Ͻÿ�. (�׷�ȭ : ���Ǹ��� �׷쿡 ���� �����Լ�����)
Select Dno, AVG(Salary) AS '��� ����'
From Employee
Group By Dno
Having AVG(Salary) > 2500000;