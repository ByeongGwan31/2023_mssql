create database MyCompany;

use MyCompany;

create table Department (
		DeptNo int not null,
		DeptName char(10),
		Floor int,
		primary key(DeptNo)
		);

insert into Department values(1, '영업', 8);
insert into Department values(2, '기획', 10);
insert into Department values(3, '개발', 9);
insert into Department values(4, '총무', 7);

Select *
From Department;


-- Employee 테이블에는 무결성 제약조건을 실습하기 위해서 몇몇가지 추가된 코드이다.
create table Employee (
		EmpNo int not null,
		EmpName char(10) unique,
		-- unique : 독특하다. EmpName 값이 전부 틀리다 할 경우는 unique라고 해도 된다.
		Title char(10) default '사원',
		-- default : 보통 회사의 경우 제일 많은 직책이 사원이기 때문에 default 값을 사용한다.
		Manager int,
		Salary int check (Salary < 6000000),
		-- check(  ) : 사이에 있는 것은 월급이 600만원보다 작다. -> 그것을 체크하겠다!
		Dno int check (Dno in (1,2,3,4,5,6) ) default 1,
		-- check(  ) : 사이에 있는 1 - 6까지
		-- default 1 : 1번 부서를 default 값으로 하겠다.
		primary key (EmpNo),
		foreign key (Manager) references Employee(EmpNo),
		foreign key (Dno) references Department (DeptNo) on Delete Set Default on Update Cascade
		-- on Delete : dno 값은 DeptNo를 참조하고있다.
		-- DeptNo가 삭제가 되면 참조하고 있는 // Department 에서 DeptNo가 삭제가 되면 -> Employee에서 그 테이블의 정보가 일치 할 경우 -> 
		-- default로 변경한다. -> Dno의 default는 1이다. -> 1로 바뀐다.
		-- Update Cascade : 만약 부서 번호 (DeptNo) 가 바뀌었다 하면 -> Dno 값들이 변경된다. (CasCade) // 연쇄적으로 변경된다.
		);

insert into Employee values(4377, '이성래', '사장', null, 5000000, 2);
insert into Employee values(3426, '박영권', '과장', 4377, 3000000, 1);
insert into Employee values(3011, '이수민', '부장', 4377, 4000000, 3);
insert into Employee values(1003, '조민희', '과장', 4377, 3000000, 2);
insert into Employee values(2106, '김창섭', '대리', 1003, 2500000, 2);
insert into Employee values(1365, '김상원', '사원', 3426, 1500000, 1);
insert into Employee values(3427, '최종철', '사원', 3011, 1500000, 3);

Select *
From Employee;

-- 문제 (SQL : DDL, DML, DCL)

-- #1. 새로운 직원에 대한 정보 (1000, '홍길동', default, 1003, 2500000, 2) 를 입력 후 확인
insert into Employee values(1000, '홍길동', default, 1003, 2500000, 2);
-- check(Salary < 600000) 로 인해 도메인 제약조건 위반 

Select *
From Employee;

-- #2. Employee에 Phone 애트리뷰트를 추가하시오.
alter table Employee add Phone char(20);

Select *
From Employee;

	-- #2-1. 이수민 직원의 전화번호를 ' 010-123-4567'로 수정하시오
	Update Employee
	Set Phone = '010-123-4567'
	Where EmpName = '이수민';

Select *
From Employee;

	-- #2-2. 홍길동 직원 정보 삭제
	Delete
	From Employee
	Where EmpName = '홍길동';

	Select *
	From Employee;

-- #3. 새로운 직원 '김창섭' 에 대한 정보를 입력하시오.
Insert into Employee values(5000, '김창수', default, 3011, 2000000, 1, '010-103-4567');

Select *
From Employee;

-- #4. Department에서 3번 부서번호를 10으로 변경하고 확인 (안되는 이유는?)
Update Department
Set DeptNo = 10
Where DeptNo = 3
---- check(  ) : 사이에 있는 1 - 6까지
		-- default 1 : 1번 부서를 default 값으로 하겠다 1-6까지 중에 설정하였다.


-- #5. Department에서 2번 부서번호를 6으로 변경하고 확인 (이유는)
Update Department
Set DeptNo = 6
Where DeptNo = 2;

Select *
From Department;

Select *
From Employee;


-- #6. Department에서 3번 부서정보를 삭제하시오.
Delete
From Department
Where DeptNo = 3;

Select *
From Department;


-- #7. Employee에 Phone 애트리뷰트를 제거하시오. (drop column)
alter table Employee drop column Phone;

Select *
From Employee;

-- #8. Department 제거하시오.
drop table Department; 

drop table Employee;