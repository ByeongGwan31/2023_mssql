create database ���۽����;

use ���۽����;

create table ������ (
	������ID int not null,
	�̸� char(10),
	����ó char(20),
	������ char(20),
	primary key(������ID)
	);

create table ���� (
	���ù�ȣ int not null,
	�帣 char(10),
	���ø� char(20),
	���� float,
	�뷮MB float,
	��� int,
	������ID int not null,
	�� int,
	�� int,
	�� int,
	primary key (���ù�ȣ),
	foreign key (������ID) references ������,
	);

create table ����� (
	�����ID int not null,
	�̸� int,
	����ó char(20),
	�� int,
	�� int,
	�� int,
	primary key (�����ID)
	);

create table ���� (
	�����ID int not null,
	���ù�ȣ int not null,
	���� float,
	���� char(30),
	foreign key (�����ID) references �����,
	foreign key (���ù�ȣ) references ����,
	);

create table ���� (
	�����ID int not null,
	���ù�ȣ int not null,
	�����ݾ� int,
	������� char(30),
	foreign key (�����ID) references �����,
	foreign key (���ù�ȣ) references ����,
	);

Insert into ������ Values (1001, '������', '010-7531-2819', '����� ���α�');
Insert into ������ Values (1002, 'ȫ�浿', '010-1234-5678', '����� ������');
Insert into ������ Values (1003, '������', '010-9431-8370', '��⵵ ���ý�');

Select *
From ������;

Insert into ���� Values (4701, '����ֹ���', '����� ����', 1.0, 102.5, 1, 1001, 2023, 5, 16);
Insert into ���� Values (6934, '�޽�����', '�鼮��', 1.0, 403.2, 1, 1002, 2021, 5, 16);
Insert into ���� Values (3942, '�Ҽȹ̵��', '���̹�����', 1.0, 850.4, 1, 1003, 2018, 8, 15);

Select *
From ����;
