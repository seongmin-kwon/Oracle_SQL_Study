--DML (Data Management Languge)
-- 데이터 조작언어

--INSERT(추가)
--UPDATE(수정)
--Delete(삭제)
--SELECT(조회 및 선택)

--[1] 샘플테이블 생성
create table exam01(
deptno number(2),--부서번호
dname varchar2(14),--부서명
loc varchar2(14)--위치
);

select *from exam01;


--[2]레코드 추가
--레코드 추가 명령 사용1
--insert into 테이블 이름(팔드명1,필드명2, ...) values(값1,값2,...)
--첫번째 방식은 필드명과 입력되어야 하는 값을 1:1 매핑하여 입력합니다.
--널 값이 있어도 되는 필드는 필드명과 값을 생략하고 입력가능합니다.
--값은 숫자와 문자를 구분 하여 입력합니다.

--레코드 추가 명령 사용2
--insert into 테이블 이름 values (전체 column(필드,열)에 넣을 VALUE 들);
--두번째 방식은 모든 필드에 해당하는 데이터를 모두 입력하는 경우로서 필드명들을 명령어 속에
--나열하지 않아도 되지만, 필드의 순서대로 빠짐없이 데이터가 나열되어야 하는 불편함도 있습니다.
--단 이방식은 널값의 표시를 다해줘야한다.

insert into exam01(deptno,dname,loc)values(10,'acount','newyork');
--[3]데이터 입력 행 생략
insert into exam01 values(30,'sales','chichago');
--[4]null값 입력
insert into exam01 values(40,'operation',null);
select *from exam01;

alter table booklist drop constraint check_grade; --제약조건: 제거 grade가 잘 안들어갔었다..

SELECT *FROM booklist;
insert into booklist(booknum,subject,makeyear,inprice,outprice,grade)
values('A001','책1',2020,12000,2500,'전체');

insert into booklist values('A002','책2',2020,12000,2500,'성인전용');
insert into booklist values('A003','책3',2018,12000,2500,'청소년');
insert into booklist values('A004','책4',2020,13000,2200,'전체');
insert into booklist values('A005','책5',2019,12000,2500,'전체');
insert into booklist values('A006','책6',2020,13000,2500,'전체');
insert into booklist values('A007','책7',2020,12000,2500,'성인전용');
insert into booklist values('A008','책8',2020,13000,2500,'전체');
insert into booklist values('A009','책9',2020,12000,2500,'전체');
insert into booklist values('A0010','책10',2020,13000,2200,'전체');


-- 이번엔 person table에 10명의 자료를 넣어보자

select * from person;
INSERT INTO PERSON(PERSONNUM,PERSONNAME,PHONE,BIRTH,ENTERDATE,BPOINT,AGE,GENDER)
VALUES('가01','홍길동','010-1232-2323','80/06/05','80/06/05',240,30,'M');
INSERT INTO PERSON VALUES('가02','홍길동','010-1232-2323','80/06/05','80/06/05',240,30,'M');
INSERT INTO PERSON VALUES('가03','남길순','010-1232-2323','80/06/05','80/06/05',240,30,'F');
INSERT INTO PERSON VALUES('가04','동식이','010-1232-2323','80/06/05','80/06/05',240,30,'M');
INSERT INTO PERSON VALUES('가05','홍길동','010-1232-2323','80/06/05','80/06/05',240,30,'M');
INSERT INTO PERSON VALUES('가06','민주','010-1232-2323','80/06/05','80/06/05',240,30,'F');
INSERT INTO PERSON VALUES('가07','홍길동','010-1232-2323','80/06/05','80/06/05',240,30,'M');
INSERT INTO PERSON VALUES('가08','사랑이','010-1232-2323','80/06/05','80/06/05',240,30,'F');
INSERT INTO PERSON VALUES('가09','홍길동','010-1232-2323','80/06/05','80/06/05',240,30,'M');
INSERT INTO PERSON VALUES('가10','권성민','010-1232-2323','80/06/05','80/06/05',240,30,'M');

SELECT *FROM PERSON;


SELECT *FROM IN_OUT;

INSERT INTO IN_OUT VALUES('2020/08/25',1,'A002','가03',100);
INSERT INTO IN_OUT VALUES('2020/08/25',2,'A002','가03',200);
INSERT INTO IN_OUT VALUES('2020/08/25',3,'A002','가03',300);
INSERT INTO IN_OUT VALUES('2020/08/25',4,'A002','가03',400);
INSERT INTO IN_OUT VALUES('2020/08/25',5,'A002','가03',500);
INSERT INTO IN_OUT VALUES('2020/09/25',6,'A002','가03',600);
INSERT INTO IN_OUT VALUES('2020/08/25',7,'A002','가03',700);
INSERT INTO IN_OUT VALUES('2020/08/25',8,'A002','가03',800);
INSERT INTO IN_OUT VALUES('2020/08/25',9,'A002','가03',50);

--commit
--BDMS 에서의 데이터 운영은 실시간으로 데이터 원본으로 작업하고 변경 사항이 저장되는 것이 아니라
--가상의 사본을 대상으로 작업하게 됩니다.
--이를 원본에 적용하기 위해서는 commit이라는 명령으로 원본에 적용해주어야 다른 접근에서 변경이 적용된 데이터를볼수 있습니다.
--다만 이클립스에서의 데이터베이스 운영은 Auto commit 이 적용되어 실행 즉시 적용되고 있습니다.
--일반적인 다른 DBMS의 는 커밋을 통해 사본을 작업후 최종 결과를 커밋해야 DB가 변경되는데 이클립스는 자동으로 커밋을 해준다.
--원래 하나의 디비에 여러명이 동시접근은 안됌


