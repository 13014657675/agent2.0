--�ͻ�����
if exists(select name from sysobjects where name='p_customer')
	drop procedure p_customer
go
create procedure p_customer
	@c_no int , 
	@c_name char (30) ,	--����
	@c_nation char (30) ,	--����
	@c_sex int ,		--�Ա�
	@c_birthy int ,		--������
	@c_birthm int ,		--������
	@c_birthd int ,		--������
	@c_marriage int , 	--0 ���� 1 �ѻ�
	@c_cardtype char (4)  ,	--֤������
	@c_cardnum char (40)  ,	--֤������
	@c_cardperiod char (8) ,--֤����Ч��
	@c_education char (4) ,	--ѧ��
	@c_email char (50)  ,	--email
	@c_phone char (30)  ,	--�̶��绰 
	@c_mobile char (30)  ,	--�ƶ��绰 
	@c_company char (50)  , --������λ��ѧУ����
	@c_post char (20)  ,	--ְ��
	@c_postcode char (20) ,	--ְҵ����	
	@c_hddr char (80)  ,	--��ס��ַ
	@c_hzip char (20)  , 	--��ס�ʱ�
	@c_cddr char (80)  ,	--��λ��ַ
	@c_czip char (20)  ,    --��λ�ʱ�
	@c_jobnm char (10) ,
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_datime datetime   
	set @c_datime=getdate()	
	if @c_jobnm='add'
	begin  	
		if @c_cardnum=''
		begin
			raiserror ('֤�����벻��Ϊ��!', 16, 1)
			return @@error
		end
		set @c_no=1
		if exists(select * from t_customer)
		begin
			select @c_no=max(c_no)+1 from t_customer
		end
		insert  t_customer  	
		(	 
			c_no,
			c_name,			--����
			c_nation,		--����
			c_sex,			--�Ա�
			c_birthy,		--������
			c_birthm,		--������
			c_birthd,		--������
			c_marriage, 		--0 ���� 1 �ѻ�
			c_cardtype,		--֤������
			c_cardnum,		--֤������
			c_cardperiod,		--֤����Ч��
			c_education,		--ѧ��
			c_email,		--email
			c_phone,		--�̶��绰 
			c_mobile,		--�ƶ��绰 
			c_company, 		--������λ��ѧУ����
			c_post,			--ְ��
			c_postcode,		--ְҵ����	
			c_hddr,			--��ס��ַ
			c_hzip, 		--��ס�ʱ�
			c_cddr,			--��λ��ַ
			c_czip,    		--��λ�ʱ�
			c_jobnm,
			c_operator, 
			c_ip
		) 
		values
		( 
			@c_no,
			@c_name,		--����
			@c_nation,		--����
			@c_sex,			--�Ա�
			@c_birthy,		--������
			@c_birthm,		--������
			@c_birthd,		--������
			@c_marriage, 		--0 ���� 1 �ѻ�
			@c_cardtype,		--֤������
			@c_cardnum,		--֤������
			@c_cardperiod,		--֤����Ч��
			@c_education,		--ѧ��
			@c_email,		--email
			@c_phone,		--�̶��绰 
			@c_mobile,		--�ƶ��绰 
			@c_company, 		--������λ��ѧУ����
			@c_post,		--ְ��
			@c_postcode,		--ְҵ����	
			@c_hddr,		--��ס��ַ
			@c_hzip, 		--��ס�ʱ�
			@c_cddr,		--��λ��ַ
			@c_czip,    		--��λ�ʱ�
			@c_jobnm,
			@c_operator, 
			@c_ip
		)	
	end	
	if @c_jobnm='update'
	begin
		update t_customer set 
			c_name=@c_name,			--����
			c_nation=@c_nation,		--����
			c_sex=@c_sex,			--�Ա�
			c_birthy=@c_birthy,		--������
			c_birthm=@c_birthm,		--������
			c_birthd=@c_birthd,		--������
			c_marriage=@c_marriage, 	--0 ���� 1 �ѻ�
			c_cardtype=@c_cardtype,		--֤������
			c_cardnum=@c_cardnum,		--֤������
			c_cardperiod=@c_cardperiod,	--֤����Ч��
			c_education=@c_education,	--ѧ��
			c_email=@c_email,		--email
			c_phone=@c_phone,		--�̶��绰 
			c_mobile=@c_mobile,		--�ƶ��绰 
			c_company=@c_company, 		--������λ��ѧУ����
			c_post=@c_post,			--ְ��
			c_postcode=@c_postcode,		--ְҵ����	
			c_hddr=@c_hddr,			--��ס��ַ
			c_hzip=@c_hzip, 		--��ס�ʱ�
			c_cddr=@c_cddr,			--��λ��ַ
			c_czip=@c_czip,    		--��λ�ʱ�
			c_jobnm=@c_jobnm,
			c_operator=@c_operator, 
			c_datime=@c_datime,
			c_ip=@c_ip
		where c_no=@c_no	 
	end	 
	select @c_no
return 0
go
--���ձ�������
if exists(select name from sysobjects where name='p_sxbd')
	drop procedure p_sxbd
