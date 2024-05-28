


/*

*/





select e.last_name, d.department_name
from employees e
    join dpartments d on 
    

--2.
select e.last_name , d.department_name
from employees e
    left join departments d on e.department_id = d.department_id;
    
    select e.last_name, d.department_name
    from employees e, departments d
    where e.department
    
    
--3.
select e.last_name, j.job_title
from employees e
    join jobs on e.job_id = j.job_id;
    


--4 직원의 last_name과 직원이 근무하는 도시 이름(city) 검색.
select e.last_name, l.city
from employees e
    join departments d on e.departmen_id = d.department_id
    join locations l on d.location_id = l.location_id;

--5 직원의 last_name과 직원이 근무하는 도시이름(city)를 검색. 근무도시를 입

select e.last_name, l.city
from employees e
    left join departments d on e.department_id = d.department_id
    left join locations l on d.location_id  l.location_id;
    

--6
select last_name, hiredate
from employees
where to_char(hiredate,'YYYY') = 2008;

-- to_char 시간을 문자열로 / to_date 문자열을 날짜타입으로 바꿔줌