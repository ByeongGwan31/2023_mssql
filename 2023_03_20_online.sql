use Company강병관;

Select *
From Department;


Select *
From Employee;

Insert Into Department Values(4, '총무', 7);

Insert Into Employee Values(5000, '김창수', '사원', 2600000, 4);
Insert Into Employee Values(5001, '이정아', '대리', 2900000, 3);
Insert Into Employee Values(5002, '배희선', '과장', 3100000, 1);
Insert Into Employee Values(5003, '박아현', '부장', 3600000, 2);
Insert Into Employee Values(5004, '박명수', '사원', 2600000, 2);

-- 급여가 250만원 이상 350만원 이하인 직원의 이름, 직책, 급여를 검색하시오

Select EmpName, Title, Salary
From Employee
Where Salary BETWEEN 2500000 AND 3500000;

-- 직원들의 이름과 현재 월급, 그리고 10% 인상된 월급을 검색하시오.

Select EmpName, Salary, Salary*1.1 As NewSalary
From Employee;
-- 조건을 확인했더니 모든 직원들이라서 Where 을 사용 할 필요가 없다.
-- As라는것은 별칭이라고 한다. Salary*1.1 한 값을 NewSalary라고 부르겠다.

Insert Into Employee Values (6000, '박수정', '사원', 2400000, null);

Select *
From Employee;


-- 부서번호가 정해지지 않아 null 값인 직원의 모든 정보를 검색하시오.

Select *
From Employee
Where Dno is null;
-- null 값은 =로 비교 할 수 없다. in null; 로 비교한다.

Select *
From Employee
Where Dno is not null;
-- null 값이 아닐경우를 찾으시오 => is not null로 할 수 있다.

-- 집단 함수

Select AVG(Salary) As '평균 급여'
From Employee;

-- 최대급여와 최소급여는?
Select Max(Salary) As '최대 급여', Min(Salary) As '최소 급여'
From Employee;
-- 조건이 따로 없으므로 Select와 From 만 사용한다. 모든 직원이기 때문에 Where은 사용 할 필요 없음

-- 전체 직원은 모두 몇명인가? count 함수 사용
Select Count(*) As '전체 직원의 수'
From Employee;
-- 데이터 행의 개수가 몇개인가 Count 안에 * 사용

Select Count(EmpNo)
From Employee;

-- 주의 null은 count하지 않는다.
Select Count(Dno)
From Employee;
-- 아까 신입 사원 넣었을 때 부서가 결정되지 않은 값이 있기 때문에 null 은 Count가 될 수 없다.

-- 회사의 직책은 몇개인가?
Select Count(Title) As '직책의 수'
From Employee;

-- 회사의 직책은 몇개인가? [2]
Select Count(Distinct Title) As '직책의 수[2]'
From Employee;
-- Title에 들어있는 중복을 제외하고 서로 다른 값들만 보여준다.

-- 투플(행) - 한 줄 단위로 삭제
Delete 
From Employee
Where Dno is null;
Select *
From Employee;

-- 애트리뷰트 (열) 값 수정
Update Employee
Set Title = '사원', Salary = 1500000
Where EmpName = '조민희';

Update Employee
Set Title = '사원', Salary = Salary*0.9
Where EmpName = '조민희';
-- Set에 수식도 넣을 수 있다.

-- 2023_03_21_ 3주차 3차강의 

-- 부서별 평균 급여를 검색하시오.
Select AVG(Salary) As '평균 급여'
From Employee
Group By Dno;

-- 부서별 평균 급여를 검색하시오. [2] 보기 좋게 
Select Dno, AVG(Salary) As '부서별 평균 급여'
From Employee
Group By Dno;

-- 부서 (번호)별 평균 급여가 270만원 이상인 부서(번호)와 그 평균 급여는?
Select Dno, AVG(Salary) As '부서별 급여'
From Employee
Group By Dno
Having AVG(Salary) > 2700000;

-- [실습1] 대리인 직원은 모두 몇 명인가요?
Select Count(*) As '대리직원의 수'
From Employee
Where Title = '대리';

-- [실습2] 과장 또는 대리인 직원은 모두 몇 명인가요?
Select Count(*) As '과장 또는 대리직원의 수'
From Employee
Where Title = '과장' Or Title = '대리';

-- [실습3] 직책별 직원수를 검색하시오.
Select Title, Count(*) AS '직책별 직원의 수'
From Employee
Group By Title;

-- [실습4] 부서별 최대급여와 최소급여를 구하시오.
Select Title, MAX(Salary) AS '최대 급여', MIN(Salary) AS '최소 급여'
From Employee
Group By Title;

-- [실습5] 직책별 평균급여를 구하시오.
Select Title, AVG(Salary) AS '직책별 평균 급여'
From Employee
Group By Title

-- [실습6] 직책별 평균급여가 300만원 이상인 직책과 그 평균급여를 구하시오.
Select Title, AVG(Salary) AS '평균 급여'
From Employee
Group By Title
Having AVG(Salary) > 3000000;

