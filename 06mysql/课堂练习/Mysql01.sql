/*创建一张User表*/
/*
字段的命名格式
英文单词 非驼峰 小写
例：  login_name
*/
create table s_user(
	id int not null,
	user_name varchar(50),
  sex  tinyint(1),/*如果存为字符串用char,用数值型用tinyint int(1)*/
  login_name varchar(50),
  salary double(11,2),/*总长度为11位，小数点占2位，整数部分为9位即到亿*/
  love varchar(50),/*1,2,3,4,5-->json数据*/
  create_time datetime,/*date datatime timestamp */
  my_timestamp timestamp
);

insert into s_user(id,user_name,sex,login_name,salary,love,create_time) VALUES(111,'admin',1,'admin',10000.80,'1,2,3,4',now());
/*
char：固定长度字符串类型；    char(10)     'aaa       '  占10位
text 字符串，大字段 一般用来存储文章信息
blob  字节 大字段 用来存储图片
一张表中不能创建多个大字段类型，如果业务需要多个，就要拆表
*/

create table s_user_detail(
 id int ,
 link_id int,
 type char(1), /*存放01---99*/
 id_no_img blob,
 remark text
);

/*添加字段 修改人 */
alter table s_user add create_id int;

desc  s_user;

/*修改字段类型  如果有记录会对记录的值进行格式转换，
有可能转换失败，字段类就无法进行修改
*/
/*Data truncated for column 'love' at row 2*/
alter table s_user modify love int;

alter table s_user modify sex char(1);

/*修改字段的名称*/
alter table s_user_detail change type  user_type char(1);

/*修改表名*/
rename table s_user_detail to s_user_detail2;

show tables;

drop table test;

/*===============DML=================*/
/*插入日期字符串 如果格式写错会转换失败，导致插入不成功*/
insert into s_user(id,user_name,sex,login_name,salary,love,create_time) VALUES(133,'admin1',1,'admin1',10000.80,'1,2,3,4','2018-08-01 20:34:23');
/*不写插入字段名称，需要全部字段要按顺序进行赋值*/
/* Column count doesn't match value count at row 1*/
insert into s_user VALUES(134,'admin3',1,'admin3',10000.80,'1,2,3,4','2018-08-01 20:34:23');
create table s_user1(
	id int not null,
	user_name varchar(50),
  sex  tinyint(1),/*如果存为字符串用char,用数值型用tinyint int(1)*/
  login_name varchar(50),
  salary double(11,2),/*总长度为11位，小数点占2位，整数部分为9位即到亿*/
  love varchar(50),/*1,2,3,4,5-->json数据*/
  create_time datetime,/*date datatime timestamp */
  my_timestamp timestamp
);

/*s_user里的记录插入到s_user1里*/
/* 必须写上表的字段，个数要对应上*/
insert into s_user1(id,user_name,sex,login_name,salary,love,create_time,my_timestamp) 
	select id,user_name,sex,login_name,salary,love,create_time,my_timestamp from s_user;

/*数据备份时经常这么用*/
create table s_user_bak(select * from s_user);



create table emp(
id int,
name varchar(100),
gender varchar(10),
birthday date,
salary float(10,2),
entry_date date,
resume text
);

INSERT INTO emp(id,name,gender,birthday,salary,entry_date,resume)
VALUES(1,'zhangsan','female','1990-5-10',10000,'2015-5-5-','good girl');

INSERT INTO emp(id,name,gender,birthday,salary,entry_date,resume)
VALUES(2,'lisi','male','1995-5-10',10000,'2015-5-5','good boy');

INSERT INTO emp(id,name,gender,birthday,salary,entry_date,resume)
VALUES(3,'你好','male','1995-5-10',10000,'2015-5-5','good boy');

select * from emp;

/*==========更新语句如果有带条件必须要带上，切勿遗漏======*/
ALTER table emp add job varchar(50);
update emp set job='it民工';

/*将所有员工薪水修改为5000元。*/
update emp set salary=5000;

/*将姓名为’zs’的员工薪水修改为3000元。*/
update emp set salary=3000 where `name`='zs';

/*将姓名为’aaa’的员工薪水修改为4000元,job改为ccc。*/

update emp set salary=4000,job='ccc' where `name`='lisi';

/*将wu的薪水在原有基础上增加1000元。*/
update emp set salary=salary+100 where `name`='lisi';


