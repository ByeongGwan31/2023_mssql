create database ���������θ�;

use ���������θ�;

create table �� (
		����ȣ char(20) not null,
		���� char(20),
		�ּ� char(20),
		primary key (����ȣ)
		);

Insert Into �� Values ('C100', '�����', '���Ｍ�ʱ�');
Insert Into �� Values ('C200', '��⿵', null);
Insert Into �� Values ('C300', '���ֿ�', '�������α�');

Select *
From ��;

create table ������ (
		ȸ���ȣ char(20) not null,
		ȸ��� char(20),
		����� int,
		primary key(ȸ���ȣ)
		);

Insert Into ������ Values ('A01', '�뼺���', 20000);
Insert Into ������ Values ('A02', '������ǻ��', 10000);

Select *
From ������;

create table ��ǰ (
		��ǰ��ȣ char(20) not null,
		��ǰ�� char(20),
		�ܰ� int,
		������ID char(20) not null
		primary key (��ǰ��ȣ),
		foreign key (������ID) references ������(ȸ���ȣ)
		);

Insert Into ��ǰ Values ('p_001', '���콺', 20000, 'A01');
Insert Into ��ǰ Values ('p_002', 'Ű����', 30000, 'A01');
Insert Into ��ǰ Values ('p_003', '�����', 300000, 'A02');

Select *
From ��ǰ;

create table �ֹ� (
		��ID char(20) not null,
		��ǰID char(20) not null,
		�ֹ����� int,
		primary key(��ID, ��ǰID),
		foreign key(��ID) references ��(����ȣ),
		foreign key(��ǰID) references ��ǰ(��ǰ��ȣ)
	);

Insert Into �ֹ� Values ('C100', 'p_001', 10);
Insert Into �ֹ� Values ('C100', 'p_003', 6);
Insert Into �ֹ� Values ('C300', 'p_002', 1);
Insert Into �ֹ� Values ('C200', 'p_001', 20);

Select *
From �ֹ�;

Select *
From ��;

Select *
From ��ǰ;

Select *
From ������;

Select *
From �ֹ�;

-- #1. ����� ���� �ֹ��� ��ǰ ID �� �ֹ������� �˻��Ͻÿ� .(���� / ��ø)
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


-- #3. ���θ��� �� �ֹ� ������ ���Ͻÿ�.
Select SUM(�ֹ�����) AS '�� �ֹ�����'
From �ֹ�;


-- #4. ��ǰ ID �׷캰 �� �ֹ������� ���Ͻÿ�.
Select ��ǰID, COUNT(�ֹ�����) AS '��ǰ ID �ֹ�����'
From �ֹ�
Group By ��ǰID;


-- #5. ��ǰ�� ��մܰ��� ���Ͻÿ�.
Select AVG(�ܰ�) AS '��ǰ�� ��մܰ�'
From ��ǰ;

-- #6. �� �ֹ��� ���Ͽ� �ֹ������� 5~10�� ��ǰ���� ���ϰ� �ֹ������� �������� �˻��Ͻÿ�.
Select �ֹ�����
From �ֹ�
Where �ֹ����� BETWEEN 5 AND 10
Order By �ֹ����� DESC;

-- #7. ���￡ �����ϴ� ���� �̸��� ������������ �˻��Ͻÿ�.
Select ����
From ��
Where �ּ� Like '����%'
Order By ���� ASC;

-- #8. �ּҰ� �Էµ��� ���� ���� �̸���?
Select ���� AS '�ּ� �Է� X'
From ��
Where �ּ� is null;


-- #9. Ű���� �Ǵ� ����͸� �ֹ��� �� ID��?
Select ��ID
From �ֹ�
Where ��ǰID			IN(
						Select ��ǰ��ȣ
						From ��ǰ
						Where ��ǰ�� = 'Ű����' OR ��ǰ�� = '�����'
						);

-- #10. Ű���� �Ǵ� ����͸� �ֹ��� ������?

Select ����
From ��, �ֹ�, ��ǰ
Where ��.����ȣ = �ֹ�.��ID 
AND �ֹ�.��ǰID = ��ǰ.��ǰ��ȣ
AND (��ǰ�� = 'Ű����' OR ��ǰ�� = '�����');

-- #10. Ű���� �Ǵ� ����͸� �ֹ��� ������? (��ø)
Select ����
From ��
Where ����ȣ	In(
				Select ��ID
				From �ֹ�
				Where ��ǰID		In(
								Select ��ǰ��ȣ
								From ��ǰ
								Where ��ǰ�� = 'Ű����' OR ��ǰ�� = '�����'
									)
				);



-- #11. ����� ���� �ֹ��� ��ǰ���� �˻��Ͻÿ�. (���� / ��ø)

Select ��ǰ��
From ��, �ֹ�, ��ǰ
Where ��.����ȣ = �ֹ�.��ID
AND ��ǰ.��ǰ��ȣ = �ֹ�.��ǰID
AND ���� = '�����';

Select ��ǰ��
From ��ǰ
Where ��ǰ��ȣ		In(
					Select ����ȣ
					From ��
					Where ���� = '�����'
					);

-- #12. ����͸� �ֹ��� ���� �̸��� �ּҸ� �˻��Ͻÿ�.

Select ����, �ּ�
From ��, �ֹ�, ��ǰ
Where ��.����ȣ = �ֹ�.��ID
AND ��ǰ.��ǰ��ȣ = �ֹ�.��ǰID
AND ��ǰ�� = '�����';

Select ����, �ּ�
From ��
Where ����ȣ	In(
				Select ��ID
				From �ֹ�
				Where ��ǰID	=(
								Select ��ǰ��ȣ
								From ��ǰ
								Where ��ǰ�� = '�����'
								)
				);

-- #13. ��մܰ����� ���� ��ǰ����?
Select AVG(�ܰ�) AS '��մܰ�'
From ��ǰ;

SELECT ��ǰ��
FROM ��ǰ
WHERE �ܰ� > (SELECT AVG(�ܰ�) FROM ��ǰ);

Select ��ǰ��
From ��ǰ
Where �ܰ� >(
			Select AVG(�ܰ�)
			From ��ǰ
			);

-- #14. p_001 ��ǰ���� �������콺�� �����Ͻÿ�.
Update ��ǰ
Set ��ǰ�� = '�������콺'
Where ��ǰ��ȣ = 'p_001';

Select *
From ��ǰ;

-- #15. ��⿵ ���� ���� ������ �����Ͻÿ�. (����� ��?)
Delete
From ��
Where ���� = '��⿵';

Delete
From �ֹ�
Where ��ID	=(
				Select ����ȣ 
				From �� 
				Where ���� = '��⿵'
				);

Select *
From �ֹ�;

Select *
From ��;

-- 11. ����� ���� �ֹ��� ��ǰ��� �ֹ������� �˻��Ͻÿ�. (���� / ��ø)

Select ��ǰ��, �ֹ�����
From ��, �ֹ�, ��ǰ
Where ��.����ȣ = �ֹ�.��ID
AND ��ǰ.��ǰ��ȣ = �ֹ�.��ǰID
AND ���� = '�����';