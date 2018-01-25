--Ա������
if exists(select name from sysobjects where name='p_staff')
	drop procedure p_staff
go
create procedure p_staff
	@c_no int ,  				--����  
	@c_orgid int ,				--����id
	@c_name char (20) ,			--����
	@c_sex char (1) , 			--�Ա� 1���� 0��Ů
	@c_birthday char (10) ,			--��������
	@c_age int ,				--����
	@c_nation char (4) ,			--����code	
	@c_politics char (4) ,			--������òcode
	@c_education char (4) ,			--ѧ��code	
	@c_marriage char (1) ,			--����code	
	@c_healthy char (4) ,			--����code	
	@c_blood  char (4)  ,			--Ѫ��code	 
	@c_certificatetype char (4) ,		--֤������code
	@c_certificate char (50)  ,		--֤������code
	@c_native char (30) ,			--����
	@c_registerplace char (50) ,		--�������ڵ�	
	@c_livein char (50) ,			--��ס��
	@c_zipcode char (10)  ,			--�ʱ�
	@c_telephone char (20) ,		--�̶��绰
	@c_mobilephone char (20) ,		--�ֻ�
	@c_email char (30)  ,			--email	
	@c_hobby char (30)  ,			--���� 
	@c_contactname char (20) ,		--������ϵ������
	@c_contactphone char (20) ,		--������ϵ�˵绰	
	@c_foreign char (30) ,			--����ˮƽ
	@c_computer char (30) ,			--����ˮƽ	
	@c_workdate char (8) ,			--�μӹ������� 
	@c_bank char (4)   ,			--����
	@c_bankcode char (50) ,			--���п���
	@c_qualificate char(50) ,		--�ʸ�֤��
	@c_sqi1 char (10)  ,			--������
	@c_sqi2 char (10)  ,
	@c_sqi3 char (10)  ,
	@c_szhi1 char (10) ,			--ֹ����
	@c_szhi2 char (10) ,
	@c_szhi3 char (10) ,
	@c_school1 char (50) ,			--ѧУ
	@c_school2 char (50) ,
	@c_school3 char (50) ,
	@c_professional1 char (30)  ,		--רҵ
	@c_professional2 char (30)  ,
	@c_professional3 char (30)  ,
	@c_wqi1 char (10)  ,			--������
	@c_wqi2 char (10)  ,
	@c_wqi3 char (10)  ,
	@c_wqi4 char (10)  ,			 
	@c_wqi5 char (10)  ,
	@c_wqi6 char (10)  ,
	@c_wzhi1 char (10) ,			--ֹ����
	@c_wzhi2 char (10) ,
	@c_wzhi3 char (10) ,
	@c_wzhi4 char (10) ,			 
	@c_wzhi5 char (10) ,
	@c_wzhi6 char (10) ,
	@c_worknote1 char (50)  ,		--��������
	@c_worknote2 char (50)  ,
	@c_worknote3 char (50)  ,
	@c_worknote4 char (50)  ,		 
	@c_worknote5 char (50)  ,
	@c_worknote6 char (50)  ,
	@c_worker1 char (30)  ,			--ְλ
	@c_worker2 char (30)  ,
	@c_worker3 char (30)  ,
	@c_worker4 char (30)  ,			 
	@c_worker5 char (30)  ,
	@c_worker6 char (30)  ,
	@c_name1 char (20)  ,
	@c_name2 char (20)  ,
	@c_name3 char (20)  , 
	@c_call1 char (20)  ,
	@c_call2 char (20)  ,
	@c_call3 char (20)  , 
	@c_company1 char (50)  ,
	@c_company2 char (50)  ,
	@c_company3 char (50)  , 
	@c_address1 char (80)  ,
	@c_address2 char (80)  ,
	@c_address3 char (80)  , 	
	@c_note char (150)  ,	  
	@c_jobnm char (10)  ,
	@c_operator char(10) ,	
	@c_ip char (25)
