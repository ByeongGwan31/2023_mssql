create database Comapany_230328_강병관;

use Comapany_230328_강병관;

create table Department (
		DeptNo int not null,
		DeptName char(10),
		Floor int,
		primary key(DeptNo)
);

Insert Into Department values(1, '영업', 8);
Insert Into Department values(2, '기획', 10);
Insert Into Department values(3, '개발', 9);
Insert Into Department values(4, '총무', 7);

Select *
From Department;

create table Employee (
		EmpNo int not null,
		EmpName char(20),
		Title char(20),
		Manager int,
		Salary int,
		Dno int,
		primary key(EmpNo),
		foreign key(Dno) references Department(DeptNo),
		foreign key(Manager) references Employee(EmpNo)
);

Insert Into Employee values(4377, '이성래', '사장', null, 5000000, 2);
Insert Into Employee values(3426, '박영권', '과장', 4377, 3000000, 1);
Insert Into Employee values(3011, '이수민', '부장', 4377, 4000000, 3);
Insert Into Employee values(1003, '조민희', '과장', 4377, 3000000, 2);
Insert Into Employee values(2106, '김창섭', '대리', 1003, 2500000, 2);
Insert Into Employee values(3427, '최종철', '사원', 3011, 1500000, 3);
Insert Into Employee values(1365, '김상원', '사원', 3426, 1500000, 1);

Select *
From Employee;

-- #1. 이성래 사원의 직책과 소속 부서번호는? --
Select Title, Dno
From Employee
Where EmpName = '이성래';

-- #2. 이씨 성을 가진 사원의 이름. 직책, 소속부서 번호는? --
Select EmpName, Title, Dno
From Employee
Where EmpName like '이%';

-- #3. 과장이면서 1번 부서가 아닌 사원의 이름과 직책, 소속부서번호는? --
Select EmpName, Title, Dno
From Employee
Where Title = '과장' AND Dno <> 1;

-- #4. 급여가 300만원 이상이고 450만원 이하인 사원의 이름, 직책, 급여는? --
Select EmpName, Title, Salary
From Employee
Where Salary Between 3000000 AND 4500000;

-- #5. 매니저가 없는 사원의 이름과 직책은? --
Select EmpName, Title
From Employee
Where Manager is null;

-- #6. 2번 부서에 근무하는 사원의 이름, 급여, 직책을 급여의 내림차순으로 검색하시오. --
Select EmpName, Salary, Title
From Employee
Where Dno = 2
Order By Salary ASC;

-- #7. 사원이름 중 가나다순으로 가장 앞인 이름과 마지막인 이름을 검색하시오. [!] --
-- ASCII 코드 사용
Select Min(EmpName) as '가나다순 앞 정렬', Max(EmpName) as '가나다순 뒷 정렬'
From Employee

-- #8. 직책별 사원의 수가 2명 이상인 직책과 그 직책의 사원수를 검색하시오. [!] --
Select Title, Count(Title) AS '직원의 수'
From Employee
Group By Title
Having Count(Title) >= 2;

-- #2-1. 김창섭이 근무하는 부서번호는? --
Select Dno
From Employee
Where EmpName = '김창섭';


-- #2-2. 김창섭이 근무하는 부서이름은? --
-- 원하는 답이 나오지 않고, 모든 답이 다 나온다. 한 가지 것을 빼먹었기 떄문이다.
-- 김창섭의 부서번호 DeptNo, Department 값이 나올려면 DeptNo가 서로 같아야한다.
Select DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '김창섭';


-- #3-1. 1번 부서에 근무하는 직원들의 이름은?

Select EmpName
From Employee
Where Dno = 1;

-- #3-2. 영업 부서에 근무하는 직원들의 이름과 직책은?
Select EmpName, Title
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '영업';

-- #3-3. 모든 직원들의 이름과 근무 부서명을 검색하시오.
Select EmpName, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo

-- #4-1. 과장인 직원들의 이름과 직책, 근무부서의 이름은?
Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND Title = '과장';

-- #4-2. 9층에 근무하는 직원들의 이름과 급여, 근무부서의 이름은?
Select EmpName, Salary, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND Floor = 9;