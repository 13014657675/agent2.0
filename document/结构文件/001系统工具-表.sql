--1�������ִ����־��
if exists(select name from sysobjects where name='t_sqlrecord')
	drop table t_sqlrecord
go
create table [dbo].[t_sqlrecord] (
	[c_no] [int] identity (1, 1) not null ,
	[c_str] char(100) null ,
	[c_sql] [varchar] (2000)  null ,
	[c_operator] char(10)  null ,
	[c_datime] [datetime] default getdate() null ,
	[c_ip] [char] (25)  null 
) on [primary]
go 
--2�̶����ƴ���� 10������ò��11���塢13ѧ����14֤����15���С�16Ѫ�͡�30���չ�˾��50 �ɷѷ�ʽ ��
if exists(select name from sysobjects where name='t_namecode')
	drop table t_namecode
go
create table [dbo].[t_namecode] (
	[c_no] [int] identity (1, 1) not null ,
	[c_type] [int] not null  ,
	[c_code] [int] not null unique,
	[c_name] [char] (50)  null 
) on [primary]
go 
insert t_namecode(c_type,c_code,c_name)  values(10,1001,'��Ա')
go 
insert t_namecode(c_type,c_code,c_name)  values(10,1002,'��Ա')
go 
insert t_namecode(c_type,c_code,c_name)  values(10,1003,'Ⱥ��')
go
insert t_namecode(c_type,c_code,c_name)  values(11,1101,'����')
go 
insert t_namecode(c_type,c_code,c_name)  values(11,1102,'����')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1301,'Сѧ')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1302,'����')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1303,'����')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1304,'��ר')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1305,'��ר')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1306,'����')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1307,'˶ʿ')
go 
insert t_namecode(c_type,c_code,c_name)  values(13,1308,'��ʿ')
go 
insert t_namecode(c_type,c_code,c_name)  values(14,1401,'���֤')
go
insert t_namecode(c_type,c_code,c_name)  values(14,1402,'���ڱ�') 
go
insert t_namecode(c_type,c_code,c_name)  values(14,1403,'����')
go  
insert t_namecode(c_type,c_code,c_name)  values(15,1501,'��������')
go 
insert t_namecode(c_type,c_code,c_name)  values(15,1502,'��������')
go 
insert t_namecode(c_type,c_code,c_name)  values(15,1503,'�㷢����')
go 
insert t_namecode(c_type,c_code,c_name)  values(15,1504,'ũҵ����')
go 
insert t_namecode(c_type,c_code,c_name)  values(15,1505,'��ͨ����')
go 
insert t_namecode(c_type,c_code,c_name)  values(15,1506,'��������')
go
insert t_namecode(c_type,c_code,c_name)  values(15,1507,'�й�����')
go
insert t_namecode(c_type,c_code,c_name)  values(15,1508,'�������')
go
insert t_namecode(c_type,c_code,c_name)  values(15,1509,'��ҵ����')
go
insert t_namecode(c_type,c_code,c_name)  values(15,1510,'��������')
go
insert t_namecode(c_type,c_code,c_name)  values(15,1530,'ũ��������')
go
insert t_namecode(c_type,c_code,c_name)  values(16,1601,'O��')
go
insert t_namecode(c_type,c_code,c_name)  values(16,1602,'A��')
go
insert t_namecode(c_type,c_code,c_name)  values(16,1603,'B��')
go
insert t_namecode(c_type,c_code,c_name)  values(16,1604,'AB��')
go
insert t_namecode(c_type,c_code,c_name)  values(16,1605,'����')
go
insert t_namecode(c_type,c_code,c_name)  values(30,3001,'����')
go
insert t_namecode(c_type,c_code,c_name)  values(30,3002,'����')
go 
insert t_namecode(c_type,c_code,c_name)  values(50,5001,'����')
go
insert t_namecode(c_type,c_code,c_name)  values(50,5002,'���')
go
insert t_namecode(c_type,c_code,c_name)  values(50,5003,'�����')
go
insert t_namecode(c_type,c_code,c_name)  values(50,5004,'����')
go
insert t_namecode(c_type,c_code,c_name)  values(50,5005,'�½�')
go
--������
if exists(select name from sysobjects where name='tb_param')
	drop table tb_param
go
create table [dbo].[tb_param] (
	[c_no] [int] identity (1, 1) not null ,
	[c_pid] [int] null ,	
	[c_type] [int] null ,	--1 �ַ� 2 ��ֵ
	[c_name] [char] (50) null unique 	 
) on [primary]
go
--���ͱ�
if exists(select name from sysobjects where name='tb_projectclass')
	drop table tb_projectclass
go
create table [dbo].[tb_projectclass] (
	[c_no] [int] identity (1, 1) not null ,
	[c_name] [char] (50) null unique , 	 
	[c_o] [int] null 	
) on [primary]
go
--������
if exists(select name from sysobjects where name='tb_function')
	drop table tb_function
go
create table [dbo].[tb_function] (
	[c_no] [int] identity (1, 1) not null ,
	[c_projectclass] [int] null ,		--����	
	[c_fid] [int] null ,	
	[c_name] [char] (50) null unique ,
	[c_proc] [char] (30) null unique	 
) on [primary]
go
--����������
if exists(select name from sysobjects where name='tb_fparam')
	drop table tb_fparam
go
create table [dbo].[tb_fparam] (
	[c_no] [int] identity (1, 1) not null , 
	[c_fid] [int] not null ,
	[c_order] [int] null ,
	[c_xid] [int] null	 
) on [primary]
go
create unique index i_fparam on tb_fparam(c_fid,c_xid)
go
--��ϱ�
if exists(select name from sysobjects where name='tb_combination')
	drop table tb_combination
go
create table [dbo].[tb_combination] (
	[c_no] [int] identity (3000, 1) not null ,
	[c_projectclass] [int] null ,		--����	
	[c_cid] [int] not null ,
	[c_name] [char] (150) null unique,
	[c_t1] [int]  null , --1 ��ַ 2����
	[c_o1] [int]  null , --��ַ
	[c_x1] [decimal](12,2) null , --����
	[c_op] [int]  null , --1 �� 2 �� 3 �� 4 �� 
	[c_t2] [int]  null , --1 ��ַ 2����
	[c_o2] [int]  null ,
	[c_x2] [decimal](12,2) null  --����
) on [primary]
go 
-- ��ϲ�����
if exists(select name from sysobjects where name='tb_cparam')
	drop table tb_cparam
go
create table [dbo].[tb_cparam] (
	[c_no] [int] identity (1, 1) not null ,
	[c_cid] [int] not null ,
	[c_order] [int] null ,
	[c_xid] [int] null	 
) on [primary]
go 
create unique index i_cparam on tb_cparam(c_cid,c_xid)
go
-- ������
if exists(select name from sysobjects where name='vb_processor')
	drop view vb_processor
go
create view [dbo].[vb_processor]  
as
select c_projectclass,c_fid c_o,c_name,1 c_type from tb_function
union 
select c_projectclass,c_cid c_o,c_name,2 c_type from tb_combination  
