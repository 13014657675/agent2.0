--代理人基础数据表
if exists(select name from sysobjects where name='t_agentset')
	drop table t_agentset
go
create table [dbo].[t_agentset] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] null ,			--机构id  
	[c_system] [int] null ,			--政策体系  	
	[c_jobnumber] [char](10) not null ,	--工号
	[c_tjrgh] [char](10) not null ,		--推荐人工号
	[c_type] [int] null ,			--职级
	[c_sxrgh] [char](10) null ,		--增员世袭人工号（对上给予利益）
	[c_cxrgh] [char](10) null ,		--利益承袭人工号（对下收取利益）
	[c_jcrgh] [char](10) null ,		--客户继承人工号（继承客户资源）
	[c_flag] [char](1) default '0' null ,
	[c_jobnm] [char](10) null ,
	[c_operator] [char](10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
insert t_agentset(c_jobnumber,c_tjrgh)values('0000000000','0000000000')
go 
--代理人历史状态表
if exists(select name from sysobjects where name='t_agentls')
	drop table t_agentls
go
create table [dbo].[t_agentls] (
	[c_no] [int] identity (1, 1) not null , 
	[c_orgid] [int] null ,			--机构id  
	[c_system] [int] null ,			--政策体系  	
	[c_jobnumber] [char](10) not null ,	--工号
	[c_type] [int] null ,			--职级
	[c_director] [char] (10)  not null ,	--上级主管
	[c_ksrq] [char](8) null ,
	[c_jsrq] [char](8) null ,
	[c_flag] [char](1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
insert t_agentls(c_jobnumber,c_director)values('0000000000','0000000000')
go
--代理人育成关系表
if exists(select name from sysobjects where name='t_agentgx')
	drop table t_agentgx
go
create table [dbo].[t_agentgx] (
	[c_no] [int] identity (1, 1) not null ,
	[c_system] [int] null ,			--政策体系  	
	[c_layer] [int] null ,			--层数 
	[c_ycgh] [char](10) not null ,		--育成人工号
	[c_byczj] [int] not null ,		--被育成人职级
	[c_bycgh] [char](10)  not null ,	--被育成人工号
	[c_flag] [char](1) default '0' null , 
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--代理人架构试图
if exists (select table_name from information_schema.views  where table_name = 'v_sxagent')
   	drop view v_sxagent
go
create view v_sxagent (
	c_orgid,	-- 机构
	c_jobnumber,	-- 工号
	c_name,		-- 姓名
	c_system,	-- 政策体系
	c_tjrgh,	-- 推荐人
	c_type,		-- 职级
	c_director,	-- 上级主管
	c_ksrq		-- 开始日期 
	) 
as  
select 	a.c_orgid,	-- 机构 
	a.c_jobnumber,	-- 工号
	a.c_name,	-- 姓名
	b.c_system,	-- 政策体系 	
	b.c_tjrgh,	-- 推荐人
	b.c_type,	-- 职级	
	c.c_director,	-- 上级主管 
	c.c_ksrq 	-- 开始日期 
	from t_staff a,t_agentset b,t_agentls c
	where 	a.c_quitdate is null and b.c_flag='0' and c.c_flag='0'
	 	and a.c_jobnumber=b.c_jobnumber and a.c_jobnumber=c.c_jobnumber 
go
--代理人佣金表
if exists(select name from sysobjects where name='t_agentcommission')
	drop table t_agentcommission
go
create table [dbo].[t_agentcommission] (
	[c_no] [int] identity (1, 1) not null ,	
	[c_year] [int] null ,			-- 年 
	[c_month] [int] null ,			-- 月  	
	[c_orgid] [int] not null ,		-- 机构	
	[c_jobnumber] [char](10) not null ,	-- 工号
	[c_name] [char](20) not null ,		-- 姓名
	[c_system] [int] null ,			-- 政策体系   
	[c_type] [int] null ,
	[c_str] [varchar] (2000)  null ,	-- 工资条（明细）
	[c_strv] [decimal](15, 2) null  	-- 工资条（合计）     
) on [primary]
go
create unique index i_agentcommission on t_agentcommission(c_year,c_month,c_orgid,c_jobnumber) 