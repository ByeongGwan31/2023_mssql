use 회사DB;

select *
from Department;

select *
from Employee;

-- #1. 이씨 성을 가진 직원의 이름, 직책, 소속부서의 이름은?
Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName Like '이%';

Select EmpName, Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND  EmpName Like '이__';

-- # 김창섭이 근무하는 부서이름은? [중첩] 
Select DeptName
From Department
Where DeptNo =(
				Select Dno
				From Employee
				Where EmpName = '김창섭'
				);



-- #영업부서에 근무하는 직원들의 이름과 직책은? (중첩 질의) :
Select EmpName, Title
From Employee
Where Dno		=(
				Select DeptNo
				From Department
				Where DeptName = '영업'
				);


-- # 9층에 근무하는 직원들의 이름과 급여, 근무부서의 이름은? (중첩질의 가능) -> X 불가능하다.
-- #[문제변경] 9층에 근무하는 직원들의 이름과 급여는? (중첩질의 가능) -> O 가능

-- 중첩질의로는 두테이블에 있는거 불가능하다.
Select EmpName, Salary
From Employee
Where Dno	=(
			Select DeptNo
			From Department
			Where Floor = 9
			);

-- 과장인 직원들의 근무부서이름은? (중첩질의)
Select DeptName
From Department
Where DeptNo	In(
				Select Dno
				From Employee
				Where Title = '과장'
				);

-- 매니저가 없는 직원의 근무부서이름은? (중첩질의)
Select DeptName
From Department
Where DeptNo	=(
				Select Dno
				From Employee
				Where Manager is null
				);

Select *
From Employee;


-- 기획부서에 근무하는 직원들의 이름과 급여는 (중첩질의)
Select EmpName, Salary
From Employee
Where Dno			=(
					Select DeptNo
					From Department
					Where DeptName = '기획'
					);

-- 영업 또는 기획부서에 근무하는 직원들의 이름과 직책은? (중첩질의)
Select EmpName, Title
From Employee
Where Dno		In(
				Select DeptNo
				From Department
				Where DeptName = '영업' OR DeptName = '기획'
				);

Select EmpName, Title
From Employee
Where Dno		In(
				Select DeptNo
				From Department
				Where DeptName  In ('영업', '기획')
				);

-- #기획 부서에 근무하는 직원들의 이름과 직책은? (조인질의)
Select EmpName, Title, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName = '기획';

-- #영업 또는 기획 부서에 근무하는 직원들의 이름과 직책은? (조인질의)
Select EmpName, Title, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND (DeptName = '기획' OR DeptName = '영업');

-- #영업 또는 기획 부서에 근무하는 직원들의 이름과 직책은? (조인질의)
Select EmpName, Title, DeptName
From Department, Employee
Where Department.DeptNo = Employee.Dno AND DeptName In ('영업', '기획');


-- #박영권과 같은 부서에 근무하는 직원들의 이름은?
Select EmpName
From Employee
Where Dno = 1;
-- 위 방식은 틀렸다.

-- #박영권과 같은 부서에 근무하는 직원들의 이름은?
Select EmpName
From Employee
Where Dno  In (
			Select Dno
			From Employee
			Where EmpName = '박영권'
			);

-- #박영권과 같은 직책인 직원들의 이름과 직책은?
Select EmpName, Title
From Employee
Where Title  =(
		Select Title
		From Employee
		Where EmpName = '박영권'
		);

-- #직원들의 평균급여는?
Select AVG(Salary) AS '직원들의 평균 급여'
From Employee;

-- #직원의 평균급여보다 많은 급여를 받는 직원들의 이름. 직책, 월급은? (중첩으로만)
Select Empname, Title, Salary
From Employee
Where Salary		>(
					Select AVG(Salary)
					From Employee
					);

Select *
From Department;

Select Empname, Title, Salary
From Employee
Where Salary		>(
					Select AVG(Salary)
					From Employee
					);


Select *
From Employee;

-- #이수민 직원의 직책과 근무부서 이름은? (조인)
Select Title, DeptName
From Employee, Department
Where Employee.Dno = Department.DeptNo AND EmpName = '이수민';

-- #이수민 직원과 같은 부서에 근무하는 직원의 이름과 부서번호는? (중첩질의)
Select EmpName, Dno
From Employee
Where Dno	=(
			Select Dno
			From Employee
			Where EmpName = '이수민'
			);