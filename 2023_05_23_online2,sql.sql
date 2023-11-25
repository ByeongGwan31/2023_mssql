create database A���θ�_������;

use A���θ�_������;

create table �� (
	��ID char(10) not null,
	���� char(10),
	��ȭ��ȣ char(20),
	primary key (��ID)
	);

insert into �� values ('c001', '�̼���', '010-1234-5678');
insert into �� values ('c002', '�赵��', '010-4321-9876');
insert into �� values ('c003', '������', '010-7531-2819');
insert into �� values ('c005', '������', '010-9431-8370');


create table ����ó (
	����ó��ȣ int not null,
	����ó�� char(10),
	����ó char(20),
	primary key (����ó��ȣ)
	);

insert into ����ó values (111, '������', '031-123-456');
insert into ����ó values (222, '��������', '02-1234-5678');
insert into ����ó values (333, '��ī�ݶ�', '02-333-5434');
insert into ����ó values (4444, '���׷�', '041-1111-2345');
insert into ����ó values (5555, '���', '02-2321-3412');

create table ������� (
	���ID char(20) not null,
	�Ⱓ char(40),
	���� char(20),
	primary key(���ID)
	);

insert into ������� values ('H0', '20190525-20200525', '�ڸ���');
insert into ������� values ('H1', '20200531-20210531', '����');
insert into ������� values ('H2', '20210125-20220718', '����');
insert into ������� values ('H4', '20230515-20230523', '1�ֳ�');
insert into ������� values ('H5', '20220501-20220601', '�̸�Ʈ���');


create table ��ǰ (
	��ǰ��ȣ int not null,
	��ǰ�� char(10),
	�ܰ� int,
	���� int,
	����ó��ȣ int,
	���ID char(20),
	������ real,
	primary key (��ǰ��ȣ),
	foreign key (����ó��ȣ) references ����ó(����ó��ȣ),
	foreign key (���ID) references �������(���ID)
	);

insert into ��ǰ values (1234, '��������', 3000, 200, 111, 'H0', 0.5);
insert into ��ǰ values (5678, 'Ȩ����', 2500, 400, 222, 'H1', 0.8);
insert into ��ǰ values (4542, '����Ĩ', 1500, 300, 111, 'H1', 0.4);
insert into ��ǰ values (8785, '��ī�ݶ�', 1700, 350, 333, 'H2', 0.5);
insert into ��ǰ values (8129, '���ް�3', 70000, 200, 4444, null, 0.2);

create table ���� (
	��ID char(10) not null,
	��ǰ��ȣ int not null,
	��¥ char(20),
	���ż��� int,
	primary key(��ID, ��ǰ��ȣ),
	foreign key(��ID) references ��(��ID),
	foreign key(��ǰ��ȣ) references ��ǰ(��ǰ��ȣ)
	);

insert into ���� values ('c001', 1234, '23-05-22', 10);
insert into ���� values ('c002', 4542, '23-05-23', 20);
insert into ���� values ('c003', 5678, null, 5);
insert into ���� values ('c004', 8129, '23-05-20', 20);
insert into ���� values ('c005', 8785, '22-05-23', 30);

select *
from ��;
select *
from ��ǰ;
select *
from ����ó;
select *
from ����;
select *
from �������;


-- #1. '��������'�� ������ ���� ����� ��ȭ��ȣ�� �˻��Ͻÿ�.
Select ����, ��ȭ��ȣ
From ��, ����, ��ǰ
Where ��.��ID = ����.��ID
AND ����.��ǰ��ȣ = ��ǰ.��ǰ��ȣ
AND ��ǰ�� = '��������';

Select ����, ��ȭ��ȣ
From ��
Where ��ID IN (
			 Select ��ID
			 From ����
			 Where ��ǰ��ȣ = (
							Select ��ǰ��ȣ
							From ��ǰ
							Where ��ǰ�� = '��������'
							)
				);

-- #2. '�ڸ���' ��翡 ������ ��ǰ�� ��ǰ��� �ܰ� (���� ����), ���� �� ������ �˻��Ͻÿ�.
Select ��ǰ��, �ܰ�, �ܰ� * ������ AS '���ε� ����'
From ��ǰ, �������
Where ��ǰ.���ID = �������.���ID
AND ���� = '�ڸ���';

-- #3. '������'���� �����ϴ� ��ǰ���� �˻��Ͻÿ�.
Select ��ǰ��
From ��ǰ, ����ó
Where ��ǰ.����ó��ȣ = ����ó.����ó��ȣ
AND ����ó�� = '������';


-- #4. �������� ������ ���� SQL�� �ۼ��ϼ���. (�� �� ���̺� �����͸� 5���� �Է��ؾ��Ѵ�.)

-- #�������� 0.5���� ū ��ǰ�� �˻��Ͻÿ�.
Select ��ǰ��ȣ, ��ǰ��, �ܰ�, ����, ������
From ��ǰ
Where ������ > 0.5
AND ����ó��ȣ IN (
				Select ����ó��ȣ
				From ����ó
				)
				AND ���ID IN (
				Select ���ID
				From �������
		);

-- #5. �������� ������ ���� SQL�� �ۼ��ϼ���.


-- # ���� ���� ��ǰ�� ������ ����� ��ID, ����, �� ���ż����� ��Ÿ���ÿ�.
Select ����.��ID, ����, ���ż��� AS �ѱ��ż���
From ����, ��
Where ����.��ID = ��.��ID
AND ����.���ż��� =(
				Select MAX(���ż���)
				From ����
				);