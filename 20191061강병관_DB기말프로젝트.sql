create database finalproject;

use finalproject;

create table 학부 (
	학과ID int not null,
	학과명 char(20) not null,
	위치 char(20)
	primary key(학과ID, 학과명)
	);

create table 전공 (
	전공명 char(30) not null,
	primary key (전공명)
	);

create table 교수 (
	교수ID int not null,
	이름 char(10),
	연락처 char(20),
	호봉 char(10),
	학과ID int not null,
	학과명 char(20) not null,
	primary key(교수ID),
	foreign key(학과ID, 학과명) references 학부(학과ID, 학과명)
	);

create table 학생 (
	학생ID int not null,
	이름 char(20),
	연락처 char(20),
	학년 int,
	학과ID int not null,
	학과명 char(20) not null,
	전공명 char(30) not null,
	교수ID int not null,
	primary key(학생ID),
	foreign key(학과ID, 학과명) references 학부(학과ID, 학과명),
	foreign key(전공명) references 전공(전공명),
	foreign key(교수ID) references 교수(교수ID)
	);

create table 강좌세부 (
	강좌ID int not null,
	강좌명 char(30) not null,
	교과군 char(20) not null,
	primary key(강좌ID, 강좌명, 교과군)
	);

insert into 강좌세부 values (154701, '이산수학', '기초교과군');
insert into 강좌세부 values (0138101, '소프트웨어공학', '심화교과군');
insert into 강좌세부 values (118201, '데이터통신', '심화교과군');
insert into 강좌세부 values (218901, '운영체제론', '심화교과군');
insert into 강좌세부 values (367202, 'C++ 프로그래밍', '핵심교과군');
insert into 강좌세부 values (614902, '빅 데이터', '응용교과군');
insert into 강좌세부 values (367402, '데이터베이스 이론 및 실습', '심화교과군');
insert into 강좌세부 values (685401, 'JSP와서블릿', '심화교과군');
insert into 강좌세부 values (994202, '알고리즘 및 실습', '심화교과군');
insert into 강좌세부 values (948104, '파이썬 프로그래밍', '기초교과군');
insert into 강좌세부 values (367102, 'JAVA 프로그래밍', '핵심교과군');
insert into 강좌세부 values (0966203, '파이썬 응용', '핵심교과군');
insert into 강좌세부 values (0994301, '웹응용 프로그래밍', '심화교과군');


create table 강좌 (
	학과ID int not null,
	학과명 char(20) not null,
	전공명 char(30) not null,
	강좌ID int not null,
	강좌명 char(30) not null,
	교과군 char(20) not null,
	강의실 char(30),
	강의시간 char(30),
	학점 int,
	비고 char(30),
	학생ID int not null,
	교수ID int not null,
	foreign key(강좌ID, 강좌명, 교과군) references 강좌세부(강좌ID, 강좌명, 교과군),
	foreign key(전공명) references 전공(전공명),
	foreign key(학생ID) references 학생(학생ID),
	foreign key(교수ID) references 교수(교수ID),
	foreign key(학과ID, 학과명) references 학부(학과ID, 학과명)
	);

insert into 학부 values(001, '컴퓨터공학부', '본부동 716호');

insert into 전공 values('소프트웨어학');
insert into 전공 values('멀티미디어학');
insert into 전공 values('정보보호학');
insert into 전공 values('정보통신학');
insert into 전공 values('인공지능학');

insert into 교수 values(140119, '이시은', '041-550-0506', '교원', 001, '컴퓨터공학부');
insert into 교수 values(120304, '강경우', '041-550-0496', '교원', 001, '컴퓨터공학부');
insert into 교수 values(080103, '윤택현', '041-550-2534', '학부장', 001, '컴퓨터공학부');
insert into 교수 values(135084, '강윤희', '041-550-0504', '교원', 001, '컴퓨터공학부');
insert into 교수 values(175046, '김병철', '041-550-9176', '교원', 001, '컴퓨터공학부');
insert into 교수 values(158012, '유진호', '041-550-0493', '교원', 001, '컴퓨터공학부');
insert into 교수 values(175054, '이승화', '041-550-2480', '교원', 001, '컴퓨터공학부');
insert into 교수 values(146050, '최미영', null, '교원', 001, '컴퓨터공학부');
insert into 교수 values(178940, '임석구', '041-550-2478', '교원', 001, '컴퓨터공학부');
insert into 교수 values(138765, '홍경호', '041-550-2446', '교원', 001, '컴퓨터공학부');
insert into 교수 values(161490, '곽노윤', '041-550-0505', '교원', 001, '컴퓨터공학부');
insert into 교수 values(120474, '이성훈', '041-550-2433', '교원', 001, '컴퓨터공학부');
insert into 교수 values(157404, '이현섭', null, '교원', 001, '컴퓨터공학부');

select *
from 교수;

