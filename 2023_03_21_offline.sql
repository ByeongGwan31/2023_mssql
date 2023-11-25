create database Company2023_03_21_offline;
use Company2023_03_21_offline;

create table Department (
	DeptNo int not null,
	DeptName char(15),
	Floor int,
	primary key(DeptNo)
);

create table Employee (
	EmpNo int not null,
	EmpName char(15),
	Title char(15),
	Salary int,
	Dno int,
	primary key(EmpNo),
	foreign key(Dno) references Department(DeptNo)
);

Insert Into Department Values(1, '영업', 8);
Insert Into Department Values(2, '기획', 10);
Insert Into Department Values(3, '개발', 9);
Insert Into Department Values(4, '총무', 7);
Insert Into Department Values(5, '전산', null);

Select *
From Department;

Insert Into Employee Values(2106, '김창섭', '대리', 2500000, 2);
Insert Into Employee Values(3426, '박영권', '과장', 3000000, 1);
Insert Into Employee Values(3011, '이수민', '부장', 4000000, 3);
Insert Into Employee Values(1003, '조민희', '과장', 3000000, 2);
Insert Into Employee Values(3427, '최종철', '사원', 1500000, 3);
Insert Into Employee Values(1365, '김상원', '사원', 1500000, 1);
Insert Into Employee Values(4377, '이성래', '사장', 5000000, 2);
Insert Into Employee Values(1212, '이선희', '인턴', 1000000, null);
Insert Into Employee Values(3901, '김수정', '인턴', 1000000, null);

Select *
From Employee;

-- #1. 영업부서에 대한 모든 정보를 검색하시오.
Select *
From Employee
Where Dno = 2;

-- #2. 대리인 직원들의 이름과 직책을 검색하시오.
Select EmpName, Title
From Employee
Where Title = '대리';

-- #3. 월급이 200만원 이상인 직원들의 모든 정보를 검색하시오. (비교 연산자)
Select *
From Employee
Where Salary > 2000000;

-- #3-2. 부서번호가 null인 직원들의 이름, 직책은?
Select EmpName, Title, Dno
From Employee
Where Dno is null;

-- #3-3. Floor 값이 nul인 부서명은?
Select DeptName
From Department
Where Floor is null;

-- #4. 직책이 사원이고 3번 부서에 근무하는 직원들의 이름과 직책은?
Select EmpName, Title
From Employee
Where Title = '사원' AND Dno = 3;

-- #5. 2번 또는 3번 부서인 직원들의 이름은? (OR, IN)
Select EmpName, Dno
From Employee
Where Dno = 2 Or Dno = 3;

Select EmpName, Dno
From Employee
Where Dno in (2,3);

-- #6. 2번 부서가 아닌 직원들의 이름과 부서번호를 검색하시오.
Select EmpName, Dno
From Employee
Where Dno <> 2;

-- #7. 이성래의 직책과 월급을 검색하시오.
Select Title, Salary
From Employee
Where EmpName = '이성래'

-- #8. 이씨 성을 가진 직원들의 이름, 직책을 검색하시오. (문자열 일부분 비교 : )
Select EmpName, Title
From Employee
Where EmpName Like '이%';

-- #9. 이씨 성이 아닌 직원들의 이름, 직책을 검색하시오.
Select EmpName, Title
From Employee
Where EmpName not Like '이%';

-- #10. 부서번호가 정해지지 않아 null 값인 직원들의 이름과 직책은? (null 값 비교 : )
Select EmpName, Title
From Employee
Where Dno is null;

-- #11. 월급이 250만원 이상 400만원 이하인 직원들의 이름, 월급을 검색하시오. (AND, 범위연산자)
Select EmpName, Salary
From Employee
Where Salary >= 2500000 AND Salary <= 4000000;

-- #11-2. 월급이 250만원 이상 300만원 이하인 직원들의 이름과 월급은?
Select EmpName, Salary
From Employee
Where Salary >= 2500000 AND Salary <= 3000000;

-- #내림차순 정렬 <오름차순 정렬은 ASC이지만 default 값이기 때문에 써주지 않는다.)
Select EmpName, Salary
From Employee
Where Salary BETWEEN 2500000 AND 3500000
Order by EmpName DESC;

Select EmpName, Salary
From Employee
Where Salary Between 2500000 AND 4000000;

