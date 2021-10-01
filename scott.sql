-- SQL 은 대소문자 구별은 안함(쿼리문)
-- 대소문자 구별은 비밀번호만 함
-- 문자열 표현할 때 홑따옴표 사용함

-- scott 계정에 존재하는 모든 테이블 조회
SELECT
    *
FROM
    tab;

-- 조회(Select) : 행 단위로 조회, 열 단위로 조회

-- emp 테이블의 내용을 전체조회
SELECT
    *
FROM
    emp;

-- emp 테이블의 empno, ename, job만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;

-- emp 테이블의 empno, deptno 조회
SELECT
    empno,
    deptno
FROM
    emp;


-- 중복 제거 후 조회 : distinct

SELECT DISTINCT
    deptno
FROM
    emp;

-- 별칭을 붙여서 조회 : AS(alais)
SELECT
    empno AS 사원번호
FROM
    emp;

SELECT
    ename           AS 사원명,
    job             AS "직 책",
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm AS 연봉
FROM
    emp;
    

-- 정렬 : ORDER BY 컬럼명 기준(오름차순(ASC),내림차순(DESC))

-- ename,sal 조회할 때 sal 내림차순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

-- 오름차순(생략가능-기본값)
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;

-- EMP 테이블의 전체 내용을 조회하고, 단 사원번호 내림차순 정렬
SELECT
    *
FROM
    emp
ORDER BY
    empno DESC;
    
-- 전체 내용 조회(부서번호 오름차순, 급여 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

-- [문제] 조회할 테이블은 EMP 테이블이며 모든 열을 출력한다.
SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no,
    job,
    hiredate
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;
    

-- 특정 조건을 기준으로 원하는 데이터를 조회 : WHERE  

-- 전체 데이터 조회, 단, 부서번호가 30번인 데이터 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;
    
-- 사원번호가 7782 번 조회    
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- 부서번호가 30번이고, 사원직책이 SALESMAN 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;


-- 부서번호가 30이거나 사원직책이 CLERK인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';


-- 연산자를 사용한 WHERE

-- 연봉이 36000 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- 월급이 3000 보다 큰 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal > 3000;

-- 월급이 3000 이상인  사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

-- 이름의 첫 글자가 F 이후인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

-- 급여가 2500이상이고, 직업이 ANALYST인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

-- 직무가 SALESMAN 이거나, CLERK 이거나, MANAGER 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'ANALYST'
    OR job = 'CLERK'
    OR job = 'MANAGER';

-- 등가비교연산자(같음  = ,  같지않음 =>  !=, <>, ^=)
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;


-- IN 

SELECT
    *
FROM
    emp
WHERE
    job IN ( 'ANALYST', 'CLERK', 'MANAGER' );

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'ANALYST', 'CLERK', 'MANAGER' );

-- 부서번호가 10,20번 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );


-- BETWEEN A AND B 

-- 급여가 2000 ~ 3000 사이인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

-- 급여가 2000 ~ 3000 사이가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드
-- 일부 문자열이 포함된 데이터 조회
-- 와일드카드 
-- ①  % : 길이와 상관없이 모든 문자 데이터를 의미
-- ②  _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미


-- 사원명이 S로 시작하는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- 사원명의 두번째 글자가 L인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

-- 사원명에 AM 문자가 포함되어 있지 않은 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

-- IS NULL 
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
-- NULL 은 0이 아니고 완전히 비어 있는 상태를 의미

-- MGR이 NULL 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

-- MGR이 NULL이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

-- 집합 연산자 : 합집합 - UNION, UNION ALL(중복값을 제거하지 않음), 
--               교집합 - INTERSECT
--               차집합 - MINUS


-- EMPNO,ENAME,SAL,DEPTNO 조회(부서번호가 10번이거나 20번인)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    sal,
    job,
    deptno,
    sal
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;


-- 오라클 함수

-- 내장함수 - 1) 문자함수

--               대소문자 변경
--               UPPER(문자열) : 괄호 안 문자를 모두 대문자로 변환
--               LOWER(문자열) : 괄호 안 문자를 모두 소문자로 변환
--               INITCAP(문자열) : 괄호 안 문자 중 첫글자만 대문자로 변환, 나머지는 소문자

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

