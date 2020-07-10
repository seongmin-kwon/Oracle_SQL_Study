----DB에서 CREATE로 만들수 있는건 3개 TABLE, VIEW, SEQUENCE이다.
--그중 VIEW 를 정리 해보자.

--# 오라클 뷰(VIEW) ----> SELECT의 부산물 뷰 속엔 명령어가 저장되있다.
--물리적인 테이블에 근거한 논리적인 가상 테이블
--가상이란 단어는 실질적으로 데이터를 저장하고 있지 않기 때문에 붙인 것이고,
--테이블이란 단어는 실질적을 데이터를 저장하고 있지 않더라도 사용 계정자는
--마치 테이블을 사용하는것과 동일하게 뷰를 사용할 수 있기 때문에 붙인것입니다.
--뷰는 기본 테이블에서 파생된 객체로서 기본테이블에 대한 하나의 쿼리문입니다.
--실제 테이블에 저장된 데이터를 뷰를 통해서 볼수 있도록 합니다.
--사용자에게 주어진 뷰를 통해서 기본 테이블을 제한적으로 사용할 수 있습니다.
--뷰는 이미 존재하고 있는 테이블에 제한적으로 접근하도록 합니다.
--뷰를 생성하기 위해서는 실질적으로 데이터를 저장하고 있는물리적인 테이블이 
--존재해야하는데 이 테이블은 기본 테이블이라 합니다.
--두개이상의 테이블또는 한개이상의 테이블이나 또다은 뷰를 참조하는 객체 입니다.
--저장된 테이블 이라기 보다 공식또는 SELECT문을 갖고 있다가 명령 데로 불러와 그때그때 구성하는 형식입니다.
--원본의 데이터 변화가 실시간으로 반영됩니다.
--생성 방법
--CREATE OR RePLACE VIEW 뷰이름 AS (SELECT 구문: 검색해서 명령을 보기위한 명령)
--SELECT 명령과 JOIN 명령 학습후 다시 상세하게 공부할 예정입니다.
--
--



--#오라클 -시퀀스(SEQUENCE)--> 프라이머리키를 적절히 만들어주겠다. 비어있지않고 중복 x숫자 만들어주니까
--			:테이블 내의 유일한 숫자들 자동으로 생성하는 번호 발생기.
--			:테이블 생성루 시퀀스(일련번호)를따로 만들어야한다.
----생성방법
--CREATE SEQUENCE 시퀀스 이름 START WITH 시작 숫자 INCREMENT BY 증가량;


--[1] 샘플 테이블 생성
CREATE TABLE memos(
num number(4) constraint memos_num_pk primary key,
name varchar(20) constraint memos_name_nn not null,
postDate Date default(sysdate)
);

--[2] 해당 테이블의 시퀀스 생성
CREATE sequence memos_seq start with 1 increment by 1;
--memos_seq :시퀀스의 이름
--start with 1: 시작 숫자
--increment by 1 : 증감량

--[3]데이터 입력 : 일련 번호 포함.
insert into memos(num,name) values(memos_seq.nextVal,'홍길동');
insert into memos(num,name) values(memos_seq.nextVal,'이순신');
insert into memos(num,name) values(memos_seq.nextVal,'강감찬');
insert into memos(num,name) values(memos_seq.nextVal,'유관순');
insert into memos(num,name) values(memos_seq.nextVal,'장영실');

select *from memos;

--[4] 현재 시퀀스가 어디까지 증가되어져 있는지 확인.
select memos_seq.currval from dual;
--select memos_seq.currval,memos_seq.currval from dual; //이렇게도 가능
--[5]시퀀스 수정: 최대 증가값을 14 까지 제한
alter sequence memos_seq maxvalue 14;
insert into memos(num,name) values(memos_seq.nextVal,'아해1');
insert into memos(num,name) values(memos_seq.nextVal,'아해2');
insert into memos(num,name) values(memos_seq.nextVal,'아해3');
insert into memos(num,name) values(memos_seq.nextVal,'아해4');
insert into memos(num,name) values(memos_seq.nextVal,'아해5');
select *from memos;

--[6]시퀀스 삭제
drop sequence memos_seq;
--[7] 시퀀스 재생성 : 14 다음 숫자부터 시작하게 하여 기존 레코드와 중복되지 않게 합니다.
create sequence memos_seq start with 15 increment by 1;

