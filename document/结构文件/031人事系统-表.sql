--Ա���� 
if exists(select name from sysobjects where name='t_staff')
	drop table t_staff
go
create table [dbo].[t_staff] (
	[c_no] [int] identity (1, 1) not null ,  	--id
	[c_prefix] char(2) null,			--ǰ׺
	[c_counter][int] null,				--������
	[c_orgid] [int]  null,				--��������
	[c_jobnumber] [char] (10)  null ,		--����
	[c_name] [char] (20)  null ,			--����
	[c_sex] [char] (1)  null , 			--�Ա� 1���� 0��Ů
	[c_birthday] [char] (10)  null ,		--��������
	[c_age] [int] null ,				--����
	[c_nation] [char] (4)  null ,			--����code
	[c_politics] [char] (4)  null ,			--������òcode
	[c_education] [char] (4)  null ,		--ѧ��code	
	[c_marriage] [char] (1)  null ,			--����code	
	[c_healthy] [char] (4)  null ,			--����code
	[c_blood] [char] (4)  null ,			--Ѫ��code	 
	[c_certificatetype] [char] (4)  null ,		--֤������code
	[c_certificate] [char] (50)  null ,		--֤������code
	[c_native] [char] (30)  null ,			--����
	[c_registerplace] [char] (50)  null ,		--�������ڵ�
	[c_livein] [char] (50)  null ,			--��ס��
	[c_zipcode] [char] (10)  null ,			--�ʱ�
	[c_telephone] [char] (20)  null ,		--�̶��绰
	[c_mobilephone] [char] (20)  null ,		--�ֻ�
	[c_email] [char] (30)  null ,			--email
	[c_hobby] [char] (30)  null ,			--���� 
	[c_contactname] [char] (20)  null ,		--������ϵ������
	[c_contactphone] [char] (20)  null ,		--������ϵ�˵绰	
	[c_foreign] [char] (30)  null ,			--����ˮƽ
	[c_computer] [char] (30)  null ,		--����ˮƽ
	[c_workdate] [char] (8)  null ,			--�μӹ������� 
	[c_bank] [char] (4)  null ,			--����
	[c_bankcode] [char] (50)  null ,		--���п���
	[c_qualificate] [char] (50)  null ,		--�ʸ�֤��	
	[c_quitdate] [char] (8)  null ,			--��ְ���� 
	[c_sqi1] [char] (10)  null ,			--������
	[c_sqi2] [char] (10)  null ,
	[c_sqi3] [char] (10)  null ,
	[c_szhi1] [char] (10)  null ,			--ֹ����
	[c_szhi2] [char] (10)  null ,
	[c_szhi3] [char] (10)  null ,
	[c_school1] [char] (50)  null ,			--ѧУ
	[c_school2] [char] (50)  null ,
	[c_school3] [char] (50)  null ,
	[c_professional1] [char] (30)  null ,		--רҵ
	[c_professional2] [char] (30)  null ,
	[c_professional3] [char] (30)  null ,
	[c_wqi1] [char] (10)  null ,			--������
	[c_wqi2] [char] (10)  null ,
	[c_wqi3] [char] (10)  null ,
	[c_wqi4] [char] (10)  null ,			 
	[c_wqi5] [char] (10)  null ,
	[c_wqi6] [char] (10)  null ,
	[c_wzhi1] [char] (10)  null ,			--ֹ����
	[c_wzhi2] [char] (10)  null ,
	[c_wzhi3] [char] (10)  null ,
	[c_wzhi4] [char] (10)  null ,			 
	[c_wzhi5] [char] (10)  null ,
	[c_wzhi6] [char] (10)  null ,
	[c_worknote1] [char] (50)  null ,		--��������
	[c_worknote2] [char] (50)  null ,
	[c_worknote3] [char] (50)  null ,
	[c_worknote4] [char] (50)  null ,		
	[c_worknote5] [char] (50)  null ,
	[c_worknote6] [char] (50)  null ,
	[c_worker1] [char] (30)  null ,			--ְλ
	[c_worker2] [char] (30)  null ,
	[c_worker3] [char] (30)  null ,
	[c_worker4] [char] (30)  null ,			 
	[c_worker5] [char] (30)  null ,
	[c_worker6] [char] (30)  null ,
	[c_name1] [char] (20)  null ,
	[c_name2] [char] (20)  null ,
	[c_name3] [char] (20)  null , 
	[c_call1] [char] (20)  null ,
	[c_call2] [char] (20)  null ,
	[c_call3] [char] (20)  null , 
	[c_company1] [char] (50)  null ,
	[c_company2] [char] (50)  null ,
	[c_company3] [char] (50)  null , 
	[c_address1] [char] (80)  null ,
	[c_address2] [char] (80)  null ,
	[c_address3] [char] (80)  null , 	
	[c_note] [char] (150)  null ,	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go   
create unique index i_staff on t_staff(c_jobnumber)
go 
insert t_staff(c_jobnumber,c_name)values('0000000000','ϵͳ')
go
--Ա����λְλ��
if exists(select name from sysobjects where name='t_postset')
	drop table t_postset
go
create table [dbo].[t_postset] (
	[c_no] [int] identity (1, 1) not null ,
	[c_jobnumber] [char](10) not null ,	--����
	[c_orgid] [int] not null ,		--����id  
	[c_postid] [int] not null ,		--��λid  
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_postset on t_postset(c_jobnumber,c_orgid,c_postid)
go
--Ա��н��ȼ���
if exists(select name from sysobjects where name='t_payset')
	drop table t_payset
go
create table [dbo].[t_payset] (
	[c_no] [int] identity (1, 1) not null ,
	[c_jobnumber] [char](10) not null ,	--����
	[c_pclass] [int] not null ,		--�ȼ�id 
	[c_state] [int] not null ,		--0 ��ʽ 1 ��ϰ  
	[c_jobnm] [char] (10)  not null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go  
create unique index i_payset on t_payset(c_jobnumber,c_pclass)
go 
--Ա����¼��
if exists(select name from sysobjects where name='t_login')
	drop table t_login
go
create table [dbo].[t_login] (
	[c_no] [int] identity (1, 1) not null ,
	[c_jobnumber] [char](10) not null ,	--����
	[c_pwd] [char] (64)  not null ,		--���� 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
insert t_login(c_jobnumber,c_pwd)values('ADMIN','e10adc3949ba59abbe56e057f20f883e') 
go
--Ա��Ȩ�ޱ�
if exists(select name from sysobjects where name='t_staffqx')
	drop table t_staffqx
go
create table [dbo].[t_staffqx] (
	[c_no] [int] identity (1, 1) not null ,
	[c_jobnumber] [char](10) not null ,	--����
	[c_xitong] [char] (1)  not null ,	--A��B��C...
	[c_menu] [varchar] (1000)  not null ,  
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--н������
if exists(select name from sysobjects where name='t_pcategory')
	drop table t_pcategory
go
create table [dbo].[t_pcategory] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_name] char(30)  null unique,	-- �������		
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--н��ȼ���
if exists(select name from sysobjects where name='t_pclass')
	drop table t_pclass
go
create table [dbo].[t_pclass] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_pcategory] [int] null ,	--  ���id 
	[c_name] char(30)  null ,	--  �ȼ�����		
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_pclass on t_pclass(c_pcategory,c_name )
go 
--н����Ŀ��
if exists(select name from sysobjects where name='t_pproject')
	drop table t_pproject
go
create table [dbo].[t_pproject] (
	[c_no] [int] identity (1, 1) not null ,	   
	[c_type] [int] null ,		--  ���: 1 ������Ŀ 2 �籣��Ŀ
	[c_name] char(30) null unique ,	--  ��Ŀ����		
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--н�������׼��
if exists(select name from sysobjects where name='t_pstandard')
	drop table t_pstandard
go
create table [dbo].[t_pstandard] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_pclass] [int] null ,		--  �ȼ�id 
	[c_pproject] [int] null ,	--  ������Ŀid 
	[c_base] [decimal](15, 2) null ,--  ����		
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_pstandard on t_pstandard(c_pclass,c_pproject )
go 
--н���籣��׼��
if exists(select name from sysobjects where name='t_psocial')
	drop table t_psocial
go
create table [dbo].[t_psocial] (
	[c_no] [int] identity (1, 1) not null ,	  	
	[c_orgid] [int] not null ,	--����id
	[c_pclass] [int] null ,		--  �ȼ�id 
	[c_pproject] [int] null ,	--  �籣��Ŀid 
	[c_base] [decimal](15, 2) null ,--  ����		
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--н�����ϵ�������
if exists(select name from sysobjects where name='t_pcoefficient')
	drop table t_pcoefficient
go
create table [dbo].[t_pcoefficient] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_var] char(30) null unique ,  --  ����ϵ������
	[c_name] char(50) null unique , --  ��Ӧָ������	
	[c_input] int null  , 		--  �������� 1�˹�����{11 ���Źҹ� } 2ϵͳ��ȡ{21 ���ݻ��� }  
	[c_period] int null  , 		--  ������Ч�� 1:�� 3:���� 12:��	
	[c_o] [int]  null , 		--  ��������ַ
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--н�����ϵ�����ñ����Źҹ��ṹA��
if exists(select name from sysobjects where name='t_pcoefficientset')
	drop table t_pcoefficientset
go
create table [dbo].[t_pcoefficientset] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_pcoefficient] int null ,  		--  ����ϵ��id
	[c_year] int null  , 			--  ���
	[c_number] int null  , 			--  ������
	[c_orgid] [int] not null ,		--  ����id
	[c_jobnumber] [char] (10)  null ,	--  ����	
	[c_value] [decimal](15, 2) null ,	--  ��ֵ	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--н�귢�ű�
if exists(select name from sysobjects where name='t_pmamount')
	drop table t_pmamount
go
create table [dbo].[t_pmamount] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_year] [int] null ,			--  �� 
	[c_month] [int] null ,			--  �� 
	[c_orgid] [int] not null ,		--  ����id
	[c_jobnumber] [char] (10)  null ,	--  ����	
	[c_str] [char](600) null ,		--  ���� 
	[c_result] [decimal](15, 2) null ,	--  ���ֵ
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_pmamount on t_pmamount(c_year,c_month,c_orgid,c_jobnumber)
go
--������Ŀ��
if exists(select name from sysobjects where name='t_ontype')
	drop table t_ontype
go
create table [dbo].[t_ontype] (
	[c_no] [int] identity (1, 1) not null ,	  
	[c_name] char(30)  null unique,		-- ��Ŀ����	
	[c_code] char(1)  null unique, 		-- ����	  
	[c_state] int  null ,	 		-- ��� 0 ����״̬ 1 �ۿ�״̬	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
--����������Ŀ��
if exists(select name from sysobjects where name='t_ontype2')
	drop table t_ontype2
go
create table [dbo].[t_ontype2] (
	[c_no] [int] identity (1, 1) not null ,	 
	[c_orgid] [int] not null ,		-- ����id 
	[c_ontype] [int] not null ,		-- ������Ŀid 
	[c_type] int  null ,	 		-- �۳����� 1 һ�� 2 һ��	 
	[c_deducted] [decimal](15, 2) null , 	-- �۳���� 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_ontype2 on t_ontype2(c_orgid,c_ontype)
go
--���Ź�����
if exists(select name from sysobjects where name='t_onrelate')
	drop table t_onrelate
go
create table [dbo].[t_onrelate] (
	[c_no] [int] identity (1, 1) not null , 
	[c_orgid] [int] not null ,		--����id 
	[c_jobnumber] [char](10) not null ,	--����
	[c_code] [varchar](30) not null ,	--����	  
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_onrelate on t_onrelate( c_orgid,c_jobnumber )
go 
--���ڼ�¼��
if exists(select name from sysobjects where name='t_onduty')
	drop table t_onduty
go
create table [dbo].[t_onduty] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		--����id 
	[c_jobnumber] [char](10) not null ,	--����
	[c_date] [char](8) not null ,		--����
	[c_morning] int   null ,		--���� 
	[c_afternoon] int   null ,		--����	
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_onduty on t_onduty( c_orgid,c_jobnumber,c_date )
go 
--���ڻ��ܱ�
if exists(select name from sysobjects where name='t_onsummary')
	drop table t_onsummary
go
create table [dbo].[t_onsummary] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		--����id 
	[c_year] [int] null ,			--�� 
	[c_month] [int] null ,			--�� 
	[c_jobnumber] [char](10) not null ,	--����	 	
	[c_deducted] [decimal](15, 2) null , 	--�۳����
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_onsummary on t_onsummary( c_orgid,c_year,c_month,c_jobnumber )
go
--���������
if exists(select name from sysobjects where name='t_bankoutlets')
	drop table t_bankoutlets
go
create table [dbo].[t_bankoutlets] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		--����id 
	[c_bank] [char] (4)  null ,		--���д���	 
	[c_code] [char](30) not null ,		--�������	 
	[c_name] [char](50) not null ,		--��������
	[c_phone] [char](30)  null ,		--�绰		
	[c_address] [char](50) null ,		--��ַ
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_bankoutlets on t_bankoutlets(c_bank,c_code)
go
--�������������
if exists(select name from sysobjects where name='t_bankrelate')
	drop table t_bankrelate
go
create table [dbo].[t_bankrelate] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		--����id 
	[c_outletsid] [int] null ,		--����id
	[c_jobnumber] [char](10) not null ,	--����רԱ����	 
	[c_ksrq] [char](8)  null ,		--��ʼ���� 
	[c_jsrq] [char](8)  null ,		--��������
	[c_flag] [char] (1) default '0'  null ,	--��Ч��־	 
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 