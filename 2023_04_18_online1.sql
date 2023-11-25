create database �б������ͺ��̽�;

use �б������ͺ��̽�;

create table �а� (
	�а���ȣ char(10) not null,
	�а��� char(20)
	primary key(�а���ȣ),
	);

Insert Into �а� Values ('D1', '��ǻ�Ͱ���');
Insert Into �а� Values ('D2', '������');

Select *
From �а�;

create table ���� (
	�����ȣ char(20) not null,
	�����̸� char(20),
	primary key (�����ȣ)
	);

Insert Into ���� Values ('CS310', '�����ͺ��̽�');
Insert Into ���� Values ('CS313', '�ü��');
Insert Into ���� Values ('CS345', '�ڷᱸ��');
Insert Into ���� Values ('CS326', '�ڹ�');

Select *
From ����;

create table ���� (
	�й� int not null,
	�����ȣ char(20) not null,
	���� char(10)
	primary key (�й�, �����ȣ),
	foreign key(�����ȣ) references ����(�����ȣ)
	);

Insert Into ���� Values ('11002', 'CS310', 'A0');
Insert Into ���� Values ('11002', 'CS313', 'B+');
Insert Into ���� Values ('24036', 'CS345', 'B0');
Insert Into ���� Values ('30419', 'CS310', 'A+');

Select *
From ����;


create table �л� (
		�й� int not null,
		�̸� char(20),
		�̸��� char(30),
		���� float,
		�а���ȣ char(10) not null,
		primary key (�й�, �а���ȣ),
		foreign key (�а���ȣ) references �а�(�а���ȣ)
		);

Insert Into �л� Values (11002, '��ȫ��', 'lee@naver.com', 4, 'D1');
Insert Into �л� Values (24036, '�����', null, 3.2, 'D2');
Insert Into �л� Values (30419, '�����', 'kim@gmail.com', 2.8, 'D1');

Select *
From �л�;

--

Select *
From �л�;

Select *
From ����;

Select *
From ����;

Select *
From �а�;

-- 

-- #1. ������ 3.0���� 4.0 ������ �л����� �̸��� ������ ������ ������������ �˻��Ͻÿ�.
Select �̸�, ����
From �л�
Where ���� BETWEEN 3.0 AND 4.0
Order By ���� DESC;

-- #2. ��ȫ�� �л��� �Ҽ� �а����� �˻��Ͻÿ�. (��ø / ����)
Select �а���
From �л�, �а�
Where �л�.�а���ȣ = �а�.�а���ȣ AND �̸� = '��ȫ��';

Select �а���
From �а�
Where �а���ȣ		=(
					Select �а���ȣ
					From �л�
					Where �̸� = '��ȫ��'
					);

-- #3. ��ϵ� �л��� ��� �� ������ ���Ͻÿ�.
Select COUNT(*) AS '��ϵ� �л�'
From �л�;

-- #4. D1 �а��� �Ҽ� �л��� ��� �� ������ ���Ͻÿ�.
Select �а���ȣ = 'D1', COUNT(�й�) AS 'D1�а� �Ҽ�'
From �л�
Where �а���ȣ = 'D1';

-- #5. ��ǻ�Ͱ��� �а��� �Ҽ� �л��� ��� �� ������ ���Ͻÿ�.
Select COUNT(*) AS '��ǻ�Ͱ��� �Ҽ� �л� ��'
From �л�, �а�
Where �л�.�а���ȣ = �а�.�а���ȣ AND �а��� = '��ǻ�Ͱ���';

-- #6. �а��� �Ҽ� �л� ���� �а���ȣ���� ���Ͻÿ�.
Select �а���ȣ, COUNT(*) AS '�Ҽ� �л� ��'
From �л�
Group By �а���ȣ;

-- #7. �а��� �Ҽ� �л� ���� �а����� ���Ͻÿ�.
Select �а���, COUNT(*) AS '�Ҽ� �л� ��'
From �л�, �а�
Where �л�.�а���ȣ = �а�.�а���ȣ
Group By �а���

-- #8. ��� �л����� ��� ������ ���Ͻÿ�.
Select AVG(����) AS '�л����� ��� ����'
From �л�;

-- #9. ��� �л����� ��� �������� ���� �л��� �̸���?
Select �̸�
From �л�
Where ����	>(
			Select AVG(����)
			From �л�
			);

-- #10. ���� ���� ������ ���� �л��� �̸��� ������ �˻��Ͻÿ�.
Select �̸�, ����
From �л�
Where ����	=(
			Select MAX(����)
			From �л�
			);

-- #11. �̸����� �Էµ��� ���� �л��� �̸���?
Select �̸�
From �л�
Where �̸��� is null;

-- #12. �达 ���� ���� �л����� �̸���?
Select �̸�
From �л�
Where �̸� Like '��%';

-- #13. ��� �л��� �й�, �̸�, �Ҽ�, �а���, ������ ������ ����+�������� �˻��Ͻÿ�.
Select �й�, �̸�, �а���ȣ, ����
From �л�
Order By ���� DESC;

Select �й�, �̸�, �а���, ����
From �л�, �а�
Where �л�.�а���ȣ = �а�.�а���ȣ
Order By ���� DESC;

-- #14. ������ 3.0���� ���� �л��� �й�, �̸�, �Ҽ�, �а����� �̸��� �����ټ����� ���̽ÿ�.
Select �й�, �̸�, �а���
From �л�, �а�
Where �л�.�а���ȣ = �а�.�а���ȣ AND ���� > 3.0
Order By �̸� ASC;

-- #15. ��ȫ�� �л��� �����ϴ� �����̸��� �˻��Ͻÿ�. (���� / ��ø)
Select �����̸�
From �л�, ����, ����
Where ����.�й� = �л�.�й�
AND ����.�����ȣ = ����.�����ȣ
AND �̸� = '��ȫ��';

Select �����̸�
From ����
Where �����ȣ	In(
				Select �����ȣ
				From ����
				Where �й�		In(
								Select �й�
								From �л�
								Where �̸� = '��ȫ��'
								)
				);



