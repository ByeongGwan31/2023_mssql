create database ��������0613;

use ��������0613;

create table �μ� (
	�μ���ȣ int not null,
	���� char(30),
	primary key(�μ���ȣ)
	);

create table ���� (
	������ȣ int not null,
	�̸� char(10),
	����ó int,
	���� char(5),
	�μ���ȣ int not null,
	primary key(������ȣ),
	foreign key(�μ���ȣ) references �μ� (�μ���ȣ)
	);

create table ������Ʈ (
	������Ʈ��ȣ int not null,
	������Ʈ�� char(20),
	���� int,
	primary key (������Ʈ��ȣ)
	);

create table ���ϴ� (
	���� char(30),
	�Ⱓ������ char(30),
	������ȣ int not null,
	������Ʈ��ȣ int not null,
	primary key (������ȣ, ������Ʈ��ȣ),
	foreign key (������ȣ) references ����(������ȣ),
	foreign key (������Ʈ��ȣ) references ������Ʈ(������Ʈ��ȣ),
	);

Insert Into �μ� values (1, '�����');
Insert Into �μ� values (2, '�����');
Insert Into �μ� values (3, '�ѹ���');
Insert Into �μ� values (4, '������');
Insert Into �μ� values (5, '���ź�');
Insert Into �μ� values (6, '�λ��');
Insert Into �μ� values (7, '���ߺ�');

Select *
From �μ�;

Insert Into ���� values (20191061, '������', 01075312819, '��', 7);
Insert Into ���� values (20211867, '������', 01094318370, '��', 4);
Insert Into ���� values (20202934, '�����', 01039492013, '��', 5);
Insert Into ���� values (20301923, '������', 01032041312, '��', 3);
Insert Into ���� values (20205912, '������', 01095745704, '��', 2);
Insert Into ���� values (20208374, '�Ӹ���', 01062496398, '��', 1);

Select *
From ����;

Insert Into ������Ʈ values (10, '���', 8000);
Insert Into ������Ʈ values (11, '��������', 6000);
Insert Into ������Ʈ values (12, '¥�İ�Ƽ', 5000);
Insert Into ������Ʈ values (13, '�ø��', 6500);
Insert Into ������Ʈ values (14, '������', 7500);

Select *
From ������Ʈ;

Insert Into ���ϴ� values ('������', '�ϸ�', 20191061, 10);



create view ��������
as select �̸�, ����ó
	from ����
	where ���� = '��'

Select *
From ��������;

create view ��������
as select �̸�, ����, ����ó
	from ����, �μ�
	where ����.������ȣ = �μ�.�μ���ȣ and ���� = '�����'

Select *
From ��������;