go
create procedure p_sxbd
	@c_no int ,		--id
	@c_orgid int ,		-- ����
	@c_companyid int ,	-- ���չ�˾
	@c_tbd char (30) ,	-- Ͷ������
	@c_bd char (30) ,	-- ������
	@c_address char (80) ,	-- ͨѶ��ַ
	@c_zip char (20) ,    	-- ͨѶ�ʱ�
	@c_tbrnum int ,		-- Ͷ���˱��
	@c_bbrnum int ,		-- �����˱��
	@c_tbrrel char (20) ,	-- ��Ͷ���˵�*	
	@c_name1 char (20)  ,	-- ����������
	@c_sex1 char (1)  ,	-- �������Ա�
	@c_bbrrel1 char (20) , 	-- �Ǳ����˵�*	
	@c_sysx1 int ,		-- ����˳��
	@c_sybl1 decimal(7, 2) ,-- �������
	@c_cardtype1 char (4)  ,-- ֤������
	@c_cardnum1 char (20)  ,-- ֤������	
	@c_name2 char (20) ,	-- ����������
	@c_sex2 char (1)  ,	-- �������Ա�
	@c_bbrrel2 char (20) , 	-- �Ǳ����˵�*	
	@c_sysx2 int ,		-- ����˳��
	@c_sybl2 decimal(7, 2) ,-- �������
	@c_cardtype2 char (4) ,	-- ֤������
	@c_cardnum2 char (20) ,	-- ֤������	
	@c_name3 char (20) ,	-- ����������
	@c_sex3 char (1)  ,	-- �������Ա�
	@c_bbrrel3 char (20) , 	-- �Ǳ����˵�*	
	@c_sysx3 int ,		-- ����˳��
	@c_sybl3 decimal(7, 2) ,-- �������
	@c_cardtype3 char (4)  ,-- ֤������
	@c_cardnum3 char (20)  ,-- ֤������ 	 
	@c_pay int ,		-- ���ѷ�ʽ
	@c_pad int ,		-- �潻��ʽ
	@c_controversy int ,	-- ���鴦��ʽ	
	@c_bank char (4) ,	-- ����
	@c_bankcode char (50) ,	-- ���п���
	@c_jobnumber char (10) ,-- ����	
	@c_outletsid int ,
	@c_tbrq char (8) ,  
	@c_jobnm char (10) ,
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_system_sq int,
	@c_orgid_sq int,
	@c_companyid_temp int ,
	@c_tbd_temp char (30) ,	-- Ͷ������
	@c_datime datetime   
	set @c_datime=getdate()		
	if not (isdate(@c_tbrq)=1 and len(@c_tbrq)=8)
	begin
		raiserror ('Ͷ�����ڸ�ʽ����!', 16, 1)
		return @@error
	end
	select @c_orgid_sq=c_orgid,@c_system_sq=c_system from t_agentset where c_jobnumber=@c_jobnumber and c_flag='0'
	if @c_jobnm='add'
	begin  	 
		if not exists (	select c_jobnumber from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null )
		begin		
			raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
			return @@error
		end
		if not exists (	select * from t_agentset where c_jobnumber=@c_jobnumber and c_system in(1,2) and c_flag='0' )
		begin		
			raiserror ('���ţ�%s ��Ч��, ����Ӵ�����������ҵ��ѪԵ��ϵ', 16, 1, @c_jobnumber)
			return @@error
		end	
		insert  t_sxbd  	
		(	 
			c_orgid  ,		-- ����
			c_companyid  ,		-- ���չ�˾
			c_tbd ,			-- Ͷ������ 
			c_bd ,			-- ������
			c_address ,		-- ͨѶ��ַ
			c_zip ,    		-- ͨѶ�ʱ�
			c_tbrnum ,		-- Ͷ���˱��
			c_bbrnum ,		-- �����˱��
			c_tbrrel ,		-- ��Ͷ���˵�*	
			c_name1 ,		-- ����������
			c_sex1 ,		-- �������Ա�
			c_bbrrel1 , 		-- �Ǳ����˵�*	
			c_sysx1 ,		-- ����˳��
			c_sybl1 ,		-- �������
			c_cardtype1 ,		-- ֤������
			c_cardnum1 ,		-- ֤������	
			c_name2 ,		-- ����������
			c_sex2 ,		-- �������Ա�
			c_bbrrel2 , 		-- �Ǳ����˵�*	
			c_sysx2 ,		-- ����˳��
			c_sybl2 ,		-- �������
			c_cardtype2 ,		-- ֤������
			c_cardnum2 ,		-- ֤������	
			c_name3 ,		-- ����������
			c_sex3 ,		-- �������Ա�
			c_bbrrel3 , 		-- �Ǳ����˵�*	
			c_sysx3 ,		-- ����˳��
			c_sybl3 ,		-- �������
			c_cardtype3 ,		-- ֤������
			c_cardnum3 ,		-- ֤������ 	 
			c_pay ,			-- ���ѷ�ʽ
			c_pad ,			-- �潻��ʽ
			c_controversy ,		-- ���鴦��ʽ	
			c_bank ,		-- ����
			c_bankcode ,		-- ���п���
			c_jobnumber ,		-- ����	
			c_outletsid ,		-- ����
			c_orgid_sq,		-- ����
			c_system_sq,		-- ������ϵ
			c_tbrq ,  		-- Ͷ������
			c_type_xq ,		 
			c_jobnumber_xq ,
			c_jobnm ,
			c_operator , 
			c_ip 
		) 
		values
		( 
			@c_orgid  ,		-- ����
			@c_companyid  ,		-- ���չ�˾
			@c_tbd ,		-- Ͷ������ 
			@c_bd ,			-- ������
			@c_address ,		-- ͨѶ��ַ
			@c_zip ,    		-- ͨѶ�ʱ�
			@c_tbrnum ,		-- Ͷ���˱��
			@c_bbrnum ,		-- �����˱��
			@c_tbrrel ,		-- ��Ͷ���˵�*	
			@c_name1 ,		-- ����������
			@c_sex1 ,		-- �������Ա�
			@c_bbrrel1 , 		-- �Ǳ����˵�*	
			@c_sysx1 ,		-- ����˳��
			@c_sybl1 ,		-- �������
			@c_cardtype1 ,		-- ֤������
			@c_cardnum1 ,		-- ֤������	
			@c_name2 ,		-- ����������
			@c_sex2 ,		-- �������Ա�
			@c_bbrrel2 , 		-- �Ǳ����˵�*	
			@c_sysx2 ,		-- ����˳��
			@c_sybl2 ,		-- �������
			@c_cardtype2 ,		-- ֤������
			@c_cardnum2 ,		-- ֤������	
			@c_name3 ,		-- ����������
			@c_sex3 ,		-- �������Ա�
			@c_bbrrel3 , 		-- �Ǳ����˵�*	
			@c_sysx3 ,		-- ����˳��
			@c_sybl3 ,		-- �������
			@c_cardtype3 ,		-- ֤������
			@c_cardnum3 ,		-- ֤������ 	 
			@c_pay ,		-- ���ѷ�ʽ
			@c_pad ,		-- �潻��ʽ
			@c_controversy ,	-- ���鴦��ʽ	
			@c_bank ,		-- ����
			@c_bankcode ,		-- ���п���
			@c_jobnumber ,		-- ����	
			@c_outletsid ,		-- ����
			@c_orgid_sq,		-- ����
			@c_system_sq,		-- ������ϵ
			@c_tbrq ,  		-- Ͷ������
			'1' ,		 
			@c_jobnumber ,
			@c_jobnm ,
			@c_operator , 
			@c_ip 
		)	 		
	end	
	if @c_jobnm ='check'
	begin
		select @c_companyid_temp=c_companyid ,@c_tbd_temp=c_tbd from t_sxbd where c_no=@c_no
		update t_sxbd set 
			c_orgid=@c_orgid  ,		-- ����
			c_companyid=@c_companyid  ,	-- ���չ�˾
			c_tbd=@c_tbd ,			-- Ͷ������ 
			c_address=@c_address ,		-- ͨѶ��ַ
			c_zip=@c_zip ,    		-- ͨѶ�ʱ�
			c_tbrnum=@c_tbrnum ,		-- Ͷ���˱��
			c_bbrnum=@c_bbrnum ,		-- �����˱��
			c_tbrrel=@c_tbrrel ,		-- ��Ͷ���˵�*	
			c_name1=@c_name1 ,		-- ����������
			c_sex1=@c_sex1 ,		-- �������Ա�
			c_bbrrel1=@c_bbrrel1 , 		-- �Ǳ����˵�*	
			c_sysx1=@c_sysx1 ,		-- ����˳��
			c_sybl1=@c_sybl1 ,		-- �������
			c_cardtype1=@c_cardtype1 ,	-- ֤������
			c_cardnum1=@c_cardnum1 ,	-- ֤������	
			c_name2=@c_name2 ,		-- ����������
			c_sex2=@c_sex2 ,		-- �������Ա�
			c_bbrrel2=@c_bbrrel2 , 		-- �Ǳ����˵�*	
			c_sysx2=@c_sysx2 ,		-- ����˳��
			c_sybl2=@c_sybl2 ,		-- �������
			c_cardtype2=@c_cardtype2 ,	-- ֤������
			c_cardnum2=@c_cardnum2 ,	-- ֤������	
			c_name3=@c_name3 ,		-- ����������
			c_sex3=@c_sex3 ,		-- �������Ա�
			c_bbrrel3=@c_bbrrel3 , 		-- �Ǳ����˵�*	
			c_sysx3=@c_sysx3 ,		-- ����˳��
			c_sybl3=@c_sybl3 ,		-- �������
			c_cardtype3=@c_cardtype3 ,	-- ֤������
			c_cardnum3=@c_cardnum3 ,	-- ֤������ 	 
			c_pay=@c_pay ,			-- ���ѷ�ʽ
			c_pad=@c_pad ,			-- �潻��ʽ
			c_controversy=@c_controversy ,	-- ���鴦��ʽ	
			c_bank=@c_bank ,		-- ����
			c_bankcode=@c_bankcode ,	-- ���п���
			c_jobnumber=@c_jobnumber ,	-- ����	
			c_outletsid=@c_outletsid ,	-- ����
			c_orgid_sq=@c_orgid_sq,		-- ����
			c_system_sq=@c_system_sq,	-- ������ϵ
			c_tbrq=@c_tbrq ,  
			c_type_xq='1',		 
			c_jobnumber_xq=@c_jobnumber ,
			c_jobnm='0' ,
			c_operator=@c_operator , 
			c_datime=@c_datime ,
			c_ip=@c_ip 
		where c_no=@c_no	
		delete t_sxtb where c_companyid=@c_companyid_temp and c_tbd=@c_tbd_temp
	end	 
	if @c_jobnm ='update'
	begin
		select @c_companyid_temp=c_companyid ,@c_tbd_temp=c_tbd from t_sxbd where c_no=@c_no
		update t_sxbd set 
			c_orgid=@c_orgid  ,		-- ����
			c_companyid=@c_companyid  ,	-- ���չ�˾
			c_tbd=@c_tbd ,			-- Ͷ������
			c_bd=@c_bd ,			-- ������
			c_address=@c_address ,		-- ͨѶ��ַ
			c_zip=@c_zip ,    		-- ͨѶ�ʱ�
			c_tbrnum=@c_tbrnum ,		-- Ͷ���˱��
			c_bbrnum=@c_bbrnum ,		-- �����˱��
			c_tbrrel=@c_tbrrel ,		-- ��Ͷ���˵�*	
			c_name1=@c_name1 ,		-- ����������
			c_sex1=@c_sex1 ,		-- �������Ա�
			c_bbrrel1=@c_bbrrel1 , 		-- �Ǳ����˵�*	
			c_sysx1=@c_sysx1 ,		-- ����˳��
			c_sybl1=@c_sybl1 ,		-- �������
			c_cardtype1=@c_cardtype1 ,	-- ֤������
			c_cardnum1=@c_cardnum1 ,	-- ֤������	
			c_name2=@c_name2 ,		-- ����������
			c_sex2=@c_sex2 ,		-- �������Ա�
			c_bbrrel2=@c_bbrrel2 , 		-- �Ǳ����˵�*	
			c_sysx2=@c_sysx2 ,		-- ����˳��
			c_sybl2=@c_sybl2 ,		-- �������
			c_cardtype2=@c_cardtype2 ,	-- ֤������
			c_cardnum2=@c_cardnum2 ,	-- ֤������	
			c_name3=@c_name3 ,		-- ����������
			c_sex3=@c_sex3 ,		-- �������Ա�
			c_bbrrel3=@c_bbrrel3 , 		-- �Ǳ����˵�*	
			c_sysx3=@c_sysx3 ,		-- ����˳��
			c_sybl3=@c_sybl3 ,		-- �������
			c_cardtype3=@c_cardtype3 ,	-- ֤������
			c_cardnum3=@c_cardnum3 ,	-- ֤������ 	 
			c_pay=@c_pay ,			-- ���ѷ�ʽ
			c_pad=@c_pad ,			-- �潻��ʽ
			c_controversy=@c_controversy ,	-- ���鴦��ʽ	
			c_bank=@c_bank ,		-- ����
			c_bankcode=@c_bankcode ,	-- ���п���
			c_jobnumber=@c_jobnumber ,	-- ����	
			c_outletsid=@c_outletsid ,	-- ����
			c_orgid_sq=@c_orgid_sq,		-- ����
			c_system_sq=@c_system_sq,	-- ������ϵ
			c_tbrq=@c_tbrq ,  
			c_type_xq='1',		 
			c_jobnumber_xq=@c_jobnumber ,
			c_jobnm='0' ,
			c_operator=@c_operator , 			 
			c_ip=@c_ip 
		where c_no=@c_no		
		update t_sxbdzt set c_tbd=@c_tbd , c_bd=@c_bd 	
			where c_companyid=@c_companyid_temp and c_tbd=@c_tbd_temp
		delete t_sxtb where c_companyid=@c_companyid_temp and c_tbd=@c_tbd_temp
	end	 
