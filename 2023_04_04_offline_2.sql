create database ���θ�;
use ���θ�;

create table �� (
			����ȣ char(20) not null,
			���� char(20),
			�ּ� char(20)
			primary key(����ȣ)
			);

Insert Into �� values('C100', '�����', '���Ｍ�ʱ�');
Insert Into �� values('C200', '��⿵', null);
Insert Into �� values('C300', '���ֿ�', '�������α�');

Select *
From ��;

create table ��ǰ (
			��ǰ��ȣ char(20) not null,
			��ǰ�� char(20),
			�ܰ� int
			primary key (��ǰ��ȣ)
			);

Insert Into ��ǰ values('p_001', '���콺', 20000);
Insert Into ��ǰ values('p_002', 'Ű����', 30000);
Insert Into ��ǰ values('p_003', '�����', 300000);

Select *
From ��ǰ;


create table �ֹ� (
			��ID char(20) not null,
			��ǰID char(20) not null,
			�ֹ����� int,
			primary key (��ID, ��ǰID),
			foreign key(��ID) references ��(����ȣ),
			foreign key(��ǰID) references ��ǰ(��ǰ��ȣ)
			);

Insert Into �ֹ� values('C100', 'p_001', 10);
Insert Into �ֹ� values('C100', 'p_003', 6);
Insert Into �ֹ� values('C300', 'p_002', 1);
Insert Into �ֹ� values('C200', 'p_001', 20);

Select *
From ��;

Select *
From ��ǰ;

Select *
From �ֹ�;

--#1. ���� �ۼ�

--#1. ����� ���� �ֹ��� ��ǰ ID�� �ֹ� ������ �˻��Ͻÿ�. (�������� / ��ø����)

Select ��ǰID, �ֹ�����
From ��, �ֹ�
Where ��.����ȣ = �ֹ�.��ID   AND (���� = '�����');

Select ��ǰID, �ֹ�����
From �ֹ�
Where ��ID		=(
					Select ����ȣ
					From ��
					Where ���� = '�����'
					);

-- #2. ��ϵ� ���� ��� �� ������ ���Ͻÿ�.
Select COUNT(����ȣ) AS '��ϵ� ��'
From ��;


--#3. ���θ��� �� �ֹ� ������ ���Ͻÿ�.
Select SUM(�ֹ�����) AS '�� �ֹ�����'
From �ֹ�;


--#4. ��ǰ ID �׷캰 �� �ֹ������� ���Ͻÿ�.
Select SUM(�ֹ�����) AS 'ID �׷캰 �� �ֹ�����'
From �ֹ�
Group By ��ǰID;

--#5. ��ǰ�� ��մܰ��� ���Ͻÿ�.
Select AVG(�ܰ�) AS '��ǰ�� ��մܰ�'
From ��ǰ;

--#6. �� �ֹ��� ���Ͽ� �ֹ������� 5~10�� ��ǰ���� ���Ͽ� �ֹ������� �������� �˻��Ͻÿ�.
Select �ֹ�����
From �ֹ�
Where �ֹ����� BETWEEN 5 AND 10
Order by �ֹ����� DESC;

--#7. ���￡ �����ϴ� ���� �̸��� ������������ �˻��Ͻÿ�.
Select ����
From ��
Where �ּ� Like '����%'
Order by ���� ASC;

-- #8. �ּҰ� �Էµ��� ���� ���� �̸���?
Select ����
From ��
Where �ּ� is null;

-- #9. Ű���� �Ǵ� ����͸� �ֹ��� �� ID��?

Select ��ID
From �ֹ�
Where ��ǰID		In(
					Select ��ǰ��ȣ
					From ��ǰ
					-- Where ��ǰ�� IN ('Ű����', '�����')
					Where ��ǰ�� = 'Ű����' OR ��ǰ�� = '�����'
					);

-- #10. Ű���� �Ǵ� ����͸� �ֹ��� ������?
Select ����
From ��
Where ����ȣ	In(
				Select ��ID
				From �ֹ�
				Where ��ǰID	In(
								Select ��ǰ��ȣ
								From ��ǰ
								Where (��ǰ�� = 'Ű����' OR ��ǰ�� = '�����')
								)
				);

--#11. ����� ���� �ֹ��� ��ǰ���� �˻��Ͻÿ�. (���� / ��ø)

Select ��ǰ��
From ��ǰ, ��, �ֹ�
Where ��ǰ.��ǰ��ȣ = ��.����ȣ,  AND ���� = '�����';

Select ��ǰ��
From ��ǰ
Where ��ǰ��ȣ		In(
					Select ��ǰID
					From �ֹ�
					Where ��ID	In(
									Select ����ȣ
									From ��
									Where ���� = '�����'
									)
					);