insert into 학생 values(20191061, '강병관', '010-7531-2819', 3, 001, '컴퓨터공학부', '소프트웨어학', 120304);
insert into 학생 values(20202345, '김지훈', '010-4412-3412', 2, 001, '컴퓨터공학부', '멀티미디어학', 175046);
insert into 학생 values(20211934, '전의산', '010-9491-9874', 3, 001, '컴퓨터공학부', '소프트웨어학', 140119);
insert into 학생 values(20223412, '한유섬', '010-1929-3945', 2, 001, '컴퓨터공학부', '인공지능학', 158012);
insert into 학생 values(20220974, '박성한', '010-2020-2021', 2, 001, '컴퓨터공학부', '정보보호학', 135084); 
insert into 학생 values(20204032, '김성현', '010-1913-2410', 4, 001, '컴퓨터공학부', '소프트웨어학', 080103);
insert into 학생 values(20183424, '김민식', '010-5060-4012', 3, 001, '컴퓨터공학부', '멀티미디어학', 157404);
insert into 학생 values(20219403, '박종훈', '010-3123-4677', 2, 001, '컴퓨터공학부', '인공지능학', 161490);
insert into 학생 values(20231034, '오원석', '010-5345-8070', 1, 001, '컴퓨터공학부', '소프트웨어학', 175046);

Select *
From 학부;

Select *
From 전공;

Select *
From 교수;

Select *
From 학생;

insert into 강좌 values (001, '컴퓨터공학부', '소프트웨어학', 0138101, '소프트웨어공학', '심화교과군', '본부동 511호','월요일 10:00-12:00', 3, '사이버강의', 20202345, 175054);
insert into 강좌 values (001, '컴퓨터공학부', '소프트웨어학', 0994301, '웹응용 프로그래밍', '심화교과군', '본부동 518호', '수요일 15:00-18:00', 3, '사이버강의', 20191061, 120304);
insert into 강좌 values (001, '컴퓨터공학부', '소프트웨어학', 0154701, '이산수학', '기초교과군', '본부동 302호', '화요일 10:00-12:00', 3, null, 20231034, 146050);
insert into 강좌 values (001, '컴퓨터공학부', '인공지능학', 0118201, '데이터통신', '심화교과군', '본부동 516호', '월요일 13:00-16:00', 3, '사이버강의', 20204032, 178940);
insert into 강좌 values (001, '컴퓨터공학부', '멀티미디어학', 0218901, '운영체제론', '심화교과군', '본부동 318호', '화요일 10:00-12:00', 3, '사이버강의', 20231034, 158012);
insert into 강좌 values (001, '컴퓨터공학부', '멀티미디어학', 0367202, 'C++ 프로그래밍', '핵심교과군', '본부동 515호', '목요일 09:00-12:00', 3, '사이버강의', 20211934, 157404);
insert into 강좌 values (001, '컴퓨터공학부', '소프트웨어학', 0614902, '빅 데이터', '응용교과군', '본부동 520호', '수요일 09:00-12:00', 3, '사이버강의', 20191061, 140119);
insert into 강좌 values (001, '컴퓨터공학부', '소프트웨어학', 0367402, '데이터베이스 이론 및 실습', '심화교과군', '본부동 520호', '화요일 10:00-13:00', 3, '사이버강의', 20191061, 140119);
insert into 강좌 values (001, '컴퓨터공학부', '소프트웨어학', 0685401, 'JSP와서블릿', '심화교과군', '본부동 210호', '목요일 15:00-18:00', 3, '사이버강의', 20191061, 175046);
insert into 강좌 values (001, '컴퓨터공학부', '멀티미디어학', 0994202, '알고리즘 및 실습', '심화교과군', '본부동 520호', '목요일 13:00-17:00', 3, '사이버강의', 20220974, 120474);
insert into 강좌 values (001, '컴퓨터공학부', '소프트웨어학', 0367402, '데이터베이스 이론 및 실습', '심화교과군', '본부동 520호', '화요일 10:00-13:00', 3, '사이버강의', 20211934, 140119);
insert into 강좌 values (001, '컴퓨터공학부', '멀티미디어학', 0948104, '파이썬 프로그래밍', '기초교과군', '본부동 505호', '월요일 15:00-18:00', 3, '사이버강의', 20204032, 161490);
insert into 강좌 values (001, '컴퓨터공학부', '소프트웨어학', 0367102, 'JAVA 프로그래밍', '핵심교과군', '본부동 504호', '목요일 12:00-15:00', 3, '사이버강의', 20202345, 135084);
insert into 강좌 values (001, '컴퓨터공학부', '인공지능학', 0966203, '파이썬 응용', '핵심교과군', '본부동 515호', '화요일 13:00-17:00', 3, null, 20211934, 138765);

Select *
From 강좌;


Select *
From 학부;

Select *
From 전공;

Select *
From 교수;

Select *
From 학생;

Select *
From 강좌세부;

Select *
From 강좌;
