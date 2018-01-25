--员工表 
if exists(select name from sysobjects where name='t_staff')
	drop table t_staff
go
create table [dbo].[t_staff] (
	[c_no] [int] identity (1, 1) not null ,  	--id
	[c_prefix] char(2) null,			--前缀
	[c_counter][int] null,				--计数器
	[c_orgid] [int]  null,				--所属机构
	[c_jobnumber] [char] (10)  null ,		--工号
	[c_name] [char] (20)  null ,			--姓名
	[c_sex] [char] (1)  null , 			--性别 1，男 0，女
	[c_birthday] [char] (10)  null ,		--出生日期
	[c_age] [int] null ,				--年龄
	[c_nation] [char] (4)  null ,			--民族code
	[c_politics] [char] (4)  null ,			--政治面貌code
	[c_education] [char] (4)  null ,		--学历code	
	[c_marriage] [char] (1)  null ,			--婚姻code	
	[c_healthy] [char] (4)  null ,			--健康code
	[c_blood] [char] (4)  null ,			--血型code	 
	[c_certificatetype] [char] (4)  null ,		--证件类型code
	[c_certificate] [char] (50)  null ,		--证件号码code
	[c_native] [char] (30)  null ,			--籍贯
	[c_registerplace] [char] (50)  null ,		--户口所在地
	[c_livein] [char] (50)  null ,			--常住地
	[c_zipcode] [char] (10)  null ,			--邮编
	[c_telephone] [char] (20)  null ,		--固定电话
	[c_mobilephone] [char] (20)  null ,		--手机
	[c_email] [char] (30)  null ,			--email
	[c_hobby] [char] (30)  null ,			--爱好 
	[c_contactname] [char] (20)  null ,		--紧急联系人姓名
	[c_contactphone] [char] (20)  null ,		--紧急联系人电话	
	[c_foreign] [char] (30)  null ,			--外语水平
	[c_computer] [char] (30)  null ,		--电脑水平
	[c_workdate] [char] (8)  null ,			--参加工作日期 
	[c_bank] [char] (4)  null ,			--银行
	[c_bankcode] [char] (50)  null ,		--银行卡号
	[c_qualificate] [char] (50)  null ,		--资格证号	
	[c_quitdate] [char] (8)  null ,			--离职日期 
	[c_sqi1] [char] (10)  null ,			--起日期
	[c_sqi2] [char] (10)  null ,
	[c_sqi3] [char] (10)  null ,
	[c_szhi1] [char] (10)  null ,			--止日期
	[c_szhi2] [char] (10)  null ,
	[c_szhi3] [char] (10)  null ,
	[c_school1] [char] (50)  null ,			--学校
	[c_school2] [char] (50)  null ,
	[c_school3] [char] (50)  null ,
	[c_professional1] [char] (30)  null ,		--专业
	[c_professional2] [char] (30)  null ,
	[c_professional3] [char] (30)  null ,
	[c_wqi1] [char] (10)  null ,			--起日期
	[c_wqi2] [char] (10)  null ,
	[c_wqi3] [char] (10)  null ,
	[c_wqi4] [char] (10)  null ,			 
	[c_wqi5] [char] (10)  null ,
	[c_wqi6] [char] (10)  null ,
	[c_wzhi1] [char] (10)  null ,			--止日期
	[c_wzhi2] [char] (10)  null ,
	[c_wzhi3] [char] (10)  null ,
	[c_wzhi4] [char] (10)  null ,			 
	[c_wzhi5] [char] (10)  null ,
	[c_wzhi6] [char] (10)  null ,
	[c_worknote1] [char] (50)  null ,		--工作经历
	[c_worknote2] [char] (50)  null ,
	[c_worknote3] [char] (50)  null ,
	[c_worknote4] [char] (50)  null ,		
	[c_worknote5] [char] (50)  null ,
	[c_worknote6] [char] (50)  null ,
	[c_worker1] [char] (30)  null ,			--职位
	[c_worker2] [char] (30)  null ,
	[c_worker3] [char] (30)  null ,
	[c_worker4] [char] (30)  null ,			 
	[c_worker5] [char] (30)  null ,
	[c_worker6] [char] (30)  null ,
	[c_name1] [char] (20)  null ,
	[c_name2] [char] (20)  null ,
	[c_name3] [char] (20)  null , 
	[c_call1] [char] (20)  null ,
	[c_call2] [char] (20)  null ,
	[c_call3] [char] (20)  null , 
	[c_company1] [char] (50)  null ,
	[c_company2] [char] (50)  null ,
	[c_company3] [char] (50)  null , 
	[c_address1] [char] (80)  null ,
	[c_address2] [char] (80)  null ,
	[c_address3] [char] (80)  null , 	
	[c_note] [char] (150)  null ,	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
create unique index i_staff on t_staff(c_jobnumber)
go 
insert t_staff(c_jobnumber,c_name)values('0000000000','系统')
go
--员工岗位职位表
if exists(select name from sysobjects where name='t_postset')
	drop table t_postset
go
create table [dbo].[t_postset] (
	[c_no] [int] identity (1, 1) not null ,
	[c_jobnumber] [char](10) not null ,	--工号
	[c_orgid] [int] not null ,		--机构id  
	[c_postid] [int] not null ,		--岗位id  
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_postset on t_postset(c_jobnumber,c_orgid,c_postid)
go
--员工薪酬等级表
if exists(select name from sysobjects where name='t_payset')
	drop table t_payset
go
create table [dbo].[t_payset] (
	[c_no] [int] identity (1, 1) not null ,
	[c_jobnumber] [char](10) not null ,	--工号
	[c_pclass] [int] not null ,		--等级id 
	[c_state] [int] not null ,		--0 正式 1 见习  
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_payset on t_payset(c_jobnumber,c_pclass)
go 
--员工登录表
if exists(select name from sysobjects where name='t_login')
	drop table t_login
go
create table [dbo].[t_login] (
	[c_no] [int] identity (1, 1) not null ,
	[c_jobnumber] [char](10) not null ,	--工号
	[c_pwd] [char] (64)  not null ,		--密码 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
insert t_login(c_jobnumber,c_pwd)values('ADMIN','e10adc3949ba59abbe56e057f20f883e') 
go
--员工权限表
if exists(select name from sysobjects where name='t_staffqx')
	drop table t_staffqx
go
create table [dbo].[t_staffqx] (
	[c_no] [int] identity (1, 1) not null ,
	[c_jobnumber] [char](10) not null ,	--工号
	[c_xitong] [char] (1)  not null ,	--A、B、C...
	[c_menu] [varchar] (1000)  not null ,  
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--薪酬类别表
if exists(select name from sysobjects where name='t_pcategory')
	drop table t_pcategory
go
create table [dbo].[t_pcategory] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_name] char(30)  null unique,	-- 类别名称		
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--薪酬等级表
if exists(select name from sysobjects where name='t_pclass')
	drop table t_pclass
go
create table [dbo].[t_pclass] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_pcategory] [int] null ,	--  类别id 
	[c_name] char(30)  null ,	--  等级名称		
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_pclass on t_pclass(c_pcategory,c_name )
go 
--薪酬项目表
if exists(select name from sysobjects where name='t_pproject')
	drop table t_pproject
go
create table [dbo].[t_pproject] (
	[c_no] [int] identity (1, 1) not null ,	   
	[c_type] [int] null ,		--  类别: 1 基本项目 2 社保项目
	[c_name] char(30) null unique ,	--  项目名称		
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--薪酬基本标准表
if exists(select name from sysobjects where name='t_pstandard')
	drop table t_pstandard
go
create table [dbo].[t_pstandard] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_pclass] [int] null ,		--  等级id 
	[c_pproject] [int] null ,	--  基本项目id 
	[c_base] [decimal](15, 2) null ,--  基数		
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_pstandard on t_pstandard(c_pclass,c_pproject )
go 
--薪酬社保标准表
if exists(select name from sysobjects where name='t_psocial')
	drop table t_psocial
go
create table [dbo].[t_psocial] (
	[c_no] [int] identity (1, 1) not null ,	  	
	[c_orgid] [int] not null ,	--机构id
	[c_pclass] [int] null ,		--  等级id 
	[c_pproject] [int] null ,	--  社保项目id 
	[c_base] [decimal](15, 2) null ,--  基数		
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--薪酬相关系数定义表
if exists(select name from sysobjects where name='t_pcoefficient')
	drop table t_pcoefficient
go
create table [dbo].[t_pcoefficient] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_var] char(30) null unique ,  --  基本系数名称
	[c_name] char(50) null unique , --  对应指标名称	
	[c_input] int null  , 		--  数据类型 1人工输入{11 工号挂钩 } 2系统提取{21 数据汇总 }  
	[c_period] int null  , 		--  数据有效期 1:月 3:季度 12:年	
	[c_o] [int]  null , 		--  处理器地址
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--薪酬相关系数设置表（工号挂钩结构A）
if exists(select name from sysobjects where name='t_pcoefficientset')
	drop table t_pcoefficientset
go
create table [dbo].[t_pcoefficientset] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_pcoefficient] int null ,  		--  基本系数id
	[c_year] int null  , 			--  年度
	[c_number] int null  , 			--  计数器
	[c_orgid] [int] not null ,		--  机构id
	[c_jobnumber] [char] (10)  null ,	--  工号	
	[c_value] [decimal](15, 2) null ,	--  数值	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--薪酬发放表
if exists(select name from sysobjects where name='t_pmamount')
	drop table t_pmamount
go
create table [dbo].[t_pmamount] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_year] [int] null ,			--  年 
	[c_month] [int] null ,			--  月 
	[c_orgid] [int] not null ,		--  机构id
	[c_jobnumber] [char] (10)  null ,	--  工号	
	[c_str] [char](600) null ,		--  描述 
	[c_result] [decimal](15, 2) null ,	--  结果值
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_pmamount on t_pmamount(c_year,c_month,c_orgid,c_jobnumber)
go
--考勤项目表
if exists(select name from sysobjects where name='t_ontype')
	drop table t_ontype
go
create table [dbo].[t_ontype] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_name] char(30)  null unique,		-- 项目名称	
	[c_code] char(1)  null unique, 		-- 编码	  
	[c_state] int  null ,	 		-- 标记 0 正常状态 1 扣款状态	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--机构考勤项目表
