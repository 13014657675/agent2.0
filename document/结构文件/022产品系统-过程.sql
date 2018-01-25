--产品分类
if exists(select name from sysobjects where name='p_ptclass')
	drop procedure p_ptclass
go
create procedure p_ptclass
	@c_no int ,
	@c_ptnature int, 		--产品性质			
	@c_name char (30)  ,  
	@c_jobnm char (10)  ,
	@c_operator char(10) ,	
	@c_ip char (25)   
as
declare	@c_datime	datetime	--操作时间 
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
--产品类型
if exists(select name from sysobjects where name='p_pttype')
	drop procedure p_pttype
go
create procedure p_pttype
	@c_no int ,
	@c_ptclassid int , 		--产品分类			
	@c_name char (30)  ,  
	@c_jobnm char (10)  ,
	@c_operator char(10) ,	
	@c_ip char (25)   
as
declare	@c_datime	datetime	--操作时间 
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
--产品
if exists(select name from sysobjects where name='p_product')
	drop procedure p_product
go
create procedure p_product
	@c_no int ,	
	@c_companyid int , 	--公司	
	@c_ptnature int ,	--产品性质
	@c_ptclassid int ,	--产品分类
	@c_pttypeid int , 	--产品类型			
	@c_code char (30) ,  
	@c_fullname char (50),  
	@c_name char (30) ,  
	@c_type int , 
	@c_flag char (1) ,
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as
declare	@c_datime	datetime	--操作时间 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_product
		(  
			c_companyid, 	--公司	
			c_ptnature,	--产品性质
			c_ptclassid,	--产品分类
			c_pttypeid, 	--产品类型			
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
			@c_companyid, 	--公司	
			@c_ptnature,	--产品性质
			@c_ptclassid,	--产品分类
			@c_pttypeid, 	--产品类型			
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
		update t_product set c_ptnature=@c_ptnature,	--产品性质
				c_ptclassid=@c_ptclassid,	--产品分类 
				c_pttypeid=@c_pttypeid, 	--产品类型	
				c_companyid=@c_companyid,	--保险公司		
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
		update t_product set c_flag=@c_flag,		--有效标志
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime ,
				c_ip=@c_ip 
			where c_no=@c_no
		update t_pcomponent set c_flag=@c_flag,		--有效标志
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
--产品组件
if exists(select name from sysobjects where name='p_pcomponent')
	drop procedure p_pcomponent
go
create procedure p_pcomponent 	
	@c_no int ,	
	@c_companyid int , 	--公司	
	@c_productid int , 	--产品id			
	@c_pcode char (30) ,  
	@c_pfullname char (50),  
	@c_pname char (30) ,  
	@c_ptype int ,  
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as
declare	@c_datime	datetime	--操作时间 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		if not exists(select * from t_product where c_companyid=@c_companyid and c_no=@c_productid)
		begin
			raiserror ('险种：%d 无效！', 16, 1, @c_productid)
			return @@error
		end
		insert  t_pcomponent
		(  
			c_companyid, 	--公司	
			c_productid, 	--产品类型			
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
			@c_companyid, 	--公司	
			@c_productid, 	--产品类型			
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
--产品费率
if exists(select name from sysobjects where name='p_ptrate')
	drop procedure p_ptrate
go
create procedure p_ptrate
	@c_no int ,
	@c_companyid int , 	--公司id	
	@c_productid int , 	--产品id	 			 
	@c_type char (1) , 	--1，根据保费做基数 2，根据保额做基数
	@c_base decimal(9, 2),	--基数	
	@c_bxqlx char (1)  ,	--0，终身 1，保止几岁 2，保n年
	@c_bxq int ,		--保险期
	@c_jfqlx char (1) ,    	--0，趸交 1，缴止几岁 2，缴n年
	@c_jfq int  ,		--缴费期 
	@c_age int  ,		--年龄
	@c_male decimal(10, 4)  ,--男费率
	@c_female decimal(10, 4),--女费率	 
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)   
as
declare	@c_datime	datetime	--操作时间 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		 
		insert  t_ptrate
		(  
			c_companyid , 	--公司id	
			c_productid , 	--产品id	 
			c_type , 	--1，根据保费做基数 2，根据保额做基数
			c_base ,	--基数	
			c_bxqlx ,	--0，终身 1，保止几岁 2，保n年
			c_bxq ,		--保险期
			c_jfqlx ,    	--1，缴止几岁 2，缴n年
			c_jfq ,		--缴费期 
			c_age ,		--年龄
			c_male ,	--男费率
			c_female ,	--女费率	 
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(  
			@c_companyid , 	--公司id	
			@c_productid , 	--产品id	  
			@c_type , 	--1，根据保费做基数 2，根据保额做基数
			@c_base ,	--基数	
			@c_bxqlx ,	--0，终身 1，保止几岁 2，保n年
			@c_bxq ,		--保险期
			@c_jfqlx ,    	--1，缴止几岁 2，缴n年
			@c_jfq ,	--缴费期 
			@c_age ,	--年龄
			@c_male ,	--男费率
			@c_female ,	--女费率	 
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_ptrate set c_type=@c_type , 	--1，根据保费做基数 2，根据保额做基数
				c_base=@c_base ,	--基数	
				c_bxqlx=@c_bxqlx ,	--0，终身 1，保止几岁 2，保n年
				c_bxq=@c_bxq ,		--保险期
				c_jfqlx=@c_jfqlx ,    	--1，缴止几岁 2，缴n年
				c_jfq=@c_jfq ,		--缴费期 
				c_age=@c_age ,		--年龄
				c_male=@c_male ,	--男费率
				c_female=@c_female ,	--女费率
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
--产品系数
if exists(select name from sysobjects where name='p_ptconvert')
	drop procedure p_ptconvert
go
create procedure p_ptconvert
	@c_no int ,
	@c_companyid int , 	--公司id	
	@c_productid int , 	--产品id 
	@c_convertT int ,	--类型  	 
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
		insert  t_ptconvert
		(   
			c_companyid , 	--公司id	
			c_productid , 	--产品id	
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
			@c_productid , 	--产品id	
			@c_convertT ,  
			@c_jfqx ,		--缴费期	
			@c_dec ,		--系数	 
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_ptconvert set 	c_companyid=@c_companyid , 	--公司id	
				c_productid=@c_productid , 	--产品id
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
		delete t_ptconvert  where c_no=@c_no
	end 
return 0
go
--保险责任
if exists(select name from sysobjects where name='p_pliability')
	drop procedure p_pliability
go
create procedure p_pliability
	@c_no int ,
	@c_companyid int , 	--公司id	
	@c_productid int , 	--产品id 	
	@c_pname char (60) , 	--保险责任名称
	@c_pdesc varchar(3000),	--保险责任描述
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25)  
as
declare	@c_datime	datetime	--操作时间 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 	  	
		insert  t_pliability
		(   
			c_companyid , 	--公司id	
			c_productid , 	--产品id	 
			c_pname , 	--保险责任名称
			c_pdesc ,	--保险责任描述	 
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(  
			@c_companyid , 	--公司id	
			@c_productid , 	--产品id	 
			@c_pname , 	--保险责任名称
			@c_pdesc ,	--保险责任描述	 
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_pliability set 	  
			c_pname=@c_pname , 	--保险责任名称
			c_pdesc=@c_pdesc ,	--保险责任描述	 
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
--保险责任参数名词
if exists(select name from sysobjects where name='p_pliabilityc')
	drop procedure p_pliabilityc
go
create procedure p_pliabilityc   
	@c_companyid int ,	-- 保险公司
	@c_productid int , 	-- 产品id 
	@c_name char (30) ,	-- 参数名称	
	@c_jobnm char (10), 
	@c_operator char(10) , 
	@c_ip char (25)   	
as
declare	@c_no_temp int ,
	@c_datime	datetime	--操作时间 
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
			c_companyid , 	--公司id	
			c_productid , 	--产品id	 		
			c_name ,	--参数名称			
			c_jobnm , 
			c_operator , 
			c_ip    	
		)
		values
		(   
			@c_no_temp ,
			@c_companyid  ,	-- 保险公司
			@c_productid  , -- 产品险种id	  
			@c_name ,	-- 参数名称		
			@c_jobnm , 
			@c_operator , 
			@c_ip    	
		)    
		select @c_no_temp
	end	 
return 0
go 
--保险责任参数名词值
if exists(select name from sysobjects where name='p_pliabilitycv')
	drop procedure p_pliabilitycv
go
create procedure p_pliabilitycv  
	@c_companyid int ,	-- 保险公司
	@c_productid int , 	-- id 	
	@c_pliabilitycid int ,
	@c_bxqtype int ,	-- 保险期间类型 0 终身 1 保*年 2 保至*岁
	@c_bxq int ,		-- 保险期间 
	@c_jfqtype int ,	-- 交费期间类型 0 趸交 1 交*年 2 交至*岁
	@c_jfq int ,		-- 交费期间 
	@c_t int , 		--1 保单年度 2 被保人年龄
	@c_v int , 		--单个数字	
	@c_jobnm char (10), 
	@c_operator char(10) , 
	@c_ip char (25)   	
as
declare	@c_datime	datetime	--操作时间 
	set @c_datime=getdate() 
	if @c_jobnm='add'
	begin 
		insert  t_pliabilitycv
		(     			
			c_companyid  ,	-- 保险公司
			c_productid  , 	-- 产品险种id	  
			c_pliabilitycid  ,	 
			c_bxqtype  ,	-- 保险期间类型 0 终身 1 保*年 2 保至*岁
			c_bxq  ,	-- 保险期间 
			c_jfqtype  ,	-- 交费期间类型 0 趸交 1 交*年 2 交至*岁
			c_jfq  ,	-- 交费期间			
			c_t  , 		--1 保单年度 2 被保人年龄
			c_v  , 		--单个数字		
			c_jobnm , 
			c_operator , 
			c_ip    	
		)
		values
		(   
			@c_companyid  ,	-- 保险公司
			@c_productid  , -- 产品险种id	 	 
			@c_pliabilitycid  ,	 
			@c_bxqtype  ,	-- 保险期间类型 0 终身 1 保*年 2 保至*岁
			@c_bxq  ,	-- 保险期间 
			@c_jfqtype  ,	-- 交费期间类型 0 趸交 1 交*年 2 交至*岁
			@c_jfq  ,	-- 交费期间			
			@c_t  , 	--1 保单年度 2 被保人年龄
			@c_v  , 	--单个数字		
			@c_jobnm , 
			@c_operator , 
			@c_ip    	
		)    
	end		 
return 0
go 
--保险责任结构
if exists(select name from sysobjects where name='p_pliabilitys')
	drop procedure p_pliabilitys
go
create procedure p_pliabilitys 
	@c_companyid int ,	-- 保险公司
	@c_productid int , 	-- 产品id 	 
	@c_pname char(50) , 	--项目名称		  
	@c_condition int , 	--条件类型 --1 全部 2 单个 3 区间
	@c_cv2t int , 		--1 保单年度 2 被保人年龄
	@c_cv2 int , 		--单个数字 
	@c_cv31t int , 		--1 保单年度 2 被保人年龄
	@c_cv31 int , 		--区间开始数字 
	@c_cv32t int , 		--1 保单年度 2 被保人年龄
	@c_cv32 int , 		--区间结束数字 
	@c_result int , 	--赔付类型 0 数值 1 基本保额 2 累计保费 
	@c_rv decimal(15, 4) ,	--数值	   	  
	@c_jobnm char (10) ,
	@c_operator char(10) , 
	@c_ip char (25)  
as
declare	@c_datime	datetime	--操作时间 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_pliabilitys
		(    
			c_companyid  ,		-- 保险公司
			c_productid  , 		-- 产品险种id	 
			c_pname  , 		--项目名称		  
			c_condition  , 		--条件类型 --1 全部 2 单个 3 区间
			c_cv2t  , 		--1 保单年度 2 被保人年龄
			c_cv2  , 		--单个数字 
			c_cv31t  , 		--1 保单年度 2 被保人年龄
			c_cv31  , 		--区间开始数字 
			c_cv32t  , 		--1 保单年度 2 被保人年龄
			c_cv32  , 		--区间结束数字 
			c_result  , 		--赔付类型 0 数值 1 基本保额 2 累计保费 
			c_rv ,	 		--数值	  
			c_jobnm ,
			c_operator , 
			c_ip   
		)
		values
		(  
			@c_companyid  ,		-- 保险公司
			@c_productid  , 	-- 产品险种id 
			@c_pname  , 		--项目名称	  
			@c_condition  , 	--条件类型 --1 全部 2 单个 3 区间
			@c_cv2t  , 		--1 保单年度 2 被保人年龄
			@c_cv2  , 		--单个数字 
			@c_cv31t  , 		--1 保单年度 2 被保人年龄
			@c_cv31  , 		--区间开始数字 
			@c_cv32t  , 		--1 保单年度 2 被保人年龄
			@c_cv32  , 		--区间结束数字 
			@c_result  , 		--赔付类型 0 数值 1 基本保额 2 累计保费 
			@c_rv ,	 		--数值	    
			@c_jobnm ,
			@c_operator , 
			@c_ip   
		)
	end  
return 0
go
