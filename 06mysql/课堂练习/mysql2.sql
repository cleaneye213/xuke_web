/*  严禁不带条件的删除
	能知道id ，尽量根据id来删除数据
*/

delete from emp;

delete from emp where id='1';

select * from emp ;

INSERT INTO emp(id,name,gender,birthday,salary,entry_date,resume)
VALUES(1,'zhangsan','female','1990-5-10',10000,'2015-5-5-','good girl');

INSERT INTO emp(id,name,gender,birthday,salary,entry_date,resume)
VALUES(2,'lisi','male','1995-5-10',10000,'2015-5-5','good boy');

INSERT INTO emp(id,name,gender,birthday,salary,entry_date,resume)
VALUES(3,'你好','male','1995-5-10',10000,'2015-5-5','good boy');

/*删除多条记录*/
delete from emp where id ='1' or id='2';
delete from emp where id in('1','2');

CREATE TABLE stu (
	sid	CHAR(6),
	sname		VARCHAR(50),
	age		INT,
	gender	VARCHAR(50)
);

INSERT INTO stu VALUES('S_1001', 'liuYi', 35, 'male');
INSERT INTO stu VALUES('S_1002', 'chenEr', 15, 'female');
INSERT INTO stu VALUES('S_1003', 'zhangSan', 95, 'male');
INSERT INTO stu VALUES('S_1004', 'liSi', 65, 'female');
INSERT INTO stu VALUES('S_1005', 'wangWu', 55, 'male');
INSERT INTO stu VALUES('S_1006', 'zhaoLiu', 75, 'female');
INSERT INTO stu VALUES('S_1007', 'sunQi', 25, 'male');
INSERT INTO stu VALUES('S_1008', 'zhouBa', 45, 'female');
INSERT INTO stu VALUES('S_1009', 'wuJiu', 85, 'male');
INSERT INTO stu VALUES('S_1010', 'zhengShi', 5, 'female');
INSERT INTO stu VALUES('S_1011', 'xxx', NULL, NULL);

/*更改表名*/
RENAME table emp to emp2;

CREATE TABLE emp(
	empno		INT,
	ename		VARCHAR(50),
	job		VARCHAR(50),
	mgr		INT,
	hiredate	DATE,
	sal		DECIMAL(7,2),
	comm		decimal(7,2),
	deptno		INT
) ;

INSERT INTO emp values(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20);
INSERT INTO emp values(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO emp values(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30);
INSERT INTO emp values(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20);
INSERT INTO emp values(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
INSERT INTO emp values(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30);
INSERT INTO emp values(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10);
INSERT INTO emp values(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20);
INSERT INTO emp values(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10);
INSERT INTO emp values(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO emp values(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20);
INSERT INTO emp values(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30);
INSERT INTO emp values(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20);
INSERT INTO emp values(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);


CREATE TABLE dept(
	deptno		INT,
	dname		varchar(14),
	loc		varchar(13)
);


INSERT INTO dept values(10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept values(20, 'RESEARCH', 'DALLAS');
INSERT INTO dept values(30, 'SALES', 'CHICAGO');
INSERT INTO dept values(40, 'OPERATIONS', 'BOSTON');




/*==============DQL*/
select * from stu where id!=null;
SELECT sid, sname, age FROM stu;

/*	Like ‘’; 模糊匹配like ‘%a’ 以a结尾 like ‘a%’ 以a开头的
 like ‘%a%’ 包含a*/



/*查询性别为女，并且年龄50的记录*/
select * from stu s where s.gender='female' and s.age=50;

/**查询学号为S_1001，或者姓名为liSi的记录*/
/*=后面区分大小写*/
select * from stu s where s.sid='S_1001' or sname='liSi';


/*查询学号为S_1001，S_1002，S_1003的记录*/
select * from stu s where sid in('S_1001','S_1002');
select * from stu s where age in(35,65);

/*查询学号不是S_1001，S_1002，S_1003的记录*/
select * from stu s where sid not in('S_1001','S_1002');

/*查询年龄为null的记录*/
/*不能这么写，错误写法*/
select * from stu where age!=null;

select * from stu where age is null;

select * from stu where age is not null;


/**查询年龄在20到40之间的学生记录*/
select * from stu where age BETWEEN 20 and 40;
select *  from stu where age>=20 and age<=40;

/*查询性别非男的学生记录*/
select * from stu where gender!='male';
select * from stu where gender='female';


/*查询姓名由5个字母构成的学生记录*/
/*_ 任意一个字母*/
select * from stu where sname like '_____';

/*查询姓名由5个字母构成，并且第5个字母为“i”的学生记录*/
select * from stu where sname like '____i';


/*查询姓名以“z”开头的学生记录*/
select * from stu where sname like 'z%';

/*查询姓名中第2个字母为“i”的学生记录*/
select * from stu where sname like '_i%';

/*查询姓名中包含“a”字母的学生记录*/
select * from stu where sname like '%a%';


/*只查询emp表的sal字段时 去除重复*/
select distinct p.sal from emp p;

/*查看雇员的月薪与佣金之和*/
select p.sal,p.comm,p.sal+p.comm as total from emp p;

select p.sal,p.comm,p.sal+ifnull(p.comm,0) as total from emp p;

/*查询所有学生记录，按年龄升序排序*/
/*升序*/
select * from stu order by age;
/*升序*/
select * from stu order by age asc;
/*降序*/
select * from stu order by age desc;

/*查询所有雇员，按月薪降序排序，如果月薪相同时，
按编号升序排序
*/
select * from emp p order by sal desc,p.empno desc;

select count(sid) from stu;

select count(age) from stu;
select 1,sid from stu;
select count(1) from stu;

/*	查询emp表中有佣金的人数：*/
select count(1) from emp p where p.comm is not null;
select count(p.comm) from emp p;

/*	查询emp表中月薪大于2500的人数：*/
select count(1) from emp where emp.sal>2500;

/*	统计月薪与佣金之和大于2500元的人数*/

select count(1) from emp  where emp.sal+ifnull(emp.comm,0)>2500;

/*	查询有佣金的人数，以及有领导的人数*/
select count(1) from emp where emp.comm is not null and emp.mgr is not null;


/*	查询所有雇员月薪和*/
select sum(sal) from emp;

/*	查询所有雇员月薪和，以及所有雇员佣金和*/
select sum(sal),sum(ifnull(emp.comm,0)) from emp;
select sum(sal),sum(emp.comm) from emp;

/*	查询所有雇员月薪+佣金和*/
select sum(sal+ifnull(emp.comm,0)) from emp;

/*	统计所有员工平均工资*/
/*29025.00/14*/
select avg(sal) from emp;