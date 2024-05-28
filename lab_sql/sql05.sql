/*
서브쿼리(subquery): SQL 문장의 일부로 다른 SQL 문장이 포함되는 것.

*/

-- 급여가 평균 이상인 직원들은?
select round(avg(sal),2) from emp; -->>> 평균값을 먼저 찾는다.

select * from emp where sal >= 2073.21; -->>>> 평균값을 찾았으니 그값을 통해 평균 이상 직원을 출력한다.

select * from emp
where sal >= (
    select avg(sal) from emp   -- 이 부분이 서브쿼리임. 괄호안
);
-->> 원래는 두 줄이 필요하나, 서브쿼리를 이용하면 한 줄로 가능!





-- ALLEN 보다 더 적은 급여를 받는 직원들의 사번,이름,급여를 검색
select empno, ename, sal from emp
where sal < (
    select sal from emp where ename = 'ALLEN'
);


-- ALLEN 과 같은 업무를 담당하는 직원들의
-- 사번, 이름, 부서번호, 업무, 급여를 검색.
select empno, ename, deptno, job, sal from emp
where job = (
    select job from emp where ename = 'ALLEN'
);


-- SALESMAN 의 급여 최대값보다 더 많은 급여를 받는 직원들의
-- 사번, 이름, 급여, 업무를 검색.
select empno, ename, sal, job from emp
where sal > (
    select max(sal) from emp where job = 'SALESMAN'
);



-- Ex. WARD 의 연봉보다 더 많은 연봉을 받는 직원들의 이름, 급여, 수당, 연봉을 검색
-- 연봉 = sal * 12 + comm. comm(수당)이 null인 경우에는 0으로 계산.
-- 연봉 내림차순 정렬.

select ename, sal, comm, sal*12+nvl(comm,0) as 연봉 -- nvl(comm,0) 의 뜻은 커미션이 널이면 0으로 하겠다는 뜻
from emp
where sal*12+nvl(comm,0) > (
    select sal*12+nvl(comm,0) from emp where ename = 'WARD'
)
order by 연봉 desc;

-- Ex. SCOTT 과 같은 급여를 받는 직원들의 이름과 급여를 검색.
-- Ex. 위 결과에서 SCOTT은 제외하고 검색.

select ename, sal from emp
where ename != 'SCOTT' and sal = (
    select sal from emp where ename = 'SCOTT'  
);

-- Ex. ALLEN보다 늦게 입사한 직원들의 이름, 입사날짜를 최근입사일부터 출력
select ename, to_char(hiredate,'YYYY-MM-DD') as 입사날짜 from emp
where hiredate > (
    select hiredate from emp where ename = 'ALLEN'
)
order by 입사날짜 desc;



-- Ex. 매니저가 KING인 직원들의 사번, 이름, 매니저 사번을 검색.
select empno, ename, mgr from emp
where mgr = (
    select empno from emp where ename = 'KING'
);


-- Ex. ACCOUNTING 부서에 일하는 직원들의 이름, 급여, 부서번호를 검색.
select ename, sal, deptno from emp
where deptno = (
    select deptno from dept where dname = 'ACCOUNTING'
);

-- Ex. CHICAGO에서 근무하는 직원들의 이름, 급여, 부서 번호를 검색.
select ename, sal, empno from emp
where deptno = (
    select deptno from dept where loc = 'CHICAGO'
);