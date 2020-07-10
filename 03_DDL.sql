--SQL)DDL
--1.DDL(Data Definition Language) :
-- 데이터 정의어 란? 데이터베이스를 정의하는 언어이며,
-- 데이터리를 생성, 수정, 삭제하는 등의
-- 데이터의 전체의 골격을 결정하는 역할을 하는 언어 입니다.
-->종류

-- Create :테이블,뷰등을 생성할떄 사용하는 명령
--CREATE TABLE 테이블명(
--				필드명1 데이터타입 [디폴트값 제약조건 및 형식],
--				필드명2 데이터타입 [디폴트값 제약조건 및 형식],
--				필드명3 데이터타입 [디폴트값 제약조건 및 형식]
-- 								...
----);
--							<주의 사항>
--#테이블이름은 객체를의미할수 있는 적절한 이름을 사용합니다.
--#테이블이름은 다른 테이블과 중복되는 이름이면 안됩니다. 공백X
--#한 테이블 내에서 필드 이름이 중복되지 않게 합니다.
--#각필드는 "," 로 구분하여 생성합니다.
--#CREATE 를 비록한 모든 SQL명령은 ";"세미클론을 붙혀 마무리해야합니다.
--#필드 뒤에 DATATYPE은 반드시 지정하고 []안에 해당 내용이 있을때 작성하며, 생략가능합니다.
--#테이블명과 필드명은 반드시 문자로 시작해야하고 예약어 명령어 등을 테이블명과 필드명으로쓸수 없습니다.
--#테이블 생성시 대/소 문자는 구분하지 않습니다.(기본적으로 테이블이나 칼럼명은 대문자로 합니다.)
--Date유형은 별도로 크기를 지정하지않는다.
--#문자 데이터 유형은 반드시 가질수 있는 최대 길이를 표시해야합니다.
--#칼럼과칼럼의 구분은 콤마로 하되 , 마지막 컬럼은 콤마를 찍지 않습니다.

--테이블 작성예 (도서대여점 테이블)
create table BookList(
	BookNum varchar2(5) not null,--5 글자문자열,null값이 될수없게 하는 제약조건 추가
	title varchar2(30)	not null,
	makeyear number(4), --출판년도,숫자형식, 4바이트가 아니고 4자리 숫자라는 의미입니다.
	inprice number(6), --입고가격
	outprice number(6), --출고가격
	
	constraint booklist_pk primary key(BookNum) --추가 제약 조건 Booknum을 기본키로 설정
	--테이블의 외부에서 현재의 제약 조건을 boolist_pk 로 접근 가능합니다.
	
);

SELECT * FROM BookList; --테이블의 명령을 조회하는 명령

--#칼럼에 대한 제약 조건이 있으면 CONSTRAINT를 이용하여 추가할 수 있다.
--#제약 조건은 DvdNum뒤에 NotNull을 기술한것과 같은 필드 LEVEL 방식과
-- COSTRAINT로 테이블 생성 마지막에 모든 제약조건을 기술하는 테이블 LEVEL 방식이있다.

--#제약조건(CONSTRAINT)
--#PRIMARY KEY
-- 테이블에 저장된 레코드를 고유하게 식별하기위한 키 ,하나의 테이블에 하나의 기본키만 정의 할 수있습니다.
-- 여러 필드가 조합된 기본키 생성이 가능합니다.
-- 기본키는 중복된 값을 갖을 수 없으며 빈칸도 있을 수 없습니다.
-- PRIMARY KEY = UNIQUE KEY+ NOT NULL
-- 
-- #UNIQUE KEY
-- 테이블에 저장된 행 데이터를 고유하게 식별하기위한 고유키를 정의 합니다.
-- 단 NULL 은 고유키 제약의 대상이 아님으로,
-- NULL 값을 가진 행이 여러개가 UNIQUE KEY 제약에 위반하지는 않습니다.
-- 
-- #NOT NULL 
-- 비어있는상태, 아무것도 없는 상태를 허용하지 않습니다. -입력을 필수로해라
-- 
-- #CHECK  
-- IF문 처럼 참거짓을 얻어내서 본다.
-- 입력할 수 있는 값의 범위를 제한 한다.
-- CHECK제약으로는 TRUE OR FALSE 로 평가 할 수 있는 논리식을 지정합니다.
-- 
-- #FOREIGN KEY
-- 관계형 데이터 베이스 에서 테이블간의 관계를 정의 하기 위해
-- 기본키를 다른테이블의 외래키로 복사하는경우 외래키가 생성됩니다.
-- 이로서 참조 무결성 제약 옵션이 생성됩니다.

--EX02) 테이블생성 예제
--필드:	PersonNum, PersonName,  Phone, Birth, Bpoint
CREATE TABLE person(
	PersonNum VARCHAR2(5) NOT NULL , --필드레벨로 설정(Not NULL )
	PersonName VARCHAR2(12) NOT NULL,--필드레벨로 설정
	Phone VARCHAR2(13) NOT NULL,--필드레벨로 설정
	Birth DATE,
	enterDate DATE default sysdate,
	Bpoint NUMBER(6) default(0),
	
	CONSTRAINT person PRIMARY KEY(PersonNum) -->테이블 레벨로 설정
);
select * from person;

create table in_out(
	out_date DATE NOT NULL, --대여날짜 -조합한 기본키
	indexk NUMBER(3) NOT NULL,--대여순번 -조합한 기본키
	booknum VARCHAR2(5) NOT NULL,--대여도서번호
	personnum VARCHAR2(5) NOT NULL,--회원 번호
	discount NUMBER(6),--할인금액
	CONSTRAINT in_out_pk PRIMARY KEY(out_date,indexk), --마땅한 프라이머리 값이없을떄 이둘을 조합해서 고유한 키를만든것
	CONSTRAINT fk1 FOREIGN KEY(booknum) REFERENCES booklist(booknum),
	CONSTRAINT fk2 FOREIGN KEY(personnum) REFERENCES person(personnum)
	--데이터는 객체 무결성을 유지하도록 만들어야하낟. booknum 에없는값이 booknum 에 올수 없다.  - >참조 무결성
);
select * from in_out;
--out_date,indexk두개의 필드를 조합하여 기본키 (in_out_pk)를생성함.
--booknum 은 in_out테이블의 외래키 (fk1)로서 booklist 테이블의 booknum 참조함
--personnum in_out테이블의 외래키(fk2)로서  personnum 테이블의 personnum 참조함
--VARCHAR2 가VARCHAR1보다 용량도 크고  가변형으러 데이터를 관리해서 좋다. Default(0)입력하지않아도 0으로 들어감
--기본키 에 대한 무결성 --> 개체 무결성
-- 외래키에 대한 무결성 -->참조 무결성


--Alter : 이미 생성되어있는 테이블 또는 뷰 등의 구조를 수정하기 위한 명령
--Drop : 이미 생성되어있는 테이블 또는 뷰 등을 삭제하기위한 명령