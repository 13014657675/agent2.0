--员工过程
if exists(select name from sysobjects where name='p_staff')
	drop procedure p_staff
go
create procedure p_staff
	@c_no int ,  				--工号  
	@c_orgid int ,				--机构id
	@c_name char (20) ,			--姓名
	@c_sex char (1) , 			--性别 1，男 0，女
	@c_birthday char (10) ,			--出生日期
	@c_age int ,				--年龄
	@c_nation char (4) ,			--民族code	
	@c_politics char (4) ,			--政治面貌code
	@c_education char (4) ,			--学历code	
	@c_marriage char (1) ,			--婚姻code	
	@c_healthy char (4) ,			--健康code	
	@c_blood  char (4)  ,			--血型code	 
	@c_certificatetype char (4) ,		--证件类型code
	@c_certificate char (50)  ,		--证件号码code
	@c_native char (30) ,			--籍贯
	@c_registerplace char (50) ,		--户口所在地	
	@c_livein char (50) ,			--常住地
	@c_zipcode char (10)  ,			--邮编
	@c_telephone char (20) ,		--固定电话
	@c_mobilephone char (20) ,		--手机
	@c_email char (30)  ,			--email	
	@c_hobby char (30)  ,			--爱好 
	@c_contactname char (20) ,		--紧急联系人姓名
	@c_contactphone char (20) ,		--紧急联系人电话	
	@c_foreign char (30) ,			--外语水平
	@c_computer char (30) ,			--电脑水平	
	@c_workdate char (8) ,			--参加工作日期 
	@c_bank char (4)   ,			--银行
	@c_bankcode char (50) ,			--银行卡号
	@c_qualificate char(50) ,		--资格证号
	@c_sqi1 char (10)  ,			--起日期
	@c_sqi2 char (10)  ,
	@c_sqi3 char (10)  ,
	@c_szhi1 char (10) ,			--止日期
	@c_szhi2 char (10) ,
	@c_szhi3 char (10) ,
	@c_school1 char (50) ,			--学校
	@c_school2 char (50) ,
	@c_school3 char (50) ,
	@c_professional1 char (30)  ,		--专业
	@c_professional2 char (30)  ,
	@c_professional3 char (30)  ,
	@c_wqi1 char (10)  ,			--起日期
	@c_wqi2 char (10)  ,
	@c_wqi3 char (10)  ,
	@c_wqi4 char (10)  ,			 
	@c_wqi5 char (10)  ,
	@c_wqi6 char (10)  ,
	@c_wzhi1 char (10) ,			--止日期
	@c_wzhi2 char (10) ,
	@c_wzhi3 char (10) ,
	@c_wzhi4 char (10) ,			 
	@c_wzhi5 char (10) ,
	@c_wzhi6 char (10) ,
	@c_worknote1 char (50)  ,		--工作经历
	@c_worknote2 char (50)  ,
	@c_worknote3 char (50)  ,
	@c_worknote4 char (50)  ,		 
	@c_worknote5 char (50)  ,
	@c_worknote6 char (50)  ,
	@c_worker1 char (30)  ,			--职位
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
	@c_jobnumber char(10),		--工号
	@c_datime   datetime		--操作时间 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 	
		--获取机构前缀
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
		--生成工号
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
			c_name ,			--姓名
			c_sex , 			--性别 1，男 0，女
			c_birthday ,			--出生日期
			c_age ,				--年龄
			c_nation ,			--民族code
			c_politics ,			--政治面貌code
			c_education ,			--学历code	
			c_marriage ,			--婚姻code	
			c_healthy ,			--健康code
			c_blood  ,			--血型code	 
			c_certificatetype ,		--证件类型code
			c_certificate ,			--证件号码code
			c_native ,			--籍贯
			c_registerplace ,		--户口所在地
			c_livein ,			--常住地
			c_zipcode ,			--邮编
			c_telephone ,			--固定电话
			c_mobilephone ,			--手机
			c_email ,			--email
			c_hobby ,			--爱好 
			c_contactname ,			--紧急联系人姓名
			c_contactphone ,		--紧急联系人电话	
			c_foreign ,			--外语水平
			c_computer ,			--电脑水平
			c_workdate,
			c_bank,
			c_bankcode,
			c_qualificate,
			c_sqi1 ,			--起日期
			c_sqi2 ,
			c_sqi3 ,
			c_szhi1 ,			--止日期
			c_szhi2 ,
			c_szhi3 ,
			c_school1 ,			--学校
			c_school2 ,
			c_school3 ,
			c_professional1 ,		--专业
			c_professional2 ,
			c_professional3 ,
			c_wqi1 ,			--起日期
			c_wqi2 ,
			c_wqi3 ,
			c_wqi4 ,			 
			c_wqi5 ,
			c_wqi6 ,
			c_wzhi1 ,			--止日期
			c_wzhi2 ,
			c_wzhi3 ,
			c_wzhi4 ,			 
			c_wzhi5 ,
			c_wzhi6 ,
			c_worknote1 ,			--工作经历
			c_worknote2 ,
			c_worknote3 ,
			c_worknote4 ,			 
			c_worknote5 ,
			c_worknote6 ,
			c_worker1 ,			--职位
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
			@c_orgid ,			--机构id
			@c_jobnumber ,
			@c_name ,			--姓名
			@c_sex , 			--性别 1，男 0，女
			@c_birthday ,			--出生日期
			@c_age ,			--年龄
			@c_nation ,			--民族code
			@c_politics ,			--政治面貌code
			@c_education ,			--学历code	
			@c_marriage ,			--婚姻code	
			@c_healthy ,			--健康code
			@c_blood  ,			--血型code	 
			@c_certificatetype ,		--证件类型code
			@c_certificate ,		--证件号码code
			@c_native ,			--籍贯
			@c_registerplace ,		--户口所在地
			@c_livein ,			--常住地
			@c_zipcode ,			--邮编
			@c_telephone ,			--固定电话
			@c_mobilephone ,		--手机
			@c_email ,			--email
			@c_hobby ,			--爱好 
			@c_contactname ,		--紧急联系人姓名
			@c_contactphone ,		--紧急联系人电话	
			@c_foreign ,			--外语水平
			@c_computer ,			--电脑水平
			@c_workdate,
			@c_bank,
			@c_bankcode,
			@c_qualificate,
			@c_sqi1 ,			--起日期
			@c_sqi2 ,
			@c_sqi3 ,
			@c_szhi1 ,			--止日期
			@c_szhi2 ,
			@c_szhi3 ,
			@c_school1 ,			--学校
			@c_school2 ,
			@c_school3 ,
			@c_professional1 ,		--专业
			@c_professional2 ,
			@c_professional3 ,
			@c_wqi1 ,			--起日期
			@c_wqi2 ,
			@c_wqi3 ,
			@c_wqi4 ,			 
			@c_wqi5 ,
			@c_wqi6 ,
			@c_wzhi1 ,			--止日期
			@c_wzhi2 ,
			@c_wzhi3 ,
			@c_wzhi4 ,			 
			@c_wzhi5 ,
			@c_wzhi6 ,
			@c_worknote1 ,			--工作经历
			@c_worknote2 ,
			@c_worknote3 ,
			@c_worknote4 ,			 
			@c_worknote5 ,
			@c_worknote6 ,
			@c_worker1 ,			--职位
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
		update t_staff set c_name=@c_name ,			--姓名
			c_sex=@c_sex , 				--性别 1，男 0，女
			c_birthday=@c_birthday ,		--出生日期
			c_age=@c_age ,				--年龄
			c_nation=@c_nation ,			--民族code
			c_politics=@c_politics ,		--政治面貌code
			c_education=@c_education ,		--学历code	
			c_marriage=@c_marriage ,		--婚姻code	
			c_healthy=@c_healthy ,			--健康code
			c_blood=@c_blood  ,			--血型code	 
			c_certificatetype=@c_certificatetype ,	--证件类型code
			c_certificate=@c_certificate ,		--证件号码code
			c_native=@c_native ,			--籍贯
			c_registerplace=@c_registerplace ,	--户口所在地
			c_livein=@c_livein ,			--常住地
			c_zipcode=@c_zipcode ,			--邮编
			c_telephone=@c_telephone ,		--固定电话
			c_mobilephone=@c_mobilephone ,		--手机
			c_email=@c_email ,			--email
			c_hobby=@c_hobby ,			--爱好 
			c_contactname=@c_contactname ,		--紧急联系人姓名
			c_contactphone=@c_contactphone ,	--紧急联系人电话	
			c_foreign=@c_foreign ,			--外语水平
			c_computer=@c_computer ,		--电脑水平
			c_workdate=@c_workdate,
			c_bank=@c_bank,
			c_bankcode=@c_bankcode,
			c_qualificate=@c_qualificate,
			c_sqi1=@c_sqi1 ,			--起日期
			c_sqi2=@c_sqi2 ,
			c_sqi3=@c_sqi3 ,
			c_szhi1=@c_szhi1 ,			--止日期
			c_szhi2=@c_szhi2 ,
			c_szhi3=@c_szhi3 ,
			c_school1=@c_school1 ,			--学校
			c_school2=@c_school2 ,
			c_school3=@c_school3 ,
			c_professional1=@c_professional1 ,	--专业
			c_professional2=@c_professional2 ,
			c_professional3=@c_professional3 ,
			c_wqi1=@c_wqi1 ,			--起日期
			c_wqi2=@c_wqi2 ,
			c_wqi3=@c_wqi3 ,
			c_wqi4=@c_wqi4 ,			 
			c_wqi5=@c_wqi5 ,
			c_wqi6=@c_wqi6 ,
			c_wzhi1=@c_wzhi1 ,			--止日期
			c_wzhi2=@c_wzhi2 ,
			c_wzhi3=@c_wzhi3 ,
			c_wzhi4=@c_wzhi4 ,			 
			c_wzhi5=@c_wzhi5 ,
			c_wzhi6=@c_wzhi6 ,
			c_worknote1=@c_worknote1 ,		--工作经历
			c_worknote2=@c_worknote2 ,
			c_worknote3=@c_worknote3 ,
			c_worknote4=@c_worknote4 ,		
			c_worknote5=@c_worknote5 ,
			c_worknote6=@c_worknote6 ,
			c_worker1=@c_worker1 ,			--职位
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
--岗位分配表
if exists(select name from sysobjects where name='p_postset')
	drop procedure p_postset
