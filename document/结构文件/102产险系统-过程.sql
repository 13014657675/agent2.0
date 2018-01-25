--���ձ�������
if exists(select name from sysobjects where name='p_cxbd')
	drop procedure p_cxbd
go
create procedure p_cxbd
	@c_no int   ,	
	@c_orgid int   ,			-- ����
	@c_companyid int  ,			-- ���չ�˾ 
	@c_bd char (30)   ,			-- ������
	@c_productid int   , 			-- ��Ʒ����id	 
	@c_bxf decimal(15,2)  , 		-- ���շ� 
	@c_ccs decimal(15,2)  , 		-- ����˰ 
	@c_platenumber char (30)   ,    	-- ���ƺ�
	@c_hisnumber char (30)  ,		-- ���ݺ�
	@c_customer char (20)    ,		-- ������������
	@c_cardtype char (4)   ,		-- ֤������
	@c_cardnum char (40)    ,		-- ֤������  
	@c_lrrq char (8)   , 			-- ǩ������
	@c_cbrq char (8)   , 			-- ������	
	@c_jobnumber char (10)  ,		-- �����˹���	
	@c_usageid int  ,			-- ʹ������	
	@c_pay int  ,				-- ���ʽ: 1���ÿ�ˢ�� 2ת�� 3�ֽ�	
	@c_fpserial char (100)  ,		-- ��Ʊ��ˮ��	
	@c_dzserial char (100)  ,		-- ��֤��ˮ��	
	@c_jobnm char (10)   ,
	@c_operator char(10)   , 
	@c_ip char (25)   
as 	  
declare @c_system_sq int,
	@c_orgid_sq int,
	@c_companyid_temp int ,
	@c_bd_temp char (30) ,	-- ������
	@c_datime datetime   
	set @c_datime=getdate()	
	if not exists (	select c_jobnumber from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null )
	begin		
		raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
		return @@error
	end
	if not exists (	select * from t_agentset where c_jobnumber=@c_jobnumber and c_system=11 and c_flag='0' )
	begin		
		raiserror ('���ţ�%s ��Ч��, ����Ӵ�����������ҵ��ѪԵ��ϵ', 16, 1, @c_jobnumber)
		return @@error
	end	
	if not (isdate(@c_lrrq)=1 and len(@c_lrrq)=8)
	begin
		raiserror ('ǩ�����ڸ�ʽ����!', 16, 1)
		return @@error
	end
	if not (isdate(@c_cbrq)=1 and len(@c_cbrq)=8)
	begin
		raiserror ('�����ڸ�ʽ����!', 16, 1)
		return @@error
	end
	if @c_lrrq > @c_cbrq
	begin
		raiserror ('ǩ�����ڲ��ܴ���������!', 16, 1)
		return @@error
	end
	select @c_orgid_sq=c_orgid,@c_system_sq=c_system from t_agentset where c_jobnumber=@c_jobnumber and c_flag='0'
	if @c_jobnm='add'
	begin  	 
		insert  t_cxbd  	
		(	 
			c_orgid ,				-- ����
			c_companyid ,				-- ���չ�˾ 
			c_bd ,					-- ������
			c_productid ,		 		-- ��Ʒ����id	 
			c_bxf ,			 		-- ���շ� 
			c_ccs ,					-- ����˰
			c_platenumber ,			    	-- ���ƺ�
			c_hisnumber  ,				-- ���ݺ�
			c_customer ,				-- ������������
			c_cardtype ,				-- ֤������
			c_cardnum ,				-- ֤������  
			c_lrrq ,		 		-- ǩ������
			c_cbrq ,		 		-- ������	
			c_jobnumber ,				-- �����˹���	
			c_usageid ,				-- ʹ������	
			c_pay ,					-- ���ʽ: 1���ÿ�ˢ�� 2ת�� 3�ֽ�	
			c_fpserial ,				-- ��Ʊ��ˮ��	
			c_dzserial ,				-- ��֤��ˮ��	
			c_orgid_sq,				-- ����
			c_system_sq ,				-- ������ϵ   
			c_jobnm ,
			c_operator ,
			c_datime ,
			c_ip  
		) 
		values
		( 
			@c_orgid ,				-- ����
			@c_companyid ,				-- ���չ�˾ 
			@c_bd ,					-- ������
			@c_productid ,		 		-- ��Ʒ����id	 
			@c_bxf ,		 		-- ���շ� 
			@c_ccs ,				-- ����˰
			@c_platenumber ,			-- ���ƺ�
			@c_hisnumber  ,				-- ���ݺ�
			@c_customer ,				-- ������������
			@c_cardtype ,				-- ֤������
			@c_cardnum ,				-- ֤������  
			@c_lrrq ,		 		-- ǩ������
			@c_cbrq ,		 		-- ������	
			@c_jobnumber ,				-- �����˹���	
			@c_usageid ,				-- ʹ������	
			@c_pay ,				-- ���ʽ: 1���ÿ�ˢ�� 2ת�� 3�ֽ�	
			@c_fpserial ,				-- ��Ʊ��ˮ��	
			@c_dzserial ,				-- ��֤��ˮ��	
			@c_orgid_sq,				-- ����
			@c_system_sq ,				-- ������ϵ   
			@c_jobnm ,
			@c_operator ,
			@c_datime ,
			@c_ip  
		)	 		
	end	
	if @c_jobnm in ('check','0')
	begin 
		update t_cxbd set 
			c_orgid=@c_orgid ,			-- ����
			c_companyid=@c_companyid ,		-- ���չ�˾ 
			c_bd=@c_bd ,				-- ������
			c_productid=@c_productid ,		-- ��Ʒ����id	 
			c_bxf=@c_bxf ,		 		-- ���շ� 
			c_ccs=@c_ccs ,				-- ����˰
			c_platenumber=@c_platenumber ,		-- ���ƺ�
			c_hisnumber=@c_hisnumber  ,		-- ���ݺ�
			c_customer=@c_customer ,		-- ������������
			c_cardtype=@c_cardtype ,		-- ֤������
			c_cardnum=@c_cardnum ,			-- ֤������  
			c_lrrq=@c_lrrq ,		 	-- ǩ������
			c_cbrq=@c_cbrq ,		 	-- ������	
			c_jobnumber=@c_jobnumber ,		-- �����˹���	
			c_usageid=@c_usageid ,			-- ʹ������	
			c_pay=@c_pay ,				-- ���ʽ: 1���ÿ�ˢ�� 2ת�� 3�ֽ�	
			c_fpserial=@c_fpserial ,		-- ��Ʊ��ˮ��	
			c_dzserial=@c_dzserial ,		-- ��֤��ˮ��	
			c_orgid_sq=@c_orgid_sq ,		-- ����
			c_system_sq=@c_system_sq ,		-- ������ϵ   
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,
			c_datime=@c_datime ,
			c_ip=@c_ip  
		where c_no=@c_no	 
	end	 
	exec p_cxsqjs2	@c_companyid,@c_bd
