--���ձ�����Ϣ��
if exists(select name from sysobjects where name='t_cxbd')
	drop table t_cxbd
go
create table [dbo].[t_cxbd] (
	[c_no] [int] identity (1, 1) not null ,	
	[c_orgid] [int] not null ,		-- ����
	[c_companyid] int not null,		-- ���չ�˾ 
	[c_bd] [char] (30)  null ,		-- ������
	[c_productid] [int] not null , 		-- ��Ʒ����id	 
	[c_bxf] [decimal](15,2) null , 		-- ���շ� 
	[c_ccs] [decimal](15,2) null , 		-- ����˰ 
	[c_bxfr1] [decimal](7,3) null ,		-- �������
	[c_bxfr2] [decimal](7,3) null ,		-- ֧������
	[c_ccsr1] [decimal](7,3) null ,		-- ����˰�������
	[c_ccsr2] [decimal](7,3) null ,		-- ����˰֧������
	[c_bxfy1] [decimal](15,3) null ,	-- ����
	[c_bxfy2] [decimal](15,3) null ,	-- ֧�� 
	[c_ccsy1] [decimal](15,3) null ,	-- ����˰����
	[c_ccsy2] [decimal](15,3) null ,	-- ����˰֧�� 
	[c_check] [char] (8)  null ,		-- ��������
	[c_solve] [char] (8)  null ,		-- ��������
	[c_platenumber] [char] (30)  null ,    	-- ���ƺ�
	[c_hisnumber] [char] (30) null ,	-- ���ݺ�
	[c_customer] [char] (20)  not null ,	-- ������������
	[c_cardtype] [char] (4)  null ,		-- ֤������
	[c_cardnum] [char] (40)  not null ,	-- ֤������  
	[c_lrrq] [char] (8)  null , 		-- ǩ������
	[c_cbrq] [char] (8)  null , 		-- ������	
	[c_jobnumber] [char] (10) null ,	-- �����˹���	
	[c_usageid] [int] null ,		-- ʹ������	
	[c_pay] [int] null ,			-- ���ʽ: 1���ÿ�ˢ�� 2ת�� 3�ֽ�	
	[c_fpserial] [char] (100) null ,	-- ��Ʊ��ˮ��	
	[c_dzserial] [char] (100) null ,	-- ��֤��ˮ��	
	[c_orgid_sq] [int] null ,		-- ����id  
	[c_system_sq] [int] null ,		-- ������ϵ  
	[c_flag] [char] (1) default '0' null ,
	[c_jobnm] [char] (10)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
create unique index i_cxbd2 on t_cxbd(c_companyid,c_bd)
go
--���ձ����սᵥ
if exists(select name from sysobjects where name='t_cxbdrjd')
	drop table t_cxbdrjd
go
create table [dbo].[t_cxbdrjd] (
	[c_no] [int] identity (1, 1) not null ,
	[c_orgid] [int] not null ,		-- ����
	[c_companyid] int  null,		-- ���չ�˾
	[c_bd] [char] (30)  null ,		-- ����	
	[c_customer] [char] (20)  null ,	-- ������������
	[c_bxf] [decimal](15,2) null , 		-- ���շ�      
	[c_jobnumber] [char] (10) null ,	-- ����	 
	[c_date] [char] (8)  null ,		-- ����
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go
create unique index i_cxbdrjd on t_cxbdrjd(c_companyid,c_bd)
go 

