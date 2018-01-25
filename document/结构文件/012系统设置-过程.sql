--��������
if exists(select name from sysobjects where name='p_orgtype')
	drop procedure p_orgtype
go
create procedure p_orgtype
	@c_no int ,
	@c_order int , 			--˳��
	@c_mark int ,
	@c_name char (30)   ,  
	@c_jobnm char (10)   ,
	@c_operator char(10) ,	
	@c_ip char (25)   
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_orgtype
		(  
			c_name,  
			c_jobnm,
			c_operator,
			c_ip
		)
		values
		(  
			@c_name,  
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_orgtype set c_name=@c_name,
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,
			c_datime=@c_datime,
			c_ip=@c_ip  
			where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_orgtype  where c_no=@c_no
	end
	if @c_jobnm='order'
	begin 		
		update t_orgtype set c_order=@c_order
			where c_no=@c_no
	end 
	if @c_jobnm='mark'
	begin 		
		update t_orgtype set c_mark=@c_mark
			where c_no=@c_no
	end 
return 0
go
--�����ȼ�
if exists(select name from sysobjects where name='p_orgclass')
	drop procedure p_orgclass
go
create procedure p_orgclass
	@c_no int , 
	@c_name char (30)   ,  
	@c_jobnm char (10)   ,
	@c_operator char(10) ,	
	@c_ip char (25)   
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_orgclass
		(  
			c_name,  
			c_jobnm,
			c_operator,
			c_ip
		)
		values
		(  
			@c_name,  
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_orgclass set c_name=@c_name,
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime,
				c_ip=@c_ip   
			where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_orgclass  where c_no=@c_no
	end 
return 0
go
--����
if exists(select name from sysobjects where name='p_organization')
	drop procedure p_organization
go
create procedure p_organization 
	@c_no int ,
	@c_orgtypeid int ,
	@c_orgclassid int ,
	@c_name char (50) , 
	@c_prefix char (2) , 
	@c_parent int ,			--������ID		
	@c_deptid int ,			--����������ID
	@c_license char (50) ,		--����Ӫҵִ�ձ��
	@c_lbeg char (8) ,		--����Ӫҵִ�ձ����Ч��ʼʱ��
	@c_lend char (8) ,		--����Ӫҵִ�ձ����Ч����ʱ��
	@c_permit char (50) ,		--��ҵ��Ӫ���֤��
	@c_pbeg char (8) ,		--��ҵ��Ӫ���֤����Ч��ʼʱ��
	@c_pend char (8) ,		--��ҵ��Ӫ���֤����Ч����ʱ��	
	@c_tax char (50) ,		--˰��Ǽ�֤��
	@c_organization char (50) ,	--��֯��������
	@c_jobnumber char (10) ,	--�����˹���	 
	@c_seal char (1) ,		--0 ��׭�̹��� 1 δ׭�̹���
	@c_slocation char (50) ,	--���´�ŵ�ַ	
	@c_bbank int  ,			--����������
	@c_bcard char (50) ,		--�������˺�
	@c_gbank1 int ,			--һ�㻧1����
	@c_gcard1 char (50) ,		--һ�㻧1�˺�
	@c_gbank2 int ,			--һ�㻧2����
	@c_gcard2 char (50) ,		--һ�㻧2�˺�	
	@c_phone char (20) ,		--�绰
	@c_address char (100) ,		--��ַ
	@c_flag char (1) ,
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as
declare	@c_count int ,  
	@c_order int ,  
	@c_path char (14) ,  
	@c_path_temp char (14) ,  
	@c_temp varchar (15) ,  
	@c_datime datetime	--����ʱ��  
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 
		select @c_order=c_order from t_orgtype where c_no = @c_orgtypeid 
		if @c_order=1
		begin 
			select @c_count=count(*) from t_organization where c_parent = @c_parent 	
			set @c_path=str(10+@c_count,2)+'000000000000'
		end
		else
		begin 
			select @c_count=count(*) from t_organization where c_parent = @c_parent 
			select @c_path_temp=c_path from t_organization where c_no = @c_parent 			
			set @c_path=left(@c_path_temp,(@c_order-1)*2)+str(10+@c_count,2)+right(@c_path_temp,(7-@c_order)*2)
		end				
		insert  t_organization 
		(
			c_orgtypeid ,
			c_orgclassid ,
			c_name , 
			c_prefix,
			c_path , 
			c_parent ,	
			c_deptid ,	
			c_license ,		--����Ӫҵִ�ձ��
			c_lbeg ,		--����Ӫҵִ�ձ����Ч��ʼʱ��
			c_lend ,		--����Ӫҵִ�ձ����Ч����ʱ��
			c_permit ,		--��ҵ��Ӫ���֤��
			c_pbeg ,		--��ҵ��Ӫ���֤����Ч��ʼʱ��
			c_pend ,		--��ҵ��Ӫ���֤����Ч����ʱ��	
			c_tax ,			--˰��Ǽ�֤��
			c_organization ,	--��֯��������
			c_jobnumber ,		--�����˹���
			c_seal ,		--0 ��׭�̹��� 1 δ׭�̹���
			c_slocation ,		--���´�ŵ�ַ	
			c_bbank  ,		--����������
			c_bcard  ,		--�������˺�
			c_gbank1 ,		--һ�㻧1����
			c_gcard1 ,		--һ�㻧1�˺�
			c_gbank2 ,		--һ�㻧2����
			c_gcard2 ,		--һ�㻧2�˺�	
			c_phone ,		--�绰
			c_address ,		--��ַ 
			c_jobnm ,
			c_operator , 
			c_ip  
		)
		values
		(
			@c_orgtypeid ,
			@c_orgclassid ,
			@c_name , 
			@c_prefix ,
			@c_path , 
			@c_parent ,	
			@c_deptid ,	
			@c_license ,		--����Ӫҵִ�ձ��
			@c_lbeg ,		--����Ӫҵִ�ձ����Ч��ʼʱ��
			@c_lend ,		--����Ӫҵִ�ձ����Ч����ʱ��
			@c_permit ,		--��ҵ��Ӫ���֤��
			@c_pbeg ,		--��ҵ��Ӫ���֤����Ч��ʼʱ��
			@c_pend ,		--��ҵ��Ӫ���֤����Ч����ʱ��	
			@c_tax ,		--˰��Ǽ�֤��
			@c_organization ,	--��֯��������
			@c_jobnumber ,		--�����˹���
			@c_seal ,		--0 ��׭�̹��� 1 δ׭�̹���
			@c_slocation ,		--���´�ŵ�ַ	
			@c_bbank  ,		--����������
			@c_bcard  ,		--�������˺�
			@c_gbank1 ,		--һ�㻧1����
			@c_gcard1 ,		--һ�㻧1�˺�
			@c_gbank2 ,		--һ�㻧2����
			@c_gcard2 ,		--һ�㻧2�˺�	
			@c_phone ,		--�绰
			@c_address ,		--��ַ 
			@c_jobnm ,
			@c_operator , 
			@c_ip  
		)
	end 
	if @c_jobnm='update'
	begin
		update t_organization
			set c_name=@c_name , 	
				c_prefix=@c_prefix ,			 
				c_license=@c_license ,		--����Ӫҵִ�ձ��
				c_lbeg=@c_lbeg ,		--����Ӫҵִ�ձ����Ч��ʼʱ��
				c_lend=@c_lend ,		--����Ӫҵִ�ձ����Ч����ʱ��
				c_permit=@c_permit ,		--��ҵ��Ӫ���֤��
				c_pbeg=@c_pbeg ,		--��ҵ��Ӫ���֤����Ч��ʼʱ��
				c_pend=@c_pend ,		--��ҵ��Ӫ���֤����Ч����ʱ��	
				c_tax=@c_tax ,			--˰��Ǽ�֤��
				c_organization=@c_organization ,--��֯��������
				c_jobnumber=@c_jobnumber ,	--�����˹���
				c_seal=@c_seal ,		--0 ��׭�̹��� 1 δ׭�̹���
				c_slocation=@c_slocation ,	--���´�ŵ�ַ	
				c_bbank=@c_bbank  ,		--����������
				c_bcard=@c_bcard  ,		--�������˺�
				c_gbank1=@c_gbank1 ,		--һ�㻧1����
				c_gcard1=@c_gcard1 ,		--һ�㻧1�˺�
				c_gbank2=@c_gbank2 ,		--һ�㻧2����
				c_gcard2=@c_gcard2 ,		--һ�㻧2�˺�	
				c_phone=@c_phone ,		--�绰
				c_address=@c_address ,		--��ַ 
				c_jobnm=@c_jobnm ,
				c_operator=@c_operator , 
				c_datime=@c_datime,
				c_ip=@c_ip  
			where c_no=@c_no
	end 
	if @c_jobnm='switch'
	begin
		select @c_order=c_order from t_orgtype where c_no = @c_orgtypeid 
	 	select @c_temp=left(c_path,@c_order*2)+'%' from t_organization where c_no=@c_no		
		update t_organization set c_flag=@c_flag,c_jobnm=@c_jobnm
			where c_path like @c_temp
	end 
	if @c_jobnm='del'
	begin
		select @c_order=c_order from t_orgtype where c_no = @c_orgtypeid 
	 	select @c_temp=left(c_path,@c_order*2)+'%' from t_organization where c_no=@c_no	 	
		delete t_organization  
			where c_path like @c_temp
	end
return 0
go
--����	
if exists(select name from sysobjects where name='p_dept')
	drop procedure p_dept
go	
create procedure p_dept
	@c_no int,
	@c_orgid int,	
	@c_name char (30),  
	@c_ptnature int , 	--����	
	@c_system  int ,	--������ϵ	
	@c_jobnm char (10),
	@c_operator char(10) ,	
	@c_ip char (25)
as 
declare	@c_datime	datetime	--����ʱ��  
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin			
		if not exists ( select * from t_organization where c_no =@c_orgid )
		begin
			raiserror ('������Ч��', 16, 1)
			return @@error
		end	
		insert  t_dept
		(
			c_orgid, 
			c_name,  
			c_ptnature,
			c_system,
			c_jobnm,
			c_operator,
			c_ip
		)
		values
		(
			@c_orgid, 
			@c_name,  
			@c_ptnature,
			@c_system,
			@c_jobnm,
			@c_operator,
			@c_ip
		)
	end	 
	if @c_jobnm='update'
	begin
		update t_dept set c_name=@c_name,
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_dept 	where c_no=@c_no
	end
return 0		
go
--ְλ��λ
if exists(select name from sysobjects where name='p_post')
	drop procedure p_post
go	 		
create procedure p_post
	@c_no int ,
	@c_orgid int, 
	@c_deptid int, 	
	@c_type int, 	
	@c_name char (30), 	
	@c_jobnm char (10),
	@c_operator char(10) ,	
	@c_ip char (25)
as 
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 	 
		if not exists ( select * from t_dept where c_no =@c_deptid and c_orgid=@c_orgid )
		begin
			raiserror ('������Ч��', 16, 1)
			return @@error
		end
		insert  t_post 
		(
			c_orgid,
			c_deptid,  
			c_type,
			c_name, 
			c_jobnm,
			c_operator,
			c_ip 
		)
		values
		(
			@c_orgid,
			@c_deptid,  
			@c_type,
			@c_name, 
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_post set  c_type=@c_type,
				c_name=@c_name,
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_post  where c_no=@c_no
	end
return 0
go
--���ų�����
if exists(select name from sysobjects where name='p_sethead')
	drop procedure p_sethead
go	 		
create procedure p_sethead 
	@c_orgid int, 
	@c_deptid int, 	
	@c_postid int, 		 
	@c_jobnm char (10),
	@c_operator char(10) ,	
	@c_ip char (25)
as 
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='sethead'
	begin
		update t_post set c_ishead='1'
			where c_orgid=@c_orgid and c_deptid=@c_deptid
	
		update t_post set c_ishead='0',
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_no=@c_postid
	end	 
return 0
go
--ְλ��λȨ��
if exists(select name from sysobjects where name='p_postqx')
	drop procedure p_postqx
go
create procedure p_postqx  
	@c_postid int,	 
	@c_xitong char (1),
	@c_menu varchar (2000), 
	@c_operator char(10) ,	
	@c_ip char (25)
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if not exists (select * from t_post where c_no=@c_postid )
	begin		
		raiserror ('��λ���룺%d ��Ч', 16, 1, @c_postid)
		return @@error
	end
	if not exists(select * from t_postqx where c_postid=@c_postid and c_xitong=@c_xitong )
	begin
		insert  t_postqx   	
		(	
			c_postid,	 
			c_xitong,
			c_menu, 
			c_operator,
			c_ip 
		) 
		values
		(
			@c_postid,	 
			@c_xitong,
			@c_menu, 
			@c_operator,
			@c_ip 
		)	
	end
	else
	begin
		update t_postqx set		 
			c_menu=@c_menu,  
			c_operator=@c_operator,
			c_datime=@c_datime ,
			c_ip=@c_ip 			
		where c_postid=@c_postid and c_xitong=@c_xitong
	end 	 
return 0 
go
--���չ�˾
if exists(select name from sysobjects where name='p_company')
	drop procedure p_company
go
create procedure p_company
	@c_no int ,
	@c_type int ,
	@c_fullname char (50),
	@c_name char (30),
	@c_tbdl int , --Ͷ��������
	@c_bdl int ,  --��������
	@c_addr char (50) ,
	@c_zipcode char (10) ,
	@c_phone char (15) ,
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate() 
	if @c_jobnm='add'
	begin 
		insert t_company
		(
			c_type,
			c_fullname,
			c_name,
			c_tbdl,  
			c_bdl,   
			c_addr,
			c_zipcode,
			c_phone,
			c_jobnm,
			c_operator, 
			c_ip
		)		
		values( 
			@c_type,
			@c_fullname,
			@c_name,
			@c_tbdl,  
			@c_bdl,   
			@c_addr,
			@c_zipcode,
			@c_phone,
			@c_jobnm,
			@c_operator, 
			@c_ip
		)
	end 
	if @c_jobnm='update'
	begin
		update t_company set
			c_type=@c_type,
			c_fullname=@c_fullname,
			c_name=@c_name,
			c_tbdl=@c_tbdl,  
			c_bdl=@c_bdl,   
			c_addr=@c_addr,
			c_zipcode=@c_zipcode,
			c_phone=@c_phone,
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,
			c_datime=@c_datime ,
			c_ip=@c_ip 
		where c_no=@c_no
	end 
	if @c_jobnm='del'
	begin
		delete t_company  where c_no=@c_no
	end 
return 0	
go
--ְҵ����
if exists(select name from sysobjects where name='p_occupation')
	drop procedure p_occupation
go
create procedure p_occupation
	@c_no int, 
	@c_companyid int,
	@c_code char (20),
	@c_name char (50),	 
	@c_jobnm char (10),
	@c_operator char(10) ,	
	@c_ip char (25)
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate() 
	if @c_jobnm='add'
	begin 
		insert t_occupation
		( 
			c_companyid,
			c_code,
			c_name,	 
			c_jobnm,
			c_operator, 
			c_ip
		)		
		values( 
			@c_companyid,
			@c_code,
			@c_name,	 
			@c_jobnm,
			@c_operator, 
			@c_ip
		)
	end 
	if @c_jobnm='update'
	begin
		update t_occupation set 
			c_code=@c_code,
			c_name=@c_name,	 
			c_jobnm=@c_jobnm,
			c_operator=@c_operator, 
			c_datime=@c_datime,
			c_ip=@c_ip
		where c_no=@c_no
	end 
	if @c_jobnm='del'
	begin
		delete t_occupation  where c_no=@c_no
	end 
return 0	
go
--�۱�����
if exists(select name from sysobjects where name='p_convertT')
	drop procedure p_convertT
go
create procedure p_convertT
	@c_no int ,   
	@c_name char (30) ,	--    
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_convertT
		(    	 
			c_name , 			 
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(     
			@c_name ,  
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_convertT set  c_name=@c_name , 				 	 	
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_convertT  where c_no=@c_no
	end 
return 0
go
--ϵ������
if exists(select name from sysobjects where name='p_convert')
	drop procedure p_convert
go
create procedure p_convert
	@c_no int ,
	@c_companyid int , 	--��˾id	 
	@c_convertT  int ,		--  
	@c_jfqx int ,		--�ɷ��� 
	@c_dec decimal(6, 4),	--ϵ��	
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_convert
		(   
			c_companyid , 	--��˾id 	
			c_convertT , 
			c_jfqx ,	--�ɷ���	
			c_dec ,		--ϵ��	 	
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(  
			@c_companyid , 	--��˾id 	 
			@c_convertT , 
			@c_jfqx ,	--�ɷ���	
			@c_dec ,	--ϵ��	 
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_convert set 	c_companyid=@c_companyid , 	--��˾id 
				c_convertT=@c_convertT , 
				c_jfqx=@c_jfqx ,		--�ɷ���	
				c_dec=@c_dec ,			--ϵ��	 	
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_convert  where c_no=@c_no
	end 
return 0
go
