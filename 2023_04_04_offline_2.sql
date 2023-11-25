create database 쇼핑몰;
use 쇼핑몰;

create table 고객 (
			고객번호 char(20) not null,
			고객명 char(20),
			주소 char(20)
			primary key(고객번호)
			);

Insert Into 고객 values('C100', '이희경', '서울서초구');
Insert Into 고객 values('C200', '배기영', null);
Insert Into 고객 values('C300', '성주원', '서울종로구');

Select *
From 고객;

create table 제품 (
			제품번호 char(20) not null,
			제품명 char(20),
			단가 int
			primary key (제품번호)
			);

Insert Into 제품 values('p_001', '마우스', 20000);
Insert Into 제품 values('p_002', '키보드', 30000);
Insert Into 제품 values('p_003', '모니터', 300000);

Select *
From 제품;


create table 주문 (
			고객ID char(20) not null,
			제품ID char(20) not null,
			주문수량 int,
			primary key (고객ID, 제품ID),
			foreign key(고객ID) references 고객(고객번호),
			foreign key(제품ID) references 제품(제품번호)
			);

Insert Into 주문 values('C100', 'p_001', 10);
Insert Into 주문 values('C100', 'p_003', 6);
Insert Into 주문 values('C300', 'p_002', 1);
Insert Into 주문 values('C200', 'p_001', 20);

Select *
From 고객;

Select *
From 제품;

Select *
From 주문;

--#1. 질의 작성

--#1. 이희경 고객이 주문한 제품 ID와 주문 수량을 검색하시오. (조인조건 / 중첩조건)

Select 제품ID, 주문수량
From 고객, 주문
Where 고객.고객번호 = 주문.고객ID   AND (고객명 = '이희경');

Select 제품ID, 주문수량
From 주문
Where 고객ID		=(
					Select 고객번호
					From 고객
					Where 고객명 = '이희경'
					);

-- #2. 등록된 고객은 모두 몇 명인지 구하시오.
Select COUNT(고객번호) AS '등록된 고객'
From 고객;


--#3. 쇼핑몰의 총 주문 수량을 구하시오.
Select SUM(주문수량) AS '총 주문수량'
From 주문;


--#4. 제품 ID 그룹별 총 주문수량을 구하시오.
Select SUM(주문수량) AS 'ID 그룹별 총 주문수량'
From 주문
Group By 제품ID;

--#5. 제품의 평균단가를 구하시오.
Select AVG(단가) AS '제품의 평균단가'
From 제품;

--#6. 각 주문에 대하여 주문수량이 5~10인 제품명을 구하오 주문수량의 내림차순 검색하시오.
Select 주문수량
From 주문
Where 주문수량 BETWEEN 5 AND 10
Order by 주문수량 DESC;

--#7. 서울에 거주하는 고객의 이름을 오름차순으로 검색하시오.
Select 고객명
From 고객
Where 주소 Like '서울%'
Order by 고객명 ASC;

-- #8. 주소가 입력되지 않은 고객의 이름은?
Select 고객명
From 고객
Where 주소 is null;

-- #9. 키보드 또는 모니터를 주문한 고객 ID는?

Select 고객ID
From 주문
Where 제품ID		In(
					Select 제품번호
					From 제품
					-- Where 제품명 IN ('키보드', '모니터')
					Where 제품명 = '키보드' OR 제품명 = '모니터'
					);

-- #10. 키보드 또는 모니터를 주문한 고객명은?
Select 고객명
From 고객
Where 고객번호	In(
				Select 고객ID
				From 주문
				Where 제품ID	In(
								Select 제품번호
								From 제품
								Where (제품명 = '키보드' OR 제품명 = '모니터')
								)
				);

--#11. 이희경 고객이 주문한 제품명을 검색하시오. (조인 / 중첩)

Select 제품명
From 제품, 고객, 주문
Where 제품.제품번호 = 고객.고객번호,  AND 고객명 = '이희경';

Select 제품명
From 제품
Where 제품번호		In(
					Select 제품ID
					From 주문
					Where 고객ID	In(
									Select 고객번호
									From 고객
									Where 고객명 = '이희경'
									)
					);