go
create procedure p_postset   	
	@c_no int ,
	@c_jobnumber char(10),	--工号
	@c_orgid int ,		--机构id  
	@c_postid int ,		--岗位id  
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as
declare	@c_datime		datetime,		--操作时间  
	@c_pwd			char(64),		--密码
	@c_code			char(2) ,		-- 	
	@c_type			int			--id	  
	set @c_pwd='e10adc3949ba59abbe56e057f20f883e'	--明文：123456
	set @c_datime=getdate()		
	if @c_jobnm='add'
	begin			
		if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
		begin		
			raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
			return @@error
		end
		begin transaction  tr_postset 				
		insert  t_postset   	
		(	
			c_jobnumber ,		--工号
			c_orgid, 
			c_postid ,		--岗位id  
			c_jobnm ,
			c_operator ,
			c_ip
		) 
		values
		(
			@c_jobnumber ,		--工号
			@c_orgid, 
			@c_postid ,		--岗位id  
			@c_jobnm ,
			@c_operator ,
			@c_ip
		)	
		if @@error<>0  
		begin
			raiserror ('员工岗位分配报错！', 16, 1)
			rollback transaction tr_postset
			return 0
		end 		 
		if not exists (select * from t_login where c_jobnumber=@c_jobnumber )
		begin		
			insert  t_login
			( 
				c_jobnumber,				--工号
				c_pwd,					--密码				 
				c_jobnm,				--作业名称
				c_operator,				--操作员 
				c_ip					--操作电脑的ip地址
			) 
			values
			( 
				@c_jobnumber,				--工号
				@c_pwd,					--密码				 
				@c_jobnm,				--作业名称
				@c_operator,				--操作员
				@c_ip					--操作电脑的ip地址
			)			
			if @@error<>0  
			begin
				raiserror ('登陆表写入报错！', 16, 1)
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
			raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
			return @@error
		end			
		update t_postset set c_jobnumber=@c_jobnumber ,		--工号
			c_orgid=@c_orgid, 
			c_postid=@c_postid ,				--岗位id  
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
--员工薪酬等级
if exists(select name from sysobjects where name='p_payset')
	drop procedure p_payset