-- ENAME이 SCOTT 인 찾기
SELECT
    *
FROM
    emp
WHERE
    lower(ename) = lower('scott');

SELECT
    *
FROM
    emp
WHERE
    lower(ename) LIKE lower('%scott%');


--               문자 길이 구하기
--               LENGTH(문자열) : 해당 문자열의 길이 돌려줌
--               LENGTHB(문자열) : 해당 문자열의 바이트수 돌려줌

SELECT
    ename,
    length(ename)
FROM
    emp;

-- 한글 한 자당 3BYTE 사용
-- DUAL : 데이터베이스 관리자가 소유한 테이블 / 임시 연산이나 함수의 결과 값 확인 용도
SELECT
    length('한글'),
    lengthb('한글')
FROM
    dual;

-- JOB 이 6글자 이상인 사원들 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;

--               문자열 일부를 추출하기
--               SUBSTR(문자열데이터,시작위치,추출길이)
--               SUBSTR(문자열데이터,시작위치)
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

-- EMP 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력하기
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;


--               문자열 데이터 안에서 특정 문자를 찾기
--               INSTR(문자열,찾을 문자열,시작위치(옵션), 몇번째에 있는걸 찾을 것인지(옵션)) 

SELECT
    instr('HELLO, ORACLE!', 'L'),
    instr('HELLO, ORACLE!', 'L', 5),
    instr('HELLO, ORACLE!', 'L', 2, 2)
FROM
    dual;
    
-- 원본 문자열 : 이것이 Oracle이다. 이것도 오라클이다.
-- 찾을 문자열 : 이것

-- 제일 처음에 나오는 이것의 위치를 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것')
FROM
    dual;

-- 시작위치를 3으로 지정한 후 나오는 이것의 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 3)
FROM
    dual;

-- 이것이 두번째로 나오는 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 1, 2)
FROM
    dual;


-- 사원 이름에 문자 S가 있는 사원 구하기
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S%';


--               특정 문자를 다른 문자로 바꾸는 함수
--               REPLACE(문자열 데이터 또는 열이름,찾는문자,바꿀문자)

-- 010-1234-5678 => 010 1234 5678, 01012345678
SELECT
    '010-1234-5678'                    AS 원본,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace2
FROM
    dual;
    

--               두 문자열 데이터를 합치는 함수
--               CONCAT(문자열1,문자열2)

-- EMPNO,ENAME 합쳐서 조회
SELECT
    empno,
    ename,
    concat(empno, ename)
FROM
    emp
WHERE
    ename = 'SCOTT';
    
-- 7788:SCOTT     
SELECT
    empno,
    ename,
    concat(empno,CONCAT(':',ename))
FROM
    emp
WHERE
    ename = 'SCOTT';  
    
-- || : 문자열 데이터 연결 연산자

SELECT
    empno || ename,
    empno || ':' || ename
FROM
    emp
WHERE
    ename = 'SCOTT';
    
-- 현재 날짜를 기준으로 입사 38년 미만인 사원 조회
SELECT ename, HIREDATE FROM emp
WHERE ADD_MONTHS(HIREDATE,480) > SYSDATE;

-- MONTHS, BETWEEN : 두 날짜 간의 개월 수 차이 구하기
SELECT EMPNO, ENAME, HIREDATE, SYSDATE, 
MONTHS_BETWEEN(SYSDATE,hiredate) AS MONTH1,
MONTHS_BETWEEN(hiredate,SYSDATE) AS MONTH2,
TRUNC(MONTHS_BETWEEN(hiredate,SYSDATE)) AS MONTH3
FROM EMP;

-- next_day(날짜,요일문자)
-- last_day(날짜)

SELECT sysdate,next_day(sysdate,'월요일'),last_day(sysdate)
from dual;
    
-- 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY/MM/DD') AS 현재날짜 FROM DUAL;

