/*
걍 교재 예제들
*/


select * 
    from emp;

select empno, ename, job, mgr, hiredate, sal, comm, deptno
    from emp;

select dept.*, deptno from dept;

select empno as 사원번호, ename as 사원이름, sal as "Salary"
    from emp;
    
select ename, sal * (12 + 3000)
    from emp;
    
select ename, sal * (12+3000) as 월급
    from emp
    order by 월급 desc;

select ename || sal
    from emp;
    
select ename || '의 월급은 ' || sal || '입니다 '  as 월급정보
from emp;

select ename || '의 직업은 ' || job || '입니다 ' as 직업정보
from emp;
















select rownum, empno, ename, job, sal from emp
where rownum <= 5;
-- rownum 은 가짜의란 뜻으로 where 절에 사용하여 상위 5개만 잠깐 살펴볼때 유용함.


select empno, ename, job, sal from emp
order by sal desc fetch first 4 rows only;
-- 위 SQL을 TOP-N QUERY 라고 함.
-- 정렬된 결과로부터 위쪽 또는 아래쪽 N개의 행을 반환하는 쿼리.
-- 56번 챕터의 ROWNUM을 사용해서 같은 결과를 보려면 뒤에배울 FROM절의
-- 서브쿼리를 사용해야 하므로 SQL이 복잡해진다.
-- 근데 fetch first n rows only 는 단순하게 위의 결과를 출력가능

select empno, ename, job, sal from emp
order by sal desc
fetch first 20 percent rows only;
-- 월급이 높은 사원중 20% 해당하는 사원만 출력하는 쿼리


select empno, ename, job, sal from emp
order by sal desc fetch first 2 rows with ties;


select empno, ename, job, sal from emp
order by sal desc offset 9 rows;
--해보니 상위 9개를 제외한 나머지를 검색해주는 쿼리였다


select empno, ename, job, sal from emp
order by sal desc 
offset 9 rows
fetch first 2 rows only;
-- 상위 9개를 제외한 나머지 중에서 먼저보여지는 2개 행만 검색



