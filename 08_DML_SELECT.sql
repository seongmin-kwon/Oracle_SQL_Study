----select 문(검색)
----[1] scott 사용자가 관리하고 있는 테이블 목록
--select *from tab;
----[2] 특정 테이블의 구조 조회(필드)
--desc dept; --커맨드 창(sqlplus)확인요망
--desc person;
--
--slelct :select와 from 사이에 조회하고자하는 필드명들을, 구분하여 지목
--select dvdnum,subject,outprice from .....
--모든 필드를 한번에 지목하려면 *을 써줍니다. --select *from...
--from 뒤에는 대상 테이블 명을 써줍니다.
--where 절을 붙여서 조선에 맞는 행만 골라내기도 합니다.
--select ~~from~~where
--위와같이 연산식을 써서 연관된 결과를 필드로 조회하고자 할땐 as와 함께 만들어진 필드명을 지어주기도 합니다.
--select empno || '-' || ename as emp_info from
--]empno || '-' || ename: empno 값과 ename값을 '-'와 함쎄 이어 붙이기 하고  그렇게 만글어진
--필드의 이름은 emp_info로 설정합니다.
--필드명에 공백이 있거나 

--||  문자 이어붙히기
-- emp as k  emp를 k로 별칭주기


--[3]특정 테이블의 DATA 표시
SELECT * FROM IN_OUT;

--[4]모든 컬럼(필드명)이 아닌, 필요한 필드만 조회
SELECT SUBJECT,MAKEYEAR FROM BOOKLIST;

--[5]각각의 필드명에 별칭을 부여해서 출력
SELECT SUBJECT AS 영화제목, MAKEYEAR AS 출판년도 FROM BOOKLIST;
--(주의) 별칭에 띄어 쓰기 하지않습니다. 띄어쓰기가 들어간 별칭은 큰따옴표로 묶어서 사용합니다.
SELECT SUBJECT AS "영화 제목" ,MAKEYEAR AS "출판 년도" FROM BOOKLIST;


--[6]  중복 제거
select distinct booknum from in_out;
--in_out테이블 에서 booknum값만을 조회하되 중복된값은 한번만 표시하도록 조회합니다.
select  * from in_out;
select * from booklist;
select * from person;

--[7] 검색 조건의 추가 : 입고가격이 20000원 이상인 book 목록
select * from booklist where inprice>=20000;
--[8] 이름이 박지성인 회원의 모든 회원정보 만 출력
select * from person where personname ='권성민';
--[9] 1983년 이후로 태어난 회워의 모든 회원 정보
select * from person where birth>'1983/01/01';
--[10] 사은 포인트(bpoint) 가 250점 이상이고  1982년이후로 태어난 회원의 모든 회원정보
select * from person where bpoint >=250 and birth >='1982/10/10';
--[11]제작년도가 2016년이전이거나 입고 가격(inprice) 이 18000이하인 book정보
select * from booklist where makeyear < 2016 or inprice <= 18000;
--[12] 성명이 '이' 로 시작하는 회원의 모든정보
select * from person where personname like '권%';
--[13] 이름이 '주'으러 끝나는 회원의 모든 정보
select * from person where personname like '%주';
--[14]도서 제목에 '책' 가 포함되는 도서정보
select * from booklist where subject like '%책%';
--[15]사은 포인트가 null이 아닌 회원의 이름과 전화번호
select personname,phone from person where bpoint != null ;
--[16]도서 제목에 두번째 글자가 '것'인 도서정보 
select * from booklist where subject like '_것'; --신기하다 _면 2번째 __면 3번째 글자를 검사한다.


--조건식(ANY,SOME,ALL,(IN))
--WHERE 절에서 사용하는 그룹내 해당 요소 찾기 함수들
--1.ANY
SELECT EMPNO ,SAL FROM EMP WHERE DEPTNO =ANY(10,20,30,40)
--위와 아래의 조건식 결과가 동일함.
SELECT EMPNO,SAL FROM EMP
WHERE DEPTNO =10 OR DEPTNO =20 OR DEPTNO =30 DEPTTNO=40;
--ANY()괄호안에 나열된 내용중 어느하나라도 해당하는것이 있다면 검색 대상으로 함.

--2.ALL
SELECT EMPNO, SAL, DEPTNO FROM EMP WHERE SAL =ALL(2000,3000,4000);
--괄호안의 모든값이 동시에 만족해야하는 조건이므로 해당하는 레코드가 없을때가 대부분입니다. 사용빈도수도 낮습니다.

--3.SOME 조건식 -ANY와 동일 , IN과도 비슷!
SELECT EMPNO,SAL,DEPTNO FROM EMP WHERE DEPTNO = SOME(10,20,40);