SELECT SYSDATE,TO_CHAR(SYSDATE,'MM') AS 현재월 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'MON') AS 현재월 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY') AS 현재월 FROM DUAL;

SELECT SYSDATE,TO_CHAR(SYSDATE,'HH:MI:SS') AS 현재시간 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'HH12:MI:SS') AS 현재시간 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'HH24:MI:SS') AS 현재시간 FROM DUAL;

SELECT SAL,
       TO_CHAR(SAL,'$999,999') AS SAL_$,
       TO_CHAR(SAL,'L999,999') AS SAL_L
FROM EMP;

SELECT TO_NUMBER('1,300', '999,999')
FROM DUAL;

SELECT TO_DATE('2021-09-12','YYYY-MM-DD') AS TODATE1,
       TO_DATE('20210912','YYYY-MM-DD') AS TODATE2
FROM DUAL;

-- 날짜 데이터는 연산이 가능함
-- 1981-06-01 이후 입사자

SELECT * 
FROM EMP
WHERE hiredate > TO_DATE('1981/06/01','yyyy-mm-dd');

-- 널처리 함수
-- nvl(데이터,널이면 처리해야 반환할 값)
SELECT empno, ename, sal,comm,sal+comm
FROM emp;

SELECT empno, ename, sal,comm,sal+comm, nvl(comm,0), sal+nvl(comm,0)
FROM emp;

-- NVL2(데이터, 널이 아닐경우 반환할 값, 널이면 반환할 값)
SELECT empno, ename, sal, comm, nvl2(comm,'O','X'), nvl2(comm, sal*12+comm,sal*12)
from emp;


