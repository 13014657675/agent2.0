--产险保单信息表
if exists(select name from sysobjects where name='t_cxbd')
	drop table t_cxbd
go
create table [dbo].[t_cxbd] (
	[c_no] [int] identity (1, 1) not null ,	
	[c_orgid] [int] not null ,		-- 机构
	[c_companyid] int not null,		-- 保险公司 
	[c_bd] [char] (30)  null ,		-- 保单号
	[c_productid] [int] not null , 		-- 产品险种id	 
	[c_bxf] [decimal](15,2) null , 		-- 保险费 
	[c_ccs] [decimal](15,2) null , 		-- 车船税 
	[c_bxfr1] [decimal](7,3) null ,		-- 收入比率
	[c_bxfr2] [decimal](7,3) null ,		-- 支出比率
	[c_ccsr1] [decimal](7,3) null ,		-- 车船税收入比率
	[c_ccsr2] [decimal](7,3) null ,		-- 车船税支出比率
	[c_bxfy1] [decimal](15,3) null ,	-- 收入
	[c_bxfy2] [decimal](15,3) null ,	-- 支出 
	[c_ccsy1] [decimal](15,3) null ,	-- 车船税收入
	[c_ccsy2] [decimal](15,3) null ,	-- 车船税支出 
	[c_check] [char] (8)  null ,		-- 对账日期
	[c_solve] [char] (8)  null ,		-- 结算日期
	[c_platenumber] [char] (30)  null ,    	-- 车牌号
	[c_hisnumber] [char] (30) null ,	-- 车驾号
	[c_customer] [char] (20)  not null ,	-- 被保险人姓名
	[c_cardtype] [char] (4)  null ,		-- 证件类型
	[c_cardnum] [char] (40)  not null ,	-- 证件号码  
	[c_lrrq] [char] (8)  null , 		-- 签单日期
	[c_cbrq] [char] (8)  null , 		-- 起保日期	
	[c_jobnumber] [char] (10) null ,	-- 代理人工号	
	[c_usageid] [int] null ,		-- 使用性质	
	[c_pay] [int] null ,			-- 付款方式: 1信用卡刷卡 2转账 3现金	
	[c_fpserial] [char] (100) null ,	-- 发票流水号	
	[c_dzserial] [char] (100) null ,	-- 单证流水号	
	[c_orgid_sq] [int] null ,		-- 机构id  
	[c_system_sq] [int] null ,		-- 政策体系  
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_cxbd2 on t_cxbd(c_companyid,c_bd)
go
--产险保单日结单
if exists(select name from sysobjects where name='t_cxbdrjd')
	drop table t_cxbdrjd
go
create table [dbo].[t_cxbdrjd] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- 机构
	[c_companyid] int  null,		-- 保险公司
	[c_bd] [char] (30)  null ,		-- 保单	
	[c_customer] [char] (20)  null ,	-- 被保险人姓名
	[c_bxf] [decimal](15,2) null , 		-- 保险费      
	[c_jobnumber] [char] (10) null ,	-- 工号	 
	[c_date] [char] (8)  null ,		-- 日期
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_cxbdrjd on t_cxbdrjd(c_companyid,c_bd)
go 

