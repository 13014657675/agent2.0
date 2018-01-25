--��Ʒ����
if exists(select name from sysobjects where name='p_ptclass')
	drop procedure p_ptclass
go
create procedure p_ptclass
	@c_no int ,
	@c_ptnature int, 		--��Ʒ����			
	@c_name char (30)  ,  
	@c_jobnm char (10)  ,
	@c_operator char(10) ,	
	@c_ip char (25)   
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_ptclass
		(  
			c_ptnature,
			c_name,  
			c_jobnm,
			c_operator,
			c_ip
		)
		values
		(  
			@c_ptnature,
			@c_name,  
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_ptclass set c_ptnature=@c_ptnature,
				c_name=@c_name,
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_ptclass  where c_no=@c_no
	end 
return 0
go
--��Ʒ����
if exists(select name from sysobjects where name='p_pttype')
	drop procedure p_pttype
go
create procedure p_pttype
	@c_no int ,
	@c_ptclassid int , 		--��Ʒ����			
	@c_name char (30)  ,  
	@c_jobnm char (10)  ,
	@c_operator char(10) ,	
	@c_ip char (25)   
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_pttype
		(  
			c_ptclassid,
			c_name,  
			c_jobnm,
			c_operator,
			c_ip
		)
		values
		(  
			@c_ptclassid,
			@c_name,  
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_pttype set c_ptclassid=@c_ptclassid, 
				c_name=@c_name,
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_pttype  where c_no=@c_no
	end 
return 0
go
--��Ʒ
if exists(select name from sysobjects where name='p_product')
	drop procedure p_product
go
create procedure p_product
	@c_no int ,	
	@c_companyid int , 	--��˾	
	@c_ptnature int ,	--��Ʒ����
	@c_ptclassid int ,	--��Ʒ����
	@c_pttypeid int , 	--��Ʒ����			
	@c_code char (30) ,  
	@c_fullname char (50),  
	@c_name char (30) ,  
	@c_type int , 
	@c_flag char (1) ,
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_product
		(  
			c_companyid, 	--��˾	
			c_ptnature,	--��Ʒ����
			c_ptclassid,	--��Ʒ����
			c_pttypeid, 	--��Ʒ����			
			c_code,  
			c_fullname,  
			c_name,  
			c_type,
			c_jobnm,
			c_operator,
			c_ip 
		)
		values
		(  
			@c_companyid, 	--��˾	
			@c_ptnature,	--��Ʒ����
			@c_ptclassid,	--��Ʒ����
			@c_pttypeid, 	--��Ʒ����			
			@c_code,  
			@c_fullname,  
			@c_name,  
			@c_type,
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_product set c_ptnature=@c_ptnature,	--��Ʒ����
				c_ptclassid=@c_ptclassid,	--��Ʒ���� 
				c_pttypeid=@c_pttypeid, 	--��Ʒ����	
				c_companyid=@c_companyid,	--���չ�˾		
				c_code=@c_code,  
				c_fullname=@c_fullname,   
				c_name=@c_name, 
				c_type=@c_type,
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_no=@c_no
	end
	if @c_jobnm='set'
	begin
		update t_product set c_flag=@c_flag,		--��Ч��־
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_no=@c_no
		update t_pcomponent set c_flag=@c_flag,		--��Ч��־
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_productid=@c_no	
	end
	if @c_jobnm='del'
	begin
		delete t_product  where c_no=@c_no
		delete t_pcomponent where c_productid=@c_no	
	end 
return 0
go
--��Ʒ���
if exists(select name from sysobjects where name='p_pcomponent')
	drop procedure p_pcomponent
go
create procedure p_pcomponent 	
	@c_no int ,	
	@c_companyid int , 	--��˾	
	@c_productid int , 	--��Ʒid			
	@c_pcode char (30) ,  
	@c_pfullname char (50),  
	@c_pname char (30) ,  
	@c_ptype int ,  
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		if not exists(select * from t_product where c_companyid=@c_companyid and c_no=@c_productid)
		begin
			raiserror ('���֣�%d ��Ч��', 16, 1, @c_productid)
			return @@error
		end
		insert  t_pcomponent
		(  
			c_companyid, 	--��˾	
			c_productid, 	--��Ʒ����			
			c_pcode,  
			c_pfullname,  
			c_pname,  
			c_ptype,
			c_jobnm,
			c_operator,
			c_ip 
		)
		values
		(  
			@c_companyid, 	--��˾	
			@c_productid, 	--��Ʒ����			
			@c_pcode,  
			@c_pfullname,  
			@c_pname,  
			@c_ptype,
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end  
	if @c_jobnm='del'
	begin
		delete t_pcomponent  where c_no=@c_no
	end 
return 0
go
--��Ʒ����
if exists(select name from sysobjects where name='p_ptrate')
	drop procedure p_ptrate
go
create procedure p_ptrate
	@c_no int ,
	@c_companyid int , 	--��˾id	
	@c_productid int , 	--��Ʒid	 			 
	@c_type char (1) , 	--1�����ݱ��������� 2�����ݱ���������
	@c_base decimal(9, 2),	--����	
	@c_bxqlx char (1)  ,	--0������ 1����ֹ���� 2����n��
	@c_bxq int ,		--������
	@c_jfqlx char (1) ,    	--0������ 1����ֹ���� 2����n��
	@c_jfq int  ,		--�ɷ��� 
	@c_age int  ,		--����
	@c_male decimal(10, 4)  ,--�з���
	@c_female decimal(10, 4),--Ů����	 
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)   
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		 
		insert  t_ptrate
		(  
			c_companyid , 	--��˾id	
			c_productid , 	--��Ʒid	 
			c_type , 	--1�����ݱ��������� 2�����ݱ���������
			c_base ,	--����	
			c_bxqlx ,	--0������ 1����ֹ���� 2����n��
			c_bxq ,		--������
			c_jfqlx ,    	--1����ֹ���� 2����n��
			c_jfq ,		--�ɷ��� 
			c_age ,		--����
			c_male ,	--�з���
			c_female ,	--Ů����	 
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(  
			@c_companyid , 	--��˾id	
			@c_productid , 	--��Ʒid	  
			@c_type , 	--1�����ݱ��������� 2�����ݱ���������
			@c_base ,	--����	
			@c_bxqlx ,	--0������ 1����ֹ���� 2����n��
			@c_bxq ,		--������
			@c_jfqlx ,    	--1����ֹ���� 2����n��
			@c_jfq ,	--�ɷ��� 
			@c_age ,	--����
			@c_male ,	--�з���
			@c_female ,	--Ů����	 
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_ptrate set c_type=@c_type , 	--1�����ݱ��������� 2�����ݱ���������
				c_base=@c_base ,	--����	
				c_bxqlx=@c_bxqlx ,	--0������ 1����ֹ���� 2����n��
				c_bxq=@c_bxq ,		--������
				c_jfqlx=@c_jfqlx ,    	--1����ֹ���� 2����n��
				c_jfq=@c_jfq ,		--�ɷ��� 
				c_age=@c_age ,		--����
				c_male=@c_male ,	--�з���
				c_female=@c_female ,	--Ů����
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_ptrate  where c_no=@c_no
	end 
return 0
go
--��Ʒϵ��
if exists(select name from sysobjects where name='p_ptconvert')
	drop procedure p_ptconvert
go
create procedure p_ptconvert
	@c_no int ,
	@c_companyid int , 	--��˾id	
	@c_productid int , 	--��Ʒid 
	@c_convertT int ,	--����  	 
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
		insert  t_ptconvert
		(   
			c_companyid , 	--��˾id	
			c_productid , 	--��Ʒid	
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
			@c_productid , 	--��Ʒid	
			@c_convertT ,  
			@c_jfqx ,		--�ɷ���	
			@c_dec ,		--ϵ��	 
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_ptconvert set 	c_companyid=@c_companyid , 	--��˾id	
				c_productid=@c_productid , 	--��Ʒid
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
		delete t_ptconvert  where c_no=@c_no
	end 
return 0
go
--��������
if exists(select name from sysobjects where name='p_pliability')
	drop procedure p_pliability
go
create procedure p_pliability
	@c_no int ,
	@c_companyid int , 	--��˾id	
	@c_productid int , 	--��Ʒid 	
	@c_pname char (60) , 	--������������
	@c_pdesc varchar(3000),	--������������
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 	  	
		insert  t_pliability
		(   
			c_companyid , 	--��˾id	
			c_productid , 	--��Ʒid	 
			c_pname , 	--������������
			c_pdesc ,	--������������	 
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(  
			@c_companyid , 	--��˾id	
			@c_productid , 	--��Ʒid	 
			@c_pname , 	--������������
			@c_pdesc ,	--������������	 
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_pliability set 	  
			c_pname=@c_pname , 	--������������
			c_pdesc=@c_pdesc ,	--������������	 
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,
			c_datime=@c_datime ,
			c_ip=@c_ip 
		where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_pliability  where c_no=@c_no
	end 
return 0
go
--�������β�������
if exists(select name from sysobjects where name='p_pliabilityc')
	drop procedure p_pliabilityc
go
create procedure p_pliabilityc   
	@c_companyid int ,	-- ���չ�˾
	@c_productid int , 	-- ��Ʒid 
	@c_name char (30) ,	-- ��������	
	@c_jobnm char (10), 
	@c_operator char(10) , 
	@c_ip char (25)   	
as
declare	@c_no_temp int ,
	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate() 
	if @c_jobnm='add'
	begin 	
		if not exists(select * from t_pliabilityc)
		begin
			set @c_no_temp=101
		end
		else
		begin
			select @c_no_temp=max(c_no)+1 from t_pliabilityc
		end
		insert  t_pliabilityc
		(     			
			c_no,
			c_companyid , 	--��˾id	
			c_productid , 	--��Ʒid	 		
			c_name ,	--��������			
			c_jobnm , 
			c_operator , 
			c_ip    	
		)
		values
		(   
			@c_no_temp ,
			@c_companyid  ,	-- ���չ�˾
			@c_productid  , -- ��Ʒ����id	  
			@c_name ,	-- ��������		
			@c_jobnm , 
			@c_operator , 
			@c_ip    	
		)    
		select @c_no_temp
	end	 
return 0
go 
--�������β�������ֵ
if exists(select name from sysobjects where name='p_pliabilitycv')
	drop procedure p_pliabilitycv
go
create procedure p_pliabilitycv  
	@c_companyid int ,	-- ���չ�˾
	@c_productid int , 	-- id 	
	@c_pliabilitycid int ,
	@c_bxqtype int ,	-- �����ڼ����� 0 ���� 1 ��*�� 2 ����*��
	@c_bxq int ,		-- �����ڼ� 
	@c_jfqtype int ,	-- �����ڼ����� 0 ���� 1 ��*�� 2 ����*��
	@c_jfq int ,		-- �����ڼ� 
	@c_t int , 		--1 ������� 2 ����������
	@c_v int , 		--��������	
	@c_jobnm char (10), 
	@c_operator char(10) , 
	@c_ip char (25)   	
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate() 
	if @c_jobnm='add'
	begin 
		insert  t_pliabilitycv
		(     			
			c_companyid  ,	-- ���չ�˾
			c_productid  , 	-- ��Ʒ����id	  
			c_pliabilitycid  ,	 
			c_bxqtype  ,	-- �����ڼ����� 0 ���� 1 ��*�� 2 ����*��
			c_bxq  ,	-- �����ڼ� 
			c_jfqtype  ,	-- �����ڼ����� 0 ���� 1 ��*�� 2 ����*��
			c_jfq  ,	-- �����ڼ�			
			c_t  , 		--1 ������� 2 ����������
			c_v  , 		--��������		
			c_jobnm , 
			c_operator , 
			c_ip    	
		)
		values
		(   
			@c_companyid  ,	-- ���չ�˾
			@c_productid  , -- ��Ʒ����id	 	 
			@c_pliabilitycid  ,	 
			@c_bxqtype  ,	-- �����ڼ����� 0 ���� 1 ��*�� 2 ����*��
			@c_bxq  ,	-- �����ڼ� 
			@c_jfqtype  ,	-- �����ڼ����� 0 ���� 1 ��*�� 2 ����*��
			@c_jfq  ,	-- �����ڼ�			
			@c_t  , 	--1 ������� 2 ����������
			@c_v  , 	--��������		
			@c_jobnm , 
			@c_operator , 
			@c_ip    	
		)    
	end		 
return 0
go 
--�������νṹ
if exists(select name from sysobjects where name='p_pliabilitys')
	drop procedure p_pliabilitys
go
create procedure p_pliabilitys 
	@c_companyid int ,	-- ���չ�˾
	@c_productid int , 	-- ��Ʒid 	 
	@c_pname char(50) , 	--��Ŀ����		  
	@c_condition int , 	--�������� --1 ȫ�� 2 ���� 3 ����
	@c_cv2t int , 		--1 ������� 2 ����������
	@c_cv2 int , 		--�������� 
	@c_cv31t int , 		--1 ������� 2 ����������
	@c_cv31 int , 		--���俪ʼ���� 
	@c_cv32t int , 		--1 ������� 2 ����������
	@c_cv32 int , 		--����������� 
	@c_result int , 	--�⸶���� 0 ��ֵ 1 �������� 2 �ۼƱ��� 
	@c_rv decimal(15, 4) ,	--��ֵ	   	  
	@c_jobnm char (10) ,
	@c_operator char(10) , 
	@c_ip char (25)  
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_pliabilitys
		(    
			c_companyid  ,		-- ���չ�˾
			c_productid  , 		-- ��Ʒ����id	 
			c_pname  , 		--��Ŀ����		  
			c_condition  , 		--�������� --1 ȫ�� 2 ���� 3 ����
			c_cv2t  , 		--1 ������� 2 ����������
			c_cv2  , 		--�������� 
			c_cv31t  , 		--1 ������� 2 ����������
			c_cv31  , 		--���俪ʼ���� 
			c_cv32t  , 		--1 ������� 2 ����������
			c_cv32  , 		--����������� 
			c_result  , 		--�⸶���� 0 ��ֵ 1 �������� 2 �ۼƱ��� 
			c_rv ,	 		--��ֵ	  
			c_jobnm ,
			c_operator , 
			c_ip   
		)
		values
		(  
			@c_companyid  ,		-- ���չ�˾
			@c_productid  , 	-- ��Ʒ����id 
			@c_pname  , 		--��Ŀ����	  
			@c_condition  , 	--�������� --1 ȫ�� 2 ���� 3 ����
			@c_cv2t  , 		--1 ������� 2 ����������
			@c_cv2  , 		--�������� 
			@c_cv31t  , 		--1 ������� 2 ����������
			@c_cv31  , 		--���俪ʼ���� 
			@c_cv32t  , 		--1 ������� 2 ����������
			@c_cv32  , 		--����������� 
			@c_result  , 		--�⸶���� 0 ��ֵ 1 �������� 2 �ۼƱ��� 
			@c_rv ,	 		--��ֵ	    
			@c_jobnm ,
			@c_operator , 
			@c_ip   
		)
	end  
return 0
go
