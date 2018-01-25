--产品分类表
if exists(select name from sysobjects where name='t_ptclass')
	drop table t_ptclass
go
create table [dbo].[t_ptclass] (
	[c_no] [int] identity (10, 2) not null ,
	[c_ptnature] int  not null , --性质			
	[c_name] [char] (30)  not null,  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
--产品类型表
if exists(select name from sysobjects where name='t_pttype')
	drop table t_pttype
go
create table [dbo].[t_pttype] (
	[c_no] [int] identity (1, 3) not null ,
	[c_ptclassid] [int] not null , 	   --产品分类			
	[c_name] [char] (30)  not null,  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
--产品表
if exists(select name from sysobjects where name='t_product')
	drop table t_product
go
create table [dbo].[t_product] (
	[c_no] [int] identity (1, 2) not null ,	--奇数编号
	[c_companyid] [int] not null , 		--公司	
	[c_ptnature] int  not null , 		--性质		
	[c_ptclassid] [int]  null , 	   	--产品分类	
	[c_pttypeid] [int]  null , 		--产品类型			
	[c_code] [char] (30)  not null,  
	[c_fullname] [char] (50)  not null,	--全称  
	[c_name] [char] (30)  not null,  	--简称
	[c_type] [int] null ,  			--1 主险 2 附加险
	[c_flag] [char] (1) default '0'  null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
create unique index i_product on t_product(c_companyid,c_code)
go
--产品组件表
if exists(select name from sysobjects where name='t_pcomponent')
	drop table t_pcomponent
go
create table [dbo].[t_pcomponent] (
	[c_no] [int] identity (2, 2) not null ,	--偶数编号
	[c_companyid] [int] not null , 		--公司	
	[c_productid] [int] not null , 		--产品id	 
	[c_pcode] [char] (30)  not null, 	--组件代码 
	[c_pfullname] [char] (50)  not null,	--组件全称  
	[c_pname] [char] (30)  not null,  	--组件简称
	[c_ptype] [int] null ,  		--1 主险 2 附加险 
	[c_flag] [char] (1) default '0'  null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_pcomponent on t_pcomponent(c_companyid,c_productid,c_pcode)
go
--产品费率表
if exists(select name from sysobjects where name='t_ptrate')
	drop table t_ptrate
go
create table [dbo].[t_ptrate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 	--公司id	
	[c_productid] [int] not null , 	--产品id	 	 			 
	[c_type] [char] (1)  not null , --1，根据保费做基数 2，根据保额做基数
	[c_base] [decimal](10, 2) null ,--基数	
	[c_bxqlx] [char] (1)  null ,	--0，终身 1，保止几岁 2，保n年
	[c_bxq] [int] null ,		--保险期
	[c_jfqlx] [char] (1)  null ,    --0，趸交 1，缴止几岁 2，缴n年
	[c_jfq] [int] null ,		--缴费期 
	[c_age] [int] null ,		--年龄
	[c_male] [decimal](15, 4) null ,--男费率
	[c_female] [decimal](15, 4) null ,--女费率	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go    
--产品系数表
if exists(select name from sysobjects where name='t_ptconvert')
	drop table t_ptconvert
go
create table [dbo].[t_ptconvert] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 	--公司id	
	[c_productid] [int] not null , 	--产品id	 
	[c_convertT] [int] not null , 	--类型
	[c_jfqx] [int] null ,		--缴费期	
	[c_dec] [decimal](6, 4) null,	--系数	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_ptconvert on t_ptconvert(c_companyid,c_productid,c_convertT,c_jfqx)
go
--保险责任表
if exists(select name from sysobjects where name='t_pliability')
	drop table t_pliability
go
create table [dbo].[t_pliability] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 		--公司id	
	[c_productid] [int] not null , 		--产品id	 
	[c_pname] [char] (60)  not null , 	--保险责任名称
	[c_pdesc] [varchar] (3000)  not null , 	--保险责任描述 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
create unique index i_pliability on t_pliability(c_companyid,c_productid,c_pname)
go
--保险责任参数名词表
if exists(select name from sysobjects where name='t_pliabilityc')
	drop table t_pliabilityc
go
create table [dbo].[t_pliabilityc] (
	[c_no] [int] not null ,
	[c_companyid] [int] not null , 		--公司id	
	[c_productid] [int] not null , 		--产品id	  
	[c_name] [char] (30)  null ,		--参数名称	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
create unique index i_pliabilityc on t_pliabilityc(c_companyid,c_productid,c_name)
go
--保险责任参数名词值表
if exists(select name from sysobjects where name='t_pliabilitycv')
	drop table t_pliabilitycv
go
create table [dbo].[t_pliabilitycv] (
	[c_companyid] [int] not null , 		--公司id	
	[c_productid] [int] not null , 		--产品id	 	
	[c_pliabilitycid] [int] not null , 
	[c_bxqtype] [int] null ,	-- 保险期间类型 0 终身 1 保*年 2 保至*岁
	[c_bxq] [int] null ,		-- 保险期间 
	[c_jfqtype] [int] null ,	-- 交费期间类型 0 趸交 1 交*年 2 交至*岁
	[c_jfq] [int] null ,		-- 交费期间 
	[c_t] [int] not null , 		--1 保单年度 2 被保人年龄
	[c_v] [int]  null , 		--单个数字	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--保险责任结构表
if exists(select name from sysobjects where name='t_pliabilitys')
	drop table t_pliabilitys
go
create table [dbo].[t_pliabilitys] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 		--公司id	
	[c_productid] [int] not null , 		--产品id 
	[c_pname] [char] (50)  null ,		--项目名称
	  
	[c_condition] [int] not null , 		--条件类型 --1 全部 2 单个 3 区间
	[c_cv2t] [int] not null , 		--1 保单年度 2 被保人年龄 （参照t_pliabilityc表） 
	[c_cv2] [int]  null , 			--单个数字 
	[c_cv31t] [int] not null , 		--1 保单年度 2 被保人年龄 （参照t_pliabilityc表） 
	[c_cv31] [int]  null , 			--区间开始数字 
	[c_cv32t] [int] not null , 		--1 保单年度 2 被保人年龄 （参照t_pliabilityc表） 
	[c_cv32] [int]  null , 			--区间结束数字 
	
	[c_result] [int]  not null , 		--赔付类型 0 数值 1 基本保额的百分比 2 累计保费的百分比 
	[c_rv] [decimal](15, 4) null,	 	--数值	     
	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
create unique index i_pliabilitys on t_pliabilitys(c_companyid,c_productid,c_pname,c_condition,c_cv2t,c_cv2,c_cv31t,c_cv31,c_cv32t,c_cv32)
go