return 0
go
--����Ͷ���������
if exists(select name from sysobjects where name='p_sxtb')
	drop procedure p_sxtb
go
create procedure p_sxtb
	@c_companyid int ,	-- ���չ�˾
	@c_tbd char (30) ,	-- Ͷ������
	@c_bd char (30) ,	-- ������
	@c_productid int , 	-- ��Ʒ����id	 
	@c_bxqtype int ,	-- �����ڼ�����
	@c_bxq int ,		-- �����ڼ�
	@c_jfqtype int ,	-- �����ڼ�����
	@c_jfq int ,		-- �����ڼ�
	@c_jfqx int , 		-- ��������
	@c_bxje decimal(15,2) ,	-- ���ս��
	@c_bxf decimal(15,2) , 	-- ���շ�  
	@c_jobnm char (10) ,
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_age int,
	@c_bbrnum int,
	@c_birthy int,		--��
	@c_birthm int,		--��
	@c_birthd int,		--��	
	@c_datime datetime   
	set @c_datime=getdate()	
	if @c_jobnm in ('add','check')
	begin  	
		if @c_bxqtype=0
		begin
			set @c_bxq=0
		end  
		if @c_jfqtype=0
		begin
			set @c_jfq=0
			set @c_jfqx=1
		end  
		if @c_jfqtype=1
		begin
			set @c_jfqx=@c_jfq
		end
		if @c_jfqtype=2
		begin
			select @c_bbrnum=c_bbrnum from t_sxbd where c_companyid=@c_companyid and c_tbd=@c_tbd	 
			select @c_birthy=c_birthy,@c_birthm=c_birthm,@c_birthd=c_birthd from t_customer where c_no=@c_bbrnum
			exec pg_age
				@c_birthy	,		--��
				@c_birthm	,		--��
				@c_birthd	,		--��
				@c_age		output	--����
			set @c_jfqx=@c_jfq-@c_age
		end
		insert  t_sxtb  	
		(	 
			c_companyid ,	-- ���չ�˾
			c_tbd ,		-- Ͷ������ 
			c_bd ,		-- ������ 
			c_productid , 	-- ��Ʒ����id	 
			c_bxqtype ,	-- �����ڼ�N��
			c_bxq ,		-- �����ڼ���N����
			c_jfqtype ,	-- �����ڼ�N��
			c_jfq ,		-- �����ڼ���N����
			c_jfqx , 	-- ������
			c_bxje ,	-- ���ս��
			c_bxf , 	-- ���շ�  
			c_jobnm ,
			c_operator , 
			c_ip   
		) 
		values
		( 
			@c_companyid ,	-- ���չ�˾
			@c_tbd ,	-- Ͷ������ 
			@c_bd ,		-- ������ 
			@c_productid , 	-- ��Ʒ����id	 
			@c_bxqtype ,	-- �����ڼ�N��
			@c_bxq ,	-- �����ڼ���N����
			@c_jfqtype ,	-- �����ڼ�N��
			@c_jfq ,	-- �����ڼ���N����
			@c_jfqx , 	-- ������
			@c_bxje ,	-- ���ս��
			@c_bxf , 	-- ���շ�  
			@c_jobnm ,
			@c_operator , 
			@c_ip   
		)	 
	end	
	if @c_jobnm='update'
	begin  	 		 
		if @c_bxqtype=0
		begin
			set @c_bxq=0
		end  
		if @c_jfqtype=0
		begin
			set @c_jfq=0
			set @c_jfqx=1
		end   
		insert  t_sxtb  	
		(	 
			c_companyid ,	-- ���չ�˾
			c_tbd ,		-- Ͷ������ 
			c_bd ,		-- ������ 
			c_productid , 	-- ��Ʒ����id	 
			c_bxqtype ,	-- �����ڼ�N��
			c_bxq ,		-- �����ڼ���N����
			c_jfqtype ,	-- �����ڼ�N��
			c_jfq ,		-- �����ڼ���N����
			c_jfqx , 	-- ������
			c_bxje ,	-- ���ս��
			c_bxf , 	-- ���շ�  
			c_jobnm ,
			c_operator , 
			c_ip   
		) 
		values
		( 
			@c_companyid ,	-- ���չ�˾
			@c_tbd ,	-- Ͷ������ 
			@c_bd ,		-- ������ 
			@c_productid , 	-- ��Ʒ����id	 
			@c_bxqtype ,	-- �����ڼ�N��
			@c_bxq ,	-- �����ڼ���N����
			@c_jfqtype ,	-- �����ڼ�N��
			@c_jfq ,	-- �����ڼ���N����
			@c_jfqx , 	-- ������
			@c_bxje ,	-- ���ս��
			@c_bxf , 	-- ���շ�  
			@c_jobnm ,
			@c_operator , 
			@c_ip   
		)	 
	end		 
