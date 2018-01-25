--��Ʒ����
if exists(select name from sysobjects where name='t_goodstype')
	drop table t_goodstype
go
create table [dbo].[t_goodstype] (
	[c_no] [int] identity (1, 1) not null , 
	[c_libraryid] [int] not null ,		--�� 1 �ʲ����� 2 �칫��Ʒ 3 ��ͨ��֤
	[c_name] [char] (50)  not null ,  	--����  
	[c_jobnm] [char] (10)  not null , 
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
create unique index i_goodstype on t_goodstype(c_libraryid,c_name)
go
--��Ʒ��
if exists(select name from sysobjects where name='t_goods')
	drop table t_goods
go
create table [dbo].[t_goods] (
	[c_no] [int] identity (1, 1) not null , 
	[c_orgid] [int] not null ,		--����id 	
	[c_libraryid] [int] not null ,		--�� 1 �ʲ����� 2 �칫��Ʒ 3 ��ͨ��֤
	[c_goodstypeid] [int] not null ,	--������id	
	[c_name] [char] (50)  not null ,  	--��Ʒ�� 
	[c_factory] [char] (100)  not null ,  	--3����
	[c_address] [char] (150)  not null ,  	--4��ַ	 
	[c_jobnm] [char] (10)  not null , 
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
create unique index i_goods on t_goods(c_orgid,c_libraryid,c_name)
go
--���ű�
if exists(select name from sysobjects where name='t_goodsrecord')
	drop table t_goodsrecord
go
create table [dbo].[t_goodsrecord] (
	[c_no] [int] identity (1, 1) not null , 		
	[c_orgid] [int] not null ,		--����id 
	[c_libraryid] [int] not null ,		--�� 1 �ʲ����� 2 �칫��Ʒ 3 ��ͨ��֤	
	[c_recordid] [bigint] not null ,	--�ⵥ�ţ� 4+1+7  
	[c_flag] [char] (1) default '0'  null ,	--��Ч���
	[c_jobnm] [char] (10)  null ,		--rk ���	rk2 �������	 
						--dj ����
						--ck ���� 	 
						--bf ����
						--hk �ؿ� 			
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--��Ʒ����������
if exists(select name from sysobjects where name='t_goodsbatch')
	drop table t_goodsbatch
go
create table [dbo].[t_goodsbatch] (
	[c_no] [int] identity (1, 1) not null , 		
	[c_orgid] [int] not null ,		--����id  
	[c_libraryid] [int] not null ,		--�� 1 �ʲ����� 2 �칫��Ʒ 3 ��ͨ��֤	
	[c_recordid] [bigint] not null ,	--�ⵥ�ţ� 4+1+7  
	[c_goodsid] [int] not null ,		--��Ʒid 
	[c_number] [int] not null  ,		--����	  		
	[c_inprice] [decimal](15, 2) null ,	--���۸�
	[c_outprice] [decimal](15, 2) null ,	--����۸�	 
	[c_p] [char] (100)  null  ,		--����ˣ�������
	[c_o] [int] null ,			--�����������û���	
	[c_flag] [char] (1) default '0'  null ,	--��Ч���
	[c_jobnm] [char] (10)  null ,		--rk ���	rk2 �������	
						--rk-del ���ɾ��	
						--dj ����
						--ck ���� 	
						--hk �ؿ�	
						--bf ����					
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--��Ʒ״̬��
if exists(select name from sysobjects where name='t_goodsstate')
	drop table t_goodsstate
go
create table [dbo].[t_goodsstate] (
	[c_no] [int] identity (1, 1) not null , 
	[c_orgid] [int] not null ,		--����id 	
	[c_libraryid] [int] not null ,		--�� 1 �ʲ����� 2 �칫��Ʒ 3 ��ͨ��֤	
	[c_recordid] [bigint] not null ,	--�ⵥ�ţ� 4+1+7 
	[c_goodsid] [int] not null ,		--��Ʒid
	[c_code] [char] (14)  not null , 	--��Ʒ��ˮ�� 
	[c_p] [char] (100)  null  ,		--����ˣ�������
	[c_o] [int] null ,			--�����������û���	
	[c_flag] [char] (1) default '0'  null ,	--��Ч���
	[c_jobnm] [char] (10)  null ,		--rk ���	rk2 �������	 
						--dj ����	
						--ck ����	
						--hk �ؿ�						 
						--bf ����
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [varchar] (25)  null 
) on [primary]
go   
--��Ʒ�۸��
if exists(select name from sysobjects where name='t_goodsprice')
	drop table t_goodsprice
go
create table [dbo].[t_goodsprice] (
	[c_no] [int] identity (1, 1) not null , 	 
	[c_code] [char] (14)  not null , 	--��Ʒ��ˮ��
	[c_inprice] [decimal](15, 2) null ,	--���۸�
	[c_outprice] [decimal](15, 2) null ,	--����۸�	 
	[c_flag] [char] (1) default '0'  null ,	--��Ч���
	[c_jobnm] [char] (10)  null ,		--						 
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [varchar] (25)  null 
) on [primary]
go