-- #12. 1번 부서에 근무하는 직원들의 이름, 월급을 검색하여 이름의 내림차순으로 보여라.
Select EmpName, Salary
From Employee
Where Dno = 1
Order By EmpName ASC;

-- #12-2. 월급의 오름차순으로 모든 직원의 모든 정보를 검색하시오.
-- 이거 확인 할 것!
Select *
From Employee
Order By Salary ASC;

-- #12-3. 과장인 직원들의 이름, 직책 월급을 부서번호의 내림차순으로 검색하시오.
Select EmpName, Title, Salary, Dno
From Employee
Where Title = '과장'
Order By Dno DESC;

-- #12-4. 모든 직원의 월급을 10% 인상한 금액을 검색하시오.
Select Salary*1.1 AS '10%인상된 월급'
From Employee;

-- #12-5. 평균 월급을 알고싶다.
Select AVG(Salary) AS '평균 월급'
From Employee;

-- #12-6. 최대값을 찾는 
Select MAX(Salary) AS '최대 월급'
From Employee;

Select MIN(Salary) AS '최소 월급'
From Employee;

Select SUM(Salary) AS '총 합계 월급'
From Employee;

--# Count 함수 사용
Select Count(Distinct Title) AS '중복 제거 직책의 수'
From Employee;

Select Count(Dno)
From Employee;
-- null은 제거한다. 

Select Count(*)
From Employee;
-- 개수를 셀 때는, 투플의 개수를 세면 절대 틀릴일이 없다.

-- 인턴은 모두 몇명인가?
Select Count(Title) AS '인턴직원의 수'
From Employee
Where Title = '인턴';

-- 과장인 직원들의 월급의 합계는?
Select Count(*) AS '과장직원의 수' , SUM(Salary) '월급의 합계'
From Employee
Where Title = '과장';

-- 과장 또는 대리인 직원의 수는 몇명인가?
Select Count(*) AS '과장 또는 대리 직원의 수'
From Employee
Where Title in ('과장', '대리');

-- 교수님
-- Delete 
Select Dno, AVG(Salary) AS '부서별 평균급여'
From Employee
Group By Dno;

-- #0.4 - 부서번호별 최대 월급은?
Select Dno, MAX(Salary) AS '부서별 최대 월급'
From Employee
Group By Dno;

-- #0.5 - 부서번호별 직원의 수는?
Select Dno, Count(*) AS '부서별 직원의 수'
From Employee
Group By Dno;

-- #0.6 - 직책별 직원의 수는?
Select Title, Count(*) AS '직책별 직원의 수'
From Employee
Group By Title;

-- #0.7 마지막 진도
Select Title, AVG(Salary) AS '부서별 평균 월급'
From Employee
Group By Title
Having AVG(Salary) >= 3000000
Order By AVG(Salary) DESC;

-- #집단 함수
-- AVG(), SUM(), MAX(), MIN(), COUNT()
-- COUNT(열) -> null인 열 count 하지 않는다.
-- 제일 쉬운 방법은 Count(*) 하는게 가장 효과적이다.

-- #13. 모든 직원들의 평균 월급을 검색하시오. (집단함수)
Select AVG(Salary) AS '평균 월급'
From Employee;

-- #14. 회사의 직원들은 모두 몇 명인가?
Select Count(*) AS '회사의 직원 수'
From Employee;

-- #15. 과장인 직원들은 모두 몇 명인가?
Select Count(Title) AS '과장 직원의 수'
From Employee
Where Title = '과장'

--# 16. 2번 부서에 근무하는 직원들의 월급의 총 합계는 얼마인가?
Select Sum(Salary) AS '월급의 총 합계'
From Employee
Where Dno = 2;

-- #17. 모든 직원들에 대해 소속 부서번호로 그룹화하고 부서별 평균월급을 검색하시오. (그룹화)
Select Dno, AVG(Salary) AS '부서별 평균 월급'
From Employee
Group By Dno;

-- #18. 모든 직원들에 대해 소속 부서번호로 그룹화하고 소속부서의 평균월급이 250만원 이상인 부서에 대해 부서번호, 부서의 평균월급을 검색하시오. (그룹화 : 조건만족 그룹에 대한 집단함수적용)
Select Dno, AVG(Salary) AS '평균 월급'
From Employee
Group By Dno
Having AVG(Salary) > 2500000;