--4.논리 조건식 NOT
SELECT empno,sal from emp where deptno not in(10,20,30,40);
--in()안에 있는것과 하나도 매칭 되지 않은 값이 검색 대상

--5.exists조건식
--in과 비슷하지만 후행 조건절로 값의 리스트가 아닌 서브 쿼리만 올수 있음
--또한 서브 쿼리내에 조인 조건이 있어야 정상작동 -JOIN 단원을 학습한후 다시 자세히 공부합시다.
SELECT DEPTNO,DNAME FROM DEPT A
WHERE EXISTS (SELECT * FROM EMP WHERE A.DEPTNO = B.DEPTNO AND B.SAL > 3000);

--정렬(SORT) -ORDER BY 필드명 [DESC]
--SELECT : 명령의 결과를 특정 필드값의 오름차순이나 내림 차순으로 정렬하라는 명령
--ASC : 오름차순 정렬,쓰지 않으면 기본 오름차순 정렬로 실행 됩니다.
--DESC :내림차순 정렬 , 내림차순 정렬을 위해서 반드시 필드명 뒤에 써야 하는 키워드 입니다.

SELECT * FROM TAB;

EMP 테이블에서 
SAL 1000이상인 데이터를 ENAME 의 오름 차순으로 정렬하여 조회
SELECT * FROM EMP WHERE SAL>= 1000 ORDER BY ENAME; --오름 차순 ASC 는생략
SAL이 1000이상인 데이터를 EMAME의 내림차순 으로 정렬하여 조회
SELECT * FROM EMP WHERE SAL >= 1000 ORDER BY ENAME DESC;

JOB으로 내림차순 정렬
SELECT * FROM EMP  ORDER BY JOB DESC;
JOB으로 내림차순 정렬 이후 같은  JOB_ID사이에서는 순서를 HIREDATE의 내림차순으로 정렬
SELECT * FROM EMP  ORDER BY JOB DESC, HIREDATE DESC ;
--두개 이상의 정렬 기준이 필요하다면 위와같이 , 로 구분해서 두가지 기준을 지정해주며,
--위의 예제로 봤을때 JOB 으로 1차 내림 차순 정렬하고, 같은 JOB 값들 사이에 HIREDATE 로 내림 차순 정렬합니다.

--CONTRIES 테이블 에서  COUNTRT_ISO 별로 내림차순 정렬
SELECT * FROM COUNTRIES ORDER BY COUNTRY_ISO_CODE DESC;
--CONTRIES 테이블에서   COUNTRT_REGION 별로 오름 차순 정렬, 같은 COUNTRY_REGION에서는 COUNTRY_NAME 별로 오름 차순 정렬

SELECT * FROM COUNTRIES ORDER BY   COUNTRT_REGION,COUNTRY_NAME;
--JOB 테이블에서 JOB_TITLE 별 내림 찻ㄴ 정렬, 같은 JOB_TITLE에서는 MAX_SALARY의 내림차순 정렬
SELECT * FROM JOBS ORDER BY JOB_TITLE DESC, MAX_SALARY DESC;


--그 외 활용하기 좋은 SELECT에 대한 예제
부서번호가 10이 아닌 사원(아래 두 문장은 같은 의미의 명령입니다.)
SELECT * FROM EMP WHERE NOT (DEPTNO =10);
SELECT * FROM EMP WHERE DEPTNO <>10;

--급여가 1000달러이상 ,3000달러이하
SELECT * FROM EMP WHERE SAL=10000 AND SAL<=3000;
SELECT * FROM EMP WHERE SAL  BETWEEN 10000 AND 3000;

--특정 필드값이 널인 레코드 또는 널이 아닌 레코드
SELECT * FROM EMP WHERE COMM IS NULL; --COMM 필드가 NULL인 레코드
SELECT * FROM EMP WHERE COMM IS  NOT NULL;  --COMM 필드가NOT NULL인 레코드



--사원의 연봉 출력
SELECT DEPTNO , ENAME, SAL *12 AS 연봉 FROM EMP;
--커미션을 포함한 사원의 연봉 출력
SELECT DEPTNO , ENAME, SAL *12+COMM  AS 연봉 FROM EMP;
--위 계산식의 경우 COMM 값이 널인 경우 계산식에 널이 포함되어 계산이 안되는 오류가 발생할 수있습니다.
--이때 해결방법
SELECT DEPTNO , ENAME,COMM, SAL *12+NVL(COMM,0) AS 연봉 FROM EMP;
--NVL 함수는 널값을 다른 값으로 바꿔주는 내장함수로서 다음 단원에 서 다른 ㅎ마수들과 함께 학습합니다
-- 혹시 널값이있으면 바꿔라