--[5] 데이터의 변경 - 수정(UPDATE)
--UPDATE 테이블명 SET 변경 내용 WHERE 검색조건
--명령문에 WHERE 이후 구문은 생량이 가능합니다.
--다만 이부분을 생략하면 모든 레코드를 대상으로해서 UPDATE 명령이 실행되어 모든 레코드가 수정됩니다.

--검색 조건: 필드명(비교-관계연산자) 조건값 으로 이루어진 조건연산이며, 흔히 자바에서 IF()괄호
--안에 사용하던 연산을 그대로 사용하는게 보통입니다.
--EX) 나이가 24세이상 : WHERE AGE>=24

--데이터 수정의 실예
--exam01 테이블에서 deptno 값을 모두 30으로 수정
update exam01 set deptno =30;
--exam01테이블에서 dname이 'account' 인 레코드의 deptno를10으로 수정
update exam01 set deptno = 10 where dname ='ACCOUNT';
--exam01테이블에서 dname이 'SALES' 인 레코드의 deptno를20으로 수정
update exam01 set deptno = 20 where dname ='SALES';
--exam01테이블에서 deptno이 'LOC' 인 레코드의 deptno를40으로 수정
update exam01 set deptno = 30 where dname ='SALES';
--exam01테이블에서 deptno이40'인 레코드의 loc을 'sikago' 수정
update exam01 set loc = 'sikago' where deptno 30;

update exam01 set loc='sikago' where dname='operation';

SELECT * FROM EXAM01;

select * from booklist;
 --booklist 테이블의 제목'봉제인형 살인사건'도서의 grade 를 '성인전용'으로 수정
update BOOKLIST set grade ='성인전용' where  SUBJECT ='책1';
 --emp 테이블의 모든 사원의 sal 값을 10% 씩 인상(sal=sal+(sal*0.1))
 update emp set sal=sal*(1.1);
 --emp 테이블에서 sal 값이 3000 이상인 사원의 급여 10%삭감
 update emp set sal=sal*(0.9) where sal>=3000;
 --hiredate 가 2020년 이전인 사원의 급여를 +2000->(2001-12-31 보다 작거나 같은)
 update emp set sal=sal+2000 where hiredate <'2001-12-31';
 --ename 이 j 로 시작하는 사원의 job을 manager 로 변경
 update emp set job ='manager' where ename like 'j%'; --j% 와일드카드 제이로 시작하는 모든글자, %j j로끝나는 문자열에서 만 시작끝번을 알기 위해 사용하나댜.
 --person 테이블에서 bpoint 가 200이 넘는 사람만 bpoint*100으로 변경
 update person set bpoint=bpoint*100 where bpoint>=200;
 --in_out 테이블에서 할인금액이 100원이 넘으면 모두 할인 금액을 90으로 변경
update in_out set discount=90 where discount>100; 

--레코드 삭제
--delete from 테이블명 where 조건식
--in_out 테이블에서 discount가 100이하인 레코드 삭제
delete from in_out where disco<100;
--where 절이없으면 테이블 내의 모든 레코드를 삭제합니다

select *from in_out;
select *from booklist;


--삭제의 제한
delete from BOOKLIST where subject='책3'; --외래키로 프라이머리 키를 만들었고 이때 두테이블의 조합으로만들어 무결성을 높혔는데  삭제할땐 어떨까? 같이지워애할끼?
--해당 도서가 대여내역 (in_out)에 존재하고 대여 ㅐ역의 도서번호가 booklist의 도서번호를참조하는 외래키가 설정되어있다면 booklist의 해당 도서는 삭제 됡 수 없습니다.
--도서가 지워지는 순간 in_out의 외래키 규칙에 위배됨으로 삭제되는거 자체가 불가능하게됩니다. 
--삭제 되려면 참조하고 있는 외래키의 옵션을 도서가 삭제되면 대여내역도 함께 삭제되는옵ㅅ션으로 변경해ㅎ야합니다 그런 설정이있는데요ㅕ

--외래키 삭제
alter table in_out drop constraint fk1;  --참조하는걸 없앰
--새로운 외래키 추가
alter table in_out add constraint foreign key(booknum)
references booklist(booknum) on delete cascade;  
--cascade는 참조하는외래키 를 다함께 삭제해서  in_out의 해당 도서대여내역도 함께 삭제하는옵션
--이렇게 한후에는 제한없이 삭제 가 잘됩니다.!


select *from booklist;
select*from in_out;

--person 테이블에서 회원 한명을 삭제 하면 , in_out테이블에서도 해당회원이 대여한 기록을 같이 삭제하도록
--외래키 설정을 바꿔주세요. *(외래키 제약 조건삭제후 재생성.)
select * from person;

alter table in_out drop constraint fk2; --외래키 조건 삭제

alter table in_out add constraint fk2 foreign key(personnum)
references person(personnum) on delete cascade;

delete from person where personname = '홍길동';
select * from person;
select * from in_out;

-- 수정의 경우 외래키 관계는 triger 이용 이후에 배움 다른부분은 on update cascade 있지만 오라클은없다.'


