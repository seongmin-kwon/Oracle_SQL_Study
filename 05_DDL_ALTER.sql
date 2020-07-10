--테이블 수정(ALTER)
--
--1. 필드명의변경
---ALTER TABLE 이름 rename column 변경전 이름 to 변경후 이름

alter table booklist rename column title to subject; --booklist를 title로 바꾸겠다.
select * from Booklist;
select * from tabs;


--2. 필드 자료형의 변경
--varchar(12) 였던 person 테이블의 personname 필드를 varchar2(30)으로 변경
alter table person modify personname varchar2(30)
select * from person;

--3. 필드의 추가
--ALTER TABLE 테이블명 ADD 필드명 자료형
--booklist에 구매등급을 저장할 수있는 grade vlfemfmf varchar2(15)로 추가
alter table booklist add grade varchar2(15);

--person테이블에 성별(gender)필드 추가 varchar2(3)
alter table person add gender varchar2(3);

--person 테이블에 나이(age) 필드 추가 number(2)
alter table person add age number(2);

select * from person;

--4. 필드의 삭제 alter
--ALTER TABLE 테이블명 DROP COLUMN 필드명
--PERSON 테이블에서 성별 필드 제거

ALTER TABLE person DROP column gender;
select * from person;

--5.제약 조건의 추가/제거
--alter table 테이블명 add constraint 제약조건명 제약조건식

--person 테이블명에서 성별 필드에 'F','M'만 입력되도록 제약 조건 추가
alter table person add constraint check_gender check(gender in('F','M'));
--마치 if문 처럼말이다.
alter table person add constraint check_age check(age<=120);
--나이 제한같이 특정 값을 못넣게함.

--in_out테이블에서 dvdlist 테이블의 dvdnum을 참조하는 외래키 제거
alter table in_out drop constraint fk1;
--in_out 기본키 제거
alter table in_out drop constraint in_out_pk;
--in_out에서 기본키 다시 추가
alter table in_out add constraint in_out_pk primary key (out_date,indexk);
--in_out테이블에 booklist 테이블의 booknum 을 참조하는 외래키 다시 추가
alter table in_out add constraint fk1 foreign key (booknum)
references booklist(booknum);

--boolist의 grade필드에 '전체' '청소년구매가능','성인전용'으로 입력을 제한
alter table booklist add constraint check_grade
check(grade in('전체','청소년구매가능','성인전용'));
select *from booklist;




--예제 1 테이블 생성
--테이블명 ORDERS
--필드: ORDER_ID NUMBER(12,0), ORDER_DATE DATE, ORDER_MORE VARCHAR2(8),CUSTOMER_ID NUMBER(6,0),
--		ORDER_STATUS NUMBER(2,0) , ORDE_TOTAL NUMBER(8,2)  SALES_REP_ID NUMBER(6,0) PROMOTION_ID NUMBER(6,0),
--제약사항: 기본키는 ORDER_ID
--			ORDER_MODE에는 'direct' ,'online'만 입력가능
--			order_total의 디폴트값은 0
			
				
create table orders(
			ORDER_ID NUMBER(12,0) not null,
			ORDER_DATE DATE, 
			ORDER_MORE VARCHAR2(8) NOT NULL,
			CUSTOMER_ID NUMBER(6,0) NOT NULL,
			ORDER_STATUS NUMBER(2,0) NOT NULL,
			ORDE_TOTAL NUMBER(8,2) default 0,
			SALES_REP_ID NUMBER(6,0) NOT NULL,
			PROMOTION_ID NUMBER(6,0) NOT NULL,
			
			CONSTRAINT pk_order PRIMARY KEY(ORDER_ID),
			CONSTRAINT ck_order_mode check(ORDER_MORE in('direct','online'))
--alter table orders add constraint check_order check(ORDER_MORE in('direct','online'));
);

--예제 2 테이블 수정
--customer_id 필드명을 customer_number로 수정
--promotion_id 값은 10000~99999사이의 값만 저장가능

alter table orders rename column customer_id to customer_number;
alter table orders add constraint pro_check check(PROMOTION_ID between 10000 and 99999);

--테이블의 복사
create table orders_2 as select *from orders;
-- AS SELECT 구분은 다음에합니다.

--테이블의 제거
DROP TABLE ORDERS_2 PURGE;--PURGE는 생략 가능 
--PERGE 가 없이 삭제된 테이블은 나중에 휴지통과 같이 복구 가능 
--PURGE를 사용하면 완전 삭제 !!