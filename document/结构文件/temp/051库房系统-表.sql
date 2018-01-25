--物品分类
if exists(select name from sysobjects where name='t_goodstype')
	drop table t_goodstype
go
create table [dbo].[t_goodstype] (
	[c_no] [int] identity (1, 1) not null , 
	[c_libraryid] [int] not null ,		--库 1 资产管理 2 办公用品 3 普通单证
	[c_name] [char] (50)  not null ,  	--类名  
	[c_jobnm] [char] (10)  not null , 
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
create unique index i_goodstype on t_goodstype(c_libraryid,c_name)
go
--物品表
if exists(select name from sysobjects where name='t_goods')
	drop table t_goods
go
create table [dbo].[t_goods] (
	[c_no] [int] identity (1, 1) not null , 
	[c_orgid] [int] not null ,		--机构id 	
	[c_libraryid] [int] not null ,		--库 1 资产管理 2 办公用品 3 普通单证
	[c_goodstypeid] [int] not null ,	--分类名id	
	[c_name] [char] (50)  not null ,  	--物品名 
	[c_factory] [char] (100)  not null ,  	--3厂商
	[c_address] [char] (150)  not null ,  	--4地址	 
	[c_jobnm] [char] (10)  not null , 
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
create unique index i_goods on t_goods(c_orgid,c_libraryid,c_name)
go
--批号表
if exists(select name from sysobjects where name='t_goodsrecord')
	drop table t_goodsrecord
go
create table [dbo].[t_goodsrecord] (
	[c_no] [int] identity (1, 1) not null , 		
	[c_orgid] [int] not null ,		--机构id 
	[c_libraryid] [int] not null ,		--库 1 资产管理 2 办公用品 3 普通单证	
	[c_recordid] [bigint] not null ,	--库单号： 4+1+7  
	[c_flag] [char] (1) default '0'  null ,	--有效标记
	[c_jobnm] [char] (10)  null ,		--rk 入库	rk2 机构入库	 
						--dj 定价
						--ck 出库 	 
						--bf 报废
						--hk 回库 			
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--物品批量操作表
if exists(select name from sysobjects where name='t_goodsbatch')
	drop table t_goodsbatch
go
create table [dbo].[t_goodsbatch] (
	[c_no] [int] identity (1, 1) not null , 		
	[c_orgid] [int] not null ,		--机构id  
	[c_libraryid] [int] not null ,		--库 1 资产管理 2 办公用品 3 普通单证	
	[c_recordid] [bigint] not null ,	--库单号： 4+1+7  
	[c_goodsid] [int] not null ,		--物品id 
	[c_number] [int] not null  ,		--数量	  		
	[c_inprice] [decimal](15, 2) null ,	--入库价格
	[c_outprice] [decimal](15, 2) null ,	--出库价格	 
	[c_p] [char] (100)  null  ,		--入库人，领用人
	[c_o] [int] null ,			--入库机构，领用机构	
	[c_flag] [char] (1) default '0'  null ,	--有效标记
	[c_jobnm] [char] (10)  null ,		--rk 入库	rk2 机构入库	
						--rk-del 入库删除	
						--dj 定价
						--ck 出库 	
						--hk 回库	
						--bf 报废					
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--物品状态表
if exists(select name from sysobjects where name='t_goodsstate')
	drop table t_goodsstate
go
create table [dbo].[t_goodsstate] (
	[c_no] [int] identity (1, 1) not null , 
	[c_orgid] [int] not null ,		--机构id 	
	[c_libraryid] [int] not null ,		--库 1 资产管理 2 办公用品 3 普通单证	
	[c_recordid] [bigint] not null ,	--库单号： 4+1+7 
	[c_goodsid] [int] not null ,		--物品id
	[c_code] [char] (14)  not null , 	--物品流水号 
	[c_p] [char] (100)  null  ,		--入库人，领用人
	[c_o] [int] null ,			--入库机构，领用机构	
	[c_flag] [char] (1) default '0'  null ,	--有效标记
	[c_jobnm] [char] (10)  null ,		--rk 入库	rk2 机构入库	 
						--dj 定价	
						--ck 出库	
						--hk 回库						 
						--bf 报废
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [varchar] (25)  null 
) on [primary]
go   
--物品价格表
if exists(select name from sysobjects where name='t_goodsprice')
	drop table t_goodsprice
go
create table [dbo].[t_goodsprice] (
	[c_no] [int] identity (1, 1) not null , 	 
	[c_code] [char] (14)  not null , 	--物品流水号
	[c_inprice] [decimal](15, 2) null ,	--入库价格
	[c_outprice] [decimal](15, 2) null ,	--出库价格	 
	[c_flag] [char] (1) default '0'  null ,	--有效标记
	[c_jobnm] [char] (10)  null ,		--						 
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [varchar] (25)  null 
) on [primary]
go