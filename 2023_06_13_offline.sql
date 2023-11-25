create database 오프라인0613;

use 오프라인0613;

create table 부서 (
	부서번호 int not null,
	정보 char(30),
	primary key(부서번호)
	);

create table 직원 (
	직원번호 int not null,
	이름 char(10),
	연락처 int,
	성별 char(5),
	부서번호 int not null,
	primary key(직원번호),
	foreign key(부서번호) references 부서 (부서번호)
	);

create table 프로젝트 (
	프로젝트번호 int not null,
	프로젝트명 char(20),
	예산 int,
	primary key (프로젝트번호)
	);

create table 일하다 (
	역할 char(30),
	기간의정보 char(30),
	직원번호 int not null,
	프로젝트번호 int not null,
	primary key (직원번호, 프로젝트번호),
	foreign key (직원번호) references 직원(직원번호),
	foreign key (프로젝트번호) references 프로젝트(프로젝트번호),
	);

Insert Into 부서 values (1, '사업부');
Insert Into 부서 values (2, '생산부');
Insert Into 부서 values (3, '총무부');
Insert Into 부서 values (4, '관리부');
Insert Into 부서 values (5, '구매부');
Insert Into 부서 values (6, '인사부');
Insert Into 부서 values (7, '개발부');

Select *
From 부서;

Insert Into 직원 values (20191061, '강병관', 01075312819, '남', 7);
Insert Into 직원 values (20211867, '민주훈', 01094318370, '남', 4);
Insert Into 직원 values (20202934, '김민지', 01039492013, '여', 5);
Insert Into 직원 values (20301923, '김지수', 01032041312, '여', 3);
Insert Into 직원 values (20205912, '조석래', 01095745704, '남', 2);
Insert Into 직원 values (20208374, '임명훈', 01062496398, '남', 1);

Select *
From 직원;

Insert Into 프로젝트 values (10, '돈까스', 8000);
Insert Into 프로젝트 values (11, '제육볶음', 6000);
Insert Into 프로젝트 values (12, '짜파게티', 5000);
Insert Into 프로젝트 values (13, '냉모밀', 6500);
Insert Into 프로젝트 values (14, '육개장', 7500);

Select *
From 프로젝트;

Insert Into 일하다 values ('개발자', '하림', 20191061, 10);



create view 여성직원
as select 이름, 연락처
	from 직원
	where 성별 = '여'

Select *
From 여성직원;

create view 영업직원
as select 이름, 정보, 연락처
	from 직원, 부서
	where 직원.직원번호 = 부서.부서번호 and 정보 = '사업부'

Select *
From 영업직원;