if exists(select name from sysobjects where name='t_ontype2')
	drop table t_ontype2
go
create table [dbo].[t_ontype2] (
	[c_no] [int] identity (1, 1) not null ,	 
	[c_orgid] [int] not null ,		-- 机构id 
	[c_ontype] [int] not null ,		-- 考勤项目id 
	[c_type] int  null ,	 		-- 扣除类型 1 一次 2 一天	 
	[c_deducted] [decimal](15, 2) null , 	-- 扣除金额 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_ontype2 on t_ontype2(c_orgid,c_ontype)
go
--工号关联表
if exists(select name from sysobjects where name='t_onrelate')
	drop table t_onrelate
go
create table [dbo].[t_onrelate] (
	[c_no] [int] identity (1, 1) not null , 
	[c_orgid] [int] not null ,		--机构id 
	[c_jobnumber] [char](10) not null ,	--工号
	[c_code] [varchar](30) not null ,	--编码	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_onrelate on t_onrelate( c_orgid,c_jobnumber )
go 
--考勤记录表
if exists(select name from sysobjects where name='t_onduty')
	drop table t_onduty
go
create table [dbo].[t_onduty] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		--机构id 
	[c_jobnumber] [char](10) not null ,	--工号
	[c_date] [char](8) not null ,		--日期
	[c_morning] int   null ,		--上午 
	[c_afternoon] int   null ,		--下午	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_onduty on t_onduty( c_orgid,c_jobnumber,c_date )
go 
--考勤汇总表
if exists(select name from sysobjects where name='t_onsummary')
	drop table t_onsummary
go
create table [dbo].[t_onsummary] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		--机构id 
	[c_year] [int] null ,			--年 
	[c_month] [int] null ,			--月 
	[c_jobnumber] [char](10) not null ,	--工号	 	
	[c_deducted] [decimal](15, 2) null , 	--扣除金额
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_onsummary on t_onsummary( c_orgid,c_year,c_month,c_jobnumber )
go
--银行网点表
if exists(select name from sysobjects where name='t_bankoutlets')
	drop table t_bankoutlets
go
create table [dbo].[t_bankoutlets] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		--机构id 
	[c_bank] [char] (4)  null ,		--银行代码	 
	[c_code] [char](30) not null ,		--网点代码	 
	[c_name] [char](50) not null ,		--网点名称
	[c_phone] [char](30)  null ,		--电话		
	[c_address] [char](50) null ,		--地址
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_bankoutlets on t_bankoutlets(c_bank,c_code)
go
--银行网点关联表
if exists(select name from sysobjects where name='t_bankrelate')
	drop table t_bankrelate
go
create table [dbo].[t_bankrelate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		--机构id 
	[c_outletsid] [int] null ,		--网点id
	[c_jobnumber] [char](10) not null ,	--渠道专员工号	 
	[c_ksrq] [char](8)  null ,		--开始日期 
	[c_jsrq] [char](8)  null ,		--结束日期
	[c_flag] [char] (1) default '0'  null ,	--有效标志	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 