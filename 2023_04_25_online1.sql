create database MyCompany;

use MyCompany;

create table Department (
		DeptNo int not null,
		DeptName char(10),
		Floor int,
		primary key(DeptNo)
		);

insert into Department values(1, '����', 8);
insert into Department values(2, '��ȹ', 10);
insert into Department values(3, '����', 9);
insert into Department values(4, '�ѹ�', 7);

Select *
From Department;


-- Employee ���̺��� ���Ἲ ���������� �ǽ��ϱ� ���ؼ� ���� �߰��� �ڵ��̴�.
create table Employee (
		EmpNo int not null,
		EmpName char(10) unique,
		-- unique : ��Ư�ϴ�. EmpName ���� ���� Ʋ���� �� ���� unique��� �ص� �ȴ�.
		Title char(10) default '���',
		-- default : ���� ȸ���� ��� ���� ���� ��å�� ����̱� ������ default ���� ����Ѵ�.
		Manager int,
		Salary int check (Salary < 6000000),
		-- check(  ) : ���̿� �ִ� ���� ������ 600�������� �۴�. -> �װ��� üũ�ϰڴ�!
		Dno int check (Dno in (1,2,3,4,5,6) ) default 1,
		-- check(  ) : ���̿� �ִ� 1 - 6����
		-- default 1 : 1�� �μ��� default ������ �ϰڴ�.
		primary key (EmpNo),
		foreign key (Manager) references Employee(EmpNo),
		foreign key (Dno) references Department (DeptNo) on Delete Set Default on Update Cascade
		-- on Delete : dno ���� DeptNo�� �����ϰ��ִ�.
		-- DeptNo�� ������ �Ǹ� �����ϰ� �ִ� // Department ���� DeptNo�� ������ �Ǹ� -> Employee���� �� ���̺��� ������ ��ġ �� ��� -> 
		-- default�� �����Ѵ�. -> Dno�� default�� 1�̴�. -> 1�� �ٲ��.
		-- Update Cascade : ���� �μ� ��ȣ (DeptNo) �� �ٲ���� �ϸ� -> Dno ������ ����ȴ�. (CasCade) // ���������� ����ȴ�.
		);

insert into Employee values(4377, '�̼���', '����', null, 5000000, 2);
insert into Employee values(3426, '�ڿ���', '����', 4377, 3000000, 1);
insert into Employee values(3011, '�̼���', '����', 4377, 4000000, 3);
insert into Employee values(1003, '������', '����', 4377, 3000000, 2);
insert into Employee values(2106, '��â��', '�븮', 1003, 2500000, 2);
insert into Employee values(1365, '����', '���', 3426, 1500000, 1);
insert into Employee values(3427, '����ö', '���', 3011, 1500000, 3);

Select *
From Employee;

-- ���� (SQL : DDL, DML, DCL)

-- #1. ���ο� ������ ���� ���� (1000, 'ȫ�浿', default, 1003, 2500000, 2) �� �Է� �� Ȯ��
insert into Employee values(1000, 'ȫ�浿', default, 1003, 2500000, 2);
-- check(Salary < 600000) �� ���� ������ �������� ���� 

Select *
From Employee;

-- #2. Employee�� Phone ��Ʈ����Ʈ�� �߰��Ͻÿ�.
alter table Employee add Phone char(20);

Select *
From Employee;

	-- #2-1. �̼��� ������ ��ȭ��ȣ�� ' 010-123-4567'�� �����Ͻÿ�
	Update Employee
	Set Phone = '010-123-4567'
	Where EmpName = '�̼���';

Select *
From Employee;

	-- #2-2. ȫ�浿 ���� ���� ����
	Delete
	From Employee
	Where EmpName = 'ȫ�浿';

	Select *
	From Employee;

-- #3. ���ο� ���� '��â��' �� ���� ������ �Է��Ͻÿ�.
Insert into Employee values(5000, '��â��', default, 3011, 2000000, 1, '010-103-4567');

Select *
From Employee;

-- #4. Department���� 3�� �μ���ȣ�� 10���� �����ϰ� Ȯ�� (�ȵǴ� ������?)
Update Department
Set DeptNo = 10
Where DeptNo = 3
---- check(  ) : ���̿� �ִ� 1 - 6����
		-- default 1 : 1�� �μ��� default ������ �ϰڴ� 1-6���� �߿� �����Ͽ���.


-- #5. Department���� 2�� �μ���ȣ�� 6���� �����ϰ� Ȯ�� (������)
Update Department
Set DeptNo = 6
Where DeptNo = 2;

Select *
From Department;

Select *
From Employee;


-- #6. Department���� 3�� �μ������� �����Ͻÿ�.
Delete
From Department
Where DeptNo = 3;

Select *
From Department;


-- #7. Employee�� Phone ��Ʈ����Ʈ�� �����Ͻÿ�. (drop column)
alter table Employee drop column Phone;

Select *
From Employee;

-- #8. Department �����Ͻÿ�.
drop table Department; 

drop table Employee;