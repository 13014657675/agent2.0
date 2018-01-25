--客户表
if exists(select name from sysobjects where name='t_customer')
	drop table t_customer
go
create table [dbo].[t_customer] (
	[c_no] int not null , 
	[c_name] [char] (20)  not null ,--姓名
	[c_nation] [char] (30) null,	--国籍
	[c_sex] [int] not null ,	--性别
	[c_birthy] [int] null,		--出生年
	[c_birthm] [int] null,		--出生月
	[c_birthd] [int] null,		--出生日
	[c_marriage] [int] null, 	--0 单身 1 已婚
	[c_cardtype] [char] (4)  null ,		--证件类型
	[c_cardnum] [char] (40)  not null ,	--证件号码
	[c_cardperiod] [char] (8) null ,	--证件有效期
	[c_education] [char] (4) null,	--学历
	[c_email] [char] (50)  null ,	--email
	[c_phone] [char] (30)  null ,	--固定电话 
	[c_mobile] [char] (30)  null ,	--移动电话 
	[c_company] [char] (50) null , 	--工作单位或学校名称
	[c_post] [char] (20)  null ,	--职务
	[c_postcode] [char] (20)  null ,--职业代码	
	[c_hddr] [char] (80)  null ,	--常住地址
	[c_hzip] [char] (20)  null , 	--常住邮编
	[c_cddr] [char] (80)  null ,	--单位地址
	[c_czip] [char] (20)  null ,    --单位邮编
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(20)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--寿险保单信息表
if exists(select name from sysobjects where name='t_sxbd')
	drop table t_sxbd
go
create table [dbo].[t_sxbd] (
	[c_no] [int] identity (1, 1) not null ,	
	[c_orgid] [int] not null ,	-- 机构
	[c_companyid] int not null,	-- 保险公司
	[c_tbd] [char] (30)  not null ,	-- 投保单号
	[c_bd] [char] (30)  null ,	-- 保单号
	[c_address] [char] (80) null ,	-- 通讯地址
	[c_zip] [char] (20)  null ,    	-- 通讯邮编
	[c_tbrnum] [int]  not null ,	-- 投保人编号
	[c_bbrnum] [int]  not null ,	-- 被保人编号
	[c_tbrrel] [char] (20)  null ,	-- 是投保人的*	
	[c_name1] [char] (20)  null ,	-- 受益人姓名
	[c_sex1] [char] (1)  null ,	-- 受益人性别
	[c_bbrrel1] [char] (20)  null , -- 是被保人的*	
	[c_sysx1] int  null ,		-- 受益顺序
	[c_sybl1] [decimal](7, 2) null ,-- 受益比例
	[c_cardtype1] [char] (4)  null ,-- 证件类型
	[c_cardnum1] [char] (20)  null ,-- 证件号码	
	[c_name2] [char] (20)  null ,	-- 受益人姓名
	[c_sex2] [char] (1)  null ,	-- 受益人性别
	[c_bbrrel2] [char] (20)  null , -- 是被保人的*	
	[c_sysx2] int  null ,		-- 受益顺序
	[c_sybl2] [decimal](7, 2) null ,-- 受益比例
	[c_cardtype2] [char] (4)  null ,-- 证件类型
	[c_cardnum2] [char] (20)  null ,-- 证件号码	
	[c_name3] [char] (20)  null ,	-- 受益人姓名
	[c_sex3] [char] (1)  null ,	-- 受益人性别
	[c_bbrrel3] [char] (20)  null , -- 是被保人的*	
	[c_sysx3] int  null ,		-- 受益顺序
	[c_sybl3] [decimal](7, 2) null ,-- 受益比例
	[c_cardtype3] [char] (4)  null ,-- 证件类型
	[c_cardnum3] [char] (20)  null ,-- 证件号码 	 
	[c_pay] [int] null ,		-- 交费方式
	[c_pad] [int] null ,		-- 垫交方式
	[c_controversy] [int] null ,	-- 争议处理方式	
	[c_bank] [char] (4)  null ,	-- 银行
	[c_bankcode] [char] (50)  null ,-- 银行卡号
	[c_jobnumber] [char] (10) null ,-- 工号	
	[c_outletsid] [int] null ,	-- 网点id ："-1 直销"
	[c_orgid_sq] [int] null ,	-- 机构id  
	[c_system_sq] [int] null ,	-- 政策体系  	
	[c_tbrq] [char] (8)  null , 	-- 投保日期
	[c_type_xq] [char] (1)  null ,	-- 续期服务类型：1.正常情况 2 递归情况 3 孤儿单（？）
	[c_jobnumber_xq] [char](10) null ,	-- 续期服务人工号
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxbd on t_sxbd(c_companyid,c_tbd) 
go
create index i_sxbd2 on t_sxbd(c_companyid,c_tbd,c_bd)
go
--投保事项表
if exists(select name from sysobjects where name='t_sxtb')
	drop table t_sxtb
go
create table [dbo].[t_sxtb] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] int not null,	-- 保险公司
	[c_tbd] [char] (30)  not null ,	-- 投保单号
	[c_bd] [char] (30)  null ,	-- 保单号
	[c_productid] [int] not null , 	-- 产品险种id	 
	[c_bxqtype] [int] null ,	-- 保险期间类型 0 终身 1保*年 2保至*岁
	[c_bxq] [int] null ,		-- 保险期间至N周岁
	[c_jfqtype] [int] null ,	-- 交费期间类型 0 趸交 1交*年 2交至*岁
	[c_jfq] [int] null ,		-- 交费期间至N周岁
	[c_jfqx] [int] null , 		-- 交费期限
	[c_bxje] [decimal](15,2) null ,	-- 保险金额
	[c_bxf] [decimal](15,2) null , 	-- 保险费 
	[c_bxfr1] [decimal](7,3) null ,	-- 收入比率
	[c_bxfr2] [decimal](7,3) null ,	-- 支出比率
	[c_bxfy1] [decimal](15,3) null ,-- 收入
	[c_bxfy2] [decimal](15,3) null ,-- 支出 
	[c_check] [char] (8)  null ,	-- 对账日期
	[c_solve] [char] (8)  null ,	-- 结算日期
	[c_bxfxs] [decimal](7, 3) null ,
	[c_bxfbz] [decimal](15, 2) null ,
	[c_bxgsxs] [decimal](7, 3) null ,
	[c_bxgsbz] [decimal](15, 2) null ,
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create index i_sxtb on t_sxtb(c_companyid,c_tbd,c_bd)
go
create unique index i_sxtb2 on t_sxtb(c_companyid,c_tbd,c_productid)
go
--寿险保单状态表
if exists(select name from sysobjects where name='t_sxbdzt')
	drop table t_sxbdzt
go
create table [dbo].[t_sxbdzt] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] int not null,	-- 保险公司
	[c_tbd] [char] (30)  not null ,
	[c_bd] [char] (30)  null ,	
	[c_type] [int] not null ,	-- 0 撤单 1 生效 2 发放 3 回执 4 犹豫期退保 5 正常退保 
					-- 9 保单终止
	[c_date] [char] (8)  null ,	
	[c_orgid] [int] null ,		-- 机构
	[c_flag] [char] (1) default '0' null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_sxbdzt on t_sxbdzt(c_companyid,c_tbd,c_type)