go
create procedure p_payset   	
	@c_no int ,
	@c_jobnumber char(10),	--工号
	@c_pclass int ,		--薪酬等级id 
	@c_state int ,		--入司状态   
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as
declare	@c_datime		datetime		--操作时间   
	set @c_datime=getdate()		
	if @c_jobnm='add'
	begin			
		if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
		begin		
			raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
			return @@error
		end
		begin transaction  tr_payset 				
		insert  t_payset   	
		(	
			c_jobnumber ,		--工号
			c_pclass,
			c_state,			 
			c_jobnm ,
			c_operator ,
			c_ip
		) 
		values
		(
			@c_jobnumber ,		--工号
			@c_pclass,
			@c_state,	
			@c_jobnm ,
			@c_operator ,
			@c_ip
		)	
		if @@error<>0  
		begin
			raiserror ('员工薪酬等级设置报错！', 16, 1)
			rollback transaction tr_payset
			return 0
		end 	 
				  
		commit transaction tr_payset		 			
	end
	if @c_jobnm='pclass'
	begin	 	
		if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
		begin		
			raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
			return @@error
		end			
		update t_payset set c_jobnumber=@c_jobnumber ,		--工号
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
			raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
			return @@error
		end			
		update t_payset set c_jobnumber=@c_jobnumber ,		--工号
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
--员工删除  
if exists(select name from sysobjects where name='p_staffdel')
	drop procedure p_staffdel
