--�����˻������ݱ�
if exists(select name from sysobjects where name='t_agentset')
	drop table t_agentset
go
create table [dbo].[t_agentset] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] null ,			--����id  
	[c_system] [int] null ,			--������ϵ  	
	[c_jobnumber] [char](10) not null ,	--����
	[c_tjrgh] [char](10) not null ,		--�Ƽ��˹���
	[c_type] [int] null ,			--ְ��
	[c_sxrgh] [char](10) null ,		--��Ա��Ϯ�˹��ţ����ϸ������棩
	[c_cxrgh] [char](10) null ,		--�����Ϯ�˹��ţ�������ȡ���棩
	[c_jcrgh] [char](10) null ,		--�ͻ��̳��˹��ţ��̳пͻ���Դ��
	[c_flag] [char](1) default '0' null ,
	[c_jobnm] [char](10) null ,
	[c_operator] [char](10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
insert t_agentset(c_jobnumber,c_tjrgh)values('0000000000','0000000000')
go 
--��������ʷ״̬��
if exists(select name from sysobjects where name='t_agentls')
	drop table t_agentls
go
create table [dbo].[t_agentls] (
	[c_no] [int] identity (1, 1) not null , 
	[c_orgid] [int] null ,			--����id  
	[c_system] [int] null ,			--������ϵ  	
	[c_jobnumber] [char](10) not null ,	--����
	[c_type] [int] null ,			--ְ��
	[c_director] [char] (10)  not null ,	--�ϼ�����
	[c_ksrq] [char](8) null ,
	[c_jsrq] [char](8) null ,
	[c_flag] [char](1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
insert t_agentls(c_jobnumber,c_director)values('0000000000','0000000000')
go
--���������ɹ�ϵ��
if exists(select name from sysobjects where name='t_agentgx')
	drop table t_agentgx
go
create table [dbo].[t_agentgx] (
	[c_no] [int] identity (1, 1) not null ,
	[c_system] [int] null ,			--������ϵ  	
	[c_layer] [int] null ,			--���� 
	[c_ycgh] [char](10) not null ,		--�����˹���
	[c_byczj] [int] not null ,		--��������ְ��
	[c_bycgh] [char](10)  not null ,	--�������˹���
	[c_flag] [char](1) default '0' null , 
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--�����˼ܹ���ͼ
if exists (select table_name from information_schema.views  where table_name = 'v_sxagent')
   	drop view v_sxagent
go
create view v_sxagent (
	c_orgid,	-- ����
	c_jobnumber,	-- ����
	c_name,		-- ����
	c_system,	-- ������ϵ
	c_tjrgh,	-- �Ƽ���
	c_type,		-- ְ��
	c_director,	-- �ϼ�����
	c_ksrq		-- ��ʼ���� 
	) 
as  
select 	a.c_orgid,	-- ���� 
	a.c_jobnumber,	-- ����
	a.c_name,	-- ����
	b.c_system,	-- ������ϵ 	
	b.c_tjrgh,	-- �Ƽ���
	b.c_type,	-- ְ��	
	c.c_director,	-- �ϼ����� 
	c.c_ksrq 	-- ��ʼ���� 
	from t_staff a,t_agentset b,t_agentls c
	where 	a.c_quitdate is null and b.c_flag='0' and c.c_flag='0'
	 	and a.c_jobnumber=b.c_jobnumber and a.c_jobnumber=c.c_jobnumber 
go
--������Ӷ���
if exists(select name from sysobjects where name='t_agentcommission')
	drop table t_agentcommission
go
create table [dbo].[t_agentcommission] (
	[c_no] [int] identity (1, 1) not null ,	
	[c_year] [int] null ,			-- �� 
	[c_month] [int] null ,			-- ��  	
	[c_orgid] [int] not null ,		-- ����	
	[c_jobnumber] [char](10) not null ,	-- ����
	[c_name] [char](20) not null ,		-- ����
	[c_system] [int] null ,			-- ������ϵ   
	[c_type] [int] null ,
	[c_str] [varchar] (2000)  null ,	-- ����������ϸ��
	[c_strv] [decimal](15, 2) null  	-- ���������ϼƣ�     
) on [primary]
go
create unique index i_agentcommission on t_agentcommission(c_year,c_month,c_orgid,c_jobnumber) 