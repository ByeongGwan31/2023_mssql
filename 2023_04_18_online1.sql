create database 학교데이터베이스;

use 학교데이터베이스;

create table 학과 (
	학과번호 char(10) not null,
	학과명 char(20)
	primary key(학과번호),
	);

Insert Into 학과 Values ('D1', '컴퓨터공학');
Insert Into 학과 Values ('D2', '전산학');

Select *
From 학과;

create table 과목 (
	과목번호 char(20) not null,
	과목이름 char(20),
	primary key (과목번호)
	);

Insert Into 과목 Values ('CS310', '데이터베이스');
Insert Into 과목 Values ('CS313', '운영체제');
Insert Into 과목 Values ('CS345', '자료구조');
Insert Into 과목 Values ('CS326', '자바');

Select *
From 과목;

create table 수강 (
	학번 int not null,
	과목번호 char(20) not null,
	학점 char(10)
	primary key (학번, 과목번호),
	foreign key(과목번호) references 과목(과목번호)
	);

Insert Into 수강 Values ('11002', 'CS310', 'A0');
Insert Into 수강 Values ('11002', 'CS313', 'B+');
Insert Into 수강 Values ('24036', 'CS345', 'B0');
Insert Into 수강 Values ('30419', 'CS310', 'A+');

Select *
From 수강;


create table 학생 (
		학번 int not null,
		이름 char(20),
		이메일 char(30),
		평점 float,
		학과번호 char(10) not null,
		primary key (학번, 학과번호),
		foreign key (학과번호) references 학과(학과번호)
		);

Insert Into 학생 Values (11002, '이홍근', 'lee@naver.com', 4, 'D1');
Insert Into 학생 Values (24036, '김순미', null, 3.2, 'D2');
Insert Into 학생 Values (30419, '김순영', 'kim@gmail.com', 2.8, 'D1');

Select *
From 학생;

--

Select *
From 학생;

Select *
From 수강;

Select *
From 과목;

Select *
From 학과;

-- 

-- #1. 평점이 3.0에서 4.0 사이인 학생들의 이름과 평점을 평점의 내림차순으로 검색하시오.
Select 이름, 평점
From 학생
Where 평점 BETWEEN 3.0 AND 4.0
Order By 평점 DESC;

-- #2. 이홍근 학생의 소속 학과명을 검색하시오. (중첩 / 조인)
Select 학과명
From 학생, 학과
Where 학생.학과번호 = 학과.학과번호 AND 이름 = '이홍근';

Select 학과명
From 학과
Where 학과번호		=(
					Select 학과번호
					From 학생
					Where 이름 = '이홍근'
					);

-- #3. 등록된 학생은 모두 몇 명인지 구하시오.
Select COUNT(*) AS '등록된 학생'
From 학생;

-- #4. D1 학과의 소속 학생은 모두 몇 명인지 구하시오.
Select 학과번호 = 'D1', COUNT(학번) AS 'D1학과 소속'
From 학생
Where 학과번호 = 'D1';

-- #5. 컴퓨터공학 학과의 소속 학생은 모두 몇 명인지 구하시오.
Select COUNT(*) AS '컴퓨터공학 소속 학생 수'
From 학생, 학과
Where 학생.학과번호 = 학과.학과번호 AND 학과명 = '컴퓨터공학';

-- #6. 학과별 소속 학생 수를 학과번호별로 구하시오.
Select 학과번호, COUNT(*) AS '소속 학생 수'
From 학생
Group By 학과번호;

-- #7. 학과별 소속 학생 수를 학과명별로 구하시오.
Select 학과명, COUNT(*) AS '소속 학생 수'
From 학생, 학과
Where 학생.학과번호 = 학과.학과번호
Group By 학과명

-- #8. 모든 학생들의 평균 평점을 구하시오.
Select AVG(평점) AS '학생들의 평균 평점'
From 학생;

-- #9. 모든 학생들의 평균 평점보다 높은 학생의 이름은?
Select 이름
From 학생
Where 평점	>(
			Select AVG(평점)
			From 학생
			);

-- #10. 가장 높은 평점을 가진 학생의 이름과 평점을 검색하시오.
Select 이름, 평점
From 학생
Where 평점	=(
			Select MAX(평점)
			From 학생
			);

-- #11. 이메일이 입력되지 않은 학생의 이름은?
Select 이름
From 학생
Where 이메일 is null;

-- #12. 김씨 성을 가진 학생들의 이름은?
Select 이름
From 학생
Where 이름 Like '김%';

-- #13. 모든 학생의 학번, 이름, 소속, 학과명, 평점을 평점의 내림+차순으로 검색하시오.
Select 학번, 이름, 학과번호, 평점
From 학생
Order By 평점 DESC;

Select 학번, 이름, 학과명, 평점
From 학생, 학과
Where 학생.학과번호 = 학과.학과번호
Order By 평점 DESC;

-- #14. 평점이 3.0보다 높은 학생의 학번, 이름, 소속, 학과명을 이름의 가나다순으로 보이시오.
Select 학번, 이름, 학과명
From 학생, 학과
Where 학생.학과번호 = 학과.학과번호 AND 평점 > 3.0
Order By 이름 ASC;

-- #15. 이홍근 학생이 수강하는 과목이름을 검색하시오. (조인 / 중첩)
Select 과목이름
From 학생, 수강, 과목
Where 수강.학번 = 학생.학번
AND 과목.과목번호 = 수강.과목번호
AND 이름 = '이홍근';

Select 과목이름
From 과목
Where 과목번호	In(
				Select 과목번호
				From 수강
				Where 학번		In(
								Select 학번
								From 학생
								Where 이름 = '이홍근'
								)
				);



