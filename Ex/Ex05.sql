/*************************
*       j o i n          *
**************************/

select *
from employees, departments;

select em.employee_id,
       em.salary, 
       em.first_name, 
       de.department_name,
       em.department_id,
       de.department_id
from employees em, departments de
where em.department_id = de.department_id;

-- 모든 직원이름, 부서이름, 업무명 을 출력하세요
select em.first_name 직원이름,
       de.department_name 부서이름,
       jo.job_title 업무명
from employees em, departments de, jobs jo
where em.department_id = de.department_id and 
      em.job_id= jo.job_id
order by em.first_name;