create Table DEPT (
DEPTNO integer Primary Key not null ,
DNAME varchar(255) not null, 
LOC varchar(255) not null,

constraint check_dname CHECK (DNAME IN('ACCOUNTIN','RESEARCH','SALES','OPERATIONS'))
);

create Table EMP 
(EMPNO integer Primary Key not null ,
ENAME varchar(255) not null,
JOB varchar(255) not null,
MGR integer not null, 
HIREDATE date not null, 
SAL decimal not null,
COMM decimal, 
DEPTNO integer not null,

CONSTRAINT fk_dp
    FOREIGN KEY (DEPTNO)
    REFERENCES DEPT(DEPTNO)
);

insert into DEPT values(10,'ACCOUNTIN','NEW-YORK')
insert into DEPT values(20,'RESEARCH','DALLAS')
insert into DEPT values(30,'SALES','CHICAGO')
insert into DEPT values(40,'OPERATIONS','BOSTON')

Insert into EMP values(7369,'SCOTT','ANALYST',7566,to_char('09/11/91','DD/MM/YY'),3000.00,NULL, 20)

CREATE TABLE EMP AS SELECT * FROM SCOTT.EMP;

COMMIT;

Insert into EMP values(7369, 'Bidon', NULL, NULL, NULL, NULL, NULL, NULL)

delete from EMP where EMPNO=7369

Alter Table EMP 
add CONSTRAINT fk_dp FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO),
add CONSTRAINT pk_empno Primary KEY (DEPTNO)

Insert into EMP values(7369, 'WILSON', 'MANAGER', 7839, to_char('17/11/91','DD/MM/YY'), 3500.00,  600.00, 10)
Insert into EMP values (7657, 'WILSON','MANAGER', 7839,to_char('17/11/91','DD/MM/YY'), 3500.00, 600.00, 50) 
Insert into EMP values  (7657, 'WILSON', 'MANAGER', 7000,to_char('17/11/91','DD/MM/YY'), 3500.00, 600.00, 10) 
Insert into EMP values (7657, 'WILSON', 'MANAGER', 7839, to_char('17/11/91','DD/MM/YY'), 3500.00,600.00, 10)

UPDATE DEPT SET LOC = 'PITTSBURGH' WHERE DNAME='SALES';

UPDATE  EMP SET SAL=SAL+(SAL*0.1) WHERE COMM> (SAL*0.5);

UPDATE  EMP SET COMM=(Select AVG(COMM) From EMP) WHERE COMM=null AND HIREDATE>to_char(' 01/01/82 ',' DD/MM/YY ')

ROLLBACK;

DELETE FROM DEPT WHERE DEPTNO=20;


/* 1 */

select ename , sal ,comm ,sal+comm from Emp 
where job= 'Salesman'

/* 2*/
select ename from Emp order by (comm/sal) desc;

select ename from Emp where (comm<(0.25*sal)) ;

select count(empno) from Emp where deptno=10;

select count(empno) from Emp where comm is not null;

select count(distinct job )from Emp;


