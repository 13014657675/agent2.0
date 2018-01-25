--目录表
if exists(select name from sysobjects where name='t_catalog')
	drop table t_catalog
go
create table [dbo].[t_catalog] (
	[c_no] [int] identity (1, 1) not null ,
	[c_sys] [int] not null ,		--1 文件管理 ；2 常用工具 ； 
	[c_name] [char] (30)  not null ,   
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
create unique index i_catalog on t_catalog(c_sys,c_name)
go
--文件表
if exists(select name from sysobjects where name='t_file')
	drop table t_file
go
create table [dbo].[t_file] (
	[c_no] [int] identity (1, 1) not null ,
	[c_sys] [int] not null ,		--1 文件管理 ；2 常用工具 ； 3 签报管理 ；
	[c_catalogid] [int]  null ,  
	[c_name] [char] (200)  not null ,  	--显示文件名
	[c_save] [char] (50)  not null ,  	--保存文件名		
	[c_url] [char] (150)  not null ,  	--物理地址
	[c_flag] [char] (1) default '0' null ,  --状态
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--系统角色表
if exists(select name from sysobjects where name='t_role')
	drop table t_role
go
create table [dbo].[t_role] (
	[c_no] [int] identity (1, 1) not null ,
	[c_sys] [int] not null ,		--1 文件管理 ；3 签报管理 
	[c_jobnumber] [char](10) not null ,	--工号
	[c_role] [int]  null ,			--1 文件管理｛101 审批人 ｝ ；3 签报管理 ｛301 审批人 302 财务负责人 303 分管总｝  
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
create unique index i_role on t_role(c_sys,c_jobnumber,c_role)
go 
--分管总设置表
if exists(select name from sysobjects where name='t_roleset')
	drop table t_roleset
go
create table [dbo].[t_roleset] (
	[c_no] [int] identity (1, 1) not null ,
	[c_sys] [int] not null ,		--3 签报管理 
	[c_jobnumber] [char](10) not null ,	--工号
	[c_orgid] [int] not null ,		--机构id  
	[c_deptid] [int] not null ,		--部门id
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
create unique index i_roleset on t_roleset(c_sys,c_jobnumber,c_orgid,c_deptid)
go
--文件签发表
if exists(select name from sysobjects where name='t_filesigned')
	drop table t_filesigned
go
create table [dbo].[t_filesigned] (
	[c_no] [int] identity (1, 1) not null , 
	[c_dname] [char] (30)  not null ,	--发文部门  
	[c_dcode] [char] (30)  not null ,	--发文字号 
	[c_write] [char] (30)  not null ,	--拟稿人  
	[c_check] [char] (30)  not null ,	--校对人 
	[c_fileid] [int] not null ,		--文件id	
	[c_note] [char](200)  null ,		--备注	 
	[c_jobnm] [char] (10)  not null ,	--add 添加 ， zz 终止
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go 
--文件权限表
if exists(select name from sysobjects where name='t_fileJT')
	drop table t_fileJT
go
create table [dbo].[t_fileJT] (
	[c_no] [int] identity (1, 1) not null ,  
	[c_fileid] [int] not null ,		--文件id		 	 
	[c_postid] [int] not null ,		--岗位id  
	[c_jobnm] [char] (10)  not null ,	--
	[c_flag] [char] (1) default '0' null ,  --状态
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--文件阅读记录表
if exists(select name from sysobjects where name='t_fileRD')
	drop table t_fileRD
go
create table [dbo].[t_fileRD] (
	[c_no] [int] identity (1, 1) not null ,  
	[c_fileid] [int] not null ,		--文件id	  	 	 
	[c_jobnumber] [char](10) not null ,	--工号
	[c_times] [int]  not null ,		--次数    
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--流转表
if exists(select name from sysobjects where name='t_sprocess')
	drop table t_sprocess
go
create table [dbo].[t_sprocess] (
	[c_no] [int] identity (1, 1) not null , 
	[c_sys] [int] not null ,		--1 文件管理 ；3 签报管理 
	[c_sid] [int]  not null ,		--签报id   	
	[c_return] [int] not null ,		--1:同意 2:不同意 	 
	[c_note] [char](200)  null ,		--备注   
	[c_send] [char](10)  null ,		--发送人
	[c_receive] [char](10)  null ,	        --接收人
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--签报表
if exists(select name from sysobjects where name='t_signed')
	drop table t_signed
go
create table [dbo].[t_signed] (
	[c_no] [int] not null , 
	[c_type] [int] not null ,		--31 项目签报  ；32 费用签报
	[c_apply] [char] (8)  not null ,	--申请日期   
	[c_cost] [decimal](15, 2) null ,	--费用金额  	  
	[c_fileid] [int]  null ,		--文件id		 	
	[c_note] [varchar](2000)  null ,	--内容
	[c_jobnm] [char] (10)  not null ,	--add 添加 ，zz 终止
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--机构流转表
if exists(select name from sysobjects where name='t_orgsigned')
	drop table t_orgsigned
go
create table [dbo].[t_orgsigned] (
	[c_no] [int] identity (1, 1) not null , 
	[c_sys] [int] not null ,		--1 文件管理 ；3 签报管理 
	[c_sid] [int]  not null ,		--签报id   	
	[c_orgid] [int] not null ,		--始机构id  	 
	[c_to] [int] not null ,			--去向 1 本机构结束 2 本机构结束后发送给审批人 3 其他机构	
	[c_orgid2] [int] not null ,		--接收机构id  
	[c_deptid2] [int] not null ,		--接收部门
	[c_jobnumber2] [char](10)  null ,	--接收人
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go 
--授权定义表
if exists(select name from sysobjects where name='t_grant')
	drop table t_grant
go
create table [dbo].[t_grant] (
	[c_no] [int] identity (1, 1) not null ,   
	[c_sys] [int] not null ,		--3 签报管理  
	[c_jobnumber] [char](10) not null ,	--工号
	[c_money] [decimal](10, 2) null ,	--授权金额   
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--签报提示表
if exists(select name from sysobjects where name='t_sprompt')
	drop table t_sprompt
go
create table [dbo].[t_sprompt] (
	[c_no] [int] identity (1, 1) not null , 
	[c_sys] [int] not null ,		--1 文件管理 ；3 签报管理 
	[c_sid] [int]  not null ,		--签报id   	
	[c_jobnumber] [char](10) not null ,	--工号
	[c_flag] [char] (1) default '0' null 	 
) on [primary]
go