create database 회사DB;
use 회사DB;

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
		Dno int
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

-- Insert Into Employee values(2106, '김창섭', '대리', 1003, 2500000, 2);
-- 


Select *
From Employee;


--#1. 김창섭의 직책과 월급을 검색하시오.
Select Title, Salary
From Employee
Where EmpName = '김창섭';

--#2. 김씨 성을 가진 직원들의 이름, 직책을 검색하시오.
Select EmpName, Title
From Employee
Where EmpName Like '김%';

--#3. 월급이 300만원 이상 400만원 이하인 직원들의 이름, 월급을 검색하시오.
Select EmpName, Salary
From Employee
Where Salary Between 3000000 AND 4000000;

--#4. 매니저가 없는 직원의 이름과 직책은?
Select EmpName, Title
From Employee
Where Manager is null;

--#5. 2번부서에 근무하는 직원들의 이름, 월급을 검색하여 월급의 내림차순으로 보여라.
Select EmpName, Salary
From Employee
Where Dno = 2
Order by Salary ASC;

--#6. 모든 직원들의 평균월급을 검색하시오.
Select AVG(Salary) As '직원들의 평균 월급'
From Employee;

--#7. 회사의 직원들은 모두 몇 명 인가?
Select Count(*) AS '전체 회사 직원의 수'
From Employee

--#8. 과장인 직원들은 모두 몇 명 인가?
Select Count(Title) AS '과장의 직원의 수'
From Employee
Where Title = '과장';


--#9. 2번 부서에 근무하는 직원들의 월급의 평균은?
Select AVG(Salary) AS '2번부서 직원들의 월급 평균'
From Employee
Where Dno = 2;

--#10. 모든 직원들에 대해 소속 부서번호로 그룹화하고 부서별 평균 월급을 검색하시오.
Select AVG(Salary) AS '부서별 평균 월급', Dno
From Employee
Group By Dno;

--#11. 모든 직원들에 대해 소속 부서번호로 그룹화하고 소속부서의 평균월급이 250만원 이상인 부서에 대해 부서번호,
-- 부서의 평균 월급을 검색하시오.
Select AVG(Salary) AS '부서별 평균 월급', Dno AS '그룹 번호'
From Employee
Group By Dno
Having AVG(Salary) >= 2500000;

--#12. 1번 부서에 근무하는 직원들의 이름을 검색하시오.
Select EmpName, Dno As '부서'
From Employee
Where Dno = 1;

--#13. 영업부서에 근무하는 직원들의 이름을 검색하시오.
Select EmpName, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '영업';

--#14. 김창섭이 근무하는 부서명을 검색하시오.
Select DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '김창섭';

--#15. 과장인 직원들의 이름과 이름의 오름차순으로 나타내시오.
Select EmpName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND TItle = '과장'
Order By EmpName ASC;

-- #15. 과장의 직원들의 이름과 이름의 오름차순으로 나타내시오.
Select EmpName
From Employee
Where Title = '과장'
Order By EmpName ASC;

-- [문제]
--#2-1. 영업 부서에 근무하는 직원들의 이름은?
Select EmpName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '영업';

Select EmpName
From Employee, Department
Where Department.DeptNo = Employee.Dno AND DeptName = '영업'
Order by DeptName DESC;

--#2-2. 8층에 근무하는 직원들의 이름과 직책, 월급은?
Select EmpName, Title, Salary
From Department, Employee
Where Department.DeptNo = Employee.Dno AND Floor = 8;

-- [문제 2]

-- #1. 이씨 성을 가진 직원의 이름, 직책, 소속부서의 이름은?
Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName Like '이%';

-- #2. 과장이면서 1번 부서가 아닌 직원의 이름과 직책, 소속부서명은?
Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND TItle = '과장' AND Dno <> 1;

-- #3. 급여가 300만원이상 450만원 이하인 직원의 이름, 급여, 소속부서명은?
Select EmpName, Salary, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND Salary Between 3000000 AND 4500000;

-- #4. 매니저가 없는 직원의 이름과 직책, 소속 부서명은?
Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND Manager is null;

-- #5. 기획부서에 근무하는 직원의 이름, 급여, 직책을 급여의 내림차순으로 검색하시오.
Select EmpName, Salary, Title
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '기획'
Order By Salary DESC;

-- #6. 직원이름 중 가나다순으로 가장 앞인 이름과 마지막인 이름을 검색하시오.
Select Min(EmpName) as '가나다순 앞 정렬', Max(EmpName) as '가나다순 뒷 정렬'
From Employee

-- #7. 직책별 직원의 수가 2명 이상인 직책과 그 직책의 직원수를 검색하시오.
Select Title, Count(Title) AS '직책별 직원의 수'
From Employee
Group By Title
Having Count(Title) >= 2;


-- [실험]
Select Min(Salary) AS '가장 적게받은 직원의 월급'
From Employee;

Select Min(EmpName)
From Employee;

Select Max(EmpName)
From Employee;

Select AVG(EmpName)
From Employee;

Select EmpName
From Employee
Order By EmpName;

Select Count(Manager)
From Employee;

-- 중복제거
Select Title, Count(*) AS '직책 직원의 수'
From Employee
Group By Title
Having Count(TItle) >= 2;

-- [마지막 문제] 김창섭이 근무하는 부서 이름은?
Select Empname, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '김창섭';

Select DeptName
From Department
Where DeptNo = (Select Dno
				From Employee
				Where Empname = '김창섭'
				);

Select Dno
From Employee
Where Empname = '김창섭'

-- [마지막 문제 [중첩] 영업 부서에 근무하는 직원 이름은?)
Select EmpName
From Employee
Where Dno = (
Select DeptNo
From Department
Where DeptName = '영업'
);