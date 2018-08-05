/*	查询每个部门的部门编号以及每个部门的人数*/
select deptno,count(1) from emp GROUP BY deptno;

/*	查询每个部门的部门编号以及每个部门工资大于1500的人数*/
select deptno,count(1) as deptnum from emp 
 where sal>1500 
 GROUP BY deptno;
/*查询每个部门的部门编号以及每个部门
工资大于1500的人数，且部门人数超过2个*/
/*having 多个条件用and链接，字段名必须在select  之后的字段*/
select deptno,count(1)  as deptnum from emp 
 where sal>1500 
 GROUP BY deptno 
HAVING deptnum>2 ;
 /*HAVING deptnum>2 and ename='111'; */

select deptno,deptnum from (select deptno,count(1) as 
deptnum from emp where sal>1500 GROUP BY deptno) temp 
where  temp.deptnum>2;

/*分页查询 ，每一页为5条记录 第一页*/
select * from emp ORDER BY empno asc;
select * from emp ORDER BY empno asc limit 0,5 ;
/*第二页*/
select * from emp ORDER BY empno asc;
select * from emp ORDER BY empno asc limit 5,5;

/*第三页 ,pageNum 第几页  pageSize每一页的条数*/
select * from emp ORDER BY empno asc;
select * from emp ORDER BY empno asc limit (3-1)*5,5;

/*=========*/
create table test(
	test_id int primary key,
	`test_name` varchar(50)
);
drop table test1;
create table test1(
	test_id int,
  test_name varchar(50),
  primary key(test_id)
);

/*对原有表添加主键*/
/* Duplicate entry '40' for key 'PRIMARY'*/
alter table dept add PRIMARY key(deptno);
alter table emp add primary key(empno);

/*  添加unqiue*/
alter table test1 modify test_name varchar(50) unique;

/*主键生成策略*/
/*自动增长*/
alter table test1 modify test_id int auto_increment;
/*uuid()*/
select uuid(),empno from emp;

/*BigDecimal */
/*default*/

insert into emp(empno,ename,sal)
 values('9988','金三胖2',null);

/*union （去除重复数据） 和 union all （没有去除重复数据）*/
/*列的个数一致，列的数据类型一致*/
select * from emp
union 
select * from emp;

select * from emp 
union all
select * from emp;

select empno,ename,sal from emp
union 
select '1111',111,'222' from emp;


/*==========*/
select * from emp e,dept d where 
 e.deptno=d.deptno and d.deptno='20';

/*内连接的特点：查询结果必须满足条件*/
select e.*,d.deptno as dptNo,dname from emp e INNER JOIN dept d where 
 e.deptno=d.deptno and d.deptno='20';

/*左连接*/
select * from emp e left join dept d on  e.deptno=d.deptno
where  d.deptno='20';

select e.sal,()　from emp e,(select * from emp) where e.eptno
in (select * from emp) deptno='20';

/*1.	工资高于JONES的员工*/
select e1.* from emp e1,emp e2 where 
e1.sal>e2.sal and e2.ename='JONES';

select * from emp e1 where e1.sal>
(select sal from emp e2 where e2.ename='JONES');

/*查询与SCOTT同一个部门的员工*/
select e1.deptno from emp e1 where e1.ename='SCOTT';
select * from emp e2 where e2.deptno='20';

select * from emp e2 where e2.deptno=
	(select e1.deptno from emp e1 where e1.ename='SCOTT');


/*工资高于30号部门所有人的员工信息*/
select max(sal) from emp where emp.deptno='30';

select * from emp where emp.sal>
(select max(sal) from emp where emp.deptno='30');

select * from emp where emp.sal>
all(select sal from emp where emp.deptno='30');

/*查询工作和工资与MARTIN（马丁）完全相同的员工信息*/
select * from emp where 
emp.sal=(select sal from emp e1 where e1.ename='MARTIN')
  and emp.job=(select job from emp e1 where e1.ename='MARTIN');

select * from emp e,(select e1.sal,e1.job from emp e1 where e1.ename='MARTIN') e2
where e.job=e2.job and e.sal=e2.sal;

/*有2个以上直接下属的员工信息*/
select count(1) as num,mgr from emp where mgr is not NULL
 GROUP BY mgr having num>=2;
select emp.* from emp,(select mgr,count(1) as num from emp where mgr is not NULL
 GROUP BY mgr having num>=2) emp2 where emp.empno=emp2.mgr ;


SELECT * FROM emp WHERE empno IN(
SELECT mgr FROM emp GROUP BY mgr HAVING COUNT(mgr)>=2)

/*查询员工编号为7788的员工名称、员工工资、
部门名称、部门地址*/
select emp.ename,emp.sal,dept.dname,dept.loc 
 from emp,dept where emp.deptno=dept.deptno 
 and emp.empno='7788';

/*求各个部门薪水最高的员工所有信息*/
select * from emp;
select max(sal),e.deptno from emp e GROUP BY e.deptno;

select * from emp,
(select max(sal) as max_sal,e.deptno from emp e GROUP BY e.deptno) temp
 where emp.deptno=temp.deptno and emp.sal=temp.max_sal;

/*
数学函数
字符串函数
日期和时间函数
条件判断函数
系统信息函数
加密函数
格式化函数
*/

update emp set sal=sal*100 ;

/*字符串函数*/
select CONCAT(ename,'saaa') from emp;
select ename+"saaa" from emp;

/*REPEAT(s,x) 将s重复x后返回*/
select repeat('ddddd','222') from emp;

/*REPLACE(s,form,target) 
将字符串中包含form的字符替换成target*/
select REPLACE(ename,'S','99') from emp;

/*NOW() 返回当前日期时间*/

/*DATE_FORMAT(s,pattern) 格式化日期*/
select * from test;


SELECT DATE_FORMAT(NOW(),'%Y%-m%d') FROM DUAL;


select test_id,test_name ,case sex when '1' then '男' 
 when '0' then '女'  else '人妖' end
 from test;