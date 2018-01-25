--��Ʒ�����
if exists(select name from sysobjects where name='t_ptclass')
	drop table t_ptclass
go
create table [dbo].[t_ptclass] (
	[c_no] [int] identity (10, 2) not null ,
	[c_ptnature] int  not null , --����			
	[c_name] [char] (30)  not null,  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
--��Ʒ���ͱ�
if exists(select name from sysobjects where name='t_pttype')
	drop table t_pttype
go
create table [dbo].[t_pttype] (
	[c_no] [int] identity (1, 3) not null ,
	[c_ptclassid] [int] not null , 	   --��Ʒ����			
	[c_name] [char] (30)  not null,  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
--��Ʒ��
if exists(select name from sysobjects where name='t_product')
	drop table t_product
go
create table [dbo].[t_product] (
	[c_no] [int] identity (1, 2) not null ,	--�������
	[c_companyid] [int] not null , 		--��˾	
	[c_ptnature] int  not null , 		--����		
	[c_ptclassid] [int]  null , 	   	--��Ʒ����	
	[c_pttypeid] [int]  null , 		--��Ʒ����			
	[c_code] [char] (30)  not null,  
	[c_fullname] [char] (50)  not null,	--ȫ��  
	[c_name] [char] (30)  not null,  	--���
	[c_type] [int] null ,  			--1 ���� 2 ������
	[c_flag] [char] (1) default '0'  null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
create unique index i_product on t_product(c_companyid,c_code)
go
--��Ʒ�����
if exists(select name from sysobjects where name='t_pcomponent')
	drop table t_pcomponent
go
create table [dbo].[t_pcomponent] (
	[c_no] [int] identity (2, 2) not null ,	--ż�����
	[c_companyid] [int] not null , 		--��˾	
	[c_productid] [int] not null , 		--��Ʒid	 
	[c_pcode] [char] (30)  not null, 	--������� 
	[c_pfullname] [char] (50)  not null,	--���ȫ��  
	[c_pname] [char] (30)  not null,  	--������
	[c_ptype] [int] null ,  		--1 ���� 2 ������ 
	[c_flag] [char] (1) default '0'  null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_pcomponent on t_pcomponent(c_companyid,c_productid,c_pcode)
go
--��Ʒ���ʱ�
if exists(select name from sysobjects where name='t_ptrate')
	drop table t_ptrate
go
create table [dbo].[t_ptrate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 	--��˾id	
	[c_productid] [int] not null , 	--��Ʒid	 	 			 
	[c_type] [char] (1)  not null , --1�����ݱ��������� 2�����ݱ���������
	[c_base] [decimal](10, 2) null ,--����	
	[c_bxqlx] [char] (1)  null ,	--0������ 1����ֹ���� 2����n��
	[c_bxq] [int] null ,		--������
	[c_jfqlx] [char] (1)  null ,    --0������ 1����ֹ���� 2����n��
	[c_jfq] [int] null ,		--�ɷ��� 
	[c_age] [int] null ,		--����
	[c_male] [decimal](15, 4) null ,--�з���
	[c_female] [decimal](15, 4) null ,--Ů����	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go    
--��Ʒϵ����
if exists(select name from sysobjects where name='t_ptconvert')
	drop table t_ptconvert
go
create table [dbo].[t_ptconvert] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 	--��˾id	
	[c_productid] [int] not null , 	--��Ʒid	 
	[c_convertT] [int] not null , 	--����
	[c_jfqx] [int] null ,		--�ɷ���	
	[c_dec] [decimal](6, 4) null,	--ϵ��	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_ptconvert on t_ptconvert(c_companyid,c_productid,c_convertT,c_jfqx)
go
--�������α�
if exists(select name from sysobjects where name='t_pliability')
	drop table t_pliability
go
create table [dbo].[t_pliability] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 		--��˾id	
	[c_productid] [int] not null , 		--��Ʒid	 
	[c_pname] [char] (60)  not null , 	--������������
	[c_pdesc] [varchar] (3000)  not null , 	--������������ 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
create unique index i_pliability on t_pliability(c_companyid,c_productid,c_pname)
go
--�������β������ʱ�
if exists(select name from sysobjects where name='t_pliabilityc')
	drop table t_pliabilityc
go
create table [dbo].[t_pliabilityc] (
	[c_no] [int] not null ,
	[c_companyid] [int] not null , 		--��˾id	
	[c_productid] [int] not null , 		--��Ʒid	  
	[c_name] [char] (30)  null ,		--��������	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
create unique index i_pliabilityc on t_pliabilityc(c_companyid,c_productid,c_name)
go
--�������β�������ֵ��
if exists(select name from sysobjects where name='t_pliabilitycv')
	drop table t_pliabilitycv
go
create table [dbo].[t_pliabilitycv] (
	[c_companyid] [int] not null , 		--��˾id	
	[c_productid] [int] not null , 		--��Ʒid	 	
	[c_pliabilitycid] [int] not null , 
	[c_bxqtype] [int] null ,	-- �����ڼ����� 0 ���� 1 ��*�� 2 ����*��
	[c_bxq] [int] null ,		-- �����ڼ� 
	[c_jfqtype] [int] null ,	-- �����ڼ����� 0 ���� 1 ��*�� 2 ����*��
	[c_jfq] [int] null ,		-- �����ڼ� 
	[c_t] [int] not null , 		--1 ������� 2 ����������
	[c_v] [int]  null , 		--��������	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--�������νṹ��
if exists(select name from sysobjects where name='t_pliabilitys')
	drop table t_pliabilitys
go
create table [dbo].[t_pliabilitys] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 		--��˾id	
	[c_productid] [int] not null , 		--��Ʒid 
	[c_pname] [char] (50)  null ,		--��Ŀ����
	  
	[c_condition] [int] not null , 		--�������� --1 ȫ�� 2 ���� 3 ����
	[c_cv2t] [int] not null , 		--1 ������� 2 ���������� ������t_pliabilityc�� 
	[c_cv2] [int]  null , 			--�������� 
	[c_cv31t] [int] not null , 		--1 ������� 2 ���������� ������t_pliabilityc�� 
	[c_cv31] [int]  null , 			--���俪ʼ���� 
	[c_cv32t] [int] not null , 		--1 ������� 2 ���������� ������t_pliabilityc�� 
	[c_cv32] [int]  null , 			--����������� 
	
	[c_result] [int]  not null , 		--�⸶���� 0 ��ֵ 1 ��������İٷֱ� 2 �ۼƱ��ѵİٷֱ� 
	[c_rv] [decimal](15, 4) null,	 	--��ֵ	     
	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
create unique index i_pliabilitys on t_pliabilitys(c_companyid,c_productid,c_pname,c_condition,c_cv2t,c_cv2,c_cv31t,c_cv31,c_cv32t,c_cv32)
go