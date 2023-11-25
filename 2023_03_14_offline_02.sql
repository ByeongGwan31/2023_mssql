create database Company강병관;

use Company강병관;

create table Department (
		DeptNo int not null,
		DeptName char(10),
		Floor int,
		primary key(DeptNo)
);

Insert into Department values (1, '영업', 8);
Insert Into Department values (2, '기획', 10);
Insert Into Department values (3, '개발', 9);
Insert Into Department values (4, '총무', 7);

Select *
From Department
Where DeptName = '영업';

Select DeptName
From Department;

Select DeptName, Floor
From Department
Where Floor = 8;

create table Employee (
		EmpNo int not null,
		EmpName char(10),
		Title char (10),
		Salary int,
		Dno int,
		primary key(EmpNo),
		foreign key(Dno) references Department(DeptNo)
);

Insert Into Employee values (2106, '김창섭', '대리', 2500000, 2);
Insert Into Employee values (3426, '박영권', '과장', 3000000, 1);
Insert Into Employee values (3011, '이수민', '부장', 4000000, 3);
Insert Into Employee values (1003, '조민희', '과장', 3000000, 2);
Insert Into Employee values (3427, '최종철', '사원', 1500000, 3);
Insert Into Employee values (1365, '김상원', '사원', 1500000, 1);
Insert Into Employee values (4377, '이성래', '사장', 5000000, 2);

Select *
From Employee;

Select EmpName, Title
From Employee;

Select EmpName, Title, Salary
From Employee
Where Title = '과장';


/* #1. 김창섭의 모든 정보를 검색하시오. */

Select *
From Employee
Where EmpName = '김창섭';

/* #2. 김창섭의 직책을 검색하시오. */
Select Title
From Employee
Where EmpName = '김창섭';

/* #3. 과장 또는 대리인직원들의 이름과 직책을 검색하시오. */
Select EmpName, Title
From Employee
Where Title = '과장' OR Title = '대리';


/* #1. 과장인 직원들의 모든 정보를 검색하시오. */
Select *
From Employee
Where Title = '과장';

/* #2. 월급이 300만원 이상인 직원들의 모든 정보를 검색하시오. (비교 연산자 : */

Select *
From Employee
Where Salary >= 3000000;

/* #3. 영업부서에 대한 모든 정보를 검색하시오. */

Select *
From Department
Where DeptName = '영업';


/* #4. 8층에 위치한 부서명은? */

Select DeptName
From Department
Where Floor = 8;

/* #5. 과장이며 1번 부서에 근무하는 직원들의 이름은? */

Select EmpName
From Employee
Where Title = '과장' AND Dno = 1;

/* #6. 2번 또는 3번 부서인 직원의 이름은? */

Select EmpName
From Employee
Where Dno = 2 OR Dno = 3;

/* #7. 2번 부서가 아닌 직원들의 이름과 부서번호를 검색하시오. */

Select EmpName, Dno
From Employee
Where Dno <> 2

/* #8. 이성래의 직책과 월급을 검색하시오. */

Select Title, Salary
From Employee
Where EmpName = '이성래';

/* #돌발 영업또는 기획부서의 모든 정보를 검색하시오. */
Select *
From Department
Where DeptName = '영업' OR DeptName = '기획';
-- Where DeptName In ('영업', '기획);

/* #돌발 */

/* #9. 이씨 성을 가진 직원들의 이름, 직책을 검색하시오. (문자열 일부분 비교 :    와일드 문자 : like ‘김%’ */

Select EmpName, Title
From Employee
Where EmpName Like '이%';

/* #11. 부서번호 1, 2, 3인 부서에 속한 직원들의 이름, 직책을 검색하시오. (OR, IN)*/

Select EmpName, Title
From Employee
Where Dno in (1, 2, 3);

Select EmpName, Title
From Employee
Where Dno = 1 OR Dno = 2 Or Dno = 3;

/* #12. 월급이 250만원 이상 400만원 이하인 직원들의 이름, 월급을 검색하시오. (And, 범위연산자) */

Select EmpName, Salary
From Employee
Where Salary >= 2500000 AND Salary <= 4000000;

/* #13. 1번 부서에 근무하는 직원들의 이름, 월급을 검색하여 이름의 내림차순으로 보여라. ( 정렬 : 오름차순 ~      내림차순 ~) */

Select EmpName, Salary
From Employee
Where Dno = '1'
Order By EmpName Desc;

/* #14. 모든 직원들의 평균 월급을 검색하시오.    ( 집단 함수 :     ) */
Select Avg(Salary)
From Employee;