--手续费比例<传统型>
if exists(select name from sysobjects where name='t_srate')
	drop table t_srate
go
create table [dbo].[t_srate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 	--公司id	
	[c_productid] [int] not null , 	--产品id	
	[c_jfqx] [int] not null ,	--缴费期	
	[c_bdnd] [int] not null ,	--保单年度
	[c_srate] [decimal](9, 4) null , 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_srate on t_srate(c_companyid,c_productid,c_jfqx,c_bdnd) 
go
--佣金项目表<传统型>
if exists(select name from sysobjects where name='t_exptype')
	drop table t_exptype
go
create table [dbo].[t_exptype] (
	[c_no] [int] identity (1, 1) not null ,	 
	[c_system] [int] not null ,	--政策体系代码  	
	[c_name] [char] (50)  not null, --项目名称   
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_exptype on t_exptype(c_system,c_name) 
go
--佣金比例<传统型>
if exists(select name from sysobjects where name='t_expsrate')
	drop table t_expsrate
go
create table [dbo].[t_expsrate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 	--公司id	
	[c_productid] [int] not null , 	--产品id			
	[c_jfqx] [int] not null ,	--缴费期	
	[c_bdnd] [int] not null ,	--保单年度
	[c_system] [int] null ,		--政策体系代码  	
	[c_exptypeid] [int] null ,	--项目id
	[c_srate] [decimal](9, 4) null , 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_expsrate on t_expsrate(c_companyid,c_productid,c_jfqx,c_bdnd,c_system,c_exptypeid) 
go
--寿险首期对账表
if exists(select name from sysobjects where name='t_sxdz')
	drop table t_sxdz
go
create table [dbo].[t_sxdz] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- 机构
	[c_year] [int] null ,			-- 年 
	[c_month] [int] null ,			-- 月  
	[c_companyid] int not null,		-- 保险公司
	[c_bd] [char] (30)  null ,		-- 保单 
	[c_tbrname] [char] (30) null ,		-- 投保人姓名
	[c_bbrname] [char] (30) null ,		-- 被保人姓名 
	[c_cbrq] [datetime] null ,		-- 承保日期 
	[c_bxf] [decimal](15, 2) null ,		-- 保险费
	[c_sxf] [decimal](15, 2) null ,	 	-- 手续费	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--寿险续期对账表
if exists(select name from sysobjects where name='t_sxdz_xq')
	drop table t_sxdz_xq
go
create table [dbo].[t_sxdz_xq] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- 机构
	[c_year] [int] null ,			-- 年 
	[c_month] [int] null ,			-- 月  
	[c_companyid] int not null,		-- 保险公司
	[c_bd] [char] (30)  null ,		-- 保单 
	[c_bdnd] [int] null ,			-- 保单年度  
	[c_bxf] [decimal](15, 2) null ,		-- 保险费
	[c_sxf] [decimal](15, 2) null ,	 	-- 手续费	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--寿险结算表
if exists(select name from sysobjects where name='t_sxjs')
	drop table t_sxjs
go
create table [dbo].[t_sxjs] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- 机构
	[c_year] [int] null ,			-- 年 
	[c_month] [int] null ,			-- 月  
	[c_companyid] int not null,		-- 保险公司
	[c_bd] [char] (30)  null ,		-- 保单  
	[c_productid] [int] not null , 		-- 产品id	
	[c_bdnd] [int] null ,			-- 保单年度  
	[c_bxf] [decimal](15, 2) null ,		-- 保险费  
	[c_bxfr1] [decimal](7,3) null ,		-- 收入比率
	[c_bxfr2] [decimal](7,3) null ,		-- 支出比率
	[c_bxfy1] [decimal](15,3) null ,	-- 收入
	[c_bxfy2] [decimal](15,3) null , 	-- 支出  
	[c_note] char(300)  null ,		-- 备注
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxjs on t_sxjs(c_companyid,c_bd,c_productid,c_bdnd)
go  
--使用性质表
if exists(select name from sysobjects where name='t_usage')
	drop table t_usage
go
create table [dbo].[t_usage] (
	[c_no] [int] identity (1, 1) not null ,	 
	[c_system] [int] not null ,	--政策体系代码  	
	[c_name] [char] (50)  not null, --项目名称   
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_usage on t_usage(c_system,c_name) 
go
--手续费比例<车险>
if exists(select name from sysobjects where name='t_crate')
	drop table t_crate
go
create table [dbo].[t_crate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	--机构	
	[c_usageid] [int] not null , 	--使用性质id		
	[c_companyid] [int] not null , 	--公司id	
	[c_productid] [int] not null , 	--产品id	
	[c_type] [int] not null ,	--类型 1 签单日期 2 起保日期
	[c_ksrq] [char](8) not null ,	--开始日期 
	[c_rate] [decimal](9, 4) null , 	--费率 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_crate on t_crate(c_orgid,c_usageid,c_companyid,c_productid,c_type,c_ksrq) 
go
--车船税收入比例<车险>
if exists(select name from sysobjects where name='t_ctax')
	drop table t_ctax
go
create table [dbo].[t_ctax] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	--机构	
	[c_usageid] [int] not null , 	--使用性质id		
	[c_companyid] [int] not null , 	--公司id	
	[c_productid] [int] not null , 	--产品id	
	[c_type] [int] not null ,	--类型 1 签单日期 2 起保日期
	[c_ksrq] [char](8) not null ,	--开始日期 
	[c_rate] [decimal](9, 4) null , 	--费率 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_ctax on t_ctax(c_orgid,c_usageid,c_companyid,c_productid,c_type,c_ksrq) 
go
--佣金比例<车险>
if exists(select name from sysobjects where name='t_expcrate')
	drop table t_expcrate
go
create table [dbo].[t_expcrate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	--机构	
	[c_usageid] [int] not null , 	--使用性质id		
	[c_companyid] [int] not null , 	--公司id	
	[c_productid] [int] not null , 	--产品id	
	[c_type] [int] not null ,	--类型 1 签单日期 2 起保日期
	[c_ksrq] [char](8) not null ,	--开始日期 
	[c_rate] [decimal](9, 4) null , 	--费率 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_expcrate on t_expcrate(c_orgid,c_usageid,c_companyid,c_productid,c_type,c_ksrq) 
go
--车船税支出比例<车险>
if exists(select name from sysobjects where name='t_expctax')
	drop table t_expctax
go
create table [dbo].[t_expctax] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	--机构	
	[c_usageid] [int] not null , 	--使用性质id		
	[c_companyid] [int] not null , 	--公司id	
	[c_productid] [int] not null , 	--产品id	
	[c_type] [int] not null ,	--类型 1 签单日期 2 起保日期
	[c_ksrq] [char](8) not null ,	--开始日期 
	[c_rate] [decimal](9, 4) null , 	--费率 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_expctax on t_expctax(c_orgid,c_usageid,c_companyid,c_productid,c_type,c_ksrq) 
go
--产险预提佣金表
if exists(select name from sysobjects where name='t_cxytyj')
	drop table t_cxytyj
go
create table [dbo].[t_cxytyj] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- 机构
	[c_companyid] int not null,		-- 保险公司
	[c_ffrq] [char](8) not null ,		-- 发放日期	
	[c_productid] [int] not null , 		-- 产品id
	[c_bd] [char] (30)  null ,		-- 保单  
	[c_bxf] [decimal](15, 2) null ,		-- 保险费
	[c_ccs] [decimal](15, 2) null ,		-- 车船税 
	[c_bxfr2] [decimal](7,3) null ,		-- 佣金比率 
	[c_bxfy2] [decimal](15, 2) null ,	-- 佣金 
	[c_ccsr2] [decimal](7,3) null ,		-- 支出税比率 
	[c_ccsy2] [decimal](15, 2) null ,	-- 支出税	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_cxytyj on t_cxytyj(c_orgid,c_companyid,c_productid,c_bd) 
go
--产险首期对账表
if exists(select name from sysobjects where name='t_cxdz')
	drop table t_cxdz
go
create table [dbo].[t_cxdz] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- 机构
	[c_year] [int] null ,			-- 年 
	[c_month] [int] null ,			-- 月  
	[c_companyid] int not null,		-- 保险公司
	[c_type] [int] not null ,		-- 类型 1 签单日期 2 起保日期
	[c_bd] [char] (30)  null ,		-- 保单  
	[c_bxf] [decimal](15, 2) null ,		-- 保险费
	[c_ccs] [decimal](15, 2) null ,		-- 车船税
	[c_bxfy1] [decimal](15, 2) null ,	-- 手续费
	[c_bxfy2] [decimal](15, 2) null ,	-- 佣金
	[c_ccsy1] [decimal](15, 2) null ,	-- 收入税
	[c_ccsy2] [decimal](15, 2) null ,	-- 支出税	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_cxdz on t_cxdz(c_orgid,c_companyid,c_bd) 
go
--产险结算表
if exists(select name from sysobjects where name='t_cxjs')
	drop table t_cxjs
go
create table [dbo].[t_cxjs] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- 机构
	[c_year] [int] null ,			-- 年 
	[c_month] [int] null ,			-- 月  
	[c_companyid] int not null,		-- 保险公司
	[c_bd] [char] (30)  null ,		-- 保单  
	[c_productid] [int] not null , 		-- 产品id  
	[c_bxf] [decimal](15, 2) null ,		-- 保险费  
	[c_ccs] [decimal](15, 2) null ,		-- 车船税  
	[c_bxfr1] [decimal](7,3) null ,		-- 手续费比率
	[c_bxfr2] [decimal](7,3) null ,		-- 佣金比率
	[c_bxfy1] [decimal](15,3) null ,	-- 手续费
	[c_bxfy2] [decimal](15,3) null , 	-- 佣金
	[c_ccsr1] [decimal](7,3) null ,		-- 收入税比率
	[c_ccsr2] [decimal](7,3) null ,		-- 支出税比率
	[c_ccsy1] [decimal](15,3) null ,	-- 收入税
	[c_ccsy2] [decimal](15,3) null , 	-- 支出税
	[c_note] char(300)  null ,		-- 备注
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_cxjs on t_cxjs(c_companyid,c_bd)
go