as
declare	@c_counter int,
	@c_prefix char(2), 
	@c_temp int, 
	@c_path varchar (15) , 
	@c_jobnumber char(10),		--����
	@c_datime   datetime		--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 	
		--��ȡ����ǰ׺
		if exists ( select * from t_orgtype where c_mark=0 
			and c_no in (select c_orgtypeid from t_organization where c_no=@c_orgid) )
		begin
			select @c_prefix=c_prefix from t_organization where c_no=@c_orgid 
		end
		else
		begin
			select @c_temp=max(c_order)*2 from t_orgtype where c_mark=0
			select @c_path=left(c_path,@c_temp)+'%' from t_organization where c_no=@c_orgid 
			select top 1 @c_prefix=c_prefix from t_organization where c_path like @c_path order by c_path
		end
		--���ɹ���
		if not exists(select * from t_staff where c_prefix=@c_prefix)
		begin
			set @c_counter=1
			set @c_jobnumber=@c_prefix+'00000001'
		end
		else
		begin
			select @c_counter=max(c_counter)+1 from t_staff where c_prefix=@c_prefix
			set @c_jobnumber=@c_prefix+right(100000000+@c_counter,8)
		end			 
		insert  t_staff
		(   
			c_prefix,
			c_counter ,
			c_orgid ,
			c_jobnumber ,
			c_name ,			--����
			c_sex , 			--�Ա� 1���� 0��Ů
			c_birthday ,			--��������
			c_age ,				--����
			c_nation ,			--����code
			c_politics ,			--������òcode
			c_education ,			--ѧ��code	
			c_marriage ,			--����code	
			c_healthy ,			--����code
			c_blood  ,			--Ѫ��code	 
			c_certificatetype ,		--֤������code
			c_certificate ,			--֤������code
			c_native ,			--����
			c_registerplace ,		--�������ڵ�
			c_livein ,			--��ס��
			c_zipcode ,			--�ʱ�
			c_telephone ,			--�̶��绰
			c_mobilephone ,			--�ֻ�
			c_email ,			--email
			c_hobby ,			--���� 
			c_contactname ,			--������ϵ������
			c_contactphone ,		--������ϵ�˵绰	
			c_foreign ,			--����ˮƽ
			c_computer ,			--����ˮƽ
			c_workdate,
			c_bank,
			c_bankcode,
			c_qualificate,
			c_sqi1 ,			--������
			c_sqi2 ,
			c_sqi3 ,
			c_szhi1 ,			--ֹ����
			c_szhi2 ,
			c_szhi3 ,
			c_school1 ,			--ѧУ
			c_school2 ,
			c_school3 ,
			c_professional1 ,		--רҵ
			c_professional2 ,
			c_professional3 ,
			c_wqi1 ,			--������
			c_wqi2 ,
			c_wqi3 ,
			c_wqi4 ,			 
			c_wqi5 ,
			c_wqi6 ,
			c_wzhi1 ,			--ֹ����
			c_wzhi2 ,
			c_wzhi3 ,
			c_wzhi4 ,			 
			c_wzhi5 ,
			c_wzhi6 ,
			c_worknote1 ,			--��������
			c_worknote2 ,
			c_worknote3 ,
			c_worknote4 ,			 
			c_worknote5 ,
			c_worknote6 ,
			c_worker1 ,			--ְλ
			c_worker2 ,
			c_worker3 ,
			c_worker4 ,			 
			c_worker5 ,
			c_worker6 ,
			c_name1 ,
			c_name2 ,
			c_name3 , 
			c_call1 ,
			c_call2 ,
			c_call3 , 
			c_company1 ,
			c_company2 ,
			c_company3 , 
			c_address1 ,
			c_address2 ,
			c_address3 , 	
			c_note ,	  
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(  
			@c_prefix,
			@c_counter ,
			@c_orgid ,			--����id
			@c_jobnumber ,
			@c_name ,			--����
			@c_sex , 			--�Ա� 1���� 0��Ů
			@c_birthday ,			--��������
			@c_age ,			--����
			@c_nation ,			--����code
			@c_politics ,			--������òcode
			@c_education ,			--ѧ��code	
			@c_marriage ,			--����code	
			@c_healthy ,			--����code
			@c_blood  ,			--Ѫ��code	 
			@c_certificatetype ,		--֤������code
			@c_certificate ,		--֤������code
			@c_native ,			--����
			@c_registerplace ,		--�������ڵ�
			@c_livein ,			--��ס��
			@c_zipcode ,			--�ʱ�
			@c_telephone ,			--�̶��绰
			@c_mobilephone ,		--�ֻ�
			@c_email ,			--email
			@c_hobby ,			--���� 
			@c_contactname ,		--������ϵ������
			@c_contactphone ,		--������ϵ�˵绰	
			@c_foreign ,			--����ˮƽ
			@c_computer ,			--����ˮƽ
			@c_workdate,
			@c_bank,
			@c_bankcode,
			@c_qualificate,
			@c_sqi1 ,			--������
			@c_sqi2 ,
			@c_sqi3 ,
			@c_szhi1 ,			--ֹ����
			@c_szhi2 ,
			@c_szhi3 ,
			@c_school1 ,			--ѧУ
			@c_school2 ,
			@c_school3 ,
			@c_professional1 ,		--רҵ
			@c_professional2 ,
			@c_professional3 ,
			@c_wqi1 ,			--������
			@c_wqi2 ,
			@c_wqi3 ,
			@c_wqi4 ,			 
			@c_wqi5 ,
			@c_wqi6 ,
			@c_wzhi1 ,			--ֹ����
			@c_wzhi2 ,
			@c_wzhi3 ,
			@c_wzhi4 ,			 
			@c_wzhi5 ,
			@c_wzhi6 ,
			@c_worknote1 ,			--��������
			@c_worknote2 ,
			@c_worknote3 ,
			@c_worknote4 ,			 
			@c_worknote5 ,
			@c_worknote6 ,
			@c_worker1 ,			--ְλ
			@c_worker2 ,
			@c_worker3 ,
			@c_worker4 ,			 
			@c_worker5 ,
			@c_worker6 ,
			@c_name1 ,
			@c_name2 ,
			@c_name3 , 
			@c_call1 ,
			@c_call2 ,
			@c_call3 , 
			@c_company1 ,
			@c_company2 ,
			@c_company3 , 
			@c_address1 ,
			@c_address2 ,
			@c_address3 , 	
			@c_note ,	  
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)				
	end 
	if @c_jobnm='update'
	begin
		update t_staff set c_name=@c_name ,			--����
			c_sex=@c_sex , 				--�Ա� 1���� 0��Ů
			c_birthday=@c_birthday ,		--��������
			c_age=@c_age ,				--����
			c_nation=@c_nation ,			--����code
			c_politics=@c_politics ,		--������òcode
			c_education=@c_education ,		--ѧ��code	
			c_marriage=@c_marriage ,		--����code	
			c_healthy=@c_healthy ,			--����code
			c_blood=@c_blood  ,			--Ѫ��code	 
			c_certificatetype=@c_certificatetype ,	--֤������code
			c_certificate=@c_certificate ,		--֤������code
			c_native=@c_native ,			--����
			c_registerplace=@c_registerplace ,	--�������ڵ�
			c_livein=@c_livein ,			--��ס��
			c_zipcode=@c_zipcode ,			--�ʱ�
			c_telephone=@c_telephone ,		--�̶��绰
			c_mobilephone=@c_mobilephone ,		--�ֻ�
			c_email=@c_email ,			--email
			c_hobby=@c_hobby ,			--���� 
			c_contactname=@c_contactname ,		--������ϵ������
			c_contactphone=@c_contactphone ,	--������ϵ�˵绰	
			c_foreign=@c_foreign ,			--����ˮƽ
			c_computer=@c_computer ,		--����ˮƽ
			c_workdate=@c_workdate,
			c_bank=@c_bank,
			c_bankcode=@c_bankcode,
			c_qualificate=@c_qualificate,
			c_sqi1=@c_sqi1 ,			--������
			c_sqi2=@c_sqi2 ,
			c_sqi3=@c_sqi3 ,
			c_szhi1=@c_szhi1 ,			--ֹ����
			c_szhi2=@c_szhi2 ,
			c_szhi3=@c_szhi3 ,
			c_school1=@c_school1 ,			--ѧУ
			c_school2=@c_school2 ,
			c_school3=@c_school3 ,
			c_professional1=@c_professional1 ,	--רҵ
			c_professional2=@c_professional2 ,
			c_professional3=@c_professional3 ,
			c_wqi1=@c_wqi1 ,			--������
			c_wqi2=@c_wqi2 ,
			c_wqi3=@c_wqi3 ,
			c_wqi4=@c_wqi4 ,			 
			c_wqi5=@c_wqi5 ,
			c_wqi6=@c_wqi6 ,
			c_wzhi1=@c_wzhi1 ,			--ֹ����
			c_wzhi2=@c_wzhi2 ,
			c_wzhi3=@c_wzhi3 ,
			c_wzhi4=@c_wzhi4 ,			 
			c_wzhi5=@c_wzhi5 ,
			c_wzhi6=@c_wzhi6 ,
			c_worknote1=@c_worknote1 ,		--��������
			c_worknote2=@c_worknote2 ,
			c_worknote3=@c_worknote3 ,
			c_worknote4=@c_worknote4 ,		
			c_worknote5=@c_worknote5 ,
			c_worknote6=@c_worknote6 ,
			c_worker1=@c_worker1 ,			--ְλ
			c_worker2=@c_worker2 ,
			c_worker3=@c_worker3 ,
			c_worker4=@c_worker4 ,			 
			c_worker5=@c_worker5 ,
			c_worker6=@c_worker6 ,
			c_name1=@c_name1 ,
			c_name2=@c_name2 ,
			c_name3=@c_name3 , 
			c_call1=@c_call1 ,
			c_call2=@c_call2 ,
			c_call3=@c_call3 , 
			c_company1=@c_company1 ,
			c_company2=@c_company2 ,
			c_company3=@c_company3 , 
			c_address1=@c_address1 ,
			c_address2=@c_address2 ,
			c_address3=@c_address3 , 	
			c_note=@c_note ,
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,			 
			c_ip=@c_ip 
		where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_staff  where c_no=@c_no
	end 
	select @c_jobnumber c_jobnumber
return 0
go
--��λ�����
if exists(select name from sysobjects where name='p_postset')
	drop procedure p_postset
go
create procedure p_postset   	
	@c_no int ,
	@c_jobnumber char(10),	--����
	@c_orgid int ,		--����id  
	@c_postid int ,		--��λid  
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as
declare	@c_datime		datetime,		--����ʱ��  
	@c_pwd			char(64),		--����
	@c_code			char(2) ,		-- 	
	@c_type			int			--id	  
	set @c_pwd='e10adc3949ba59abbe56e057f20f883e'	--���ģ�123456
	set @c_datime=getdate()		
	if @c_jobnm='add'
	begin			
		if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
		begin		
			raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
			return @@error
		end
		begin transaction  tr_postset 				
		insert  t_postset   	
		(	
			c_jobnumber ,		--����
			c_orgid, 
			c_postid ,		--��λid  
			c_jobnm ,
			c_operator ,
			c_ip
		) 
		values
		(
			@c_jobnumber ,		--����
			@c_orgid, 
			@c_postid ,		--��λid  
			@c_jobnm ,
			@c_operator ,
			@c_ip
		)	
		if @@error<>0  
		begin
			raiserror ('Ա����λ���䱨��', 16, 1)
			rollback transaction tr_postset
			return 0
		end 		 
		if not exists (select * from t_login where c_jobnumber=@c_jobnumber )
		begin		
			insert  t_login
			( 
				c_jobnumber,				--����
				c_pwd,					--����				 
				c_jobnm,				--��ҵ����
				c_operator,				--����Ա 
				c_ip					--�������Ե�ip��ַ
			) 
			values
			( 
				@c_jobnumber,				--����
				@c_pwd,					--����				 
				@c_jobnm,				--��ҵ����
				@c_operator,				--����Ա
				@c_ip					--�������Ե�ip��ַ
			)			
			if @@error<>0  
			begin
				raiserror ('��½��д�뱨��', 16, 1)
				rollback transaction tr_postset
				return 0
			end	
		end
				  
		commit transaction tr_postset		 			
	end
	if @c_jobnm='update'
	begin	 	
		if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
		begin		
			raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
			return @@error
		end			
		update t_postset set c_jobnumber=@c_jobnumber ,		--����
			c_orgid=@c_orgid, 
			c_postid=@c_postid ,				--��λid  
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,
			c_datime=@c_datime,
			c_ip=@c_ip		
		where c_no=@c_no		
		 
	end	
	if @c_jobnm='del'
	begin	 				
		delete t_postset where c_no=@c_no		
		if not exists(select * from t_postset where c_jobnumber=@c_jobnumber)
		begin
			delete t_login where c_jobnumber=@c_jobnumber	
		end
	end	 
return 0 
go
--Ա��н��ȼ�
if exists(select name from sysobjects where name='p_payset')
	drop procedure p_payset
go
create procedure p_payset   	
	@c_no int ,
	@c_jobnumber char(10),	--����
	@c_pclass int ,		--н��ȼ�id 
	@c_state int ,		--��˾״̬   
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as
declare	@c_datime		datetime		--����ʱ��   
	set @c_datime=getdate()		
	if @c_jobnm='add'
	begin			
		if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
		begin		
			raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
			return @@error
		end
		begin transaction  tr_payset 				
		insert  t_payset   	
		(	
			c_jobnumber ,		--����
			c_pclass,
			c_state,			 
			c_jobnm ,
			c_operator ,
			c_ip
		) 
		values
		(
			@c_jobnumber ,		--����
			@c_pclass,
			@c_state,	
			@c_jobnm ,
			@c_operator ,
			@c_ip
		)	
		if @@error<>0  
		begin
			raiserror ('Ա��н��ȼ����ñ���', 16, 1)
			rollback transaction tr_payset
			return 0
		end 	 
				  
		commit transaction tr_payset		 			
	end
	if @c_jobnm='pclass'
	begin	 	
		if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
		begin		
			raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
			return @@error
		end			
		update t_payset set c_jobnumber=@c_jobnumber ,		--����
			c_pclass=@c_pclass,			 
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,
			c_datime=@c_datime,
			c_ip=@c_ip		
		where c_no=@c_no		
		 
	end
	if @c_jobnm='state'
	begin	 	
		if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
		begin		
			raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
			return @@error
		end			
		update t_payset set c_jobnumber=@c_jobnumber ,		--����
			c_state=@c_state,		 
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,
			c_datime=@c_datime,
			c_ip=@c_ip		
		where c_no=@c_no		
		 
	end	
	if @c_jobnm='del'
	begin	 				
		delete t_payset where c_no=@c_no			 
	end	 
return 0 
go
--Ա��ɾ��  
if exists(select name from sysobjects where name='p_staffdel')
	drop procedure p_staffdel
go
create procedure p_staffdel  
	@c_jobnumber char(10) 	--����	 
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	
	if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
	begin		
		raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
		return @@error
	end
	 
	delete t_staff where c_jobnumber =@c_jobnumber
	
	delete t_postset where c_jobnumber =@c_jobnumber 
	
	delete t_payset where c_jobnumber =@c_jobnumber 
	
	delete t_login where c_jobnumber =@c_jobnumber 
	 
	delete t_staffqx where c_jobnumber =@c_jobnumber 
	
	delete t_agentset where c_jobnumber=@c_jobnumber
return 0 
go
--Ա��Ȩ��  
if exists(select name from sysobjects where name='p_staffqx')
	drop procedure p_staffqx
go
create procedure p_staffqx  
	@c_jobnumber char(10) ,	--����
	@c_xitong char (1),
	@c_menu varchar (1000), 
	@c_operator char(10) ,	
	@c_ip char (25)
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	
	if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
	begin		
		raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
		return @@error
	end
	if not exists(select * from t_staffqx where c_jobnumber=@c_jobnumber and c_xitong=@c_xitong )
	begin
		insert  t_staffqx   	
		(	
			c_jobnumber, 
			c_xitong,
			c_menu, 
			c_operator,
			c_ip 
		) 
		values
		(
			@c_jobnumber, 
			@c_xitong,
			@c_menu,
 			@c_operator,
			@c_ip 
		)	
	end
	else
	begin
		update t_staffqx set			 		
		 	c_jobnumber=@c_jobnumber, 
			c_xitong=@c_xitong,
			c_menu=@c_menu, 
			c_operator=@c_operator,
			c_ip=@c_ip 			
		where c_jobnumber=@c_jobnumber and c_xitong=@c_xitong
	end 	 
return 0 
go 
--�������������� 
if exists(select name from sysobjects where name='p_orghead')
	drop procedure p_orghead
go
create procedure p_orghead
	@c_orgid int ,		--����id
	@c_jobnumber char(10)	--���� 
as 
	update t_organization 
		set  c_jobnumber=@c_jobnumber
		where c_no=@c_orgid	 
return 0
go
--Ա��Ȩ�޲�ѯ 
if exists(select name from sysobjects where name='p_staffqxcx')
	drop procedure p_staffqxcx
go
create procedure p_staffqxcx
	@c_jobnumber char(10),	--����
	@c_xitong char(1)	--ϵͳ����	
as 
declare	@c_postid 	int  ,	--��λid
	@c_s	 	varchar(2000),
	@c_menu 	varchar(5000)
	set @c_menu=''  
	declare c_staffqxcx cursor for
	select  c_postid from t_postset where c_jobnumber = @c_jobnumber  
	open	c_staffqxcx
	fetch	next from c_staffqxcx into @c_postid
	while	(@@fetch_status = 0)
	begin	
		set @c_s=''  	
		select @c_s=c_menu from t_postqx where c_postid=@c_postid and c_xitong=@c_xitong
		set @c_menu=ltrim(rtrim(@c_menu))+ltrim(rtrim(@c_s))
		fetch	next from c_staffqxcx into @c_postid
	end
	close c_staffqxcx
	deallocate c_staffqxcx
	 
	set @c_s=''  
	select @c_s=c_menu from t_staffqx where c_jobnumber=@c_jobnumber and c_xitong=@c_xitong
	set @c_menu=ltrim(rtrim(@c_menu))+ltrim(rtrim(@c_s))
	select  @c_menu c_menu
return 0
go 
--Ա����¼
if exists(select name from sysobjects where name='p_login')
	drop procedure p_login
go
create procedure p_login 
	@c_jobnumber char(10),	--����
	@c_pwd	char(64)	--����	
as 	 
	if not exists (select * from t_login where c_jobnumber=@c_jobnumber and c_pwd=@c_pwd)
	begin		
		raiserror ('���Ż����벻��ȷ��', 16, 1 )
		return @@error
	end 
	select @c_jobnumber c_jobnumber
return 0
go
--�����޸�
if exists(select name from sysobjects where name='p_pwdreset')
	drop procedure p_pwdreset
go
create procedure p_pwdreset   	 
	@c_jobnumber 	char(10),		--����
	@c_pwd		char(64),		--����	  	
	@c_operator 	char(10),		--����Ա	
	@c_ip		char(25) 		--����Աip	
as
declare	@c_datime	datetime		--����ʱ�� 		
	set @c_datime=getdate()	
	if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
	begin		
		raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
		return @@error
	end
	if not exists (select * from t_login where c_jobnumber=@c_jobnumber )
	begin		
		raiserror ('���ţ�%s ���Ƶ�¼', 16, 1, @c_jobnumber)
		return @@error
	end 
	update t_login set c_pwd=@c_pwd, 
			c_jobnm='reset',
			c_operator=@c_operator,
			c_datime=@c_datime ,
			c_ip=@c_ip 
		where c_jobnumber=@c_jobnumber 
return 0 
go 
--Ա����ְ
if exists(select name from sysobjects where name='p_staffquit')
	drop procedure p_staffquit
go
create procedure p_staffquit  
	@c_jobnumber 	char(10),		--���� 
	@c_operator 	char(10),	
	@c_ip 		char (25)
as 
declare	@c_datime	datetime		--����ʱ�� 		
	set @c_datime=getdate()	
	if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
	begin		
		raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
		return @@error
	end	
	
	update t_staff set c_quitdate=convert(char(8),@c_datime,112) ,
			c_jobnm='quit',
			c_operator=@c_operator, 
			c_ip=@c_ip 
		where c_jobnumber=@c_jobnumber
	delete t_postset where c_jobnumber=@c_jobnumber
	delete t_payset where c_jobnumber =@c_jobnumber 
	delete t_login where c_jobnumber=@c_jobnumber		
	delete t_staffqx where c_jobnumber=@c_jobnumber
	update t_agentset set c_flag='1',c_jobnm='ls' 
		where c_jobnumber=@c_jobnumber and c_flag='0'  
return 0
go
--н�����
if exists(select name from sysobjects where name='p_pcategory')
	drop procedure p_pcategory
go
create procedure p_pcategory  
	@c_no int ,  
	@c_name char(30) ,	 
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_pcategory
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
		update t_pcategory set 
			c_name=@c_name , 
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end
	
	if @c_jobnm='del'
	begin	
		delete t_pcategory where c_no=@c_no
	end 
return 0 
go 
--н��ȼ�
if exists(select name from sysobjects where name='p_pclass')
	drop procedure p_pclass
go
create procedure p_pclass  
	@c_no int ,  
	@c_pcategory int ,
	@c_name char(30) ,	 
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_pclass
	 	(		   
	 		c_pcategory ,
			c_name , 	 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 		
	 		@c_pcategory , 
			@c_name ,	 
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_pclass set 
			c_name=@c_name , 
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end
	
	if @c_jobnm='del'
	begin	
		delete t_pclass where c_no=@c_no
	end 
return 0 
go 
--н����Ŀ
if exists(select name from sysobjects where name='p_pproject')
	drop procedure p_pproject
go
create procedure p_pproject  
	@c_no int ,  
	@c_type int ,
	@c_name char(30) ,	 
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_pproject
	 	(		   
	 		c_type ,
			c_name , 	 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 		
	 		@c_type , 
			@c_name ,	 
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_pproject set  
			c_name=@c_name , 
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end
	
	if @c_jobnm='del'
	begin	
		delete t_pproject where c_no=@c_no
	end 
return 0 
go 
--н���籣
if exists(select name from sysobjects where name='p_psocial')
	drop procedure p_psocial
go
create procedure p_psocial  
	@c_no int ,  
	@c_orgid int ,
	@c_pclass int ,
	@c_pproject int , 
	@c_base decimal(15, 2) ,	
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_psocial
	 	(		  
	 		c_orgid ,  
	 		c_pclass ,
			c_pproject ,
			c_base , 	 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 		
	 		@c_orgid ,
	 		@c_pclass , 
			@c_pproject ,
			@c_base ,  
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_psocial set   
			c_pclass=@c_pclass ,
			c_pproject=@c_pproject ,
			c_base=@c_base ,  
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end
	
	if @c_jobnm='del'
	begin	
		delete t_psocial where c_no=@c_no
	end 
return 0 
go 
--н�������׼
if exists(select name from sysobjects where name='p_pstandard')
	drop procedure p_pstandard
go
create procedure p_pstandard  
	@c_no int ,  
	@c_pclass int ,
	@c_pproject int ,
	@c_base decimal(15, 2) ,	
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_pstandard
	 	(		   
	 		c_pclass ,
			c_pproject ,
			c_base , 	 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 		
	 		@c_pclass ,
			@c_pproject ,
			@c_base ,  
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_pstandard set 
			c_pclass=@c_pclass ,
			c_pproject=@c_pproject ,
			c_base=@c_base ,  
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end
	
	if @c_jobnm='del'
	begin	
		delete t_pstandard where c_no=@c_no
	end 
return 0 
go
--н�����ϵ��
if exists(select name from sysobjects where name='p_pcoefficient')
	drop procedure p_pcoefficient
go
create procedure p_pcoefficient  
	@c_no int ,   
	@c_var char(30) ,  --  ����ϵ������
	@c_name char(50) , --  ��Ӧָ������
	@c_input int ,
	@c_period int ,	
	@c_o int ,	   --  ��ַ
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_pcoefficient
	 	(		   
	 		c_var ,
			c_name , 
			c_input ,	
			c_period , 
			c_o ,
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 		
	 		@c_var ,
			@c_name , 
			@c_input ,	
			@c_period , 
			@c_o ,
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_pcoefficient set 
			c_var=@c_var ,
			c_name=@c_name , 
			c_input=@c_input ,	
			c_period=@c_period ,
			c_o=@c_o ,
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end
	
	if @c_jobnm='del'
	begin	
		delete t_pcoefficient where c_no=@c_no
	end 
return 0 
go
--н�����ϵ�����ñ����Źҹ���
if exists(select name from sysobjects where name='p_pcoefficientset')
	drop procedure p_pcoefficientset
go
create procedure p_pcoefficientset  
	@c_no int ,    
	@c_pcoefficient int ,
	@c_year int ,	
	@c_number int ,	
	@c_orgid int ,
	@c_jobnumber char(10) ,
	@c_value decimal(15, 2) ,
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_pcoefficientset
	 	(	
	 		c_pcoefficient ,	
	 		c_year ,
	 		c_number ,
			c_orgid , 
			c_jobnumber ,	
			c_value , 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 		
	 		@c_pcoefficient ,	
	 		@c_year ,
	 		@c_number ,
			@c_orgid , 
			@c_jobnumber ,	
			@c_value , 
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_pcoefficientset set 
			c_pcoefficient=@c_pcoefficient ,	
	 		c_year=@c_year ,
	 		c_number=@c_number ,
			c_orgid=@c_orgid , 
			c_jobnumber=@c_jobnumber ,	
			c_value=@c_value , 
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end
	
	if @c_jobnm='del'
	begin	
		delete t_pcoefficientset where c_no=@c_no
	end 
return 0 
go
--н��������
if exists(select name from sysobjects where name='p_pmamount')
	drop procedure p_pmamount
go
create procedure p_pmamount   	
	@c_no int ,
	@c_year int ,	
	@c_month int ,	
	@c_orgid int ,
	@c_jobnumber char(10) ,
	@c_str char(600) , 
	@c_result decimal(15,2) ,
	@c_jobnm char(10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_pmamount
	 	(	 	
	 		c_year ,
	 		c_month ,
	 		c_orgid , 
			c_jobnumber ,	
			c_str ,
			c_result , 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 		
	 		@c_year ,
	 		@c_month ,
	 		@c_orgid , 
			@c_jobnumber ,	
			@c_str ,
			@c_result , 
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_pmamount set 
			c_jobnumber=@c_jobnumber ,	
			c_str=@c_str ,
			c_result=@c_result , 
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end
	
	if @c_jobnm='del'
	begin	
		delete t_pmamount where c_no=@c_no
	end 
return 0 
go
--������Ŀ
if exists(select name from sysobjects where name='p_ontype')
	drop procedure p_ontype
go
create procedure p_ontype  
	@c_no int ,  
	@c_name char(30) ,	
	@c_code char(1) ,  
	@c_state int ,			-- ��� 0 ����״̬ 1 �ۿ�״̬	
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_ontype
	 	(		   
			c_name ,
			c_code , 
			c_state , 	 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 	 
			@c_name ,	
			@c_code ,	 
			@c_state , 
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_ontype set 
			c_name=@c_name ,	 
			c_code=@c_code , 
			c_state=@c_state , 
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end 
	if @c_jobnm='del'
	begin	
		delete t_ontype where c_no=@c_no
	end 
return 0 
go 
--����������Ŀ
if exists(select name from sysobjects where name='p_ontype2')
	drop procedure p_ontype2
go
create procedure p_ontype2  
	@c_no int , 
	@c_orgid int ,			--����id  
	@c_ontype int ,			--������Ŀid
	@c_type int ,			-- 1 һ�� 2 һ��
	@c_deducted decimal(15, 2) ,
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_ontype2
	 	(		 
	 		c_orgid ,	 
			c_ontype , 
			c_type ,
			c_deducted ,		 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 		 
	 		@c_orgid ,
			@c_ontype ,	 
			@c_type ,
			@c_deducted ,
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_ontype2 set 			 
			c_type=@c_type ,
			c_deducted=@c_deducted ,
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end  
	if @c_jobnm='del'
	begin	
		delete t_ontype2 where c_no=@c_no
	end 
return 0 
go 
--���Ź���
if exists(select name from sysobjects where name='p_onrelate')
	drop procedure p_onrelate
go
create procedure p_onrelate  
	@c_no int , 
	@c_orgid int , 
	@c_jobnumber char(10) , 
	@c_code char(30) ,	
	@c_jobnm char (10) , 
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_onrelate
	 	(		 	 
			c_orgid ,		 
			c_jobnumber ,
			c_code ,
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 		 
			@c_orgid ,		 
			@c_jobnumber ,
			@c_code ,
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_onrelate set  
			c_jobnumber=@c_jobnumber ,
			c_code=@c_code ,
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end 
	if @c_jobnm='del'
	begin	
		delete t_onrelate where c_no=@c_no
	end 
return 0 
go
--���ڼ�¼����
if exists(select name from sysobjects where name='p_onimport')
	drop procedure p_onimport
go
create procedure p_onimport   
	@c_orgid int ,		--����id 
	@c_sno char(30) ,	--���
	@c_date char(8) ,	--����
	@c_morning char(1)  ,	--
	@c_afternoon char(1)  ,	--
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_jobnumber char(10) ,
	@c_morning2 int  ,	--
	@c_afternoon2 int  ,	--
	@c_tempdate char(8)  ,	--
	@c_datime	datetime	--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='import'
	begin	
		if exists ( select * from t_onrelate where c_orgid=@c_orgid and c_code=@c_sno )
		begin
			select @c_jobnumber=c_jobnumber from t_onrelate where c_orgid=@c_orgid and c_code=@c_sno			
		end
		else
		begin
			if exists ( select * from t_staff  where c_jobnumber=@c_sno )
			begin
				select @c_jobnumber=@c_sno
			end
			else
			begin
				raiserror ('��ţ�%s ��Ч��', 16, 1, @c_sno)
				return @@error
			end 
		end
		set @c_tempdate=convert(char(8),convert(datetime, @c_date),112)	
		if not exists ( select * from t_ontype where c_code=@c_morning ) 
		begin
			raiserror ('��ţ�%s ����: %s ����', 16, 1, @c_sno,@c_date)
			return @@error
		end		
		if not exists ( select * from t_ontype where c_code=@c_afternoon ) 
		begin
			raiserror ('��ţ�%s ����: %s ����', 16, 1, @c_sno,@c_date)
			return @@error
		end
		select @c_morning2=c_no from t_ontype where c_code=@c_morning
		select @c_afternoon2=c_no from t_ontype where c_code=@c_afternoon 	
	 	insert t_onduty
	 	(
		 	c_orgid ,		--����id 
			c_jobnumber ,		--����
			c_date ,		--����
			c_morning ,
			c_afternoon , 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(
	 		@c_orgid ,		--����id 
			@c_jobnumber ,		--����
			@c_tempdate ,		--����
			@c_morning2 ,
			@c_afternoon2 , 
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end	 
return 0 
go 
--���ڼ�¼¼�� 
if exists(select name from sysobjects where name='p_onduty')
	drop procedure p_onduty
go
create procedure p_onduty  
	@c_no int ,
	@c_orgid int ,		--����id 
	@c_jobnumber char(10) ,	--����
	@c_date char(8) ,	--����
	@c_morning int  ,	--
	@c_afternoon int  ,	-- 
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_onduty
	 	(
		 	c_orgid ,		--����id 
			c_jobnumber ,		--����
			c_date ,		--����
			c_morning ,
			c_afternoon , 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(
	 		@c_orgid ,		--����id 
			@c_jobnumber ,		--����
			@c_date ,		--����
			@c_morning ,
			@c_afternoon , 
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_onduty set 
			c_morning=@c_morning ,
			c_afternoon=@c_afternoon , 	 
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end
	if @c_jobnm='del'
	begin	
		delete t_onduty where c_no=@c_no
	end 
return 0 
go 
--���ڻ��ܱ�
if exists(select name from sysobjects where name='p_onsummary')
	drop procedure p_onsummary
go
create procedure p_onsummary  
	@c_no int ,
	@c_orgid int ,			--����id 
	@c_year int ,			--��
	@c_month int ,			--�� 
	@c_jobnumber char(10) ,		--����
	@c_deducted decimal(15, 2), 	--�۳����
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_onsummary
	 	(
		 	c_orgid ,		--����id 
		 	c_year ,
		 	c_month ,
			c_jobnumber ,		--����
			c_deducted ,		--			 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(
	 		@c_orgid ,		--����id 
			@c_year ,
		 	@c_month ,
			@c_jobnumber ,		--����
			@c_deducted ,		--	
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end	 
	if @c_jobnm='del'
	begin	
		delete t_onsummary where c_no=@c_no
	end 
return 0 
go 
--��������
if exists(select name from sysobjects where name='p_bankoutlets')
	drop procedure p_bankoutlets
go
create procedure p_bankoutlets  
	@c_no int ,  
	@c_orgid int ,			--����id 
	@c_bank char (4)  ,		--���д���
	@c_code char(30) ,		--�������	 
	@c_name char(50) ,		--��������
	@c_phone char(30) ,		--�绰	
	@c_address char(50) ,		--��ַ	
	@c_jobnm char (10) ,
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
	 	insert t_bankoutlets
	 	(		   
	 		c_orgid ,
	 		c_bank , 	
	 		c_code , 
			c_name ,
			c_phone ,
			c_address ,			 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 	 
	 		@c_orgid ,
			@c_bank , 
			@c_code ,	
			@c_name , 
			@c_phone ,
			@c_address ,
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end
	if @c_jobnm='update'
	begin	
		update t_bankoutlets set  	
			c_bank=@c_bank , 
			c_code=@c_code ,	
			c_name=@c_name , 
			c_phone=@c_phone ,
			c_address=@c_address ,
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,		 
			c_ip=@c_ip 
		where c_no=@c_no
	end 
	if @c_jobnm='del'
	begin	
		delete t_bankoutlets where c_no=@c_no
		delete t_bankrelate where c_outletsid=@c_no
	end 
return 0 
go 
--�����������
if exists(select name from sysobjects where name='p_bankrelate')
	drop procedure p_bankrelate
go
create procedure p_bankrelate  
	@c_no int ,  
	@c_orgid int ,			--����id 
	@c_outletsid int ,		--����id
	@c_jobnumber char(10) ,		--����רԱ����	 
	@c_ksrq char(8) ,		--��ʼ����  
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--����ʱ�� 		
	set @c_datime=getdate()	 
	if @c_jobnm='set'
	begin	
		--��������
		if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=2 and c_jobnumber=@c_jobnumber and c_flag='0' )
		begin
			raiserror ('���ţ�%s ��Ч��', 16, 1, @c_jobnumber)
			return @@error
		end		
		update  t_bankrelate set c_flag='1',c_jsrq=convert(char(8),@c_datime,112)
				where c_orgid=@c_orgid and c_outletsid=@c_outletsid and c_flag='0'				
	 	insert t_bankrelate
	 	(		    
	 		c_orgid ,		--����id 
			c_outletsid ,		--����id
			c_jobnumber ,		--����רԱ����	 
			c_ksrq ,		--��ʼ���� 
			c_jsrq ,		--�������� 	 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 	  
	 		@c_orgid ,		--����id 
			@c_outletsid ,		--����id
			@c_jobnumber ,		--����רԱ����	 
			@c_ksrq ,		--��ʼ���� 
			'20990101' ,		--�������� 	 
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end	 
	if @c_jobnm='del'
	begin	
		update  t_bankrelate set c_flag='1',c_jsrq=convert(char(8),@c_datime,112)
				where c_no=@c_no
	end 
return 0 
go 