go
create procedure p_staffdel  
	@c_jobnumber char(10) 	--工号	 
as
declare	@c_datime	datetime			--操作时间 		
	set @c_datime=getdate()	
	if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
	begin		
		raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
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
--员工权限  
if exists(select name from sysobjects where name='p_staffqx')
	drop procedure p_staffqx
go
create procedure p_staffqx  
	@c_jobnumber char(10) ,	--工号
	@c_xitong char (1),
	@c_menu varchar (1000), 
	@c_operator char(10) ,	
	@c_ip char (25)
as
declare	@c_datime	datetime			--操作时间 		
	set @c_datime=getdate()	
	if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
	begin		
		raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
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
--机构负责人设置 
if exists(select name from sysobjects where name='p_orghead')
	drop procedure p_orghead
go
create procedure p_orghead
	@c_orgid int ,		--机构id
	@c_jobnumber char(10)	--工号 
as 
	update t_organization 
		set  c_jobnumber=@c_jobnumber
		where c_no=@c_orgid	 
return 0
go
--员工权限查询 
if exists(select name from sysobjects where name='p_staffqxcx')
	drop procedure p_staffqxcx
go
create procedure p_staffqxcx
	@c_jobnumber char(10),	--工号
	@c_xitong char(1)	--系统分类	
as 
declare	@c_postid 	int  ,	--岗位id
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
--员工登录
if exists(select name from sysobjects where name='p_login')
	drop procedure p_login
go
create procedure p_login 
	@c_jobnumber char(10),	--工号
	@c_pwd	char(64)	--密码	
as 	 
	if not exists (select * from t_login where c_jobnumber=@c_jobnumber and c_pwd=@c_pwd)
	begin		
		raiserror ('工号或密码不正确！', 16, 1 )
		return @@error
	end 
	select @c_jobnumber c_jobnumber
return 0
go
--密码修改
if exists(select name from sysobjects where name='p_pwdreset')
	drop procedure p_pwdreset