return 0
go
--����Ͷ������������
if exists(select name from sysobjects where name='p_sxbd_cd')
	drop procedure p_sxbd_cd
go
create procedure p_sxbd_cd
	@c_companyid int ,	-- ���չ�˾
	@c_tbd char (30) ,	-- Ͷ������ 	
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_datime datetime   
	set @c_datime=getdate()	
	insert t_sxbdzt
	(
		c_companyid,
		c_tbd,
		c_type, 
		c_operator,
		c_ip
	) 
	values
	(
		@c_companyid,
		@c_tbd,
		4, 
		@c_operator,
		@c_ip
	)
	update t_sxbd set c_jobnm='4'	-- 4 ��ԥ���˱� 
		where c_companyid=@c_companyid and c_tbd=@c_tbd	 
return 0
go
--���ձ�����Ч����
if exists(select name from sysobjects where name='p_sxbd_sx')
	drop procedure p_sxbd_sx
go
create procedure p_sxbd_sx
	@c_companyid int ,	-- ���չ�˾
	@c_tbd char (30) ,	-- Ͷ������ 	
	@c_bd char (30) ,	-- ������  
	@c_cardnum char (40) ,	-- Ͷ����֤������	
	@c_jobnumber char (10) ,-- �����˹���	
	@c_bxf decimal(15,2) , 	-- ���շѺϼ� 
	@c_date char(8) ,	-- �б����� 
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_tbrnum int,
	@c_cardnum_temp char(40),
	@c_jobnumber_temp char(10),
	@c_bxf_temp decimal(15,2) , 	
	@c_datime datetime   
	set @c_datime=getdate()	
	print CAST(@c_date AS datetime )
	select @c_tbrnum=c_tbrnum,@c_jobnumber_temp=c_jobnumber from t_sxbd where c_companyid=@c_companyid and c_tbd=@c_tbd
	select @c_bxf_temp=sum(c_bxf) from t_sxtb where c_companyid=@c_companyid and c_tbd=@c_tbd
	select @c_cardnum_temp=c_cardnum from t_customer where c_no=@c_tbrnum 
	if @c_cardnum_temp<>@c_cardnum
	begin
		raiserror ('Ͷ����֤�����벻һ��!', 16, 1)
		return @@error
	end
	if @c_jobnumber_temp<>@c_jobnumber
	begin
		raiserror ('�����˹��Ų�һ��!', 16, 1)
		return @@error
	end
	if abs(@c_bxf_temp-@c_bxf)<1
	begin
		raiserror ('���շѺϼƲ�һ��!', 16, 1)
		return @@error
	end 
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('�б����ڸ�ʽ����!', 16, 1)
		return @@error
	end
	if exists(select * from t_sxbd where c_companyid=@c_companyid and c_bd=@c_bd)
	begin
		raiserror ('�����Ų������ظ����ڣ���!', 16, 1)
		return @@error
	end
	insert t_sxbdzt
	(
		c_companyid,
		c_tbd,
		c_bd,
		c_type, 
		c_date,
		c_operator,
		c_ip
	) 
	values
	(
		@c_companyid,
		@c_tbd,
		@c_bd,
		1, 
		@c_date,
		@c_operator,
		@c_ip
	) 
	update t_sxbd set c_bd=@c_bd
		where c_companyid=@c_companyid and c_tbd=@c_tbd
	update t_sxtb set c_bd=@c_bd
		where c_companyid=@c_companyid and c_tbd=@c_tbd	 
return 0
go
--���ձ������Ź���
if exists(select name from sysobjects where name='p_sxbd_ff')
	drop procedure p_sxbd_ff
go
create procedure p_sxbd_ff
	@c_companyid int ,	-- ���չ�˾
	@c_tbd char (30) ,	-- Ͷ������ 	
	@c_bd char (30) ,	-- ������   
	@c_orgid int ,
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_datime datetime   
	set @c_datime=getdate()		 
	update t_sxbdzt set c_flag='1' 
		where c_companyid=@c_companyid and c_tbd=@c_tbd
	insert t_sxbdzt
	(
		c_companyid,
		c_tbd,
		c_bd,
		c_type, 
		c_orgid,
		c_operator,
		c_ip
	) 
	values
	(
		@c_companyid,
		@c_tbd,
		@c_bd,
		2, 
		@c_orgid,
		@c_operator,
		@c_ip
	) 
return 0
go
--���ձ�����ִ����
if exists(select name from sysobjects where name='p_sxbd_hz')
	drop procedure p_sxbd_hz
go
create procedure p_sxbd_hz
	@c_companyid int ,	-- ���չ�˾
	@c_tbd char (30) ,	-- Ͷ������ 	
	@c_bd char (30) ,	-- ������   
	@c_date char(8) ,	-- ǩ������ 
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_datime datetime   
	set @c_datime=getdate()		  
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('ǩ�����ڸ�ʽ����!', 16, 1)
		return @@error
	end
	update t_sxbdzt set c_flag='1' 
		where c_companyid=@c_companyid and c_tbd=@c_tbd
	insert t_sxbdzt
	(
		c_companyid,
		c_tbd,
		c_bd,
		c_type, 
		c_date,
		c_operator,
		c_ip
	) 
	values
	(
		@c_companyid,
		@c_tbd,
		@c_bd,
		3, 
		@c_date,
		@c_operator,
		@c_ip
	) 
return 0
go
--���ձ����˱�����
if exists(select name from sysobjects where name='p_sxbd_tb')
	drop procedure p_sxbd_tb
