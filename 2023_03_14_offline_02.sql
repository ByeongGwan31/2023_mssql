create database Company������;

use Company������;

create table Department (
		DeptNo int not null,
		DeptName char(10),
		Floor int,
		primary key(DeptNo)
);

Insert into Department values (1, '����', 8);
Insert Into Department values (2, '��ȹ', 10);
Insert Into Department values (3, '����', 9);
Insert Into Department values (4, '�ѹ�', 7);

Select *
From Department
Where DeptName = '����';

Select DeptName
From Department;

Select DeptName, Floor
From Department
Where Floor = 8;

create table Employee (
		EmpNo int not null,
		EmpName char(10),
		Title char (10),
		Salary int,
		Dno int,
		primary key(EmpNo),
		foreign key(Dno) references Department(DeptNo)
);

Insert Into Employee values (2106, '��â��', '�븮', 2500000, 2);
Insert Into Employee values (3426, '�ڿ���', '����', 3000000, 1);
Insert Into Employee values (3011, '�̼���', '����', 4000000, 3);
Insert Into Employee values (1003, '������', '����', 3000000, 2);
Insert Into Employee values (3427, '����ö', '���', 1500000, 3);
Insert Into Employee values (1365, '����', '���', 1500000, 1);
Insert Into Employee values (4377, '�̼���', '����', 5000000, 2);

Select *
From Employee;

Select EmpName, Title
From Employee;

Select EmpName, Title, Salary
From Employee
Where Title = '����';


/* #1. ��â���� ��� ������ �˻��Ͻÿ�. */

Select *
From Employee
Where EmpName = '��â��';

/* #2. ��â���� ��å�� �˻��Ͻÿ�. */
Select Title
From Employee
Where EmpName = '��â��';

/* #3. ���� �Ǵ� �븮���������� �̸��� ��å�� �˻��Ͻÿ�. */
Select EmpName, Title
From Employee
Where Title = '����' OR Title = '�븮';


/* #1. ������ �������� ��� ������ �˻��Ͻÿ�. */
Select *
From Employee
Where Title = '����';

/* #2. ������ 300���� �̻��� �������� ��� ������ �˻��Ͻÿ�. (�� ������ : */

Select *
From Employee
Where Salary >= 3000000;

/* #3. �����μ��� ���� ��� ������ �˻��Ͻÿ�. */

Select *
From Department
Where DeptName = '����';


/* #4. 8���� ��ġ�� �μ�����? */

Select DeptName
From Department
Where Floor = 8;

/* #5. �����̸� 1�� �μ��� �ٹ��ϴ� �������� �̸���? */

Select EmpName
From Employee
Where Title = '����' AND Dno = 1;

/* #6. 2�� �Ǵ� 3�� �μ��� ������ �̸���? */

Select EmpName
From Employee
Where Dno = 2 OR Dno = 3;

/* #7. 2�� �μ��� �ƴ� �������� �̸��� �μ���ȣ�� �˻��Ͻÿ�. */

Select EmpName, Dno
From Employee
Where Dno <> 2

/* #8. �̼����� ��å�� ������ �˻��Ͻÿ�. */

Select Title, Salary
From Employee
Where EmpName = '�̼���';

/* #���� �����Ǵ� ��ȹ�μ��� ��� ������ �˻��Ͻÿ�. */
Select *
From Department
Where DeptName = '����' OR DeptName = '��ȹ';
-- Where DeptName In ('����', '��ȹ);

/* #���� */

/* #9. �̾� ���� ���� �������� �̸�, ��å�� �˻��Ͻÿ�. (���ڿ� �Ϻκ� �� :    ���ϵ� ���� : like ����%�� */

Select EmpName, Title
From Employee
Where EmpName Like '��%';

/* #11. �μ���ȣ 1, 2, 3�� �μ��� ���� �������� �̸�, ��å�� �˻��Ͻÿ�. (OR, IN)*/

Select EmpName, Title
From Employee
Where Dno in (1, 2, 3);

Select EmpName, Title
From Employee
Where Dno = 1 OR Dno = 2 Or Dno = 3;

/* #12. ������ 250���� �̻� 400���� ������ �������� �̸�, ������ �˻��Ͻÿ�. (And, ����������) */

Select EmpName, Salary
From Employee
Where Salary >= 2500000 AND Salary <= 4000000;

/* #13. 1�� �μ��� �ٹ��ϴ� �������� �̸�, ������ �˻��Ͽ� �̸��� ������������ ������. ( ���� : �������� ~      �������� ~) */

Select EmpName, Salary
From Employee
Where Dno = '1'
Order By EmpName Desc;

/* #14. ��� �������� ��� ������ �˻��Ͻÿ�.    ( ���� �Լ� :     ) */
Select Avg(Salary)
From Employee;