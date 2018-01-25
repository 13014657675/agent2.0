--报表数据表
if exists(select name from sysobjects where name='t_bbsj')
	drop table t_bbsj
go
create table [dbo].[t_bbsj] (
	[c_no] [int] identity (1, 1) not null ,
	[c_time] bigint  not null , 	--令牌
	[c_code] int  not null , 	--报表代码
	[c_row] int  null ,		--行
	[c_col] int  null , 		--列
	[c_value] [char] (100)   null ,	--内容
	[c_type] [char] (1)  null ,	--r 跨行 c 跨列 n 无标记
	[c_count] int  null  		--	 
) on [primary]
go 