go
create procedure p_sxbd_tb
	@c_companyid int ,	-- ���չ�˾ 
	@c_tbd char (30) ,	-- Ͷ������ 
	@c_bd char (30) ,	-- ������   
	@c_type int ,		-- 4 ��ԥ���˱� 5 �����˱� 
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_datime datetime   
	set @c_datime=getdate()		 
	update t_sxbdzt set c_flag='1' 
		where c_companyid=@c_companyid and c_tbd=@c_tbd
	insert t_sxbdzt
	(
		c_companyid,
		c_tbd,
		c_bd,
		c_type,  
		c_operator,
		c_ip
	) 
	values
	(
		@c_companyid,
		@c_tbd,
		@c_bd,
		@c_type,  
		@c_operator,
		@c_ip
	) 
	update t_sxbd  set c_jobnm=@c_type
		where c_companyid=@c_companyid and c_tbd=@c_tbd
return 0
go
--���ձ���״̬�ָ�����
if exists(select name from sysobjects where name='p_sxbd_back')
	drop procedure p_sxbd_back
go
create procedure p_sxbd_back
	@c_companyid int ,	-- ���չ�˾
	@c_tbd char (30) ,	-- Ͷ������ 	
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_no int,
	@c_datime datetime   
	set @c_datime=getdate()	 
	update t_sxbd set c_jobnm='0'
		where c_companyid=@c_companyid and c_tbd=@c_tbd	 
	delete t_sxbdzt 	
		where c_companyid=@c_companyid and c_tbd=@c_tbd	 and c_type in (0,4,5,9)
	select @c_no=max(c_no) from t_sxbdzt where c_companyid=@c_companyid and c_tbd=@c_tbd	
	update t_sxbdzt set c_flag='0' where c_no=@c_no
return 0
go
--���ձ��������޸Ĺ���
if exists(select name from sysobjects where name='p_sxbd_rq')
	drop procedure p_sxbd_rq
go
create procedure p_sxbd_rq
	@c_companyid int ,	-- ���չ�˾
	@c_tbd char (30) ,	-- Ͷ������ 	
	@c_jobnm char(10) , 	-- a Ͷ������ b �б����� c ��ִ����
	@c_date char(8) ,	-- ���� 
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_datime datetime   
	set @c_datime=getdate()	 
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('�������ڸ�ʽ����!', 16, 1)
		return @@error
	end
	if @c_jobnm='a'
	begin
		update t_sxbd set c_tbrq=@c_date
			where c_companyid=@c_companyid and c_tbd=@c_tbd
	end  
	if @c_jobnm='b'
	begin
		update t_sxbdzt set c_date=@c_date
			where c_companyid=@c_companyid and c_tbd=@c_tbd and c_type=1
	end  
	if @c_jobnm='c'
	begin
		update t_sxbdzt set c_datime=@c_date
			where c_companyid=@c_companyid and c_tbd=@c_tbd and c_type=3
	end   
return 0
go
--����Ͷ�����ʹ������
if exists(select name from sysobjects where name='p_sxtbsds')
	drop procedure p_sxtbsds
go
create procedure p_sxtbsds
	@c_orgid	int,
	@c_date		char(8),
	@c_companyid	int,	
	@c_operator 	char(10) , 
	@c_ip 		char(25)  
as 	  
declare @c_times  int 
	set @c_times=1
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('�������ڸ�ʽ����!', 16, 1)
		return @@error
	end
	if exists(select * from t_sxtbsds where c_orgid=@c_orgid and c_date=@c_date and c_companyid=@c_companyid)
	begin
		select @c_times=max(c_times)+1 from t_sxtbsds where c_orgid=@c_orgid and c_date=@c_date and c_companyid=@c_companyid
	end	
	insert  t_sxtbsds  	
	(	  
		c_orgid,	-- ����
		c_companyid,	-- ���չ�˾ 
		c_tbd,		-- Ͷ���� 
		c_tbrnum,	-- Ͷ���˱��   
		c_date,		-- ����
		c_times,	-- ����
		c_operator, 
		c_ip
	) 
	select 
		c_orgid,
		c_companyid,
		c_tbd,
		c_tbrnum,
		@c_date,
		@c_times,
		@c_operator,
		@c_ip
	from t_sxbd where c_orgid=@c_orgid and convert(char(8),c_datime,112)=@c_date and c_companyid=@c_companyid
		and c_tbd not in (select c_tbd from t_sxtbsds where c_orgid=@c_orgid and c_date=@c_date and c_companyid=@c_companyid) 
		and c_jobnm='0' and c_flag='0'
return 0
go
--����Ͷ�����սᵥ����
if exists(select name from sysobjects where name='p_sxtbrjd')
	drop procedure p_sxtbrjd
go
create procedure p_sxtbrjd
	@c_orgid	int,
	@c_date		char(8), 
	@c_operator 	char(10) , 
	@c_ip 		char(25)  
as 	   
declare @c_datime datetime   
	set @c_datime=getdate()		
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('�������ڸ�ʽ����!', 16, 1)
		return @@error
	end
	delete  t_sxtbrjd where c_orgid=@c_orgid and c_date=@c_date
	insert  t_sxtbrjd	
	(	  
		c_orgid,	-- ����
		c_companyid,	-- ���չ�˾ 
		c_tbd,		-- Ͷ���� 
		c_tbrnum,	-- Ͷ���˱��   
		c_jobnumber,	-- �����˹���
		c_date,		-- ���� 
		c_operator, 
		c_ip
	) 
	select 
		c_orgid,
		c_companyid,
		c_tbd,
		c_tbrnum,
		c_jobnumber,
		@c_date, 
		@c_operator,
		@c_ip
	from t_sxbd where c_orgid=@c_orgid and convert(char(8),c_datime,112)=@c_date and c_jobnm='0' and c_flag='0'		 
return 0
go
--���ձ�����Ч�սᵥ����
if exists(select name from sysobjects where name='p_sxsxrjd')
	drop procedure p_sxsxrjd
go
create procedure p_sxsxrjd
	@c_orgid	int,
	@c_date		char(8), 
	@c_operator 	char(10) , 
	@c_ip 		char(25)  
as 	   
declare @c_datime datetime   
	set @c_datime=getdate()	
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('�������ڸ�ʽ����!', 16, 1)
		return @@error
	end	
	delete  t_sxsxrjd where c_orgid=@c_orgid and c_date=@c_date
	insert  t_sxsxrjd	
	(	  
		c_orgid,	-- ����
		c_companyid,	-- ���չ�˾ 
		c_tbd,		-- Ͷ���� 
		c_bd,		-- ���� 		 
		c_date,		-- ���� 
		c_operator, 
		c_ip
	) 
	select 
		c_orgid,
		c_companyid,
		c_tbd,
		c_bd, 
		@c_date, 
		@c_operator,
		@c_ip
	from t_sxbd where c_orgid=@c_orgid 
		and c_bd in (select c_bd from t_sxbdzt where c_companyid=t_sxbd.c_companyid and c_type=1 and convert(char(8),c_datime,112)=@c_date)
		and c_jobnm='0' and c_flag='0'		 
return 0
go
--���ձ��������嵥����
if exists(select name from sysobjects where name='p_sxffqd')
	drop procedure p_sxffqd
go
create procedure p_sxffqd
	@c_companyid 	int ,		-- ���չ�˾
	@c_bd 		char (30) ,	-- ������ 		
	@c_operator 	char(10) , 
	@c_ip 		char(25)  
