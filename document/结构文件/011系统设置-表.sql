--机构类型表
if exists(select name from sysobjects where name='t_orgtype')
	drop table t_orgtype
go
create table [dbo].[t_orgtype] (
	[c_no] [int] identity (10, 2) not null ,
	[c_order] [int] null , 		--顺序
	[c_mark] [int] default 1 null , 		--0 启用前缀  1 不启用前缀			
	[c_name] [char] (30)  not null,  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
--机构等级表（为机构管理服务）
if exists(select name from sysobjects where name='t_orgclass')
	drop table t_orgclass
go
create table [dbo].[t_orgclass] (
	[c_no] [int] identity (10, 10) not null , 
	[c_name] [char] (30)  not null,  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--机构表
if exists(select name from sysobjects where name='t_organization')
	drop table t_organization
go
create table [dbo].[t_organization] (
	[c_no] [int] identity (1000, 1) not null ,
	[c_orgtypeid] [int] not null ,
	[c_orgclassid] [int] null ,
	[c_name] [char] (50)  not null , 
	[c_prefix] [char] (2)  null , 
	[c_path] [char] (14)  not null unique , 
	[c_parent] [int] not null ,		--父机构ID
	[c_deptid] [int] not null ,		--父机构部门ID
	[c_license] [char] (50) null ,		--工商营业执照编号
	[c_lbeg] [char] (8) null ,		--工商营业执照编号有效开始时间
	[c_lend] [char] (8) null ,		--工商营业执照编号有效结束时间
	[c_permit] [char] (50) null ,		--企业经营许可证号
	[c_pbeg] [char] (8) null ,		--企业经营许可证号有效开始时间
	[c_pend] [char] (8) null ,		--企业经营许可证号有效结束时间	
	[c_tax] [char] (50) null ,		--税务登记证号
	[c_organization] [char] (50) null ,	--组织机构代码
	[c_jobnumber] [char] (10) null ,	--负责人工号  	 
	[c_seal] [char] (1) null ,		--0 已篆刻公章 1 未篆刻公章
	[c_slocation] [char] (50) null ,	--公章存放地址	
	[c_bbank] [int]  null ,			--基本户银行
	[c_bcard] [char] (50) null ,		--基本户账号
	[c_gbank1] [int]  null ,		--一般户1银行
	[c_gcard1] [char] (50) null ,		--一般户1账号
	[c_gbank2] [int]  null ,		--一般户2银行
	[c_gcard2] [char] (50) null ,		--一般户2账号	
	[c_phone] [char] (20) null ,		--电话
	[c_address] [char] (100) null ,		--地址
	[c_flag] [char] (1) default '0'  null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
--部门表
if exists(select name from sysobjects where name='t_dept')
	drop table t_dept
go
create table [dbo].[t_dept] (
	[c_no] [int] identity (1, 5) not null ,
	[c_orgid] [int] not null ,
	[c_name] [char] (30)  not null ,  
	[c_ptnature] int  not null , 	--性质	
	[c_system] [int] null ,		--政策体系  	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_dept on t_dept(c_orgid,c_name)
go
--职位岗位表
if exists(select name from sysobjects where name='t_post')
	drop table t_post
go
create table [dbo].[t_post] (
	[c_no] [int] identity (1, 3) not null ,
	[c_orgid] [int] not null ,
	[c_deptid] [int] not null ,
	[c_type] [int] null ,		--1 职位 2 岗位
	[c_name] [char] (30)  not null ,  
	[c_ishead] [char] (1) default '1' null ,	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_post on t_post(c_orgid,c_deptid,c_name )
go
--职位岗位权限表
if exists(select name from sysobjects where name='t_postqx')
	drop table t_postqx
go
create table [dbo].[t_postqx] (
	[c_no] [int] identity (1, 1) not null ,
	[c_postid] [int] not null ,
	[c_xitong] [char] (1)  not null ,	--A、B、C...
	[c_menu] [varchar] (2000)  not null ,  
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_postqx on t_postqx(c_postid,c_xitong )
go
--保险公司表
if exists(select name from sysobjects where name='t_company')
	drop table t_company
go
create table [dbo].[t_company] (
	[c_no] [int] identity (100, 1) not null ,
	[c_type] [int] not null , --性质	
	[c_fullname] [char] (50)  not null ,--全称
	[c_name] [char] (30)  not null ,    --简称	
	[c_tbdl] [int] not null , --投保单长度
	[c_bdl] [int] not null ,  --保单长度
	[c_addr] [char] (50)  null ,
	[c_zipcode] [char] (10)  null ,
	[c_phone] [char] (15)  null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--职业代码表
if exists(select name from sysobjects where name='t_occupation')
	drop table t_occupation
go
create table [dbo].[t_occupation] (
	[c_no] [int] identity (1, 1) not null , 
	[c_companyid] int not null,
	[c_code] [char] (20)  not null ,
	[c_name] [char] (50)  not null ,	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_occupation on t_occupation(c_companyid,c_code )
go
--系数类型表
if exists(select name from sysobjects where name='t_convertT')
	drop table t_convertT
go
create table [dbo].[t_convertT] (
	[c_no] [int] identity (1, 1) not null ,  
	[c_name] [char] (30)  null , 	--系数名称
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_convertT on t_convertT(c_name )
go
--系数表
if exists(select name from sysobjects where name='t_convert')
	drop table t_convert
go
create table [dbo].[t_convert] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 	--公司id  
	[c_convertT] [int] not null , 	--系统名称id
	[c_jfqx] [int] null ,		--缴费期间	
	[c_dec] [decimal](6, 4) null,	--系数	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_convert on t_convert(c_companyid,c_convertT,c_jfqx )
go
--代理人政策体系表
if exists(select name from sysobjects where name='t_policy')
	drop table t_policy
go
create table [dbo].[t_policy] (
	[c_no] [int] identity (1, 1) not null , 
	[c_ptnature] int  not null , 	--性质	
	[c_system] [int] null ,		--政策体系代码  	
	[c_name] [char] (30)  null , 	--政策体系名称
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
insert  t_policy(c_ptnature,c_system,c_name)values(3001,1,'直营')
go
insert  t_policy(c_ptnature,c_system,c_name)values(3001,2,'渠道') 
go 
insert  t_policy(c_ptnature,c_system,c_name)values(3002,11,'产险')
go  
--政策职级定义表
if exists(select name from sysobjects where name='t_pzjdy')
	drop table t_pzjdy
go
create table [dbo].[t_pzjdy] (  	
	[c_ptnature] int  not null , 	--性质	
	[c_system] [int] null ,		--政策体系代码   	
	[c_level] [int] null ,		--1层、2层、3层 	 
	[c_type] [int] null ,
	[c_name] [char](30) null 
) on [primary]
go 
--直营
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,1,1,10,'理财顾问')
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,1,1,11,'理财主任')
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,1,2,20,'理财经理')
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,1,3,30,'理财总监')
go
--渠道
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,1,10,'见习客户经理') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,1,11,'初级客户经理') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,1,12,'中级客户经理') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,1,13,'高级客户经理') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,2,20,'初级区经理') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,2,21,'中级区经理') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,2,22,'高级区经理') 
go
--产险
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3002,11,1,10,'代理人')
go 