go
create index i_sxbdzt2 on t_sxbdzt(c_companyid,c_tbd,c_bd)
go
--寿险保单信息试图
if exists (select table_name from information_schema.views  where table_name = 'v_sxbdxx')
   	drop view v_sxbdxx
go
create view v_sxbdxx (
	c_orgid,	-- 机构 
	c_companyid,	-- 保险公司
	c_tbd,		-- 投保单
	c_bd,		-- 保单 	
	c_tbrnum,	-- 投保人编号
	c_bbrnum,	-- 被保人编号	
	c_jobnumber,	-- 工号  
	c_outletsid,	-- 网点
	c_orgid_sq,	-- 机构
	c_system_sq,	-- 政策体系
	c_productid, 	-- 产品险种id	
	c_jfqx, 	-- 交费期限
	c_bxje,		-- 保险金额
	c_bxf, 		-- 保险费 
	c_bxfxs,	-- 标保系数
	c_bxfbz,	-- 标保
	c_bxgsxs,	-- 保险公司标保系数 
	c_bxgsbz,	-- 保险公司标保
	c_bxfr1,	-- 收入比率 
	c_bxfr2,	-- 支出比率 
	c_bxfy1,	-- 收入
	c_bxfy2,	-- 支出 	
	c_lrrq,		-- 录入日期
	c_tbrq,		-- 投保日期  
	c_solve,	-- 结算日期 
	c_jobnm		-- 状态
	) 
