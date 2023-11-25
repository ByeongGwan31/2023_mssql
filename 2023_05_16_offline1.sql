create database 구글스토어;

use 구글스토어;

create table 개발자 (
	개발자ID int not null,
	이름 char(10),
	연락처 char(20),
	소재지 char(20),
	primary key(개발자ID)
	);

create table 어플 (
	어플번호 int not null,
	장르 char(10),
	어플명 char(20),
	버전 float,
	용량MB float,
	등급 int,
	개발자ID int not null,
	년 int,
	월 int,
	일 int,
	primary key (어플번호),
	foreign key (개발자ID) references 개발자,
	);

create table 사용자 (
	사용자ID int not null,
	이름 int,
	연락처 char(20),
	년 int,
	월 int,
	일 int,
	primary key (사용자ID)
	);

create table 리뷰 (
	사용자ID int not null,
	어플번호 int not null,
	별점 float,
	내용 char(30),
	foreign key (사용자ID) references 사용자,
	foreign key (어플번호) references 어플,
	);

create table 결제 (
	사용자ID int not null,
	어플번호 int not null,
	결제금액 int,
	결제방법 char(30),
	foreign key (사용자ID) references 사용자,
	foreign key (어플번호) references 어플,
	);

Insert into 개발자 Values (1001, '강병관', '010-7531-2819', '서울시 구로구');
Insert into 개발자 Values (1002, '홍길동', '010-1234-5678', '서울시 강서구');
Insert into 개발자 Values (1003, '민주훈', '010-9431-8370', '경기도 평택시');

Select *
From 개발자;

Insert into 어플 Values (4701, '배달주문앱', '배달의 민족', 1.0, 102.5, 1, 1001, 2023, 5, 16);
Insert into 어플 Values (6934, '메신저앱', '백석톡', 1.0, 403.2, 1, 1002, 2021, 5, 16);
Insert into 어플 Values (3942, '소셜미디어', '네이버웹툰', 1.0, 850.4, 1, 1003, 2018, 8, 15);

Select *
From 어플;