as 	   
declare @c_orgid  int,
	@c_times  int, 
	@c_date	  char(8) 	
	set @c_times=1
	set @c_date=convert(char(8),getdate(),112) 	
	select @c_orgid=c_orgid_sq from t_sxbd where c_companyid=@c_companyid and c_bd=@c_bd
	delete  t_sxffqd where c_companyid=@c_companyid and c_bd=@c_bd
	insert  t_sxffqd	
	(	  		
		c_companyid,	-- ���չ�˾  
		c_bd,		-- ���� 	
		c_orgid,	-- ����	 
		c_date,		-- ���� 
		c_times,
		c_operator, 
		c_ip
	) 
	values
	( 	
		@c_companyid, 
		@c_bd, 
		@c_orgid,
		@c_date, 
		@c_times,
		@c_operator,
		@c_ip
	 )  
return 0
go
--���ձ�����ִ�ʹ������
if exists(select name from sysobjects where name='p_sxhzsds')
	drop procedure p_sxhzsds
go
create procedure p_sxhzsds
	@c_orgid	int,
	@c_date		char(8),
	@c_companyid	int,	
	@c_operator 	char(10) , 
	@c_ip 		char(25)  
as 	  
declare @c_times  int 
	set @c_times=1
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('�������ڸ�ʽ����!', 16, 1)
		return @@error
	end
	if exists(select * from t_sxhzsds where c_orgid=@c_orgid and c_date=@c_date and c_companyid=@c_companyid)
	begin
		select @c_times=max(c_times)+1 from t_sxhzsds where c_orgid=@c_orgid and c_date=@c_date and c_companyid=@c_companyid
	end	
	insert  t_sxhzsds  	
	(	  
		c_orgid,	-- ����
		c_companyid,	-- ���չ�˾ 
		c_bd,		-- ����    
		c_date,		-- ����
		c_times,	-- ����
		c_operator, 
		c_ip
	) 
	select 
		c_orgid,
		c_companyid,
		c_bd,		 
		@c_date,
		@c_times,
		@c_operator,
		@c_ip
	from t_sxbd where c_orgid=@c_orgid and c_companyid=@c_companyid
		and c_bd in (select c_bd from t_sxbdzt where c_companyid=@c_companyid and c_type=3 and convert(char(8),c_datime,112)=@c_date) 
		and c_bd not in (select c_bd from t_sxhzsds where c_orgid=@c_orgid and c_companyid=@c_companyid and c_date=@c_date) 
		and c_jobnm='0' and c_flag='0'
return 0
go
--���ձ�����ִ�սᵥ����
if exists(select name from sysobjects where name='p_sxhzrjd')
	drop procedure p_sxhzrjd
go
create procedure p_sxhzrjd
	@c_orgid	int,
	@c_date		char(8), 
	@c_operator 	char(10) , 
	@c_ip 		char(25)  
as 	   
declare @c_datime datetime   
	set @c_datime=getdate()		
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('�������ڸ�ʽ����!', 16, 1)
		return @@error
	end
	delete  t_sxhzrjd where c_orgid=@c_orgid and c_date=@c_date
	insert  t_sxhzrjd	
	(	  
		c_orgid,	-- ����
		c_companyid,	-- ���չ�˾  
		c_bd,		-- ���� 		 
		c_date,		-- ���� 
		c_operator, 
		c_ip
	) 
	select 
		c_orgid,
		c_companyid, 
		c_bd, 
		@c_date, 
		@c_operator,
		@c_ip
	from t_sxbd where c_orgid=@c_orgid  
		and c_bd in (select c_bd from t_sxbdzt where c_companyid=t_sxbd.c_companyid and c_type=3 and convert(char(8),c_datime,112)=@c_date)
		and c_jobnm='0' and c_flag='0'		 
return 0
go
--�������ڷ�Ʊ����
if exists(select name from sysobjects where name='p_sxtb_xq')
	drop procedure p_sxtb_xq
go
create procedure p_sxtb_xq
	@c_no int,
	@c_orgid int,
	@c_companyid int ,	-- ���չ�˾
	@c_bd char (30) ,	-- ������
	@c_tbrname char(30),	-- Ͷ��������	
	@c_bdnd int,		-- �������
	@c_code char(8),	-- ��Ʊ����
	@c_fprq char(8),	-- ��Ʊ����
	@c_productid int , 	-- ��Ʒ����id	  
	@c_bxf decimal(15,2) , 	-- ���շ�  	
	@c_jobnm char (10) , 
	@c_operator 	char(10) , 
	@c_ip 		char(25)  
as 	   
declare @c_tbrnum int,
	@c_tbrname_temp char(30),	
	@c_datime datetime   
	set @c_datime=getdate()	
	if not (isdate(@c_fprq)=1 and len(@c_fprq)=8)
	begin
		raiserror ('��Ʊ���ڸ�ʽ����!', 16, 1)
		return @@error
	end	
	if @c_jobnm='add'
	begin
		select @c_tbrnum=c_tbrnum from t_sxbd where c_orgid=@c_orgid and c_companyid=@c_companyid and c_bd=@c_bd and c_jobnm='0' and c_flag='0'
		select @c_tbrname_temp=c_name  from t_customer where c_no=@c_tbrnum
		if @c_tbrname_temp <> @c_tbrname
		begin
			raiserror ('Ͷ����������һ��!', 16, 1)
			return @@error
		end		
		insert  t_sxtb_xq	
		(	  
			c_orgid ,		-- ����
			c_companyid ,		-- ���չ�˾
			c_bd ,			-- ����
			c_tbrname ,		-- Ͷ��������	
			c_bdnd ,		-- �������
			c_code ,		-- ��Ʊ����
			c_fprq ,		-- ��Ʊ����
			c_productid , 		-- ��Ʒ����id		
			c_bxf , 		-- ���շ�  			
			c_jobnm ,
			c_operator , 
			c_ip
		) 
		values
		(
			@c_orgid ,		-- ����
			@c_companyid ,		-- ���չ�˾
			@c_bd ,			-- ����
			@c_tbrname ,		-- Ͷ��������	
			@c_bdnd ,		-- �������
			@c_code ,		-- ��Ʊ����
			@c_fprq ,		-- ��Ʊ����
			@c_productid , 		-- ��Ʒ����id		
			@c_bxf , 		-- ���շ�   
			@c_jobnm ,
			@c_operator , 
			@c_ip
		)
	end	
	if @c_jobnm='update'
	begin
		update t_sxtb_xq
			set c_code=@c_code,
			c_fprq=@c_fprq ,		-- ��Ʊ����
			c_productid=@c_productid , 	-- ��Ʒ����id		
			c_bxf=@c_bxf  			-- ���շ�   
		where c_no=@c_no	
	end
	if @c_jobnm='del'
	begin
		delete t_sxtb_xq where c_no=@c_no
	end
return 0
go
--�߽ɲ�ѯ
if exists(select name from sysobjects where name='p_cjcx_xq')
	drop procedure p_cjcx_xq
go
create procedure p_cjcx_xq 
	@c_orgid int ,		--����id
	@c_companyid int , 	--��˾id	
	@c_year	 int , 		--��
	@c_month int  		--��	 
