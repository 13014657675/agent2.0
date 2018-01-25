--1命令语句执行日志表
if exists(select name from sysobjects where name='t_sqlrecord')
	drop table t_sqlrecord
go
create table [dbo].[t_sqlrecord] (
	[c_no] [int] identity (1, 1) not null ,
	[c_str] char(100) null ,
	[c_sql] [varchar] (2000)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--2固定名称代码表（ 10政治面貌、11民族、13学历、14证件、15银行、16血型、30保险公司、50 缴费方式 ）
if exists(select name from sysobjects where name='t_namecode')
	drop table t_namecode
go
create table [dbo].[t_namecode] (
	[c_no] [int] identity (1, 1) not null ,
	[c_type] [int] not null  ,
	[c_code] [int] not null unique,
	[c_name] [char] (50)  null 
) on [primary]
go 
insert t_namecode(c_type,c_code,c_name)  values(10,1001,'党员')
go 
insert t_namecode(c_type,c_code,c_name)  values(10,1002,'团员')
go 
insert t_namecode(c_type,c_code,c_name)  values(10,1003,'群众')
go
insert t_namecode(c_type,c_code,c_name)  values(11,1101,'汉族')
go 
insert t_namecode(c_type,c_code,c_name)  values(11,1102,'回族')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1301,'小学')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1302,'初中')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1303,'高中')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1304,'中专')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1305,'大专')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1306,'本科')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1307,'硕士')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1308,'博士')
go 
insert t_namecode(c_type,c_code,c_name)  values(14,1401,'身份证')
go
insert t_namecode(c_type,c_code,c_name)  values(14,1402,'户口薄') 
go
insert t_namecode(c_type,c_code,c_name)  values(14,1403,'护照')
go  
insert t_namecode(c_type,c_code,c_name)  values(15,1501,'建设银行')
go 
insert t_namecode(c_type,c_code,c_name)  values(15,1502,'工商银行')
go 
insert t_namecode(c_type,c_code,c_name)  values(15,1503,'广发银行')
go 
insert t_namecode(c_type,c_code,c_name)  values(15,1504,'农业银行')
go 
insert t_namecode(c_type,c_code,c_name)  values(15,1505,'交通银行')
go 
insert t_namecode(c_type,c_code,c_name)  values(15,1506,'邮政储蓄')
go
insert t_namecode(c_type,c_code,c_name)  values(15,1507,'中国银行')
go
insert t_namecode(c_type,c_code,c_name)  values(15,1508,'光大银行')
go
insert t_namecode(c_type,c_code,c_name)  values(15,1509,'兴业银行')
go
insert t_namecode(c_type,c_code,c_name)  values(15,1510,'招商银行')
go
insert t_namecode(c_type,c_code,c_name)  values(15,1530,'农村信用社')
go
insert t_namecode(c_type,c_code,c_name)  values(16,1601,'O型')
go
insert t_namecode(c_type,c_code,c_name)  values(16,1602,'A型')
go
insert t_namecode(c_type,c_code,c_name)  values(16,1603,'B型')
go
insert t_namecode(c_type,c_code,c_name)  values(16,1604,'AB型')
go
insert t_namecode(c_type,c_code,c_name)  values(16,1605,'其他')
go
insert t_namecode(c_type,c_code,c_name)  values(30,3001,'寿险')
go
insert t_namecode(c_type,c_code,c_name)  values(30,3002,'产险')
go 
insert t_namecode(c_type,c_code,c_name)  values(50,5001,'趸缴')
go
insert t_namecode(c_type,c_code,c_name)  values(50,5002,'年缴')
go
insert t_namecode(c_type,c_code,c_name)  values(50,5003,'半年缴')
go
insert t_namecode(c_type,c_code,c_name)  values(50,5004,'季缴')
go
insert t_namecode(c_type,c_code,c_name)  values(50,5005,'月缴')
go
--参数表
if exists(select name from sysobjects where name='tb_param')
	drop table tb_param
go
create table [dbo].[tb_param] (
	[c_no] [int] identity (1, 1) not null ,
	[c_pid] [int] null ,	
	[c_type] [int] null ,	--1 字符 2 数值
	[c_name] [char] (50) null unique 	 
) on [primary]
go
--类型表
if exists(select name from sysobjects where name='tb_projectclass')
	drop table tb_projectclass
go
create table [dbo].[tb_projectclass] (
	[c_no] [int] identity (1, 1) not null ,
	[c_name] [char] (50) null unique , 	 
	[c_o] [int] null 	
) on [primary]
go
--函数表
if exists(select name from sysobjects where name='tb_function')
	drop table tb_function
go
create table [dbo].[tb_function] (
	[c_no] [int] identity (1, 1) not null ,
	[c_projectclass] [int] null ,		--类型	
	[c_fid] [int] null ,	
	[c_name] [char] (50) null unique ,
	[c_proc] [char] (30) null unique	 
) on [primary]
go
--函数参数表
if exists(select name from sysobjects where name='tb_fparam')
	drop table tb_fparam
go
create table [dbo].[tb_fparam] (
	[c_no] [int] identity (1, 1) not null , 
	[c_fid] [int] not null ,
	[c_order] [int] null ,
	[c_xid] [int] null	 
) on [primary]
go
create unique index i_fparam on tb_fparam(c_fid,c_xid)
go
--组合表
if exists(select name from sysobjects where name='tb_combination')
	drop table tb_combination
go
create table [dbo].[tb_combination] (
	[c_no] [int] identity (3000, 1) not null ,
	[c_projectclass] [int] null ,		--类型	
	[c_cid] [int] not null ,
	[c_name] [char] (150) null unique,
	[c_t1] [int]  null , --1 地址 2数字
	[c_o1] [int]  null , --地址
	[c_x1] [decimal](12,2) null , --数字
	[c_op] [int]  null , --1 加 2 减 3 乘 4 除 
	[c_t2] [int]  null , --1 地址 2数字
	[c_o2] [int]  null ,
	[c_x2] [decimal](12,2) null  --数字
) on [primary]
go 
-- 组合参数表
if exists(select name from sysobjects where name='tb_cparam')
	drop table tb_cparam
go
create table [dbo].[tb_cparam] (
	[c_no] [int] identity (1, 1) not null ,
	[c_cid] [int] not null ,
	[c_order] [int] null ,
	[c_xid] [int] null	 
) on [primary]
go 
create unique index i_cparam on tb_cparam(c_cid,c_xid)
go
-- 处理器
if exists(select name from sysobjects where name='vb_processor')
	drop view vb_processor
go
create view [dbo].[vb_processor]  
as
select c_projectclass,c_fid c_o,c_name,1 c_type from tb_function
union 
select c_projectclass,c_cid c_o,c_name,2 c_type from tb_combination  