go
create procedure p_pwdreset   	 
	@c_jobnumber 	char(10),		--工号
	@c_pwd		char(64),		--密码	  	
	@c_operator 	char(10),		--操作员	
	@c_ip		char(25) 		--操作员ip	
as
declare	@c_datime	datetime		--操作时间 		
	set @c_datime=getdate()	
	if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
	begin		
		raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
		return @@error
	end
	if not exists (select * from t_login where c_jobnumber=@c_jobnumber )
	begin		
		raiserror ('工号：%s 限制登录', 16, 1, @c_jobnumber)
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
--员工离职
if exists(select name from sysobjects where name='p_staffquit')
	drop procedure p_staffquit
go
create procedure p_staffquit  
	@c_jobnumber 	char(10),		--工号 
	@c_operator 	char(10),	
	@c_ip 		char (25)
as 
declare	@c_datime	datetime		--操作时间 		
	set @c_datime=getdate()	
	if not exists (select * from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null)
	begin		
		raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
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
--薪酬类别
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
declare	@c_datime	datetime			--操作时间 		
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
--薪酬等级
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
declare	@c_datime	datetime			--操作时间 		
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
--薪酬项目
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
declare	@c_datime	datetime			--操作时间 		
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
--薪酬社保
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
declare	@c_datime	datetime			--操作时间 		
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
--薪酬基本标准
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
declare	@c_datime	datetime			--操作时间 		
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
--薪酬相关系数
if exists(select name from sysobjects where name='p_pcoefficient')
	drop procedure p_pcoefficient
go
create procedure p_pcoefficient  
	@c_no int ,   
	@c_var char(30) ,  --  基本系数名称
	@c_name char(50) , --  对应指标名称
	@c_input int ,
	@c_period int ,	
	@c_o int ,	   --  地址
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--操作时间 		
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
--薪酬相关系数设置表（工号挂钩）
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
declare	@c_datime	datetime			--操作时间 		
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
--薪酬计算过程
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
declare	@c_datime	datetime			--操作时间 		
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
--考勤项目
if exists(select name from sysobjects where name='p_ontype')
	drop procedure p_ontype
go
create procedure p_ontype  
	@c_no int ,  
	@c_name char(30) ,	
	@c_code char(1) ,  
	@c_state int ,			-- 标记 0 正常状态 1 扣款状态	
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--操作时间 		
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
--机构考勤项目
if exists(select name from sysobjects where name='p_ontype2')
	drop procedure p_ontype2
go
create procedure p_ontype2  
	@c_no int , 
	@c_orgid int ,			--机构id  
	@c_ontype int ,			--考勤项目id
	@c_type int ,			-- 1 一次 2 一天
	@c_deducted decimal(15, 2) ,
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--操作时间 		
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
--工号关联
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
declare	@c_datime	datetime			--操作时间 		
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
--考勤记录导入
if exists(select name from sysobjects where name='p_onimport')
	drop procedure p_onimport
