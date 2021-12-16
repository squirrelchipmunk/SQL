/***********************
*      그 룹 함 수       *
************************/

--오류 발생이유 확인 > 1개의 row에 표현할 수 없음
select first_name, avg(salary)
from employees;

--그룹함수-avg()
select avg(salary)
from employees;


--그룹함수-count()
select count(*)
from employees;

select count(employee_id)
from employees;

select count(commission_pct)
from employees;

select count(*)
from employees
where salary > 16000;

-- 부서번호가 100인 사람 수
select count(*)
from employees
where department_id = 100;

-- 그룹함수-sum()
select count(*), sum(salary)
from employees;

-- 그룹함수-avg()
select  count(*),
        sum(salary),
        avg(salary)
from employees;

select  count(*),
        sum(salary),
        avg(salary)
from employees;

-- 주의: null 값이있는경우빼고계산함–nvl함수와같이사용
select  count(*), 
        sum(salary), 
        avg(nvl(salary,0))
from employees;

--그룹함수-max() / min()
select  count(*), 
        max(salary), 
        min(salary)
from employees;

/***********************
*     group by 절       *
************************/

select  avg(salary),
        department_id
from employees
group by department_id;