as  
	 
	create table #t_xqys
	(
		c_companyid int ,		-- ���չ�˾ 
		c_bd char (30)  ,		-- ������
		c_tbrnum char(10),		-- Ͷ���˿ͻ���
		c_tbrname char(20),		-- Ͷ�������� 
		c_phone char (30)  ,		-- Ͷ���˹̶��绰 
		c_mobile char (30) ,		-- Ͷ�����ƶ��绰 
		c_hddr char (80)  ,		-- Ͷ���˳�ס��ַ
		c_bbrnum char(10),		-- �����˿ͻ���
		c_bbrname char(20),		-- ���������� 
		c_bank char (4),		-- ����
		c_bankcode char (50),		-- ���п���
		c_cbrq char (8),		-- �б�����
		c_productid int , 		-- ��Ʒ����id	 
		c_jfqx int , 			-- ��������
		c_bdnd int ,			-- �������
		c_bxf decimal(15,2) , 		-- ���շ�  			  
		c_orgid int ,			-- ����
		c_orgname char (50) ,		-- ��������
		c_jobnumber char(10) ,		-- �����˹���
		c_outletsid int ,		-- ����
		c_name char(20) ,		-- ����������
		c_telephone char(20),		-- �����˹̶��绰
		c_mobilephone char(20)  	-- �������ֻ� 
	)
	insert #t_xqys
	(
		c_companyid ,		-- ���չ�˾ 
		c_bd ,			-- ������
		c_tbrnum ,		-- Ͷ���˿ͻ���
		c_bbrnum ,		-- �����˿ͻ���
		c_bank ,		-- ����
		c_bankcode ,		-- ���п���
		c_cbrq ,		-- �б�����
		c_productid , 		-- ��Ʒ����id	 
		c_jfqx , 		-- ��������
		c_bdnd ,		-- �������
		c_bxf , 		-- ���շ�  	 
		c_jobnumber , 		-- �����˹���
		c_outletsid		-- ����
	)
	select  a.c_companyid ,		-- ���չ�˾ 
		a.c_bd ,		-- ������
		a.c_tbrnum ,		-- Ͷ���˿ͻ���		
		a.c_bbrnum ,		-- �����˿ͻ���
		a.c_bank ,		-- ����
		a.c_bankcode ,		-- ���п���
		b.c_date ,		-- �б�����
		d.c_productid , 	-- ��Ʒ����id	 
		d.c_jfqx , 		-- �������� 
		datediff(year,b.c_date,str(@c_year,4)+right(b.c_date,4))+1 ,--������� 
		d.c_bxf , 		-- ���շ�  
		a.c_jobnumber_xq, 	-- �����˹���
		a.c_outletsid		-- ����
	from t_sxbd a,t_sxbdzt b,t_staff c,t_sxtb d
	where a.c_companyid=b.c_companyid and a.c_bd=b.c_bd
		and a.c_companyid=d.c_companyid and a.c_bd=d.c_bd
		and a.c_companyid=@c_companyid and a.c_orgid=@c_orgid and b.c_type=1
		and a.c_jobnumber_xq=c.c_jobnumber 
		and month(b.c_date)=@c_month and year(b.c_date)< @c_year		  
		and a.c_flag='0' and a.c_jobnm in ('0','5')		 	 		 		
	--ɾ������߽ɵ��� 
	delete #t_xqys where c_jfqx < c_bdnd
	--ȡͶ��������
	update #t_xqys set c_tbrname=(select c_name from t_customer where c_no=#t_xqys.c_tbrnum)
	--ȡͶ���˹̻�
	update #t_xqys set c_phone=(select c_phone  from t_customer where c_no=#t_xqys.c_tbrnum)
	--ȡͶ�����ƶ��绰
	update #t_xqys set c_mobile=(select c_mobile from t_customer where c_no=#t_xqys.c_tbrnum)	
	--ȡͶ���˳�ס��ַ
	update #t_xqys set c_hddr=(select c_hddr from t_customer where c_no=#t_xqys.c_tbrnum)
	--ȡ����������
	update #t_xqys set c_bbrname=(select c_name from t_customer where c_no=#t_xqys.c_bbrnum)
	--����ID
	update #t_xqys set c_orgid=(select c_orgid from  t_staff where c_jobnumber=#t_xqys.c_jobnumber)  	 
	--��������
	update #t_xqys set c_orgname=(select rtrim(c_name) from t_organization where c_no=#t_xqys.c_orgid)  	 
	--����������
	update #t_xqys set c_name=(select c_name from  t_staff where c_jobnumber=#t_xqys.c_jobnumber)   
	--�����˹̶��绰
	update #t_xqys set c_telephone=(select c_telephone from  t_staff where c_jobnumber=#t_xqys.c_jobnumber)  
	--�������ֻ� 	
	update #t_xqys set c_mobilephone=(select c_mobilephone from  t_staff where c_jobnumber=#t_xqys.c_jobnumber)  	  	
	select * from #t_xqys  order by c_orgid,c_companyid,c_bd,c_bdnd	
return 0
go
--�սɽ��Ȳ�ѯ
if exists(select name from sysobjects where name='p_sjjdcx')
	drop procedure p_sjjdcx
go
create procedure p_sjjdcx 
	@c_orgtypeid int ,	--��������id
	@c_orgid int ,		--����id
	@c_year	 int , 		--��
	@c_month int  		--�� 		 
as  
declare @c_order int,
	@c_path varchar (14),
	@c_bdnd	int,			-- �������
	@c_companyid int ,		-- ���չ�˾
	@c_bd char (30) ,		-- ����
	@c_skrq char (8),		-- �տ�����
	@c_date char (8)  		-- �˱�����	   	
	create table #t_xqjd
	(
		c_skrq char (8),		-- �տ�����
		c_bdnd int,			-- �������
		c_orgid_sq int,			-- ����	
		c_system_sq int ,		-- ������ϵ  	
		c_companyid int ,		-- ���չ�˾ 
		c_bd char (30)  ,		-- ������
		c_tbrnum char(10),		-- Ͷ���˿ͻ��� 
		c_bbrnum char(10),		-- �����˿ͻ���
		c_bank char (4),		-- ����
		c_bankcode char (50),		-- ���п��� 
		c_productid int , 		-- ��Ʒ����id	 
		c_jfqx int , 			-- ��������
		c_bxf decimal(15,2) , 		-- ���շ�		
		c_cbrq char (8),		-- �б�����
		c_jobnumber char(10) ,		-- �����˹���
		c_outletsid int ,		-- ����
		c_jobnm char (10)  		--		  
	)
	select @c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid	 
	insert #t_xqjd
		(
		c_skrq ,		-- �տ�����
		c_bdnd ,		-- �������
		c_orgid_sq ,		-- ����	
		c_system_sq ,		-- ������ϵ  	
		c_companyid ,		-- ���չ�˾ 
		c_bd ,			-- ������
		c_tbrnum ,		-- Ͷ���˿ͻ��� 
		c_bbrnum ,		-- �����˿ͻ���
		c_bank ,		-- ����
		c_bankcode ,		-- ���п��� 
		c_productid , 		-- ��Ʒ����id	 
		c_jfqx ,		-- ��������
		c_bxf , 		-- ���շ�		
		c_cbrq ,		-- �б�����
		c_jobnumber ,		-- �����˹���
		c_outletsid ,		-- ����
		c_jobnm   		--		
		)
	select 	str(@c_year,4)+right(a.c_date,4) ,
		datediff(year,a.c_date,str(@c_year,4)+right(a.c_date,4))+1 ,
		b.c_orgid_sq,
		b.c_system_sq,
		b.c_companyid,
		b.c_bd,
		b.c_tbrnum,
		b.c_bbrnum,
		b.c_bank,
		b.c_bankcode,		
		c.c_productid, 
		c.c_jfqx,
		c.c_bxf,
		a.c_date,
		b.c_jobnumber,
		b.c_outletsid,		
		rtrim(b.c_jobnm)  from t_sxbdzt a,t_sxbd b,t_sxtb c 
		where a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_companyid=c.c_companyid and a.c_bd=c.c_bd and a.c_type=1 
		and b.c_orgid_sq in (select c_no from t_organization where c_path like @c_path )
		and b.c_flag='0' and b.c_jobnm in ('0','5') and month(a.c_date)=@c_month and year(a.c_date)< @c_year
		order by a.c_companyid,b.c_orgid_sq  

	--ɾ������߽ɵ��� 
	delete #t_xqjd where c_jfqx < c_bdnd

	declare c_temp1 cursor for	
	select c_skrq,c_bdnd,c_companyid,c_bd from #t_xqjd
	open	c_temp1
	fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
	while (@@fetch_status = 0)
	begin  	
		--ǰ���δ�ɷѣ�����Ȳ���ʾ
		if not exists(select * from t_sxtb_xq where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd-1) and @c_bdnd>2
		begin
			update #t_xqjd set c_jobnm='del' where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
			fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
			continue
		end
		--������˱����������ʾ������Ȳ���ʾ
		set @c_date=null
		select @c_date=c_date from t_sxbdzt where c_companyid=@c_companyid and c_bd=@c_bd and c_type=5
		if @c_date is not null and DATEPART(year,@c_skrq)>DATEPART(year,@c_date)
		begin
			update #t_xqjd set c_jobnm='del' where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
			fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
			continue
		end 
		fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
	end
	close c_temp1
	deallocate  c_temp1 	
	select * from #t_xqjd where c_jobnm<>'del' order by c_orgid_sq,c_companyid,c_bd,c_productid,c_bdnd 		 