as  
select 	a.c_orgid,	-- 机构 
	a.c_companyid,	-- 保险公司
	a.c_tbd,	-- 投保单
	a.c_bd,		-- 保单 	
	a.c_tbrnum,	-- 投保人编号
	a.c_bbrnum,	-- 被保人编号	
	a.c_jobnumber,	-- 工号  
	a.c_outletsid,  -- 网点
	a.c_orgid_sq,	-- 机构
	a.c_system_sq,	-- 政策体系
	b.c_productid, 	-- 产品险种id	
	b.c_jfqx, 	-- 交费期限
	b.c_bxje,	-- 保险金额
	b.c_bxf, 	-- 保险费 
	b.c_bxfxs,	-- 标保系数
	b.c_bxfbz,	-- 标保
	b.c_bxgsxs,	-- 保险公司标保系数 
	b.c_bxgsbz,	-- 保险公司标保
	b.c_bxfr1,	-- 收入比率 
	b.c_bxfr2,	-- 支出比率 
	b.c_bxfy1,	-- 收入
	b.c_bxfy2,	-- 支出 	
	convert(char(8),a.c_datime,112),-- 录入日期
	a.c_tbrq,	-- 投保日期  
	b.c_solve,	-- 结算日期 
	a.c_jobnm	-- 状态
	from t_sxbd a,t_sxtb b 
	where a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd  
go
--寿险投保单送达书
if exists(select name from sysobjects where name='t_sxtbsds')
	drop table t_sxtbsds
go
create table [dbo].[t_sxtbsds] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	-- 机构
	[c_companyid] int not null,	-- 保险公司 
	[c_tbd] [char] (30)  null ,	-- 投保单 
	[c_tbrnum] [int]  null ,	-- 投保人编号   
	[c_date] [char] (8)  null ,	-- 日期
	[c_times] [int]  null ,		-- 次数
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxtbsds on t_sxtbsds(c_companyid,c_tbd)
go 
--寿险投保单日结单
if exists(select name from sysobjects where name='t_sxtbrjd')
	drop table t_sxtbrjd
go
create table [dbo].[t_sxtbrjd] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	-- 机构
	[c_companyid] int not null,	-- 保险公司
	[c_tbd] [char] (30)  null ,	-- 投保单	
	[c_tbrnum] [int]  null ,	-- 投保人编号     
	[c_jobnumber] [char] (10) null ,-- 工号	 
	[c_date] [char] (8)  null ,	-- 日期
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxtbrjd on t_sxtbrjd(c_companyid,c_tbd)
go 
--寿险保单生效日结单
if exists(select name from sysobjects where name='t_sxsxrjd')
	drop table t_sxsxrjd
go
create table [dbo].[t_sxsxrjd] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	-- 机构
	[c_companyid] int not null,	-- 保险公司
	[c_tbd] [char] (30)  not null ,
	[c_bd] [char] (30)  not null ,
	[c_date] [char] (8)  null ,	-- 日期
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxsxrjd on t_sxsxrjd(c_companyid,c_bd)
go
--寿险保单发放清单
if exists(select name from sysobjects where name='t_sxffqd')
	drop table t_sxffqd
