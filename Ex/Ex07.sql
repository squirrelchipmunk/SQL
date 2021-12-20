/**********************************
*    s  u  b     q  u  e  r  y    *
***********************************/

--예제
/* 1) 딘의 급여보다 많은 사람의 이름과 급여?
select first_name, salary
from employees
where salary > 딘의 급여;
*/

-- 2) 딘의 급여
select salary
from employees
where first_name='Den';

-- 3)sub query문 완성 (들여쓰기 잘할것)
select first_name, salary
from employees
where salary > (select salary
                from employees
                where first_name='Den');


-- [예제]
-- 급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?

select min(salary) -- 최저 급여 2100
from employees;

select first_name, salary, employee_id
from employees
where salary = (select min(salary)
                from employees);

-- 평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?

select avg(salary) -- 평균 급여 6461.8317.....
from employees;

select first_name, salary
from employees
where salary < (select avg(salary)
                from employees);