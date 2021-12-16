/***********************
*   단 일 행    함 수     *
************************/

--  문자함수–INITCAP(컬럼명)
select  email,
        initcap(email) "Email2", 
        department_id
from employees
where department_id= 100;

-- 문자함수–LOWER(컬럼명) / UPPER(컬럼명)
select  first_name, 
        lower(first_name) l_first_name, 
        upper(first_name) u_first_name
from employees
where department_id= 100;

-- 문자함수–SUBSTR(컬럼명, 시작위치, 글자수)
select  first_name, 
        substr(first_name,1,3), 
        substr(first_name,-3,2)
from employees
where department_id= 100;

-- 문자함수–LPAD(컬럼명, 자리수, ‘채울문자’) / RPAD(컬럼명, 자리수, ‘채울문자’)
select  first_name,
        lpad(first_name,10,'*'),
        rpad(first_name,10,'*')
from employees;

-- 문자함수–REPLACE (컬럼명, 문자1, 문자2)
select  first_name,
        replace(first_name, 'an', '**')
from employees
where department_id=100;

select  first_name,
        replace(first_name, 'a', '*'),
        replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id=100;

-- 숫자함수–ROUND(숫자, 출력을원하는자리수)
select  round(123.346, 2) "r2",
        round(123.456, 0) "r0",
        round(123.456, -1) "r-1"
from dual;

-- 숫자함수–TRUNC(숫자, 출력을원하는자리수)
select  trunc(123.346, 2) "r2",
        trunc(123.956, 0) "r0",
        trunc(128.456, -1) "r-1"
from dual;

-- 날짜함수–SYSDATE()
select sysdate
from dual;

select sysdate
from employees;

-- 단일함수>날짜함수–MONTH_BETWEEN(d1, d2)
select  sysdate,
        hire_date,
        months_between(sysdate, hire_date),
        trunc(months_between(sysdate, hire_date), 0), 
        round(months_between(sysdate, hire_date), 0)
from employees
where department_id= 100;


-- TO_CHAR(숫자, ‘출력모양’) 숫자형문자형으로변환하기
select  first_name,
        to_char(salary*12, '$000,000,000.00') "SAL",
        to_char(salary*12, '$999,999,999.99') "SAL",
        to_char(salary*12*12, '$909,090,900.00') "SAL"
from employees
where department_id=110;

-- 변환함수>TO_CHAR(날짜, ‘출력모양’) 날짜문자형으로변환하기
select  sysdate,
        to_char(sysdate, 'YY.MM.DD'),
        to_char(hire_date, 'HH')
from employees;

select  sysdate,
        to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;

select  sysdate,
        to_char(sysdate, 'YYYY"년"MM"월"DD"일" DAY HH24"시"MI"분"SS"초"')
from dual;


일반함수>NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때값)
select  commission_pct, 
        nvl(commission_pct, 0)
from employees;

select  commission_pct,
        nvl2(commission_pct, 100, 0)
from employees;