return 0
go
--���ձ�������
if exists(select name from sysobjects where name='p_sxlpba')
	drop procedure p_sxlpba
go
create procedure p_sxlpba
	@c_no int,
	@c_orgid int ,			-- ����
	@c_companyid int ,		-- ���չ�˾
	@c_bd char (30) ,		-- ����
	@c_tbrname char (30) ,		-- Ͷ��������
	@c_barq char (8) ,		-- ��������
	@c_basm varchar (1000) ,	-- ����˵��		 
	@c_jobnm char (10) ,		-- ������ba  �᰸: ja
	@c_operator char (10) , 
	@c_ip char (25)   
as 	   
declare @c_tbrnum int,
	@c_tbrname_temp char(30),	
	@c_datime datetime   
	set @c_datime=getdate()		
	if not (isdate(@c_barq)=1 and len(@c_barq)=8)
	begin
		raiserror ('�������ڸ�ʽ����!', 16, 1)
		return @@error
	end
	if @c_jobnm='add'
	begin
		select @c_tbrnum=c_tbrnum from t_sxbd where c_orgid=@c_orgid and c_companyid=@c_companyid and c_bd=@c_bd and c_jobnm='0' and c_flag='0'
		select @c_tbrname_temp=c_name  from t_customer where c_no=@c_tbrnum
		if not exists(select * from t_sxbd where c_orgid=@c_orgid and c_companyid=@c_companyid and c_bd=@c_bd 
			and c_jobnm='0' and c_flag='0') or @c_tbrname_temp <> @c_tbrname 
		begin
			raiserror ('�����Ų����ڻ�Ͷ����������һ��!', 16, 1)
			return @@error
		end
		insert  t_sxlp	
		(	  
			c_orgid ,		-- ����
			c_companyid ,		-- ���չ�˾
			c_bd ,			-- ����
			c_tbrname ,		-- Ͷ��������
			c_barq ,		-- ��������
			c_basm ,		-- ����˵��		 
			c_jobnm ,		-- ������ba  �᰸: ja
			c_operator , 
			c_ip    
		) 
		values
		(
			@c_orgid ,		-- ����
			@c_companyid ,		-- ���չ�˾
			@c_bd ,			-- ����
			@c_tbrname ,		-- Ͷ��������
			@c_barq ,		-- ��������
			@c_basm ,		-- ����˵��		 
			'ba' ,			-- ������ba  �᰸: ja
			@c_operator , 
			@c_ip    
		)
	end	
	if @c_jobnm='update'
	begin
		update t_sxlp
			set c_barq=@c_barq ,		-- ��������
			c_basm=@c_basm ,		-- ����˵��
			c_operator=@c_operator , 
			c_ip=@c_ip    
		where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_sxlp where c_no=@c_no	
	end
return 0
go
--���ս᰸����
if exists(select name from sysobjects where name='p_sxlpja')
	drop procedure p_sxlpja
go
create procedure p_sxlpja
	@c_no int,
	@c_orgid int ,			-- ����
	@c_companyid int ,		-- ���չ�˾
	@c_bd char (30) ,		-- ���� 
	@c_jarq char (8) ,		-- �᰸����
	@c_jasm varchar (1000) ,	-- �᰸˵��		 
	@c_jajg int ,			-- �᰸��� 1 ���� 2 ����
	@c_je decimal(15,2),		-- �⸶���
	@c_bdzt char (10),		-- ����״̬
	@c_jobnm char (10) ,		-- 
	@c_operator char (10) , 
	@c_ip char (25)   
as 	   
declare @c_type int ,
	@c_tbd char (30) ,		-- Ͷ���� 
	@c_datime datetime   
	set @c_datime=getdate()	
	if not (isdate(@c_jarq)=1 and len(@c_jarq)=8)
	begin
		raiserror ('�᰸���ڸ�ʽ����!', 16, 1)
		return @@error
	end	
	if @c_jobnm='add'
	begin 
		update t_sxlp
			set c_jarq=@c_jarq ,		-- �᰸����
			c_jasm=@c_jasm ,		-- �᰸˵��
			c_jajg=@c_jajg ,		-- �᰸���
			c_je=@c_je ,
			c_bdzt=@c_bdzt ,
			c_jobnm='ja',
			c_operator=@c_operator , 
			c_ip=@c_ip    
		where c_no=@c_no			
	end	
	if @c_jobnm='update'
	begin
		update t_sxlp
			set c_jarq=@c_jarq ,		-- �᰸����
			c_jasm=@c_jasm ,		-- �᰸˵��
			c_jajg=@c_jajg ,		-- �᰸���
			c_je=@c_je ,
			c_bdzt=@c_bdzt ,			
			c_operator=@c_operator , 
			c_ip=@c_ip    
		where c_no=@c_no	
	end 	
	if @c_bdzt='zz'
	begin  
		if not exists(select * from t_sxbdzt where c_companyid=@c_companyid and c_bd=@c_bd and c_type=9)
		begin
			select @c_tbd=c_tbd from t_sxbd where c_companyid=@c_companyid and c_bd=@c_bd
			insert t_sxbdzt
			(
				c_companyid, 
				c_tbd,
				c_bd,
				c_type,  
				c_operator,
				c_ip
			) 
			values
			(
				@c_companyid, 
				@c_tbd,
				@c_bd,
				9,  
				@c_operator,
				@c_ip
			) 
		end				
		update t_sxbd  set c_jobnm=@c_bdzt
			where c_companyid=@c_companyid and c_bd=@c_bd
	end	 
	if @c_bdzt='0'
	begin  	
		delete t_sxbdzt where c_companyid=@c_companyid and c_bd=@c_bd and c_type=9		 
		update t_sxbd  set c_jobnm=@c_bdzt
			where c_companyid=@c_companyid and c_bd=@c_bd
	end	 
return 0
go