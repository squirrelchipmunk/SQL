/*
여러줄 주석
*/

-- 직원테이블 조회
select * from employees;

-- 부서테이블 조회
select * from departments;

-- 원하는 컬럼 조회
select  employee_id, 
        first_name, 
        last_name
from employees;

-- 예)
select first_name, phone_number, hire_date, salary
from employees;

select  first_name, 
        last_name, 
        salary, 
        phone_number, 
        email, 
        hire_date
from employees;

-- 출력할 컬럼명 별명 적용
select  employee_id as "empNo",
        first_name as "f-name",
        last_name as "연 봉"
from employees;

-- 사원의 이름(fisrt_name)과 전화번호 입사일 급여 로 표시되도록 출력하세요
select  first_name as 이름,
        phone_number as 전화번호,
        hire_date as 입사일,
        salary as 급여
from employees;

-- 사원의 사원번호 이름(first_name) 성(last_name) 급여 전화번호 이메일 입사일로 표시되도록 출력하세요
select  employee_id 사원번호,
        first_name 이름,
        last_name 성,
        salary 급여,
        phone_number 전화번호,
        email 메일,
        hire_date 입사일
from employees;

-- ■ 연결 연산자(Concatenation)로 컬럼들 붙이기
select first_name, last_name
from employees;

select first_name || last_name
from employees;

select first_name || ' ' || last_name as "Full Name"
from employees;

select first_name || ' hire date is ' || hire_date as "사원 입사일"
from employees;

--■ 산술 연산자 사용하기
select first_name, salary
from employees;

select first_name, salary 월급, salary*12 연봉
from employees;

select first_name, salary, salary*12, (salary+300)*12
from employees;

/* 다음을 실행해 보고 오류를 분석해 보세요
select job_id*12   >> job_id의 자료형이 문자열(varchar2)
from employees;
*/

/*
전체직원의 정보를 다음과 같이 출력하세요
성명(first_name last_name)
성과 이름사이에 – 로 구분 ex) William-Gietz
급여
연봉(급여*12)
연봉2(급여*12+5000)
전화번호
*/
select  first_name || '-' || last_name 성명,
        salary 급여,
        salary*12 연봉,
        salary*12+5000 연봉2,
        phone_number 전화번호
from employees;

--부서번호가 10인 사원의 이름을 구하시오
select  first_name, last_name, salary, department_id
from employees
where department_id = 10;


-- 연봉이 15000 이상인 사원들의 이름과 월급을 출력하세요
select  first_name, salary
from employees
WHERE salary >= 15000;

-- 07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select  first_name, hire_date
from employees
WHERE hire_date >= '070101';

-- 이름이 Lex인 직원의 연봉을 출력하세요
select  first_name, salary*12
from employees
WHERE first_name = 'Lex';


-- 조건 2개 이상

    --연봉이 14000 이상 17000이하인 사원의 이름과 연봉을 구하시오
select  first_name, salary
from employees
WHERE salary >= 14000 and salary <= 17000;
    -- 연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select  first_name, salary
from employees
WHERE salary <= 14000 or salary >= 17000;
    -- 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select  first_name, hire_date
from employees
WHERE hire_date >= '040101' and hire_date <= '051231';

--  BETWEEN 연산자로 특정구간 값 출력하기
select  first_name, salary
from employees
WHERE salary Between 14000 and 17000;

--  IN 연산자로 여러 조건을 검사하기
select *
from employees
--where first_name = 'Neena' or first_name = 'Lex' or first_name = 'John';
where first_name in ('Neena', 'Lex', 'John');

--  연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
select first_name, salary
from employees
WHERE salary in(2100, 3100, 4100, 5100);

--  Like 연산자로 비슷한것들 모두 찾기
select  first_name, last_name, salary
from employees
where first_name like 'L%';

-- 이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select  first_name, salary
from employees
where first_name like '%am%';
-- 이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select  first_name, salary
from employees
where first_name like '_a%';
-- 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select  first_name
from employees
where first_name like '___a%';
-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select  first_name
from employees
where first_name like '__a_';

--null을 포함한 산술식은 null
select first_name, salary, commission_pct, salary*commission_pct
from employees
where salary between 13000 and 15000;

--■ is null / is not null
select first_name, salary, commission_pct
from employees
where commission_pct is null;

-- 커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name, salary*commission_pct
from employees
where commission_pct is not null;

-- 담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where manager_id is null and commission_pct is null;

--■ order by 절을 사용해 보기 좋게 정렬하기
select first_name, salary
from employees
order by salary desc;

select first_name, salary
from employees
where salary >= 9000
order by salary desc;

-- 부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id, salary, first_name
from employees
order by department_id;

-- 급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name, salary
from employees
where salary >= 10000
ORDER BY salary desc;

-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요
select department_id, salary, first_name
from employees
order by department_id, salary desc;