return 0
go
--���ձ����սᵥ����
if exists(select name from sysobjects where name='p_cxbdrjd')
	drop procedure p_cxbdrjd
go
create procedure p_cxbdrjd
	@c_orgid	int,
	@c_date		char(8), 
	@c_operator 	char(10) , 
	@c_ip 		char(25)  
as 	   
declare @c_customer char (20)    ,		-- �ͻ�����
	@c_companyid int  ,			-- ���չ�˾ 
	@c_bd char (30)   ,			-- ������
	@c_bxf decimal(15,2)  , 		-- ���շ� 
	@c_jobnumber char (10)  ,		-- �����˹���
	@c_datime datetime   
	set @c_datime=getdate()		
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('�������ڸ�ʽ����!', 16, 1)
		return @@error
	end
	delete  t_cxbdrjd where c_orgid=@c_orgid and c_date=@c_date
	insert  t_cxbdrjd	
	(	  
		c_orgid,	-- ����
		c_companyid,	-- ���չ�˾ 
		c_bd,		-- ���� 
		c_customer,	-- �ͻ�����   
		c_bxf,		-- ���շ�
		c_jobnumber,	-- �����˹���
		c_date,		-- ���� 
		c_operator, 
		c_ip
	) 
	select 	@c_orgid,
		c_companyid,
		c_bd,
		c_customer,
		c_bxf,		
		c_jobnumber,
		@c_date, 
		c_operator,
		c_ip
	from t_cxbd where c_orgid=@c_orgid and c_lrrq=@c_date and c_jobnm='0' and c_flag='0'		 
return 0
go

