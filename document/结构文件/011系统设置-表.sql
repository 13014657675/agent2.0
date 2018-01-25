--�������ͱ�
if exists(select name from sysobjects where name='t_orgtype')
	drop table t_orgtype
go
create table [dbo].[t_orgtype] (
	[c_no] [int] identity (10, 2) not null ,
	[c_order] [int] null , 		--˳��
	[c_mark] [int] default 1 null , 		--0 ����ǰ׺  1 ������ǰ׺			
	[c_name] [char] (30)  not null,  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
--�����ȼ���Ϊ�����������
if exists(select name from sysobjects where name='t_orgclass')
	drop table t_orgclass
go
create table [dbo].[t_orgclass] (
	[c_no] [int] identity (10, 10) not null , 
	[c_name] [char] (30)  not null,  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--������
if exists(select name from sysobjects where name='t_organization')
	drop table t_organization
go
create table [dbo].[t_organization] (
	[c_no] [int] identity (1000, 1) not null ,
	[c_orgtypeid] [int] not null ,
	[c_orgclassid] [int] null ,
	[c_name] [char] (50)  not null , 
	[c_prefix] [char] (2)  null , 
	[c_path] [char] (14)  not null unique , 
	[c_parent] [int] not null ,		--������ID
	[c_deptid] [int] not null ,		--����������ID
	[c_license] [char] (50) null ,		--����Ӫҵִ�ձ��
	[c_lbeg] [char] (8) null ,		--����Ӫҵִ�ձ����Ч��ʼʱ��
	[c_lend] [char] (8) null ,		--����Ӫҵִ�ձ����Ч����ʱ��
	[c_permit] [char] (50) null ,		--��ҵ��Ӫ���֤��
	[c_pbeg] [char] (8) null ,		--��ҵ��Ӫ���֤����Ч��ʼʱ��
	[c_pend] [char] (8) null ,		--��ҵ��Ӫ���֤����Ч����ʱ��	
	[c_tax] [char] (50) null ,		--˰��Ǽ�֤��
	[c_organization] [char] (50) null ,	--��֯��������
	[c_jobnumber] [char] (10) null ,	--�����˹���  	 
	[c_seal] [char] (1) null ,		--0 ��׭�̹��� 1 δ׭�̹���
	[c_slocation] [char] (50) null ,	--���´�ŵ�ַ	
	[c_bbank] [int]  null ,			--����������
	[c_bcard] [char] (50) null ,		--�������˺�
	[c_gbank1] [int]  null ,		--һ�㻧1����
	[c_gcard1] [char] (50) null ,		--һ�㻧1�˺�
	[c_gbank2] [int]  null ,		--һ�㻧2����
	[c_gcard2] [char] (50) null ,		--һ�㻧2�˺�	
	[c_phone] [char] (20) null ,		--�绰
	[c_address] [char] (100) null ,		--��ַ
	[c_flag] [char] (1) default '0'  null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
--���ű�
if exists(select name from sysobjects where name='t_dept')
	drop table t_dept
go
create table [dbo].[t_dept] (
	[c_no] [int] identity (1, 5) not null ,
	[c_orgid] [int] not null ,
	[c_name] [char] (30)  not null ,  
	[c_ptnature] int  not null , 	--����	
	[c_system] [int] null ,		--������ϵ  	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_dept on t_dept(c_orgid,c_name)
go
--ְλ��λ��
if exists(select name from sysobjects where name='t_post')
	drop table t_post
go
create table [dbo].[t_post] (
	[c_no] [int] identity (1, 3) not null ,
	[c_orgid] [int] not null ,
	[c_deptid] [int] not null ,
	[c_type] [int] null ,		--1 ְλ 2 ��λ
	[c_name] [char] (30)  not null ,  
	[c_ishead] [char] (1) default '1' null ,	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_post on t_post(c_orgid,c_deptid,c_name )
go
--ְλ��λȨ�ޱ�
if exists(select name from sysobjects where name='t_postqx')
	drop table t_postqx
go
create table [dbo].[t_postqx] (
	[c_no] [int] identity (1, 1) not null ,
	[c_postid] [int] not null ,
	[c_xitong] [char] (1)  not null ,	--A��B��C...
	[c_menu] [varchar] (2000)  not null ,  
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_postqx on t_postqx(c_postid,c_xitong )
go
--���չ�˾��
if exists(select name from sysobjects where name='t_company')
	drop table t_company
go
create table [dbo].[t_company] (
	[c_no] [int] identity (100, 1) not null ,
	[c_type] [int] not null , --����	
	[c_fullname] [char] (50)  not null ,--ȫ��
	[c_name] [char] (30)  not null ,    --���	
	[c_tbdl] [int] not null , --Ͷ��������
	[c_bdl] [int] not null ,  --��������
	[c_addr] [char] (50)  null ,
	[c_zipcode] [char] (10)  null ,
	[c_phone] [char] (15)  null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--ְҵ�����
if exists(select name from sysobjects where name='t_occupation')
	drop table t_occupation
go
create table [dbo].[t_occupation] (
	[c_no] [int] identity (1, 1) not null , 
	[c_companyid] int not null,
	[c_code] [char] (20)  not null ,
	[c_name] [char] (50)  not null ,	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_occupation on t_occupation(c_companyid,c_code )
go
--ϵ�����ͱ�
if exists(select name from sysobjects where name='t_convertT')
	drop table t_convertT
go
create table [dbo].[t_convertT] (
	[c_no] [int] identity (1, 1) not null ,  
	[c_name] [char] (30)  null , 	--ϵ������
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_convertT on t_convertT(c_name )
go
--ϵ����
if exists(select name from sysobjects where name='t_convert')
	drop table t_convert
go
create table [dbo].[t_convert] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 	--��˾id  
	[c_convertT] [int] not null , 	--ϵͳ����id
	[c_jfqx] [int] null ,		--�ɷ��ڼ�	
	[c_dec] [decimal](6, 4) null,	--ϵ��	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_convert on t_convert(c_companyid,c_convertT,c_jfqx )
go
--������������ϵ��
if exists(select name from sysobjects where name='t_policy')
	drop table t_policy
go
create table [dbo].[t_policy] (
	[c_no] [int] identity (1, 1) not null , 
	[c_ptnature] int  not null , 	--����	
	[c_system] [int] null ,		--������ϵ����  	
	[c_name] [char] (30)  null , 	--������ϵ����
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
insert  t_policy(c_ptnature,c_system,c_name)values(3001,1,'ֱӪ')
go
insert  t_policy(c_ptnature,c_system,c_name)values(3001,2,'����') 
go 
insert  t_policy(c_ptnature,c_system,c_name)values(3002,11,'����')
go  
--����ְ�������
if exists(select name from sysobjects where name='t_pzjdy')
	drop table t_pzjdy
go
create table [dbo].[t_pzjdy] (  	
	[c_ptnature] int  not null , 	--����	
	[c_system] [int] null ,		--������ϵ����   	
	[c_level] [int] null ,		--1�㡢2�㡢3�� 	 
	[c_type] [int] null ,
	[c_name] [char](30) null 
) on [primary]
go 
--ֱӪ
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,1,1,10,'��ƹ���')
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,1,1,11,'�������')
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,1,2,20,'��ƾ���')
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,1,3,30,'����ܼ�')
go
--����
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,1,10,'��ϰ�ͻ�����') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,1,11,'�����ͻ�����') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,1,12,'�м��ͻ�����') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,1,13,'�߼��ͻ�����') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,2,20,'����������') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,2,21,'�м�������') 
go
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3001,2,2,22,'�߼�������') 
go
--����
insert  t_pzjdy(c_ptnature,c_system,c_level,c_type,c_name)values(3002,11,1,10,'������')
go 