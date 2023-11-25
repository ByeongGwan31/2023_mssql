create database DBOTT0530;

use DBOTT0530;

create table �̿�� (
	�̿�ǹ�ȣ int not null,
	���� char(20),
	�̿�ݾ� int,
	�̿�Ǹ� char(20)
	primary key (�̿�ǹ�ȣ)
	)

insert into �̿�� values (40124, '�Ϲݰ���', 7800, '�Ϲ�');
insert into �̿�� values (50302, '�Ŵް���', 7800, '�Ϲ�');
insert into �̿�� values (34583, '�Ϲݰ���', 12800, '�����̾�');
insert into �̿�� values (39821, '�Ŵް���', 5400, '������');
insert into �̿�� values (91023, '�Ŵް���', 12800, '�����̾�');

Select *
From �̿��;

create table �� (
	��ID int not null,
	��й�ȣ char(20),
	�̸��� char(20),
	�̿�ǹ�ȣ int not null,
	primary key (��ID),
	foreign key (�̿�ǹ�ȣ) references �̿��(�̿�ǹ�ȣ)
	)

insert into �� values (20191061, 'xptmxm123', '2000bk@naver.com', 50302);
insert into �� values (20211867, 'wngns123', 'wngns@naver.com', 39821);
insert into �� values (20201302, 'wnstj567', 'wnstj@naver.com', 91023);
insert into �� values (20228472, 'wjdghks012', 'wjdghks@gmail.com', 50302);

Select *
From ��;

create table ������ (
	��������ȣ int not null,
	�������� char(20),
	���۳⵵ int,
	���Աݾ� int,
	������� int,
	primary key (��������ȣ)
	)

insert into ������ values (1, '�ܿ�ձ�', 2013, 197835, 1);
insert into ������ values (2, '���̽��丮4', 2019, 41623682, 1);
insert into ������ values (3, 'ī����', 2022, 9302911, 18);
insert into ������ values (4, '���������갶����2', 2017, 401230, 12);
insert into ������ values (5, '����2', 2022, 6938, 15);

Select *
From ������;


create table ���� (
	��ID int not null,
	��������ȣ int not null,
	��¥ int,
	����Ⱓ char(20),
	primary key (��ID, ��������ȣ),
	foreign key (��ID) references ��(��ID),
	foreign key (��������ȣ) references ������(��������ȣ)
	)

Select *
From ��;

Select *
From ������;

Select *
From ����;

insert into ���� values (20191061, 3, 2022, 2);
insert into ���� values (20201302, 1, 2015, 1);
insert into ���� values (20211934, 4, 2021, 3);
insert into ���� values (20228472, 5, 2023, 1);
insert into ���� values (20211867, 2, 2021, 4);

Select *
From ����;

create table �� (
	��ID int not null,
	��������ȣ int not null,
	������ char(30),
	���� int,
	primary key (��ID, ��������ȣ),
	foreign key (��ID) references ��(��ID),
	foreign key (��������ȣ) references ������(��������ȣ)
	)

Select *
From ��;

Select *
From ������;

Select *
From ����;

insert into �� values (20191061, 3, '�ʹ� ����־����ϴ�.', 9);
insert into �� values (20201302, 1, '�����̾����ϴ�. ���� ��Ⱦ��', 10);
insert into �� values (20211867, 2, '������ϴ�. ���ۿ�..', 8);
insert into �� values (20211934, 4, '�� ���� �ϰ� ���� ������ ¯¯', 10);
insert into �� values (20228472, 5, '�������� ���ο��׿�..', 4);

Select *
From ��;

-- �̿��, ��, ������, ����, ��

Select *
From �̿��;
Select *
From ��;
Select *
From ������;
Select *
From ����;
Select *
From ��;

-- #1. �������� �̿���� ����ϴ� ȸ���� ��ID�� ��Ÿ���ÿ�.

Select ��ID
From ��
Where �̿�ǹ�ȣ =(
			Select �̿�ǹ�ȣ
			From �̿��
			Where �̿�Ǹ� = '������'
			);

-- #2. ī������ ���������� ������ ����� ��ID�� �̸����� ��Ÿ���ÿ�.

Select ��ID, �̸���
From ��
Where ��ID =(
			Select ��ID
			From ����
			Where ��������ȣ =(
							Select ��������ȣ
							From ������
							Where �������� = 'ī����'
							)
			);

Select *
From �̿��;
Select *
From ��;
Select *
From ������;
Select *
From ����;
Select *
From ��;