--�������ݱ�
if exists(select name from sysobjects where name='t_bbsj')
	drop table t_bbsj
go
create table [dbo].[t_bbsj] (
	[c_no] [int] identity (1, 1) not null ,
	[c_time] bigint  not null , 	--����
	[c_code] int  not null , 	--�������
	[c_row] int  null ,		--��
	[c_col] int  null , 		--��
	[c_value] [char] (100)   null ,	--����
	[c_type] [char] (1)  null ,	--r ���� c ���� n �ޱ��
	[c_count] int  null  		--	 
) on [primary]
go 
