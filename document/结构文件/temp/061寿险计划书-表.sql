--计划书表
if exists(select name from sysobjects where name='t_plan_book')
	drop table t_plan_book
go
create table [dbo].[t_plan_book] (
	[c_no] [int] not null ,
	[c_tbrname] [char] (30) null ,	--投保人姓名
	[c_bbrname] [char] (30) null,	--被保人姓名
	[c_bbrsex] [int] not null ,	--被保人性别 1 男 2 女
	[c_bbirthy] [int] null,		--被保人出生年
	[c_bbirthm] [int] null,		--被保人出生月
	[c_bbirthd] [int] null,		--被保人出生日
	[c_age] [int] null ,		--年龄 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--计划书险种表
if exists(select name from sysobjects where name='t_plan_books')
	drop table t_plan_books
go
create table [dbo].[t_plan_books] (
	[c_no] [int] identity (1, 1) not null ,
	[c_plan_bookid] [int] not null ,	
	[c_companyid] [int] not null,	-- 保险公司
	[c_productid] [int] not null , 	-- 产品险种id	 
	[c_basetype] [int] null ,	-- 基数类型 1 保额 2 保费
	[c_base] [decimal](15,2) null , -- 基数 
	[c_bxqtype] [int] null ,	-- 保险期间类型 0 终身 1 保*年 2 保至*岁
	[c_bxq] [int] null ,		-- 保险期间 
	[c_jfqtype] [int] null ,	-- 交费期间类型 0 趸交 1 交*年 2 交至*岁
	[c_jfq] [int] null ,		-- 交费期间
	[c_jfqx] [int] null , 		-- 交费期限	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_plan_books on t_plan_books(c_plan_bookid,c_companyid,c_productid)
go