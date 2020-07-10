--Function 내장함수
--[1]샘플 테이블인 dual 테이블
select * from  tab;  현재 사용자가 고유한 테이블 목록표시
select * from dual; 라이브러리 함수의 결과를 보기위한 키워드 사용 dual: 임시 데이터 출력시 사용함
--임시 데이터란 특정 테이블을 대상으로 하는 select 문이 아니면서 계산의 결과가 출력되어야 하는곳에 쓰는 키워드 입니다.
--임시테이터 출력
select sal*12 =nvl(comm,0)as "연봉" from emp; --emp테이블 대상
select 1234*1234 from dual ; --특정 테이블이 대상이 아닌 연산결과 조회

--** 문자열 처리 관련 함수 **
--lower():모든 문자를 소문자로 변환
select lower('Hong kil Dong') as "소문자" from dual;
--upper():모든 문자를 대문자로 변환
select upper('Hong kil Dong') as "대문자" from dual;
--initcap():첫문자만 대문자 변환
select initcap('hong kil dong') as "단어별첫글자만대문자" from dual;
--concat():문자열의 연결
select concat('이젠 IT','아카데미') from dual;
--length():문자열의 길이
select length('이젠 아카데미')as len1, length('이젠 아카데미 열공중') as len2 from dual;
--substr(): 문자열 추출
select substr('권성민 만세',2,4) from dual; -- 두글자부터 네글자 을 자름 자바의 썹스트링이랑다름..
--substr 의경우 자바의 substring 처럼 시작번째부터끝번째 +1이 아니라
--시작 번째 부터 글자수를 나타냅니다. 위의 예 경우 2번쨰 글자부터 네글자 표시

--instr() :문자열 시작위치
select instr('홍길동 만세 동그라미','동') from dual;
--lpad() rpad() : 자리지우기
select lpad('oracle',20,'#') from dual; --오라클글자를 20칸잡고 체움 남은칸은 #체움 left
select rpad('oracle',20,'*') from dual;--오라클글자를 20칸잡고 체움 남은칸은 *체움 right
--trim(): 칼럼이나 대상 문자열에서 특정문자가 첫번쨰 글이거나 마지막 글자이면 잘라내고 남은 문자열 반환
select trim('a' from 'aaaOracleaaaaaaaaaaaaaaaaaa') from dual;
select trim(' ' from 'Orale           ') from dual;


-- 수식 처리 관련 함수 --
--round():반올림(음수: 소수점 이상 자리)  -> excel의 라운드 함수와 같다.
--3: 반올림하여 표시하는 마지막자리수
--3: 소수점 4자리에서 반올림하여 세째자리까지 남김
select round(12.3456,0) from dual;

select round(128.9382,3) from dual;
select round(128.9382,2) from dual;
select round(128.9382,1) from dual;
select round(128.9382,0) from dual;
select round(128.9382,-1) from dual;
select round(128.9382,-2) from dual;


--abs(): 절대값
select abs(-10) from dual;
--floor() : 소수점 아래 절사 - 반올림 없음.
select floor(12.94567)from dual;
--trunc() :특정 자리 자르기 -반올림 없음.
select trunc (12.3456,3) from dual; --3은 남기고 싶은 소수점 아래 자리수
-- mod() :나머지
select mod(8,5) from dual; --8을 5로 나눈나머지



--** 날자 처리 관련함수 **
--sysdate :날짜   -- 윈도우 의 시스템 시간을 가져옴
select sysdate from dual;
--months_between() :개월수 구하기
select months_between('2020-12-31','2020-07-10') from dual;
--add_months():개월 수 더하기
select add_months(sysdate,200) from dual; --200개신음수쓰면 그만큼 줄어듦
--next_day(): 다가올 요일에 해당하는 날짜
select next_day(sysdate,'일요일') from dual;
--last_day(): 해당 달의 마지막 일 수
select last_day(sysdate) from dual;
select last_day('2020-07-10') from dual; --7월의 가장 마지막 일수 나옴
--***to_char():문자열로 반환
select to_char(sysdate,'yyyy-mm-dd') from dual;
--***to_date(): 날짜형 으로 반환
select to_date('2020/07/10','yyyy/mm/dd') from dual; --문자형을 그대로 계산  x date타입으로 바꿔야함

--nvl() :null인 데이터를 다른 데이터로 변경.
select comm/100 as comm_pct from emp;
--comm 필드 값에따라서 일부 레코드는 계산결과가 null이 나올 수 있음.
select nvl(comm,1)/100 as comm_pct from emp;  
--해당 필드 값이 null이면 1로 바꿔서 계산에 참여 그래서 1/100인거래..?

--deocde() : switch 문과 같은 기능
select ename,deptno,decode(
			10, 'account',
			20, 'research',
			30	, 'sales',
			40,   'sales',
			50,   'sales',
			60,   'sales',
			70,   'sales',
			80,   'sales',
			90,   'sales',
			100,  'sales',
			110,  'sales'
)as "부서이름" from emp;
--deptno 값이 무엇이냐에 따라 부서이름이 결정되어 결과 표시;
--부서번호(deptno) 필드와 부서명(dname) 필드가 정의되어 있는 테이블이 있다면 두개의 테이블을
--join 하여 표시하면 되지만 , 위의 경우 해당 테이블이 없을때 사용하는 방법입니다.


--case() : if~ else if 와 비슷한 구조
select ename,deptno,
	case when deptno = 10 then 'account',
	case when deptno = 20 then 'account',
	case when deptno = 30 then 'account',
	case when deptno = 40 then 'account',
	case when deptno = 50 then 'account',
	case when deptno = 60 then 'account',
	case when deptno = 70 then 'account',
	case when deptno = 80 then 'account',
	case when deptno = 90 then 'account',
	case when deptno = 100 then'account',
	case when deptno = 110 then'account',
			end as "부서명"
	from emp;

--POWER함수
SELECT POWER(2,3) POWER(3,3) POWER(3,3.0001)FROM dual;
--첫번쨰 요소값을 두번째 요소만큼 거듭제곱
--제곱근 sqrt
select sqrt(2), sqrt(5) from dual;









