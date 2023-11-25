use Company������;

Select *
From Department;


Select *
From Employee;

Insert Into Department Values(4, '�ѹ�', 7);

Insert Into Employee Values(5000, '��â��', '���', 2600000, 4);
Insert Into Employee Values(5001, '������', '�븮', 2900000, 3);
Insert Into Employee Values(5002, '����', '����', 3100000, 1);
Insert Into Employee Values(5003, '�ھ���', '����', 3600000, 2);
Insert Into Employee Values(5004, '�ڸ��', '���', 2600000, 2);

-- �޿��� 250���� �̻� 350���� ������ ������ �̸�, ��å, �޿��� �˻��Ͻÿ�

Select EmpName, Title, Salary
From Employee
Where Salary BETWEEN 2500000 AND 3500000;

-- �������� �̸��� ���� ����, �׸��� 10% �λ�� ������ �˻��Ͻÿ�.

Select EmpName, Salary, Salary*1.1 As NewSalary
From Employee;
-- ������ Ȯ���ߴ��� ��� �������̶� Where �� ��� �� �ʿ䰡 ����.
-- As��°��� ��Ī�̶�� �Ѵ�. Salary*1.1 �� ���� NewSalary��� �θ��ڴ�.

Insert Into Employee Values (6000, '�ڼ���', '���', 2400000, null);

Select *
From Employee;


-- �μ���ȣ�� �������� �ʾ� null ���� ������ ��� ������ �˻��Ͻÿ�.

Select *
From Employee
Where Dno is null;
-- null ���� =�� �� �� �� ����. in null; �� ���Ѵ�.

Select *
From Employee
Where Dno is not null;
-- null ���� �ƴҰ�츦 ã���ÿ� => is not null�� �� �� �ִ�.

-- ���� �Լ�

Select AVG(Salary) As '��� �޿�'
From Employee;

-- �ִ�޿��� �ּұ޿���?
Select Max(Salary) As '�ִ� �޿�', Min(Salary) As '�ּ� �޿�'
From Employee;
-- ������ ���� �����Ƿ� Select�� From �� ����Ѵ�. ��� �����̱� ������ Where�� ��� �� �ʿ� ����

-- ��ü ������ ��� ����ΰ�? count �Լ� ���
Select Count(*) As '��ü ������ ��'
From Employee;
-- ������ ���� ������ ��ΰ� Count �ȿ� * ���

Select Count(EmpNo)
From Employee;

-- ���� null�� count���� �ʴ´�.
Select Count(Dno)
From Employee;
-- �Ʊ� ���� ��� �־��� �� �μ��� �������� ���� ���� �ֱ� ������ null �� Count�� �� �� ����.

-- ȸ���� ��å�� ��ΰ�?
Select Count(Title) As '��å�� ��'
From Employee;

-- ȸ���� ��å�� ��ΰ�? [2]
Select Count(Distinct Title) As '��å�� ��[2]'
From Employee;
-- Title�� ����ִ� �ߺ��� �����ϰ� ���� �ٸ� ���鸸 �����ش�.

-- ����(��) - �� �� ������ ����
Delete 
From Employee
Where Dno is null;
Select *
From Employee;

-- ��Ʈ����Ʈ (��) �� ����
Update Employee
Set Title = '���', Salary = 1500000
Where EmpName = '������';

Update Employee
Set Title = '���', Salary = Salary*0.9
Where EmpName = '������';
-- Set�� ���ĵ� ���� �� �ִ�.

-- 2023_03_21_ 3���� 3������ 

-- �μ��� ��� �޿��� �˻��Ͻÿ�.
Select AVG(Salary) As '��� �޿�'
From Employee
Group By Dno;

-- �μ��� ��� �޿��� �˻��Ͻÿ�. [2] ���� ���� 
Select Dno, AVG(Salary) As '�μ��� ��� �޿�'
From Employee
Group By Dno;

-- �μ� (��ȣ)�� ��� �޿��� 270���� �̻��� �μ�(��ȣ)�� �� ��� �޿���?
Select Dno, AVG(Salary) As '�μ��� �޿�'
From Employee
Group By Dno
Having AVG(Salary) > 2700000;

-- [�ǽ�1] �븮�� ������ ��� �� ���ΰ���?
Select Count(*) As '�븮������ ��'
From Employee
Where Title = '�븮';

-- [�ǽ�2] ���� �Ǵ� �븮�� ������ ��� �� ���ΰ���?
Select Count(*) As '���� �Ǵ� �븮������ ��'
From Employee
Where Title = '����' Or Title = '�븮';

-- [�ǽ�3] ��å�� �������� �˻��Ͻÿ�.
Select Title, Count(*) AS '��å�� ������ ��'
From Employee
Group By Title;

-- [�ǽ�4] �μ��� �ִ�޿��� �ּұ޿��� ���Ͻÿ�.
Select Title, MAX(Salary) AS '�ִ� �޿�', MIN(Salary) AS '�ּ� �޿�'
From Employee
Group By Title;

-- [�ǽ�5] ��å�� ��ձ޿��� ���Ͻÿ�.
Select Title, AVG(Salary) AS '��å�� ��� �޿�'
From Employee
Group By Title

-- [�ǽ�6] ��å�� ��ձ޿��� 300���� �̻��� ��å�� �� ��ձ޿��� ���Ͻÿ�.
Select Title, AVG(Salary) AS '��� �޿�'
From Employee
Group By Title
Having AVG(Salary) > 3000000;

