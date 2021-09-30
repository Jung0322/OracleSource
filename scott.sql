-- SQL은 대소문자 구별 안함

-- scott 계정에 존재하는 모든 테이블 조회
SELECT *
FROM tab;

SELECT empno, ename, job FROM emp;

-- 중복 제거: DISTINCT
SELECT DISTINCT deptno FROM emp;

-- 별칭을 붙여서 조회: AS
SELECT EMPNO AS 사원번호 FROM EMP;

SELECT ename AS 사원명,sal AS 급여,comm AS 추가수당,sal*12+comm AS 연봉
FROM emp;

-- 내림차순으로 정렬
SELECT ename,sal FROM emp ORDER BY sal desc;

-- 오름차순으로 정렬
SELECT ename,sal FROM emp ORDER BY sal asc;

SELECT * FROM EMP ORDER BY EMPNO DESC;

SELECT * FROM EMP ORDER BY DEPTNO ASC, SAL DESC;

SELECT 
    EMPNO AS EMPLOYEE_NO, 
    ENAME AS EMPLOYEE_NAME, 
    MGR AS MANAGER, 
    SAL AS SALARY , 
    COMM AS COMMISION , 
    DEPTNO AS DEPARTMENT_NO FROM EMP ORDER BY DEPTNO DESC, 
    ENAME DESC;

SELECT * FROM emp WHERE empno=7782;

SELECT * FROM emp WHERE deptno=30 and job='SALESMAN';

SELECT * FROM emp WHERE EMPno=7499 and deptno=30;

SELECT * FROM emp WHERE job='CLERK' OR deptno=30;

SELECT LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = 176;

SELECT LAST_NAME, salary FROM employees WHERE SALARY>=12000;

SELECT LAST_NAME, SALARY FROM EMP WHERE 5000<=SALARY AND SALARY<=12000;

-- 집합 연산자 : 합집합 - UNION, UNION ALL(중복값을 제거하지 않음), 
--              교집합 - INTERSECT
--              차집합 - MINUS

-- EMPNO, ENAME, SAL, DEPTNO 조회(부서번호가 10번이거나 20번인)
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION ALL
SELECT SAL,JOB,DEPTNO,SAL
FROM EMP
WHERE DEPTNO = 20;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;


-- 오라클 함수

-- 내장함수 - 1) 문자함수

--              대소문자 변경
--              UPPER(문자열) : 괄호 안 문자를 모두 대문자로 변환
--              LOWER(문자열) : 괄호 안 문자를 모두 소문자로 변환
--              INITCAP(문자열) : 괄호 안 문자 중 첫글자만 대문자로 변환, 나머지는 소문자

SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;

-- ENAME이 SCOTT 인 사람 찾기
SELECT * FROM EMP WHERE lower(ENAME) = 'scott';
SELECT * FROM EMP WHERE lower(ENAME) LIKE 'scott';

-- 문자 길이 구하기 
-- LENGTH(문자열) : 해당 문자열의 길이 돌려줌
-- LENGTHB(문자열) : 해당 문자열의 바이트수 돌려줌

SELECT ENAME, LENGTH(ENAME) FROM EMP;

-- DUAL : 데이터베이스 관리자가 소요한 테이블 / 임시 연산이나 함수의 결과 값 확인 용도
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;

-- JOB 이 6글자 이상인 사원들 조회
SELECT * FROM EMP WHERE LENGTH(JOB)>=6;

-- 문자열 일부를 추출하기
-- SUBSTR(문자열데이터,시작위치,추출길이)
-- SUBSTR(문자열데이터,시작위치)
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2),SUBSTR(JOB,5) FROM EMP;

-- EMP 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력하기
SELECT SUBSTR(ENAME,3) FROM EMP;

-- 문자열 데이터 안에서 특정 문자를 찾기
-- INSTR(문자열, 찾을 문자열, 시작위치, 몇번째에 있는걸 찾을 것인지)

SELECT 
    instr('HELLO, ORACLE!', 'L'), 
    instr('HELLO, ORACLE!', 'L',5), 
    instr('HELLO, ORACLE!', 'L',2,2) 
FROM
    DUAL;
    
SELECT 
    instr('이것이 ORACLE이다. 이것도 오라클이다.','이것'), 
    instr('이것이 ORACLE이다. 이것도 오라클이다.','이것',3),
    instr('이것이 ORACLE이다. 이것도 오라클이다.','이것',1,2)
FROM
    DUAL;
    
SELECT ENAME FROM EMP WHERE ename LIKE '%S%';
SELECT * FROM EMP WHERE INSTR(ENAME,'S')>0;

--    특정 문자를 다른 문자로 바꾸는 함수
--    REPLACE(문자열 데이터 또는 열이름, 찾는문자, 바꿀문자)

-- 010-1234-5678
SELECT 
    '010-1234-5678' AS 원본, 
    REPLACE('010-1234-5678','-',' ') AS REPLACE1,
    REPLACE('010-1234-5678','-') AS REPLACE2
FROM
    dual;
    
    
--  두 문자열 데이터를 합치는 함수
--  concat(문자열1,문자열2)
--  EMPNO,ENAME 합쳐서 조회

SELECT EMPNO,ENAME,CONCAT(EMPNO,ENAME)
FROM EMP
WHERE 
    ENAME = 'SCOTT';
    
-- 7788:SCOTT
SELECT 
    EMPNO,
    ENAME,
    CONCAT(EMPNO,CONCAT(':',ENAME))
FROM EMP
WHERE 
    ENAME = 'SCOTT';
    
-- || : 문자열 데이터 연결 연산자

SELECT 
    EMPNO || ENAME,
    CONCAT(EMPNO,CONCAT(':',ENAME))
FROM EMP
WHERE 
    ENAME = 'SCOTT';
    
-- 문자열 함수 :  공백제거
--               TRIM : 양쪽 공백 제거
--               LTRIM : 왼쪽 공백 제거
--               RTRIM : 오른쪽 공백 제거

SELECT ' 이것이   ',TRIM('   이것이   ') FROM DUAL;


-- TRIM(삭제옵션(선택), 삭제할 문자(선택), from 원본문자열)
SELECT '['|| TRIM('_' FROM '__Oracle__') || ']' AS  TRIM,
'[' || TRIM(LEADING '_' FROM '__Oracle__') || ']' AS TRIM_LEADING,
'[' || TRIM(BOTH '_' FROM '__Oracle__') ||']' AS trim_both
from dual;