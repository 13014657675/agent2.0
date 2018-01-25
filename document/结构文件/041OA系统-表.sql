--Ŀ¼��
if exists(select name from sysobjects where name='t_catalog')
	drop table t_catalog
go
create table [dbo].[t_catalog] (
	[c_no] [int] identity (1, 1) not null ,
	[c_sys] [int] not null ,		--1 �ļ����� ��2 ���ù��� �� 
	[c_name] [char] (30)  not null ,   
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
create unique index i_catalog on t_catalog(c_sys,c_name)
go
--�ļ���
if exists(select name from sysobjects where name='t_file')
	drop table t_file
go
create table [dbo].[t_file] (
	[c_no] [int] identity (1, 1) not null ,
	[c_sys] [int] not null ,		--1 �ļ����� ��2 ���ù��� �� 3 ǩ������ ��
	[c_catalogid] [int]  null ,  
	[c_name] [char] (200)  not null ,  	--��ʾ�ļ���
	[c_save] [char] (50)  not null ,  	--�����ļ���		
	[c_url] [char] (150)  not null ,  	--�����ַ
	[c_flag] [char] (1) default '0' null ,  --״̬
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--ϵͳ��ɫ��
if exists(select name from sysobjects where name='t_role')
	drop table t_role
go
create table [dbo].[t_role] (
	[c_no] [int] identity (1, 1) not null ,
	[c_sys] [int] not null ,		--1 �ļ����� ��3 ǩ������ 
	[c_jobnumber] [char](10) not null ,	--����
	[c_role] [int]  null ,			--1 �ļ������101 ������ �� ��3 ǩ������ ��301 ������ 302 �������� 303 �ֹ��ܣ�  
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
create unique index i_role on t_role(c_sys,c_jobnumber,c_role)
go 
--�ֹ������ñ�
if exists(select name from sysobjects where name='t_roleset')
	drop table t_roleset
go
create table [dbo].[t_roleset] (
	[c_no] [int] identity (1, 1) not null ,
	[c_sys] [int] not null ,		--3 ǩ������ 
	[c_jobnumber] [char](10) not null ,	--����
	[c_orgid] [int] not null ,		--����id  
	[c_deptid] [int] not null ,		--����id
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
create unique index i_roleset on t_roleset(c_sys,c_jobnumber,c_orgid,c_deptid)
go
--�ļ�ǩ����
if exists(select name from sysobjects where name='t_filesigned')
	drop table t_filesigned
go
create table [dbo].[t_filesigned] (
	[c_no] [int] identity (1, 1) not null , 
	[c_dname] [char] (30)  not null ,	--���Ĳ���  
	[c_dcode] [char] (30)  not null ,	--�����ֺ� 
	[c_write] [char] (30)  not null ,	--�����  
	[c_check] [char] (30)  not null ,	--У���� 
	[c_fileid] [int] not null ,		--�ļ�id	
	[c_note] [char](200)  null ,		--��ע	 
	[c_jobnm] [char] (10)  not null ,	--add ��� �� zz ��ֹ
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go 
--�ļ�Ȩ�ޱ�
if exists(select name from sysobjects where name='t_fileJT')
	drop table t_fileJT
go
create table [dbo].[t_fileJT] (
	[c_no] [int] identity (1, 1) not null ,  
	[c_fileid] [int] not null ,		--�ļ�id		 	 
	[c_postid] [int] not null ,		--��λid  
	[c_jobnm] [char] (10)  not null ,	--
	[c_flag] [char] (1) default '0' null ,  --״̬
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--�ļ��Ķ���¼��
if exists(select name from sysobjects where name='t_fileRD')
	drop table t_fileRD
go
create table [dbo].[t_fileRD] (
	[c_no] [int] identity (1, 1) not null ,  
	[c_fileid] [int] not null ,		--�ļ�id	  	 	 
	[c_jobnumber] [char](10) not null ,	--����
	[c_times] [int]  not null ,		--����    
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--��ת��
if exists(select name from sysobjects where name='t_sprocess')
	drop table t_sprocess
go
create table [dbo].[t_sprocess] (
	[c_no] [int] identity (1, 1) not null , 
	[c_sys] [int] not null ,		--1 �ļ����� ��3 ǩ������ 
	[c_sid] [int]  not null ,		--ǩ��id   	
	[c_return] [int] not null ,		--1:ͬ�� 2:��ͬ�� 	 
	[c_note] [char](200)  null ,		--��ע   
	[c_send] [char](10)  null ,		--������
	[c_receive] [char](10)  null ,	        --������
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--ǩ����
if exists(select name from sysobjects where name='t_signed')
	drop table t_signed
go
create table [dbo].[t_signed] (
	[c_no] [int] not null , 
	[c_type] [int] not null ,		--31 ��Ŀǩ��  ��32 ����ǩ��
	[c_apply] [char] (8)  not null ,	--��������   
	[c_cost] [decimal](15, 2) null ,	--���ý��  	  
	[c_fileid] [int]  null ,		--�ļ�id		 	
	[c_note] [varchar](2000)  null ,	--����
	[c_jobnm] [char] (10)  not null ,	--add ��� ��zz ��ֹ
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--������ת��
if exists(select name from sysobjects where name='t_orgsigned')
	drop table t_orgsigned
go
create table [dbo].[t_orgsigned] (
	[c_no] [int] identity (1, 1) not null , 
	[c_sys] [int] not null ,		--1 �ļ����� ��3 ǩ������ 
	[c_sid] [int]  not null ,		--ǩ��id   	
	[c_orgid] [int] not null ,		--ʼ����id  	 
	[c_to] [int] not null ,			--ȥ�� 1 ���������� 2 �������������͸������� 3 ��������	
	[c_orgid2] [int] not null ,		--���ջ���id  
	[c_deptid2] [int] not null ,		--���ղ���
	[c_jobnumber2] [char](10)  null ,	--������
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go 
--��Ȩ�����
if exists(select name from sysobjects where name='t_grant')
	drop table t_grant
go
create table [dbo].[t_grant] (
	[c_no] [int] identity (1, 1) not null ,   
	[c_sys] [int] not null ,		--3 ǩ������  
	[c_jobnumber] [char](10) not null ,	--����
	[c_money] [decimal](10, 2) null ,	--��Ȩ���   
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null
) on [primary]
go
--ǩ����ʾ��
if exists(select name from sysobjects where name='t_sprompt')
	drop table t_sprompt
go
create table [dbo].[t_sprompt] (
	[c_no] [int] identity (1, 1) not null , 
	[c_sys] [int] not null ,		--1 �ļ����� ��3 ǩ������ 
	[c_sid] [int]  not null ,		--ǩ��id   	
	[c_jobnumber] [char](10) not null ,	--����
	[c_flag] [char] (1) default '0' null 	 
) on [primary]
go