create database TESTCompany;

use TESTCompany;

create table Department (
	DeptNo int not null,
	DeptName char (10),
	Floor int,
	primary key (DeptNo)
);

Insert Into Department Values (1, '영업', 8);

Select *
From Department;

-- #1. 8층에 위치한 부서 이름은?
Select DeptName
From Department
Where Floor = 8;


Insert Into Department Values (null, '기획', 10);
-- 기본키 값은 null이 안된다 -> 기본키와 엔터티무결성 제약조건		(기본키와 엔터티무결성 제약조건)

Insert Into Department Values (1, '기획', 10);
-- 키 제약조건 -> 기본키 애트리뷰트에 중복된 값이 존재해서는 안된다.	(키 제약조건)

Insert Into Department Values ('two', '기획', 10);
-- 부서번호라고 하는 것은 int 형태이기 때문에 char 로는 입력되지 않는다. (도메인 제약조건)