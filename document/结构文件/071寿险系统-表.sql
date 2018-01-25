--�ͻ���
if exists(select name from sysobjects where name='t_customer')
	drop table t_customer
go
create table [dbo].[t_customer] (
	[c_no] int not null , 
	[c_name] [char] (20)  not null ,--����
	[c_nation] [char] (30) null,	--����
	[c_sex] [int] not null ,	--�Ա�
	[c_birthy] [int] null,		--������
	[c_birthm] [int] null,		--������
	[c_birthd] [int] null,		--������
	[c_marriage] [int] null, 	--0 ���� 1 �ѻ�
	[c_cardtype] [char] (4)  null ,		--֤������
	[c_cardnum] [char] (40)  not null ,	--֤������
	[c_cardperiod] [char] (8) null ,	--֤����Ч��
	[c_education] [char] (4) null,	--ѧ��
	[c_email] [char] (50)  null ,	--email
	[c_phone] [char] (30)  null ,	--�̶��绰 
	[c_mobile] [char] (30)  null ,	--�ƶ��绰 
	[c_company] [char] (50) null , 	--������λ��ѧУ����
	[c_post] [char] (20)  null ,	--ְ��
	[c_postcode] [char] (20)  null ,--ְҵ����	
	[c_hddr] [char] (80)  null ,	--��ס��ַ
	[c_hzip] [char] (20)  null , 	--��ס�ʱ�
	[c_cddr] [char] (80)  null ,	--��λ��ַ
	[c_czip] [char] (20)  null ,    --��λ�ʱ�
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(20)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--���ձ�����Ϣ��
if exists(select name from sysobjects where name='t_sxbd')
	drop table t_sxbd
go
create table [dbo].[t_sxbd] (
	[c_no] [int] identity (1, 1) not null ,	
	[c_orgid] [int] not null ,	-- ����
	[c_companyid] int not null,	-- ���չ�˾
	[c_tbd] [char] (30)  not null ,	-- Ͷ������
	[c_bd] [char] (30)  null ,	-- ������
	[c_address] [char] (80) null ,	-- ͨѶ��ַ
	[c_zip] [char] (20)  null ,    	-- ͨѶ�ʱ�
	[c_tbrnum] [int]  not null ,	-- Ͷ���˱��
	[c_bbrnum] [int]  not null ,	-- �����˱��
	[c_tbrrel] [char] (20)  null ,	-- ��Ͷ���˵�*	
	[c_name1] [char] (20)  null ,	-- ����������
	[c_sex1] [char] (1)  null ,	-- �������Ա�
	[c_bbrrel1] [char] (20)  null , -- �Ǳ����˵�*	
	[c_sysx1] int  null ,		-- ����˳��
	[c_sybl1] [decimal](7, 2) null ,-- �������
	[c_cardtype1] [char] (4)  null ,-- ֤������
	[c_cardnum1] [char] (20)  null ,-- ֤������	
	[c_name2] [char] (20)  null ,	-- ����������
	[c_sex2] [char] (1)  null ,	-- �������Ա�
	[c_bbrrel2] [char] (20)  null , -- �Ǳ����˵�*	
	[c_sysx2] int  null ,		-- ����˳��
	[c_sybl2] [decimal](7, 2) null ,-- �������
	[c_cardtype2] [char] (4)  null ,-- ֤������
	[c_cardnum2] [char] (20)  null ,-- ֤������	
	[c_name3] [char] (20)  null ,	-- ����������
	[c_sex3] [char] (1)  null ,	-- �������Ա�
	[c_bbrrel3] [char] (20)  null , -- �Ǳ����˵�*	
	[c_sysx3] int  null ,		-- ����˳��
	[c_sybl3] [decimal](7, 2) null ,-- �������
	[c_cardtype3] [char] (4)  null ,-- ֤������
	[c_cardnum3] [char] (20)  null ,-- ֤������ 	 
	[c_pay] [int] null ,		-- ���ѷ�ʽ
	[c_pad] [int] null ,		-- �潻��ʽ
	[c_controversy] [int] null ,	-- ���鴦��ʽ	
	[c_bank] [char] (4)  null ,	-- ����
	[c_bankcode] [char] (50)  null ,-- ���п���
	[c_jobnumber] [char] (10) null ,-- ����	
	[c_outletsid] [int] null ,	-- ����id ��"-1 ֱ��"
	[c_orgid_sq] [int] null ,	-- ����id  
	[c_system_sq] [int] null ,	-- ������ϵ  	
	[c_tbrq] [char] (8)  null , 	-- Ͷ������
	[c_type_xq] [char] (1)  null ,	-- ���ڷ������ͣ�1.������� 2 �ݹ���� 3 �¶���������
	[c_jobnumber_xq] [char](10) null ,	-- ���ڷ����˹���
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxbd on t_sxbd(c_companyid,c_tbd) 
go
create index i_sxbd2 on t_sxbd(c_companyid,c_tbd,c_bd)
go
--Ͷ�������
if exists(select name from sysobjects where name='t_sxtb')
	drop table t_sxtb
go
create table [dbo].[t_sxtb] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] int not null,	-- ���չ�˾
	[c_tbd] [char] (30)  not null ,	-- Ͷ������
	[c_bd] [char] (30)  null ,	-- ������
	[c_productid] [int] not null , 	-- ��Ʒ����id	 
	[c_bxqtype] [int] null ,	-- �����ڼ����� 0 ���� 1��*�� 2����*��
	[c_bxq] [int] null ,		-- �����ڼ���N����
	[c_jfqtype] [int] null ,	-- �����ڼ����� 0 ���� 1��*�� 2����*��
	[c_jfq] [int] null ,		-- �����ڼ���N����
	[c_jfqx] [int] null , 		-- ��������
	[c_bxje] [decimal](15,2) null ,	-- ���ս��
	[c_bxf] [decimal](15,2) null , 	-- ���շ� 
	[c_bxfr1] [decimal](7,3) null ,	-- �������
	[c_bxfr2] [decimal](7,3) null ,	-- ֧������
	[c_bxfy1] [decimal](15,3) null ,-- ����
	[c_bxfy2] [decimal](15,3) null ,-- ֧�� 
	[c_check] [char] (8)  null ,	-- ��������
	[c_solve] [char] (8)  null ,	-- ��������
	[c_bxfxs] [decimal](7, 3) null ,
	[c_bxfbz] [decimal](15, 2) null ,
	[c_bxgsxs] [decimal](7, 3) null ,
	[c_bxgsbz] [decimal](15, 2) null ,
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create index i_sxtb on t_sxtb(c_companyid,c_tbd,c_bd)
go
create unique index i_sxtb2 on t_sxtb(c_companyid,c_tbd,c_productid)
go
--���ձ���״̬��
if exists(select name from sysobjects where name='t_sxbdzt')
	drop table t_sxbdzt
go
create table [dbo].[t_sxbdzt] (
	[c_no] [int] identity (1, 1) not null ,
	[c_companyid] int not null,	-- ���չ�˾
	[c_tbd] [char] (30)  not null ,
	[c_bd] [char] (30)  null ,	
	[c_type] [int] not null ,	-- 0 ���� 1 ��Ч 2 ���� 3 ��ִ 4 ��ԥ���˱� 5 �����˱� 
					-- 9 ������ֹ
	[c_date] [char] (8)  null ,	
	[c_orgid] [int] null ,		-- ����
	[c_flag] [char] (1) default '0' null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null  
) on [primary]
go
create unique index i_sxbdzt on t_sxbdzt(c_companyid,c_tbd,c_type)
go
create index i_sxbdzt2 on t_sxbdzt(c_companyid,c_tbd,c_bd)
go
--���ձ�����Ϣ��ͼ
if exists (select table_name from information_schema.views  where table_name = 'v_sxbdxx')
   	drop view v_sxbdxx
go
create view v_sxbdxx (
	c_orgid,	-- ���� 
	c_companyid,	-- ���չ�˾
	c_tbd,		-- Ͷ����
	c_bd,		-- ���� 	
	c_tbrnum,	-- Ͷ���˱��
	c_bbrnum,	-- �����˱��	
	c_jobnumber,	-- ����  
	c_outletsid,	-- ����
	c_orgid_sq,	-- ����
	c_system_sq,	-- ������ϵ
	c_productid, 	-- ��Ʒ����id	
	c_jfqx, 	-- ��������
	c_bxje,		-- ���ս��
	c_bxf, 		-- ���շ� 
	c_bxfxs,	-- �걣ϵ��
	c_bxfbz,	-- �걣
	c_bxgsxs,	-- ���չ�˾�걣ϵ�� 
	c_bxgsbz,	-- ���չ�˾�걣
	c_bxfr1,	-- ������� 
	c_bxfr2,	-- ֧������ 
	c_bxfy1,	-- ����
	c_bxfy2,	-- ֧�� 	
	c_lrrq,		-- ¼������
	c_tbrq,		-- Ͷ������  
	c_solve,	-- �������� 
	c_jobnm		-- ״̬
	) 
as  
select 	a.c_orgid,	-- ���� 
	a.c_companyid,	-- ���չ�˾
	a.c_tbd,	-- Ͷ����
	a.c_bd,		-- ���� 	
	a.c_tbrnum,	-- Ͷ���˱��
	a.c_bbrnum,	-- �����˱��	
	a.c_jobnumber,	-- ����  
	a.c_outletsid,  -- ����
	a.c_orgid_sq,	-- ����
	a.c_system_sq,	-- ������ϵ
	b.c_productid, 	-- ��Ʒ����id	
	b.c_jfqx, 	-- ��������
	b.c_bxje,	-- ���ս��
	b.c_bxf, 	-- ���շ� 
	b.c_bxfxs,	-- �걣ϵ��
	b.c_bxfbz,	-- �걣
	b.c_bxgsxs,	-- ���չ�˾�걣ϵ�� 
	b.c_bxgsbz,	-- ���չ�˾�걣
	b.c_bxfr1,	-- ������� 
	b.c_bxfr2,	-- ֧������ 
	b.c_bxfy1,	-- ����
	b.c_bxfy2,	-- ֧�� 	
	convert(char(8),a.c_datime,112),-- ¼������
	a.c_tbrq,	-- Ͷ������  
	b.c_solve,	-- �������� 
	a.c_jobnm	-- ״̬
	from t_sxbd a,t_sxtb b 
	where a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd  
go
--����Ͷ�����ʹ���
if exists(select name from sysobjects where name='t_sxtbsds')
	drop table t_sxtbsds
go
create table [dbo].[t_sxtbsds] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	-- ����
	[c_companyid] int not null,	-- ���չ�˾ 
	[c_tbd] [char] (30)  null ,	-- Ͷ���� 
	[c_tbrnum] [int]  null ,	-- Ͷ���˱��   
	[c_date] [char] (8)  null ,	-- ����
	[c_times] [int]  null ,		-- ����
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxtbsds on t_sxtbsds(c_companyid,c_tbd)
go 
--����Ͷ�����սᵥ
if exists(select name from sysobjects where name='t_sxtbrjd')
	drop table t_sxtbrjd
go
create table [dbo].[t_sxtbrjd] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	-- ����
	[c_companyid] int not null,	-- ���չ�˾
	[c_tbd] [char] (30)  null ,	-- Ͷ����	
	[c_tbrnum] [int]  null ,	-- Ͷ���˱��     
	[c_jobnumber] [char] (10) null ,-- ����	 
	[c_date] [char] (8)  null ,	-- ����
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxtbrjd on t_sxtbrjd(c_companyid,c_tbd)
go 
--���ձ�����Ч�սᵥ
if exists(select name from sysobjects where name='t_sxsxrjd')
	drop table t_sxsxrjd
go
create table [dbo].[t_sxsxrjd] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	-- ����
	[c_companyid] int not null,	-- ���չ�˾
	[c_tbd] [char] (30)  not null ,
	[c_bd] [char] (30)  not null ,
	[c_date] [char] (8)  null ,	-- ����
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxsxrjd on t_sxsxrjd(c_companyid,c_bd)
go
--���ձ��������嵥
if exists(select name from sysobjects where name='t_sxffqd')
	drop table t_sxffqd
go
create table [dbo].[t_sxffqd] (
	[c_no] [int] identity (1, 1) not null ,	
	[c_companyid] int not null,	-- ���չ�˾
	[c_bd] [char] (30)  not null ,	-- ����  
	[c_orgid] [int] not null ,	-- ����
	[c_date] [char] (8)  null ,	-- ����
	[c_times] [int]  null ,		-- ����
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxffqd on t_sxffqd(c_companyid,c_bd)
go
--���ջ�ִ�ʹ���
if exists(select name from sysobjects where name='t_sxhzsds')
	drop table t_sxhzsds
go
create table [dbo].[t_sxhzsds] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	-- ����
	[c_companyid] int not null,	-- ���չ�˾
	[c_bd] [char] (30)  not null ,	-- ���� 
	[c_date] [char] (8)  null ,	-- ����
	[c_times] [int]  null ,		-- ����
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxhzsds on t_sxhzsds(c_companyid,c_bd)
go
--���ջ�ִ�����սᵥ
if exists(select name from sysobjects where name='t_sxhzrjd')
	drop table t_sxhzrjd
go
create table [dbo].[t_sxhzrjd] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,	-- ����
	[c_companyid] int not null,	-- ���չ�˾
	[c_bd] [char] (30)  not null ,	-- ���� 
	[c_date] [char] (8)  null ,	-- ����
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxhzrjd on t_sxhzrjd(c_companyid,c_bd)
go
--�������ڷ�Ʊ��
if exists(select name from sysobjects where name='t_sxtb_xq')
	drop table t_sxtb_xq
go
create table [dbo].[t_sxtb_xq] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- ����
	[c_companyid] int not null,		-- ���չ�˾
	[c_bd] [char] (30)  not null ,		-- ����
	[c_tbrname] [char] (30) not null ,	-- Ͷ��������	
	[c_bdnd] [int] not null ,		-- �������
	[c_code] [char] (30)  null ,		-- ��Ʊ����
	[c_fprq] [char] (8)  null ,		-- ��Ʊ���� 	
	[c_productid] [int] not null , 		-- ��Ʒ����id		
	[c_bxf] [decimal](15,2) null , 		-- ���շ�  	
	[c_bxfr1] [decimal](7,3) null ,		-- �������
	[c_bxfr2] [decimal](7,3) null ,		-- ֧������
	[c_bxfy1] [decimal](15,3) null ,	-- ����
	[c_bxfy2] [decimal](15,3) null ,	-- ֧�� 
	[c_check] [char] (8)  null ,		-- ��������
	[c_solve] [char] (8)  null ,		-- ��������
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_sxtb_xq on t_sxtb_xq(c_companyid,c_bd,c_bdnd,c_productid)
go 
--���������
if exists(select name from sysobjects where name='t_sxlp')
	drop table t_sxlp
go
create table [dbo].[t_sxlp] ( 
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- ����
	[c_companyid] int not null,		-- ���չ�˾
	[c_bd] [char] (30)  not null ,		-- ����
	[c_tbrname] [char] (30) not null ,	-- Ͷ��������
	[c_barq] [char] (8)  null ,		-- ��������
	[c_basm] [varchar] (1000)  null ,	-- ����˵��	
	[c_jarq] [char] (8)  null ,		-- �᰸����
	[c_jasm] [varchar] (1000)  null ,	-- �᰸˵��	
	[c_jajg] [int]  null ,			-- �᰸��� 1 ���� 2 ����
	[c_je] [decimal](15, 2) null ,		-- �⸶���
	[c_bdzt] [char] (10)  null ,		-- ����״̬ zz ��ֹ 0 ����	
	[c_jobnm] [char] (10)  null ,		-- ������ba  �᰸: ja
	[c_operator] [char] (10)   null ,
	[c_datime] [datetime] default getdate()  null ,
	[c_ip] [char] (25)  null  
)  on [primary]
go 
create unique index i_sxlp on t_sxlp(c_companyid,c_bd,c_barq) 
go 