-- DECODE 함수
-- DECODE([검사, 대싱이 될 열, 또는 데이터],
--        [조건1],[데이터가 조건 1과 일치할 때 반환할 결과],
--        [조건2],[데이터가 조건 2와 일치할 떄 반환할 결과],

-- [위 조건들 중에서 일치한 경우가 없을때 반환할 결과]

-- JOB_ID 에 따라 급여의 비율 설정
SELECT EMPNO, 
       ename, 
       job, 
       SAL, 
       DECODE(job,'MANAGER',SAL*1.1, 'SALESMAN',SAL*1.05,'ANALYST', 
       SAL, SAL * 1.03) AS UPSAL
FROM EMP;

-- CASE
SELECT empno, 
       ename, 
       job, 
       sal, 
       CASE JOB
       WHEN 'MANAGER'THEN SAL*1.1
       WHEN 'SALESMAN'THEN SAL*1.05
       WHEN 'ANALYST' THEN SAL
       ELSE SAL * 1.03 
       END AS UPSAL
FROM EMP;

-- COMM 이 널이면 '해당사항 없음', 0 이면 '수당없음' , 0보다 코므ㅕㄴ '수당 : 2500' 출력
SELECT empno, 
       ename, 
       COMM,
       CASE 
       WHEN COMM IS NULL THEN '해당사항 없음'
       WHEN COMM = 0 THEN '수당 없음'
       WHEN COMM > 0 THEN ' 수당 : ' || COMM
       END AS COMM_TEXT FROM EMP;
       
SELECT EMPNO,
       ENAME,
       SAL,
       TRUNC(SAL/21.5,2) AS DAY_PAY,
       ROUND(SAL/21.5/8,1) AS TIME_PAY
       FROM EMP;

SELECT EMPNO,
       ENAME,
       hiredate,
       NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일') AS R_JOB,
       NVL(TO_CHAR(COMM),'N/A') AS COMM
       FROM EMP;
       
SELECT EMPNO,
       ENAME,
       MGR,
       CASE 
       WHEN MGR LIKE '75%' THEN '5555'
       WHEN MGR LIKE '76%' THEN '6666'
       WHEN MGR LIKE '77%' THEN '7777'
       WHEN MGR LIKE '78%' THEN '8888'
       WHEN MGR IS NULL THEN '0000'
       ELSE TO_CHAR(MGR)
       END AS COMM
       FROM EMP;
       
-- 다중행 함수: SUM(), COUNT(), AVG(), MAX(), MIN()

SELECT SUM(SAL) FROM EMP;
            
-- EMP 테이블의 데이터 개수 조회
SELECT COUNT(*) FROM EMP;
       
-- 부서번호가 10번인 사원의 최대 급여
SELECT MAX(SAL) FROM EMP WHERE DEPTNO=10;
-- 부서번호가 10번인 사원의 최소 급여
SELECT MIN(SAL) FROM EMP WHERE DEPTNO=10;

SELECT COUNT(DISTINCT SAL) FROM EMP;

SELECT MAX(HIREDATE) FROM EMP WHERE DEPTNO=20;

SELECT ROUND(AVG(SAL),1) FROM EMP WHERE DEPTNO=30;

SELECT ROUND(AVG(DISTINCT SAL),1) FROM EMP WHERE DEPTNO=30;

SELECT DEPTNO,COUNT(sal) FROM emp GROUP BY DEPTNO ORDER BY DEPTNO;

SELECT DEPTNO,AVG(sal) FROM emp GROUP BY DEPTNO ORDER BY DEPTNO;

SELECT DEPTNO,JOB,AVG(sal) FROM emp GROUP BY DEPTNO, JOB ORDER BY DEPTNO, JOB;

SELECT DEPTNO,JOB,AVG(SAL) FROM EMP GROUP BY DEPTNO, JOB HAVING AVG(SAL)>2000 ORDER BY DEPTNO, JOB;

SELECT DEPTNO, TRUNC(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL, COUNT(DEPTNO) FROM EMP GROUP BY DEPTNO;

SELECT JOB , COUNT(*) FROM EMP GROUP BY JOB HAVING COUNT(JOB)>=3;

SELECT TO_CHAR(HIREDATE,'YYYY'), DEPTNO , COUNT(DEPTNO) AS CNT FROM EMP GROUP BY  TO_CHAR(HIREDATE,'YYYY'),DEPTNO ORDER BY TO_CHAR(HIREDATE,'YYYY');

-- 실습용 테이블 생성
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

SELECT* FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP(DEPTNO,DNAME,LOC) VALUES(50,'DATABASE','SEOUL');

INSERT INTO DEPT_TEMP VALUES(60,'NETWORK','BUSAN');


INSERT INTO DEPT_TEMP(DEPTNO,DNAME) VALUES(90,'DATABASE');

INSERT INTO DEPT_TEMP(DEPTNO,DNAME,LOC) VALUES(91,'WEB',NULL);

INSERT INTO DEPT_TEMP(DEPTNO,DNAME,LOC) VALUES(92,'MOBILE','');

DELETE FROM DEPT_TEMP WHERE DNAME='MOBILE';

COMMIT;



-- 실습용 테이블 생성
-- 테이블 구조는 복사하되, 데이터는 복사하고 싶지 않을 때
CREATE TABLE emp_temp AS SELECT * FROM emp where 1<>1;

select * from emp_temp;

desc emp_temp;

insert into emp_Temp(empno,ename,job,mgr,hiredate,sal,comm,deptno) 
values(1111,'홍길동','manager',null,'2021-09-27',4000,null,10);

insert into emp_Temp
values(2222,'성춘향','analyst',null,'2021/09/27',5000,null,10);

insert into emp_Temp
values(3333,'박보검','analyst',null,sysdate,5000,null,10);

commit;

-- UPDATE : 수정
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값....
-- UPDATE 테이블명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값.... WHERE 수정할 조건

SELECT * FROM DEPT_TEMP;

UPDATE DEPT_TEMP
SET LOC = 'SEOUL'
WHERE DEPTNO = 90;

UPDATE DEPT_TEMP
SET LOC = 'BUSAN'
WHERE DEPTNO = 91;

commit;

SELECT * FROM EMP_TEMP;

UPDATE emp_temp SET COMM = 50 WHERE SAL<=4000;

UPDATE emp_temp SET COMM = 100;

ROLLBACK;

COMMIT;

-- DELETE: 삭제
-- DELETE 테이블 이름 WHERE 삭제할 데이터 조건
-- DELETE FROM 테이블 이름 WHERE 삭제할 데이터 조건

CREATE TABLE emp_temp2 AS SELECT * FROM emp;
SELECT * FROM EMP_TEMP2; 

-- JOB이 MANAGER인 사원 삭제
DELETE EMP_TEMP2
WHERE JOB='MANAGER';

-- 전체 사원 삭제
DELETE EMP_TEMP2;



-- 조인

select count(*) from emp;
select count(*) from dept;

-- 카테시안 조인 : 나올 수 있는 모든 조합(14 * 4  =56)
select *
from emp, dept;

-- 내부조인(inner 조인)
-- 등가조인 : 일치하는 데이터를 기준으로 조인
-- 비등가 조인 : 특정 범위에 있는 데이터 추출 

select *
from emp, dept
where emp.deptno = dept.deptno;

-- 급여가 2500 이하이고, 사원번호가 9999 이하인 사원의 사번,이름,급여,부서명,부서위치
select empno, ename, sal, dname,loc
from emp e, dept d
where e.deptno = d.deptno and sal <=2500 and empno <=9999;

-- emp 테이블의 급여가 salgrade 특정 범위에 속하면 grade 값 조회
select *
from emp e, salgrade s
where e.sal BETWEEN s.losal and s.hisal;

select * from salgrade;
select * from emp;

-- 자체 조인(셀프 조인) : 본인 테이블과 조인
select e1.empno, e1.ename,e1.mgr,e2.empno ,e2.ename
from emp e1, emp e2
where e1.mgr=e2.empno;

-- 외부조인 
-- 왼쪽외부조인
select e1.empno, e1.ename,e1.mgr,e2.empno ,e2.ename
from emp e1, emp e2
where e1.mgr=e2.empno(+);

-- 오른쪽외부조인
select e1.empno, e1.ename,e1.mgr,e2.empno ,e2.ename
from emp e1, emp e2
where e1.mgr(+) = e2.empno;

-- 양쪽외부조인(+ 기호는 제공안함)
select empno, ename, emp.deptno, dname
from emp join dept on emp.deptno = dept.deptno
order by dname;

select empno, ename, sal, dname,loc
from emp e join dept d on e.deptno = d.deptno 
where sal <=2500 and empno <=9999;

select * 
from emp e join salgrade s
on e.sal Between s.losal and s.hisal;

-- outer 표준 구문

select e1.empno,e1.ename,e1.mgr,e2.empno,e2.ename
from emp e1 left outer join emp e2 on e1.mgr = e2.empno;

select e1.empno,e1.ename,e1.mgr,e2.empno,e2.ename
from emp e1 right outer join emp e2 on e1.mgr = e2.empno;

select deptno, dname, empno, ename, sal from emp where sal>2000;

select e.deptno, dname, empno, ename, sal from dept d,emp e 
where d.deptno=e.deptno and sal>2000;

select e.deptno,dname ,trunc(avg(sal),1), max(sal),min(sal), count(e.deptno) from emp e, dept d 
where d.deptno=e.deptno
group by e.deptno,dname ; 

select d.deptno,  dname, empno, e.ename, job, sal from emp e, dept d
where d.deptno = e.deptno(+)
order by deptno, ename;

select*from dept  ;
select*from emp;

-- 세 개 테이블 조인
select * 
from emp e1, emp e2, emp e3
where e1.empno =  e2.empno and e2.empno = e3.empno;

select * 
from emp e1 join emp e2 on e1.empno = e2.empno
            join emp e3 on e2.empno = e3.empno;
            
select * from salgrade, emp, dept;
select * from salgrade;
select * from emp;
select * from dept;
            
select d.deptno, dname, e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno, losal, hisal, grade,e2.empno as mgr_empno, e2.ename as mgr_ename
from dept d,emp e1, salgrade s, emp e2
where d.deptno = e1.deptno(+) and e.sal between s.losal and s.hisal;


-- 서브쿼리 : sql 문을 실행하는 데 필요한 데이터를 추가로 조회하기 위해 sql 문
--           내부에서 사용하는 select 문을 말함
--           연산자와 같은 비교 또는 조회 대상을 오른쪽에 놓여서 괄호로 묶어서 사용
--           서브쿼리의 SELECT 절에 명시한 열은 메인쿼리의 비교 대상과 같은 자료형

-- jones보다 큰 사원 조회
select *from emp where sal>(select sal from emp where ename='JONES');

-- ALLEN 사원의 추가 수당보다 많은 추가수당을 받는 사원 조회
SELECT * FROM EMP WHERE COMM>(SELECT COMM FROM EMP WHERE ENAME='ALLEN');

-- WARD 사원의 입사일보다 빨리 입사한 사원 목록 조회
SELECT * FROM EMP WHERE hiredate<(SELECT HIREDATE FROM EMP WHERE ENAME='WARD');

SELECT e.DEPTNO, ENAME, JOB, SAL, d.deptno, dname, loc 
FROM EMP e, dept d 
WHERE d.deptno = e.deptno and d.deptno = 20 and e.sal > (select avg(sal) from emp );

-- 다중행 서브쿼리
-- 서브쿼리 실행결과가 여러 개로 나오는 걸 의미
-- IN :  메인 쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하면 true
-- ANY(SOME): 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
-- ALL : 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 true
-- EXISTS : 서브 쿼리의 결과가 존재하면(행 1개이상 존재하면) true

--in
select * 
from emp 
where sal in (select max(sal) from emp group by deptno);

-- any
select * 
from emp 
where sal <any (select max(sal) from emp group by deptno);

select * 
from emp 
where sal >any (select sal from emp where deptno = 30); 

select * 
from emp 
where sal <any (select sal from emp where deptno = 30); 


--all
select * 
from emp 
where sal <All (select sal from emp where deptno = 30); 

--EXIST
SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=10);

--문제1
SELECT *FROM EMP;
SELECT *FROM DEPT;

SELECT ENAME,EMPNO,JOB,SAL,E.DEPTNO,DNAME 
FROM EMP E, DEPT D
WHERE JOB IN (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN') AND D.DEPTNO = E.DEPTNO;

-- 문제2
SELECT *FROM salgrade;

SELECT E.DEPTNO, DNAME, GRADE
FROM EMP E
JOIN DEPT D ON E.deptno=D.DEPTNO 
JOIN salgrade S ON E.SAL BETWEEN S.losal AND S.hisal AND SAL > (SELECT AVG(SAL) FROM EMP) ORDER BY SAL DESC , E.EMPNO ASC;


select * 
from emp 
where sal >ALL (select sal from emp where deptno = 30); 

-- 비교할 열이 여러 개인 다중열 서브쿼리

select * 
from emp 
where (DEPTNO,sal) in (select DEPTNO,max(sal) from emp group by deptno);

-- FROM 서브쿼리 (인라인 뷰)
SELECT EMPNO,ENAME,E10.DEPTNO,DNAME,LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10, (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

-- INSERT 사용하는 서브쿼리

INSERT INTO EMP_TEMP
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM EMP E, salgrade S 
WHERE E.SAL BETWEEN s.losal AND s.hisal AND S.GRADE =1;

SELECT * FROM EMP_TEMP;

-- UPDATE 서브쿼리
SELECT DNAME,LOC
FROM DEPT
WHERE DEPTNO = 30;

UPDATE DEPT_TEMP
SET(DNAME,LOC) = (SELECT DNAME,LOC FROM DEPT WHERE DEPTNO = 30)
WHERE DEPTNO = 40;

UPDATE DEPT_TEMP
SET LOC='SEOUL'
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT_TEMP WHERE DNAME='NETWORK');

--DELETE 서브쿼리
SELECT *FROM EMP_TEMP;
DELETE EMP_TEMP
WHERE EMPNO IN ( SELECT EMPNO FROM EMP_TEMP E, salgrade S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE =3 AND DEPTNO =30);


SELECT * FROM EXAM_EMP;
CREATE TABLE EXAM_EMP AS SELECT * FROM EMP where 1<>1;
CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT;
CREATE TABLE EXAM_SALGRADE AS SELECT * FROM salgrade;


SELECT * FROM EXAM_EMP;
INSERT INTO EXAM_EMP
VALUES(7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,NULL,50);

DELETE FROM EXAM_EMP WHERE EMPNO=7202;

UPDATE EXAM_EMP SET MGR=7201 WHERE COMM=300;

UPDATE EXAM_EMP SET DEPTNO = 70
WHERE SAL >(SELECT AVG(SAL) FROM EXAM_EMP WHERE DEPTNO=50); 

UPDATE EXAM_EMP SET DEPTNO = 80, SAL=SAL+SAL*0.1
WHERE HIREDATE >ANY (SELECT HIREDATE FROM EXAM_EMP WHERE DEPTNO=60);

SELECT * FROM salgrade;

DELETE EXAM_EMP 
WHERE SAL IN (SELECT SAL FROM EXAM_EMP E, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE =5);

-- 트랜잭션
-- 하나의 단위로 데이터를 처리

CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;

-- 트랜잭션과 관련있는 명령어 실행
INSERT INTO DEPT_TCL VALUES(50,'DATABASE','SEOUL');

UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;

DELETE FROM DEPT_TCL WHERE DNAME='RESEARCH';

SELECT * FROM DEPT_TCL;

--수행된 명령 취소
ROLLBACK;

--수행된 명령 최종 반영
COMMIT;

--세션 : 어떤 활동을 위한 시간이나 기간
--      데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 수핸한 후
--      접속을 종료하기까지 전체 기간

delete from dept_tcl where deptno=50;

update dept_tcl
set loc='SEOUL'
where deptno=30;
COMMIT;


-- 데이터 정의어
-- 객체를 생성,변경,삭제
-- 실행하면 반영됨

-- create(생성), alter(변경), drop(삭제)

-- create table 테이블 이름(
--        필드명1 자료형,
--        필드명2 자료형,
--   )

-- 테이블 이름 규칙
-- 문자로 시작
-- 같은 사용자 안에서 동일한 테이블 명 사용불가
-- sql 키워드는 테이블 이름으로 사용할 수 없음

-- 필드명 생성 규칙
-- 문자로 시작
-- 열 이름은 중복되면 안됨
-- slq 키워드 사용불가

-- 자료형 : 숫자 NUMBER, 문자 varchar2, 날짜 date

create table EMP_DOL(
    EMPNO NUMBER, -- 4자리 허용
    ENAME VARCHAR2(10),
    JOB VARCHAR(9), 
    MGR NUMBER(4),
    HIREDATE DATE, 
    SAL NUMBER(7,2),  -- 숫자로 7자리 허용(소수점은 2자리 허용)
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);
    
DESC EMP_DOL;

DROP TABLE emp_dol;

create table dept_ddl_30 as select * from dept where deptno =30;

-- 구조만 복사
create table dept_ddl2 as select * from dept where 1<>1;

create table emp_alter as select * from emp;

alter table emp_alter add hp varchar2(20);

SELECT * FROM EMP_RENAME;

-- RENAME : 열 이름을 변경
ALTER TABLE EMP_ALTER RENAME COLUMN HP TO TEL;

-- MODIFY : 열의 자료형을 변경
ALTER TABLE EMP_ALTER MODIFY EMPNO NUMBER(5);

-- DROP : 열 삭제
ALTER TABLE EMP_ALTER DROP COLUMN TEL;

-- 테이블 이름 변경
RENAME EMP_ALTER TO EMP_RENAME;

-- 테이블 데이터를 삭제 TRUNCATE
TRUNCATE TABLE EMP_RENAME;

CREATE TABLE MEMBER (
    ID CHAR(8),
    NAME VARCHAR2(10),
    ADDR VARCHAR2(50),
    NATION CHAR(4),
    EMAIL VARCHAR2(50),
    AGE NUMBER(7,2)
    );
    
alter table MEMBER add BIGO varchar2(20);

ALTER TABLE MEMBER MODIFY BIGO VARCHAR2(30);

ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;

SELECT * FROM MEMBER;

select * from member;

select * from member;
