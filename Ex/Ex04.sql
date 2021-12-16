/***********************
*     group by 절       *
************************/

select  avg(salary),
        department_id
from employees
group by department_id;