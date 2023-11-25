create database 강병관쇼핑몰;

use 강병관쇼핑몰;

create table 고객 (
		고객번호 char(20) not null,
		고객명 char(20),
		주소 char(20),
		primary key (고객번호)
		);

Insert Into 고객 Values ('C100', '이희경', '서울서초구');
Insert Into 고객 Values ('C200', '배기영', null);
Insert Into 고객 Values ('C300', '성주원', '서울종로구');

Select *
From 고객;

create table 제조사 (
		회사번호 char(20) not null,
		회사명 char(20),
		매출액 int,
		primary key(회사번호)
		);

Insert Into 제조사 Values ('A01', '대성산업', 20000);
Insert Into 제조사 Values ('A02', '진아컴퓨터', 10000);

Select *
From 제조사;

create table 제품 (
		제품번호 char(20) not null,
		제품명 char(20),
		단가 int,
		제조사ID char(20) not null
		primary key (제품번호),
		foreign key (제조사ID) references 제조사(회사번호)
		);

Insert Into 제품 Values ('p_001', '마우스', 20000, 'A01');
Insert Into 제품 Values ('p_002', '키보드', 30000, 'A01');
Insert Into 제품 Values ('p_003', '모니터', 300000, 'A02');

Select *
From 제품;

create table 주문 (
		고객ID char(20) not null,
		제품ID char(20) not null,
		주문수량 int,
		primary key(고객ID, 제품ID),
		foreign key(고객ID) references 고객(고객번호),
		foreign key(제품ID) references 제품(제품번호)
	);

Insert Into 주문 Values ('C100', 'p_001', 10);
Insert Into 주문 Values ('C100', 'p_003', 6);
Insert Into 주문 Values ('C300', 'p_002', 1);
Insert Into 주문 Values ('C200', 'p_001', 20);

Select *
From 주문;

Select *
From 고객;

Select *
From 제품;

Select *
From 제조사;

Select *
From 주문;

-- #1. 이희경 고객이 주문한 제품 ID 와 주문수량을 검색하시오 .(조인 / 중첩)
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


-- #3. 쇼핑몰의 총 주문 수량을 구하시오.
Select SUM(주문수량) AS '총 주문수량'
From 주문;


-- #4. 제품 ID 그룹별 총 주문수량을 구하시오.
Select 제품ID, COUNT(주문수량) AS '제품 ID 주문수량'
From 주문
Group By 제품ID;


-- #5. 제품의 평균단가를 구하시오.
Select AVG(단가) AS '제품의 평균단가'
From 제품;

-- #6. 각 주문에 대하여 주문수량이 5~10인 제품명을 구하고 주문수량의 내림차순 검색하시오.
Select 주문수량
From 주문
Where 주문수량 BETWEEN 5 AND 10
Order By 주문수량 DESC;

-- #7. 서울에 거주하는 고객의 이름을 오름차순으로 검색하시오.
Select 고객명
From 고객
Where 주소 Like '서울%'
Order By 고객명 ASC;

-- #8. 주소가 입력되지 않은 고객의 이름은?
Select 고객명 AS '주소 입력 X'
From 고객
Where 주소 is null;


-- #9. 키보드 또는 모니터를 주문한 고객 ID는?
Select 고객ID
From 주문
Where 제품ID			IN(
						Select 제품번호
						From 제품
						Where 제품명 = '키보드' OR 제품명 = '모니터'
						);

-- #10. 키보드 또는 모니터를 주문한 고객명은?

Select 고객명
From 고객, 주문, 제품
Where 고객.고객번호 = 주문.고객ID 
AND 주문.제품ID = 제품.제품번호
AND (제품명 = '키보드' OR 제품명 = '모니터');

-- #10. 키보드 또는 모니터를 주문한 고객명은? (중첩)
Select 고객명
From 고객
Where 고객번호	In(
				Select 고객ID
				From 주문
				Where 제품ID		In(
								Select 제품번호
								From 제품
								Where 제품명 = '키보드' OR 제품명 = '모니터'
									)
				);



-- #11. 이희경 고객이 주문한 제품명을 검색하시오. (조인 / 중첩)

Select 제품명
From 고객, 주문, 제품
Where 고객.고객번호 = 주문.고객ID
AND 제품.제품번호 = 주문.제품ID
AND 고객명 = '이희경';

Select 제품명
From 제품
Where 제품번호		In(
					Select 고객번호
					From 고객
					Where 고객명 = '이희경'
					);

-- #12. 모니터를 주문한 고객의 이름과 주소를 검색하시오.

Select 고객명, 주소
From 고객, 주문, 제품
Where 고객.고객번호 = 주문.고객ID
AND 제품.제품번호 = 주문.제품ID
AND 제품명 = '모니터';

Select 고객명, 주소
From 고객
Where 고객번호	In(
				Select 고객ID
				From 주문
				Where 제품ID	=(
								Select 제품번호
								From 제품
								Where 제품명 = '모니터'
								)
				);

-- #13. 평균단가보다 높은 제품명은?
Select AVG(단가) AS '평균단가'
From 제품;

SELECT 제품명
FROM 제품
WHERE 단가 > (SELECT AVG(단가) FROM 제품);

Select 제품명
From 제품
Where 단가 >(
			Select AVG(단가)
			From 제품
			);

-- #14. p_001 제품명을 무선마우스로 수정하시오.
Update 제품
Set 제품명 = '무선마우스'
Where 제품번호 = 'p_001';

Select *
From 제품;

-- #15. 배기영 고객에 대한 정보를 삭제하시오. (결과는 왜?)
Delete
From 고객
Where 고객명 = '배기영';

Delete
From 주문
Where 고객ID	=(
				Select 고객번호 
				From 고객 
				Where 고객명 = '배기영'
				);

Select *
From 주문;

Select *
From 고객;

-- 11. 이희경 고객이 주문한 제품명과 주문수량을 검색하시오. (조인 / 중첩)

Select 제품명, 주문수량
From 고객, 주문, 제품
Where 고객.고객번호 = 주문.고객ID
AND 제품.제품번호 = 주문.제품ID
AND 고객명 = '이희경';