go
create table [dbo].[t_sxffqd] (
	[c_no] [int] identity (1, 1) not null ,	
	[c_companyid] int not null,	-- 保险公司
	[c_bd] [char] (30)  not null ,	-- 保单  
	[c_orgid] [int] not null ,	-- 机构
	[c_date] [char] (8)  null ,	-- 日期
	[c_times] [int]  null ,		-- 次数
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxffqd on t_sxffqd(c_companyid,c_bd)
go
--寿险回执送达书
if exists(select name from sysobjects where name='t_sxhzsds')
	drop table t_sxhzsds
go
create table [dbo].[t_sxhzsds] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	-- 机构
	[c_companyid] int not null,	-- 保险公司
	[c_bd] [char] (30)  not null ,	-- 保单 
	[c_date] [char] (8)  null ,	-- 日期
	[c_times] [int]  null ,		-- 次数
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxhzsds on t_sxhzsds(c_companyid,c_bd)
go
--寿险回执核销日结单
if exists(select name from sysobjects where name='t_sxhzrjd')
	drop table t_sxhzrjd
go
create table [dbo].[t_sxhzrjd] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	-- 机构
	[c_companyid] int not null,	-- 保险公司
	[c_bd] [char] (30)  not null ,	-- 保单 
	[c_date] [char] (8)  null ,	-- 日期
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxhzrjd on t_sxhzrjd(c_companyid,c_bd)
go
--寿险续期发票表
if exists(select name from sysobjects where name='t_sxtb_xq')
	drop table t_sxtb_xq
go
create table [dbo].[t_sxtb_xq] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- 机构
	[c_companyid] int not null,		-- 保险公司
	[c_bd] [char] (30)  not null ,		-- 保单
	[c_tbrname] [char] (30) not null ,	-- 投保人姓名	
	[c_bdnd] [int] not null ,		-- 保单年度
	[c_code] [char] (30)  null ,		-- 发票号码
	[c_fprq] [char] (8)  null ,		-- 发票日期 	
	[c_productid] [int] not null , 		-- 产品险种id		
	[c_bxf] [decimal](15,2) null , 		-- 保险费  	
	[c_bxfr1] [decimal](7,3) null ,		-- 收入比率
	[c_bxfr2] [decimal](7,3) null ,		-- 支出比率
	[c_bxfy1] [decimal](15,3) null ,	-- 收入
	[c_bxfy2] [decimal](15,3) null ,	-- 支出 
	[c_check] [char] (8)  null ,		-- 对账日期
	[c_solve] [char] (8)  null ,		-- 结算日期
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxtb_xq on t_sxtb_xq(c_companyid,c_bd,c_bdnd,c_productid)
go 
--寿险理赔表
if exists(select name from sysobjects where name='t_sxlp')
	drop table t_sxlp
go
create table [dbo].[t_sxlp] ( 
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- 机构
	[c_companyid] int not null,		-- 保险公司
	[c_bd] [char] (30)  not null ,		-- 保单
	[c_tbrname] [char] (30) not null ,	-- 投保人姓名
	[c_barq] [char] (8)  null ,		-- 报案日期
	[c_basm] [varchar] (1000)  null ,	-- 报案说明	
	[c_jarq] [char] (8)  null ,		-- 结案日期
	[c_jasm] [varchar] (1000)  null ,	-- 结案说明	
	[c_jajg] [int]  null ,			-- 结案结果 1 理赔 2 拒赔
	[c_je] [decimal](15, 2) null ,		-- 赔付金额
	[c_bdzt] [char] (10)  null ,		-- 保单状态 zz 终止 0 正常	
	[c_jobnm] [char] (10)  null ,		-- 报案：ba  结案: ja
	[c_operator] [char] (10)   null ,
	[c_datime] [datetime] default getdate()  null ,
	[c_ip] [char] (25)  null  
)  on [primary]
go 
create unique index i_sxlp on t_sxlp(c_companyid,c_bd,c_barq) 
go 
