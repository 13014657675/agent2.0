--机构类型
if exists(select name from sysobjects where name='p_orgtype')
	drop procedure p_orgtype
go
create procedure p_orgtype
	@c_no int ,
	@c_order int , 			--顺序
	@c_mark int ,
	@c_name char (30)   ,  
	@c_jobnm char (10)   ,
	@c_operator char(10) ,	
	@c_ip char (25)   
as
declare	@c_datime	datetime	--操作时间 
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
--机构等级
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
declare	@c_datime	datetime	--操作时间 
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
--机构
if exists(select name from sysobjects where name='p_organization')
	drop procedure p_organization
go
create procedure p_organization 
	@c_no int ,
	@c_orgtypeid int ,
	@c_orgclassid int ,
	@c_name char (50) , 
	@c_prefix char (2) , 
	@c_parent int ,			--父机构ID		
	@c_deptid int ,			--父机构部门ID
	@c_license char (50) ,		--工商营业执照编号
	@c_lbeg char (8) ,		--工商营业执照编号有效开始时间
	@c_lend char (8) ,		--工商营业执照编号有效结束时间
	@c_permit char (50) ,		--企业经营许可证号
	@c_pbeg char (8) ,		--企业经营许可证号有效开始时间
	@c_pend char (8) ,		--企业经营许可证号有效结束时间	
	@c_tax char (50) ,		--税务登记证号
	@c_organization char (50) ,	--组织机构代码
	@c_jobnumber char (10) ,	--负责人工号	 
	@c_seal char (1) ,		--0 已篆刻公章 1 未篆刻公章
	@c_slocation char (50) ,	--公章存放地址	
	@c_bbank int  ,			--基本户银行
	@c_bcard char (50) ,		--基本户账号
	@c_gbank1 int ,			--一般户1银行
	@c_gcard1 char (50) ,		--一般户1账号
	@c_gbank2 int ,			--一般户2银行
	@c_gcard2 char (50) ,		--一般户2账号	
	@c_phone char (20) ,		--电话
	@c_address char (100) ,		--地址
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
	@c_datime datetime	--操作时间  
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
			c_license ,		--工商营业执照编号
			c_lbeg ,		--工商营业执照编号有效开始时间
			c_lend ,		--工商营业执照编号有效结束时间
			c_permit ,		--企业经营许可证号
			c_pbeg ,		--企业经营许可证号有效开始时间
			c_pend ,		--企业经营许可证号有效结束时间	
			c_tax ,			--税务登记证号
			c_organization ,	--组织机构代码
			c_jobnumber ,		--负责人工号
			c_seal ,		--0 已篆刻公章 1 未篆刻公章
			c_slocation ,		--公章存放地址	
			c_bbank  ,		--基本户银行
			c_bcard  ,		--基本户账号
			c_gbank1 ,		--一般户1银行
			c_gcard1 ,		--一般户1账号
			c_gbank2 ,		--一般户2银行
			c_gcard2 ,		--一般户2账号	
			c_phone ,		--电话
			c_address ,		--地址 
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
			@c_license ,		--工商营业执照编号
			@c_lbeg ,		--工商营业执照编号有效开始时间
			@c_lend ,		--工商营业执照编号有效结束时间
			@c_permit ,		--企业经营许可证号
			@c_pbeg ,		--企业经营许可证号有效开始时间
			@c_pend ,		--企业经营许可证号有效结束时间	
			@c_tax ,		--税务登记证号
			@c_organization ,	--组织机构代码
			@c_jobnumber ,		--负责人工号
			@c_seal ,		--0 已篆刻公章 1 未篆刻公章
			@c_slocation ,		--公章存放地址	
			@c_bbank  ,		--基本户银行
			@c_bcard  ,		--基本户账号
			@c_gbank1 ,		--一般户1银行
			@c_gcard1 ,		--一般户1账号
			@c_gbank2 ,		--一般户2银行
			@c_gcard2 ,		--一般户2账号	
			@c_phone ,		--电话
			@c_address ,		--地址 
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
				c_license=@c_license ,		--工商营业执照编号
				c_lbeg=@c_lbeg ,		--工商营业执照编号有效开始时间
				c_lend=@c_lend ,		--工商营业执照编号有效结束时间
				c_permit=@c_permit ,		--企业经营许可证号
				c_pbeg=@c_pbeg ,		--企业经营许可证号有效开始时间
				c_pend=@c_pend ,		--企业经营许可证号有效结束时间	
				c_tax=@c_tax ,			--税务登记证号
				c_organization=@c_organization ,--组织机构代码
				c_jobnumber=@c_jobnumber ,	--负责人工号
				c_seal=@c_seal ,		--0 已篆刻公章 1 未篆刻公章
				c_slocation=@c_slocation ,	--公章存放地址	
				c_bbank=@c_bbank  ,		--基本户银行
				c_bcard=@c_bcard  ,		--基本户账号
				c_gbank1=@c_gbank1 ,		--一般户1银行
				c_gcard1=@c_gcard1 ,		--一般户1账号
				c_gbank2=@c_gbank2 ,		--一般户2银行
				c_gcard2=@c_gcard2 ,		--一般户2账号	
				c_phone=@c_phone ,		--电话
				c_address=@c_address ,		--地址 
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
--部门	
if exists(select name from sysobjects where name='p_dept')
	drop procedure p_dept
go	
create procedure p_dept
	@c_no int,
	@c_orgid int,	
	@c_name char (30),  
	@c_ptnature int , 	--性质	
	@c_system  int ,	--政策体系	
	@c_jobnm char (10),
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
--职位岗位
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
declare	@c_datime	datetime	--操作时间 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 	 
		if not exists ( select * from t_dept where c_no =@c_deptid and c_orgid=@c_orgid )
		begin
			raiserror ('部门无效！', 16, 1)
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
--部门长设置
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
declare	@c_datime	datetime	--操作时间 
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
--职位岗位权限
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
declare	@c_datime	datetime	--操作时间 
	set @c_datime=getdate()
	if not exists (select * from t_post where c_no=@c_postid )
	begin		
		raiserror ('岗位代码：%d 无效', 16, 1, @c_postid)
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
--保险公司
if exists(select name from sysobjects where name='p_company')
	drop procedure p_company
go
create procedure p_company
	@c_no int ,
	@c_type int ,
	@c_fullname char (50),
	@c_name char (30),
	@c_tbdl int , --投保单长度
	@c_bdl int ,  --保单长度
	@c_addr char (50) ,
	@c_zipcode char (10) ,
	@c_phone char (15) ,
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as
declare	@c_datime	datetime	--操作时间 
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
--职业代码
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
declare	@c_datime	datetime	--操作时间 
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
--折标类型
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
declare	@c_datime	datetime	--操作时间 
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
--系数设置
if exists(select name from sysobjects where name='p_convert')
	drop procedure p_convert
go
create procedure p_convert
	@c_no int ,
	@c_companyid int , 	--公司id	 
	@c_convertT  int ,		--  
	@c_jfqx int ,		--缴费期 
	@c_dec decimal(6, 4),	--系数	
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--操作时间 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_convert
		(   
			c_companyid , 	--公司id 	
			c_convertT , 
			c_jfqx ,	--缴费期	
			c_dec ,		--系数	 	
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(  
			@c_companyid , 	--公司id 	 
			@c_convertT , 
			@c_jfqx ,	--缴费期	
			@c_dec ,	--系数	 
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_convert set 	c_companyid=@c_companyid , 	--公司id 
				c_convertT=@c_convertT , 
				c_jfqx=@c_jfqx ,		--缴费期	
				c_dec=@c_dec ,			--系数	 	
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
