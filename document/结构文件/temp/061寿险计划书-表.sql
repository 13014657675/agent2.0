--�ƻ����
if exists(select name from sysobjects where name='t_plan_book')
	drop table t_plan_book
go
create table [dbo].[t_plan_book] (
	[c_no] [int] not null ,
	[c_tbrname] [char] (30) null ,	--Ͷ��������
	[c_bbrname] [char] (30) null,	--����������
	[c_bbrsex] [int] not null ,	--�������Ա� 1 �� 2 Ů
	[c_bbirthy] [int] null,		--�����˳�����
	[c_bbirthm] [int] null,		--�����˳�����
	[c_bbirthd] [int] null,		--�����˳�����
	[c_age] [int] null ,		--���� 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--�ƻ������ֱ�
if exists(select name from sysobjects where name='t_plan_books')
	drop table t_plan_books
go
create table [dbo].[t_plan_books] (
	[c_no] [int] identity (1, 1) not null ,
	[c_plan_bookid] [int] not null ,	
	[c_companyid] [int] not null,	-- ���չ�˾
	[c_productid] [int] not null , 	-- ��Ʒ����id	 
	[c_basetype] [int] null ,	-- �������� 1 ���� 2 ����
	[c_base] [decimal](15,2) null , -- ���� 
	[c_bxqtype] [int] null ,	-- �����ڼ����� 0 ���� 1 ��*�� 2 ����*��
	[c_bxq] [int] null ,		-- �����ڼ� 
	[c_jfqtype] [int] null ,	-- �����ڼ����� 0 ���� 1 ��*�� 2 ����*��
	[c_jfq] [int] null ,		-- �����ڼ�
	[c_jfqx] [int] null , 		-- ��������	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_plan_books on t_plan_books(c_plan_bookid,c_companyid,c_productid)
go