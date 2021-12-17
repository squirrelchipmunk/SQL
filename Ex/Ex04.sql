select department_id, count(*), sum(salary)
from employees
group by department_id
order by department_id;

-- group by절에 포함되지 않는 job_id는 검색 조건 속성에 포함될 수 없음
select department_id, job_id, count(*), sum(salary)
from employees
group by department_id;

select department_id, job_id, count(*), sum(salary)
from employees
group by department_id, job_id
order by department_id desc, job_id desc;


-- 연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요

select department_id, count(*), sum(salary)
from employees
where sum(salary) >= 20000 -- where 절에는 그룹함수 사용 불가
group by department_id;

-- having 절에는 그룹함수 와 Group by에 참여한 컬럼만 사용할 수 있다.
select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) >= 20000;

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
and department_id = 100;

-- CASE ~ END 문
select employee_id,
       first_name,
       salary,
       job_id,
       case when job_id='AC_ACCOUNT' then salary + salary * 0.1
            when job_id='SA_REP' then salary + salary * 0.2
            when job_id = 'ST_CLERK' then salary + salary * 0.3
            else salary
       end bonus
from employees;

--  DECODE 문 (CASE ~ END 비교)
SELECT employee_id,
       salary,
       DECODE( job_id,  'AC_ACCOUNT', salary + salary * 0.1,
                        'SA_REP', salary + salary * 0.2,
                        'ST_CLERK', salary + salary * 0.3,
                salary ) realSalary
FROM employees;

/* 직원의 이름, 부서, 팀을 출력하세요
팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
60~100이면 ‘B-TEAM’ 110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요
*/
select first_name 이름,
       department_id 부서,
       case when department_id >= 10 and department_id <= 50 then 'A-TEAM'
            when department_id >= 60 and department_id <= 100 then 'B-TEAM'
            when department_id >= 110 and department_id <= 150 then 'C-TEAM'
            else '팀없음'
       end 팀
from employees
order by department_id;