go
create procedure p_onimport   
	@c_orgid int ,		--机构id 
	@c_sno char(30) ,	--编号
	@c_date char(8) ,	--日期
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
	@c_datime	datetime	--操作时间 		
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
				raiserror ('编号：%s 无效！', 16, 1, @c_sno)
				return @@error
			end 
		end
		set @c_tempdate=convert(char(8),convert(datetime, @c_date),112)	
		if not exists ( select * from t_ontype where c_code=@c_morning ) 
		begin
			raiserror ('编号：%s 日期: %s 有误！', 16, 1, @c_sno,@c_date)
			return @@error
		end		
		if not exists ( select * from t_ontype where c_code=@c_afternoon ) 
		begin
			raiserror ('编号：%s 日期: %s 有误！', 16, 1, @c_sno,@c_date)
			return @@error
		end
		select @c_morning2=c_no from t_ontype where c_code=@c_morning
		select @c_afternoon2=c_no from t_ontype where c_code=@c_afternoon 	
	 	insert t_onduty
	 	(
		 	c_orgid ,		--机构id 
			c_jobnumber ,		--工号
			c_date ,		--日期
			c_morning ,
			c_afternoon , 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(
	 		@c_orgid ,		--机构id 
			@c_jobnumber ,		--工号
			@c_tempdate ,		--日期
			@c_morning2 ,
			@c_afternoon2 , 
			@c_jobnm ,
			@c_operator ,		 
			@c_ip 
	 	)
	end	 
return 0 
go 
--考勤记录录入 
if exists(select name from sysobjects where name='p_onduty')
	drop procedure p_onduty
go
create procedure p_onduty  
	@c_no int ,
	@c_orgid int ,		--机构id 
	@c_jobnumber char(10) ,	--工号
	@c_date char(8) ,	--日期
	@c_morning int  ,	--
	@c_afternoon int  ,	-- 
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--操作时间 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_onduty
	 	(
		 	c_orgid ,		--机构id 
			c_jobnumber ,		--工号
			c_date ,		--日期
			c_morning ,
			c_afternoon , 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(
	 		@c_orgid ,		--机构id 
			@c_jobnumber ,		--工号
			@c_date ,		--日期
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
--考勤汇总表
if exists(select name from sysobjects where name='p_onsummary')
	drop procedure p_onsummary
go
create procedure p_onsummary  
	@c_no int ,
	@c_orgid int ,			--机构id 
	@c_year int ,			--年
	@c_month int ,			--月 
	@c_jobnumber char(10) ,		--工号
	@c_deducted decimal(15, 2), 	--扣除金额
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime			--操作时间 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
	 	insert t_onsummary
	 	(
		 	c_orgid ,		--机构id 
		 	c_year ,
		 	c_month ,
			c_jobnumber ,		--工号
			c_deducted ,		--			 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(
	 		@c_orgid ,		--机构id 
			@c_year ,
		 	@c_month ,
			@c_jobnumber ,		--工号
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
--银行网点
if exists(select name from sysobjects where name='p_bankoutlets')
	drop procedure p_bankoutlets
go
create procedure p_bankoutlets  
	@c_no int ,  
	@c_orgid int ,			--机构id 
	@c_bank char (4)  ,		--银行代码
	@c_code char(30) ,		--网点代码	 
	@c_name char(50) ,		--网点名称
	@c_phone char(30) ,		--电话	
	@c_address char(50) ,		--地址	
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--操作时间 		
	set @c_datime=getdate()	 
	if @c_jobnm='add'
	begin	
		if not exists ( select * from t_organization where c_no =@c_orgid )
		begin
			raiserror ('机构无效！', 16, 1)
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
--银行网点关联
if exists(select name from sysobjects where name='p_bankrelate')
	drop procedure p_bankrelate
go
create procedure p_bankrelate  
	@c_no int ,  
	@c_orgid int ,			--机构id 
	@c_outletsid int ,		--网点id
	@c_jobnumber char(10) ,		--渠道专员工号	 
	@c_ksrq char(8) ,		--开始日期  
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--操作时间 		
	set @c_datime=getdate()	 
	if @c_jobnm='set'
	begin	
		--银行渠道
		if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=2 and c_jobnumber=@c_jobnumber and c_flag='0' )
		begin
			raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
			return @@error
		end		
		update  t_bankrelate set c_flag='1',c_jsrq=convert(char(8),@c_datime,112)
				where c_orgid=@c_orgid and c_outletsid=@c_outletsid and c_flag='0'				
	 	insert t_bankrelate
	 	(		    
	 		c_orgid ,		--机构id 
			c_outletsid ,		--网点id
			c_jobnumber ,		--渠道专员工号	 
			c_ksrq ,		--开始日期 
			c_jsrq ,		--结束日期 	 
			c_jobnm ,
			c_operator ,		 
			c_ip 
	 	)
	 	values
	 	(	 	  
	 		@c_orgid ,		--机构id 
			@c_outletsid ,		--网点id
			@c_jobnumber ,		--渠道专员工号	 
			@c_ksrq ,		--开始日期 
			'20990101' ,		--结束日期 	 
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