create database DBOTT0530;

use DBOTT0530;

create table 이용권 (
	이용권번호 int not null,
	혜택 char(20),
	이용금액 int,
	이용권명 char(20)
	primary key (이용권번호)
	)

insert into 이용권 values (40124, '일반결제', 7800, '일반');
insert into 이용권 values (50302, '매달결제', 7800, '일반');
insert into 이용권 values (34583, '일반결제', 12800, '프리미엄');
insert into 이용권 values (39821, '매달결제', 5400, '베이직');
insert into 이용권 values (91023, '매달결제', 12800, '프리미엄');

Select *
From 이용권;

create table 고객 (
	고객ID int not null,
	비밀번호 char(20),
	이메일 char(20),
	이용권번호 int not null,
	primary key (고객ID),
	foreign key (이용권번호) references 이용권(이용권번호)
	)

insert into 고객 values (20191061, 'xptmxm123', '2000bk@naver.com', 50302);
insert into 고객 values (20211867, 'wngns123', 'wngns@naver.com', 39821);
insert into 고객 values (20201302, 'wnstj567', 'wnstj@naver.com', 91023);
insert into 고객 values (20228472, 'wjdghks012', 'wjdghks@gmail.com', 50302);

Select *
From 고객;

create table 컨텐츠 (
	컨텐츠번호 int not null,
	컨텐츠명 char(20),
	제작년도 int,
	구입금액 int,
	관람등급 int,
	primary key (컨텐츠번호)
	)

insert into 컨텐츠 values (1, '겨울왕국', 2013, 197835, 1);
insert into 컨텐츠 values (2, '토이스토리4', 2019, 41623682, 1);
insert into 컨텐츠 values (3, '카지노', 2022, 9302911, 18);
insert into 컨텐츠 values (4, '가디언즈오브갤럭시2', 2017, 401230, 12);
insert into 컨텐츠 values (5, '공조2', 2022, 6938, 15);

Select *
From 컨텐츠;


create table 구입 (
	고객ID int not null,
	컨텐츠번호 int not null,
	날짜 int,
	재생기간 char(20),
	primary key (고객ID, 컨텐츠번호),
	foreign key (고객ID) references 고객(고객ID),
	foreign key (컨텐츠번호) references 컨텐츠(컨텐츠번호)
	)

Select *
From 고객;

Select *
From 컨텐츠;

Select *
From 구입;

insert into 구입 values (20191061, 3, 2022, 2);
insert into 구입 values (20201302, 1, 2015, 1);
insert into 구입 values (20211934, 4, 2021, 3);
insert into 구입 values (20228472, 5, 2023, 1);
insert into 구입 values (20211867, 2, 2021, 4);

Select *
From 구입;

create table 평가 (
	고객ID int not null,
	컨텐츠번호 int not null,
	감상평 char(30),
	점수 int,
	primary key (고객ID, 컨텐츠번호),
	foreign key (고객ID) references 고객(고객ID),
	foreign key (컨텐츠번호) references 컨텐츠(컨텐츠번호)
	)

Select *
From 고객;

Select *
From 컨텐츠;

Select *
From 구입;

insert into 평가 values (20191061, 3, '너무 재미있었습니다.', 9);
insert into 평가 values (20201302, 1, '감동이었습니다. 눈물 흘렸어요', 10);
insert into 평가 values (20211867, 2, '울었습니다. 슬퍼요..', 8);
insert into 평가 values (20211934, 4, '와 역시 믿고 보는 가오갤 짱짱', 10);
insert into 평가 values (20228472, 5, '생각보다 별로였네요..', 4);

Select *
From 평가;

-- 이용권, 고객, 컨텐츠, 구입, 평가

Select *
From 이용권;
Select *
From 고객;
Select *
From 컨텐츠;
Select *
From 구입;
Select *
From 평가;

-- #1. 베이직을 이용권을 사용하는 회원의 고객ID를 나타내시오.

Select 고객ID
From 고객
Where 이용권번호 =(
			Select 이용권번호
			From 이용권
			Where 이용권명 = '베이직'
			);

-- #2. 카지노라는 컨텐츠명을 구입한 사람의 고객ID와 이메일을 나타내시오.

Select 고객ID, 이메일
From 고객
Where 고객ID =(
			Select 고객ID
			From 구입
			Where 컨텐츠번호 =(
							Select 컨텐츠번호
							From 컨텐츠
							Where 컨텐츠명 = '카지노'
							)
			);

Select *
From 이용권;
Select *
From 고객;
Select *
From 컨텐츠;
Select *
From 구입;
Select *
From 평가;