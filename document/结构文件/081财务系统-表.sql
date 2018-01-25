--�����ѱ���<��ͳ��>
if exists(select name from sysobjects where name='t_srate')
	drop table t_srate
go
create table [dbo].[t_srate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 	--��˾id	
	[c_productid] [int] not null , 	--��Ʒid	
	[c_jfqx] [int] not null ,	--�ɷ���	
	[c_bdnd] [int] not null ,	--�������
	[c_srate] [decimal](9, 4) null , 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_srate on t_srate(c_companyid,c_productid,c_jfqx,c_bdnd) 
go
--Ӷ����Ŀ��<��ͳ��>
if exists(select name from sysobjects where name='t_exptype')
	drop table t_exptype
go
create table [dbo].[t_exptype] (
	[c_no] [int] identity (1, 1) not null ,	 
	[c_system] [int] not null ,	--������ϵ����  	
	[c_name] [char] (50)  not null, --��Ŀ����   
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_exptype on t_exptype(c_system,c_name) 
go
--Ӷ�����<��ͳ��>
if exists(select name from sysobjects where name='t_expsrate')
	drop table t_expsrate
go
create table [dbo].[t_expsrate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] [int] not null , 	--��˾id	
	[c_productid] [int] not null , 	--��Ʒid			
	[c_jfqx] [int] not null ,	--�ɷ���	
	[c_bdnd] [int] not null ,	--�������
	[c_system] [int] null ,		--������ϵ����  	
	[c_exptypeid] [int] null ,	--��Ŀid
	[c_srate] [decimal](9, 4) null , 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_expsrate on t_expsrate(c_companyid,c_productid,c_jfqx,c_bdnd,c_system,c_exptypeid) 
go
--�������ڶ��˱�
if exists(select name from sysobjects where name='t_sxdz')
	drop table t_sxdz
go
create table [dbo].[t_sxdz] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- ����
	[c_year] [int] null ,			-- �� 
	[c_month] [int] null ,			-- ��  
	[c_companyid] int not null,		-- ���չ�˾
	[c_bd] [char] (30)  null ,		-- ���� 
	[c_tbrname] [char] (30) null ,		-- Ͷ��������
	[c_bbrname] [char] (30) null ,		-- ���������� 
	[c_cbrq] [datetime] null ,		-- �б����� 
	[c_bxf] [decimal](15, 2) null ,		-- ���շ�
	[c_sxf] [decimal](15, 2) null ,	 	-- ������	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--�������ڶ��˱�
if exists(select name from sysobjects where name='t_sxdz_xq')
	drop table t_sxdz_xq
go
create table [dbo].[t_sxdz_xq] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- ����
	[c_year] [int] null ,			-- �� 
	[c_month] [int] null ,			-- ��  
	[c_companyid] int not null,		-- ���չ�˾
	[c_bd] [char] (30)  null ,		-- ���� 
	[c_bdnd] [int] null ,			-- �������  
	[c_bxf] [decimal](15, 2) null ,		-- ���շ�
	[c_sxf] [decimal](15, 2) null ,	 	-- ������	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--���ս����
if exists(select name from sysobjects where name='t_sxjs')
	drop table t_sxjs
go
create table [dbo].[t_sxjs] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- ����
	[c_year] [int] null ,			-- �� 
	[c_month] [int] null ,			-- ��  
	[c_companyid] int not null,		-- ���չ�˾
	[c_bd] [char] (30)  null ,		-- ����  
	[c_productid] [int] not null , 		-- ��Ʒid	
	[c_bdnd] [int] null ,			-- �������  
	[c_bxf] [decimal](15, 2) null ,		-- ���շ�  
	[c_bxfr1] [decimal](7,3) null ,		-- �������
	[c_bxfr2] [decimal](7,3) null ,		-- ֧������
	[c_bxfy1] [decimal](15,3) null ,	-- ����
	[c_bxfy2] [decimal](15,3) null , 	-- ֧��  
	[c_note] char(300)  null ,		-- ��ע
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxjs on t_sxjs(c_companyid,c_bd,c_productid,c_bdnd)
go  
--ʹ�����ʱ�
if exists(select name from sysobjects where name='t_usage')
	drop table t_usage
go
create table [dbo].[t_usage] (
	[c_no] [int] identity (1, 1) not null ,	 
	[c_system] [int] not null ,	--������ϵ����  	
	[c_name] [char] (50)  not null, --��Ŀ����   
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_usage on t_usage(c_system,c_name) 
go
--�����ѱ���<����>
if exists(select name from sysobjects where name='t_crate')
	drop table t_crate
go
create table [dbo].[t_crate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	--����	
	[c_usageid] [int] not null , 	--ʹ������id		
	[c_companyid] [int] not null , 	--��˾id	
	[c_productid] [int] not null , 	--��Ʒid	
	[c_type] [int] not null ,	--���� 1 ǩ������ 2 ������
	[c_ksrq] [char](8) not null ,	--��ʼ���� 
	[c_rate] [decimal](9, 4) null , 	--���� 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_crate on t_crate(c_orgid,c_usageid,c_companyid,c_productid,c_type,c_ksrq) 
go
--����˰�������<����>
if exists(select name from sysobjects where name='t_ctax')
	drop table t_ctax
go
create table [dbo].[t_ctax] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	--����	
	[c_usageid] [int] not null , 	--ʹ������id		
	[c_companyid] [int] not null , 	--��˾id	
	[c_productid] [int] not null , 	--��Ʒid	
	[c_type] [int] not null ,	--���� 1 ǩ������ 2 ������
	[c_ksrq] [char](8) not null ,	--��ʼ���� 
	[c_rate] [decimal](9, 4) null , 	--���� 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_ctax on t_ctax(c_orgid,c_usageid,c_companyid,c_productid,c_type,c_ksrq) 
go
--Ӷ�����<����>
if exists(select name from sysobjects where name='t_expcrate')
	drop table t_expcrate
go
create table [dbo].[t_expcrate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	--����	
	[c_usageid] [int] not null , 	--ʹ������id		
	[c_companyid] [int] not null , 	--��˾id	
	[c_productid] [int] not null , 	--��Ʒid	
	[c_type] [int] not null ,	--���� 1 ǩ������ 2 ������
	[c_ksrq] [char](8) not null ,	--��ʼ���� 
	[c_rate] [decimal](9, 4) null , 	--���� 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_expcrate on t_expcrate(c_orgid,c_usageid,c_companyid,c_productid,c_type,c_ksrq) 
go
--����˰֧������<����>
if exists(select name from sysobjects where name='t_expctax')
	drop table t_expctax
go
create table [dbo].[t_expctax] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	--����	
	[c_usageid] [int] not null , 	--ʹ������id		
	[c_companyid] [int] not null , 	--��˾id	
	[c_productid] [int] not null , 	--��Ʒid	
	[c_type] [int] not null ,	--���� 1 ǩ������ 2 ������
	[c_ksrq] [char](8) not null ,	--��ʼ���� 
	[c_rate] [decimal](9, 4) null , 	--���� 
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] [char] (20)  not null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_expctax on t_expctax(c_orgid,c_usageid,c_companyid,c_productid,c_type,c_ksrq) 
go
--����Ԥ��Ӷ���
if exists(select name from sysobjects where name='t_cxytyj')
	drop table t_cxytyj
go
create table [dbo].[t_cxytyj] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- ����
	[c_companyid] int not null,		-- ���չ�˾
	[c_ffrq] [char](8) not null ,		-- ��������	
	[c_productid] [int] not null , 		-- ��Ʒid
	[c_bd] [char] (30)  null ,		-- ����  
	[c_bxf] [decimal](15, 2) null ,		-- ���շ�
	[c_ccs] [decimal](15, 2) null ,		-- ����˰ 
	[c_bxfr2] [decimal](7,3) null ,		-- Ӷ����� 
	[c_bxfy2] [decimal](15, 2) null ,	-- Ӷ�� 
	[c_ccsr2] [decimal](7,3) null ,		-- ֧��˰���� 
	[c_ccsy2] [decimal](15, 2) null ,	-- ֧��˰	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_cxytyj on t_cxytyj(c_orgid,c_companyid,c_productid,c_bd) 
go
--�������ڶ��˱�
if exists(select name from sysobjects where name='t_cxdz')
	drop table t_cxdz
go
create table [dbo].[t_cxdz] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- ����
	[c_year] [int] null ,			-- �� 
	[c_month] [int] null ,			-- ��  
	[c_companyid] int not null,		-- ���չ�˾
	[c_type] [int] not null ,		-- ���� 1 ǩ������ 2 ������
	[c_bd] [char] (30)  null ,		-- ����  
	[c_bxf] [decimal](15, 2) null ,		-- ���շ�
	[c_ccs] [decimal](15, 2) null ,		-- ����˰
	[c_bxfy1] [decimal](15, 2) null ,	-- ������
	[c_bxfy2] [decimal](15, 2) null ,	-- Ӷ��
	[c_ccsy1] [decimal](15, 2) null ,	-- ����˰
	[c_ccsy2] [decimal](15, 2) null ,	-- ֧��˰	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_cxdz on t_cxdz(c_orgid,c_companyid,c_bd) 
go
--���ս����
if exists(select name from sysobjects where name='t_cxjs')
	drop table t_cxjs
go
create table [dbo].[t_cxjs] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- ����
	[c_year] [int] null ,			-- �� 
	[c_month] [int] null ,			-- ��  
	[c_companyid] int not null,		-- ���չ�˾
	[c_bd] [char] (30)  null ,		-- ����  
	[c_productid] [int] not null , 		-- ��Ʒid  
	[c_bxf] [decimal](15, 2) null ,		-- ���շ�  
	[c_ccs] [decimal](15, 2) null ,		-- ����˰  
	[c_bxfr1] [decimal](7,3) null ,		-- �����ѱ���
	[c_bxfr2] [decimal](7,3) null ,		-- Ӷ�����
	[c_bxfy1] [decimal](15,3) null ,	-- ������
	[c_bxfy2] [decimal](15,3) null , 	-- Ӷ��
	[c_ccsr1] [decimal](7,3) null ,		-- ����˰����
	[c_ccsr2] [decimal](7,3) null ,		-- ֧��˰����
	[c_ccsy1] [decimal](15,3) null ,	-- ����˰
	[c_ccsy2] [decimal](15,3) null , 	-- ֧��˰
	[c_note] char(300)  null ,		-- ��ע
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_cxjs on t_cxjs(c_companyid,c_bd)
go