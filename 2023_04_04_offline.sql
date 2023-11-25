create database offline_20230404;

use offline_20230404;

create table Department (
			DeptNo int not null,
			DeptName char(20),
			Floor int,
			primary key (DeptNo)
			);

Insert Into Department values (1, '영업', 8);
Insert Into Department values (2, '기획', 10);
Insert Into Department values (3, '개발', 9);
Insert Into Department values (4, '총무', 7);
			
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
			

Select *
From Department;

Select *
From Employee;

--#1번 부서에 근무하는 직원들의 이름을 검색하시오.
Select EmpName, Dno AS '1번 부서'
From Employee
Where Dno = 1;

--#2번 영업부서에 근무하는 직원들의 이름을 검색하시오.
--#2-1) 조인질의 이용

Select EmpName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '영업';

--#2-2) 중첩질의 이용
Select EmpName
From Employee
Where Dno	=(
			Select DeptNo
			From Department
			Where DeptName = '영업'
			);

-- #3번. 모든 직원에 대하여 직원번호, 직원이름, 근무부서명을 검색하시오 (조인조건)
Select EmpNo, EmpName, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo;

Select *
From Department;

Select *
From Employee;


-- #4번. 김창섭이 근무하는 부서명을 검색하시오. (조인조건 / 중첩조건)
Select DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '김창섭';


Select DeptName
From Department
Where DeptNo	=(
				Select Dno
				From Employee
				Where EmpName = '김창섭'
				);

Select *
From Department;

Select *
From Employee;

-- #5번. 사장인 직원의 이름과 근무부서명을 검색하시오. (조인)
Select EMpName, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND Title = '사장';


-- #6번. 영업 또는 기획부서에 근무하는 직원의 이름을 검색하시오. (조인조건 / 중첩조건)
Select EmpName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND (DeptName = '영업' OR DeptName = '기획');

Select EmpName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND (DeptName IN('영업', '기획'));

Select EmpName
From Employee
Where Dno		In(
				Select DeptNo
				From Department
				Where DeptName IN ('영업', '기획')
				);


Select *
From Department;

Select *
From Employee;

-- #7번. 영업 또는 기획부서에 근무하는 직원의 이름과 부서명을 검색하시오. (조인조건)
Select EmpName, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName In ('영업', '기획');


-- #8번 부서번호 (그룹)별 평균 급여를 구하시오.
Select Dno, AVG(Salary) AS '부서별 평균 급여'
From Employee
Group By Dno




-- #9번 부서명 (그룹)별 평균 급여를 구하시오.
Select DeptName, AVG(Salary) AS '부서명 평균 급여'
From Department, Employee
Where Department.DeptNo = Employee.Dno
Group By DeptName;


-- #10번 박영권과 같은 부서에 근무하는 직원들의 이름을 검색하시오. (중첩조건)
Select EmpName
From Employee
Where Dno  In(
			Select Dno
			From Employee
			Where EmpName = '박영권'
			);

-- #김창섭과 같은 직책인 직원의 이름, 직책, 월급은? (중첩조건)
Select EMpName, Title, Salary
From Employee
Where Title		=(
				Select Title
				From Employee
				Where EmpName = '김상원'
				);

-- #영업부서에 근무하는 직원들의 이름은? (중첩조건)
Select EmpName
From Employee
Where Dno		=(
				Select DeptNo
				From Department
				Where DeptName = '영업'
				);

Select *
From Department;

Select *
From Employee;

-- #11번 박영권과 같은 직책인 직원들의 이름과 직책을 검색하시오. (중첩조건)
Select EmpName, Title
From Employee
Where Title		=(
				Select Title
				From Employee
				Where EmpName = '박영권'
				);

-- #12번. 평균 급여보다 많은 급여를 받는 직원들의 이름과 급여를 검색하시오. (중첩조건)

Select AVG(Salary) AS '평균 급여'
From Employee;

Select EmpName, Salary
From Employee
Where Salary		>(
					Select AVG(Salary)
					From Employee
					);


-- #13번. 가장 많은 급여를 받은 직원의 이름, 급여, 직책을 검색하시오. (중첩조건)
Select EmpName, Salary, Title
From Employee
Where Salary		=(
					Select MAX(Salary)
					From Employee
					);


-- #
Select DeptName, AVG(Salary) AS '부서별 평균 월급'
From Employee, Department
Where Dno = DeptNo
Group By DeptName;


-- 과장인 직원들의 근무부서이름은? (중첩질의)

Select DeptName
From Department
Where DeptNo		In(
					Select Dno
					From Employee
					Where Title = '과장'
					);

Select *
From Department;

Select *
From Employee;

-- 매니저가 없는 직원의 근무부서이름은/ (중첩질의)
Select DeptName
From Department
Where DeptNo	In(
				Select Dno
				From Employee
				Where Manager is null
				);

-- 매니저가 없는 사람이 여러명 있다 -> = 보다는 In으로 표기.


-- 기획부서에 근무하는 직원들의 이름과 급여는? (중첩질의)

Select EmpName, Salary
From Employee
Where Dno			In( 
					Select DeptNo
					From Department
					Where DeptName = '기획'
					);
-- in과 = 가 헷갈리면 그냥 싹 다 In으로 해버려라.


Select *
From Department;

Select *
From Employee;


-- 박영권과 같은 부서에 근무하는 직원들의 이름은? (중첩으로만)
Select EmpName
From Employee
Where Dno			In(
					Select Dno
					From Employee
					Where EmpName = '박영권'
					);

-- 이수민 직원의 직책과 근무부서이름은? (조인질의)
Select Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '이수민';

