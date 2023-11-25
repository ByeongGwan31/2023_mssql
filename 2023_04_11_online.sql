create database TESTCompany;

use TESTCompany;

create table Department (
	DeptNo int not null,
	DeptName char (10),
	Floor int,
	primary key (DeptNo)
);

Insert Into Department Values (1, '����', 8);

Select *
From Department;

-- #1. 8���� ��ġ�� �μ� �̸���?
Select DeptName
From Department
Where Floor = 8;


Insert Into Department Values (null, '��ȹ', 10);
-- �⺻Ű ���� null�� �ȵȴ� -> �⺻Ű�� ����Ƽ���Ἲ ��������		(�⺻Ű�� ����Ƽ���Ἲ ��������)

Insert Into Department Values (1, '��ȹ', 10);
-- Ű �������� -> �⺻Ű ��Ʈ����Ʈ�� �ߺ��� ���� �����ؼ��� �ȵȴ�.	(Ű ��������)

Insert Into Department Values ('two', '��ȹ', 10);
-- �μ���ȣ��� �ϴ� ���� int �����̱� ������ char �δ� �Էµ��� �ʴ´�. (������ ��������)