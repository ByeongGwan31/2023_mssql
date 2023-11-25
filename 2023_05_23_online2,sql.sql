create database A쇼핑몰_강병관;

use A쇼핑몰_강병관;

create table 고객 (
	고객ID char(10) not null,
	고객명 char(10),
	전화번호 char(20),
	primary key (고객ID)
	);

insert into 고객 values ('c001', '이수진', '010-1234-5678');
insert into 고객 values ('c002', '김도윤', '010-4321-9876');
insert into 고객 values ('c003', '강병관', '010-7531-2819');
insert into 고객 values ('c005', '민주훈', '010-9431-8370');


create table 공급처 (
	공급처번호 int not null,
	공급처명 char(10),
	연락처 char(20),
	primary key (공급처번호)
	);

insert into 공급처 values (111, '오리온', '031-123-456');
insert into 공급처 values (222, '해태제과', '02-1234-5678');
insert into 공급처 values (333, '코카콜라', '02-333-5434');
insert into 공급처 values (4444, '빙그레', '041-1111-2345');
insert into 공급처 values (5555, '농심', '02-2321-3412');

create table 세일행사 (
	행사ID char(20) not null,
	기간 char(40),
	행사명 char(20),
	primary key(행사ID)
	);

insert into 세일행사 values ('H0', '20190525-20200525', '코리아');
insert into 세일행사 values ('H1', '20200531-20210531', '생일');
insert into 세일행사 values ('H2', '20210125-20220718', '전역');
insert into 세일행사 values ('H4', '20230515-20230523', '1주년');
insert into 세일행사 values ('H5', '20220501-20220601', '이마트행사');


create table 상품 (
	상품번호 int not null,
	상품명 char(10),
	단가 int,
	수량 int,
	공급처번호 int,
	행사ID char(20),
	할인율 real,
	primary key (상품번호),
	foreign key (공급처번호) references 공급처(공급처번호),
	foreign key (행사ID) references 세일행사(행사ID)
	);

insert into 상품 values (1234, '초코파이', 3000, 200, 111, 'H0', 0.5);
insert into 상품 values (5678, '홈런볼', 2500, 400, 222, 'H1', 0.8);
insert into 상품 values (4542, '꼬북칩', 1500, 300, 111, 'H1', 0.4);
insert into 상품 values (8785, '코카콜라', 1700, 350, 333, 'H2', 0.5);
insert into 상품 values (8129, '오메가3', 70000, 200, 4444, null, 0.2);

create table 구입 (
	고객ID char(10) not null,
	상품번호 int not null,
	날짜 char(20),
	구매수량 int,
	primary key(고객ID, 상품번호),
	foreign key(고객ID) references 고객(고객ID),
	foreign key(상품번호) references 상품(상품번호)
	);

insert into 구입 values ('c001', 1234, '23-05-22', 10);
insert into 구입 values ('c002', 4542, '23-05-23', 20);
insert into 구입 values ('c003', 5678, null, 5);
insert into 구입 values ('c004', 8129, '23-05-20', 20);
insert into 구입 values ('c005', 8785, '22-05-23', 30);

select *
from 고객;
select *
from 상품;
select *
from 공급처;
select *
from 구입;
select *
from 세일행사;


-- #1. '초코파이'를 구입한 고객의 고객명과 전화번호를 검색하시오.
Select 고객명, 전화번호
From 고객, 구입, 상품
Where 고객.고객ID = 구입.고객ID
AND 구입.상품번호 = 상품.상품번호
AND 상품명 = '초코파이';

Select 고객명, 전화번호
From 고객
Where 고객ID IN (
			 Select 고객ID
			 From 구입
			 Where 상품번호 = (
							Select 상품번호
							From 상품
							Where 상품명 = '초코파이'
							)
				);

-- #2. '코리아' 행사에 참여한 상품의 상품명과 단가 (원래 가격), 할인 된 가격을 검색하시오.
Select 상품명, 단가, 단가 * 할인율 AS '할인된 가격'
From 상품, 세일행사
Where 상품.행사ID = 세일행사.행사ID
AND 행사명 = '코리아';

-- #3. '오리온'에서 공급하는 상품명을 검색하시오.
Select 상품명
From 상품, 공급처
Where 상품.공급처번호 = 공급처.공급처번호
AND 공급처명 = '오리온';


-- #4. 여러분이 문제를 쓰고 SQL을 작성하세요. (단 각 테이블에 데이터를 5개는 입력해야한다.)

-- #할인율이 0.5보다 큰 상품을 검색하시오.
Select 상품번호, 상품명, 단가, 수량, 할인율
From 상품
Where 할인율 > 0.5
AND 공급처번호 IN (
				Select 공급처번호
				From 공급처
				)
				AND 행사ID IN (
				Select 행사ID
				From 세일행사
		);

-- #5. 여러분이 문제를 쓰고 SQL을 작성하세요.


-- # 가장 많은 상품을 구매한 사람의 고객ID, 고객명, 총 구매수량을 나타내시오.
Select 구입.고객ID, 고객명, 구매수량 AS 총구매수량
From 구입, 고객
Where 구입.고객ID = 고객.고객ID
AND 구입.구매수량 =(
				Select MAX(구매수량)
				From 구입
				);