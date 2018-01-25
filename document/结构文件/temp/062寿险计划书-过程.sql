--计划书过程
if exists(select name from sysobjects where name='p_plan_book')
	drop procedure p_plan_book
go
create procedure p_plan_book
	@c_tbrname char (30),		--投保人姓名
	@c_bbrname char (30),		--被保人姓名
	@c_bbrsex int ,			--被保人性别 1 男 2 女
	@c_bbirthy int ,		--被保人出生年
	@c_bbirthm int ,		--被保人出生月
	@c_bbirthd int ,		--被保人出生日
	@c_age int  ,			--年龄 	 
	@c_jobnm char (10) ,
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_no_temp int,
	@c_datime datetime   
	set @c_datime=getdate()	
	if @c_jobnm='add'
	begin  		
		if not exists(select * from t_plan_book)
		begin
			set @c_no_temp=1000
		end
		else
		begin
			select @c_no_temp=max(c_no)+1 from t_plan_book 
		end			 
		insert  t_plan_book  	
		(	 
			c_no,
			c_tbrname,		--姓名
			c_bbrname,		--国籍
			c_bbrsex,		--性别
			c_bbirthy,		--出生年
			c_bbirthm,		--出生月
			c_bbirthd,		--出生日
			c_age, 			--			 
			c_jobnm,
			c_operator, 
			c_ip
		) 
		values
		( 
			@c_no_temp,
			@c_tbrname,		--姓名
			@c_bbrname,		--国籍
			@c_bbrsex,		--性别
			@c_bbirthy,		--出生年
			@c_bbirthm,		--出生月
			@c_bbirthd,		--出生日
			@c_age, 		--			 
			@c_jobnm,
			@c_operator, 
			@c_ip
		)	
		select @c_no_temp c_plan_bookid
	end		 
return 0
go
--计划书险种过程
if exists(select name from sysobjects where name='p_plan_books')
	drop procedure p_plan_books
go
create procedure p_plan_books
	@c_plan_bookid int ,	
	@c_companyid int ,	-- 保险公司
	@c_productid int , 	-- 产品险种id	 
	@c_basetype int ,	-- 基数类型
	@c_base decimal(15,2) , -- 基数 
	@c_bxqtype int ,	-- 保险期间类型
	@c_bxq int ,		-- 保险期间 
	@c_jfqtype int ,	-- 交费期间类型
	@c_jfq int ,		-- 交费期间	
	@c_jobnm char (10)  ,
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_age int, 
	@c_jfqx int , 		-- 交费期限	 
	@c_datime datetime   
	set @c_datime=getdate()	
	if @c_jobnm='add'
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
			select @c_age=c_age from t_plan_book where c_no=@c_plan_bookid  
			set @c_jfqx=@c_jfq-@c_age
		end	 
		insert  t_plan_books  	
		(	  
			c_plan_bookid ,	
			c_companyid ,		-- 保险公司
			c_productid , 		-- 产品险种id	 
			c_basetype ,		-- 基数类型
			c_base , 		-- 基数 
			c_bxqtype ,		-- 保险期间类型
			c_bxq ,			-- 保险期间 
			c_jfqtype ,		-- 交费期间类型
			c_jfq ,			-- 交费期间
			c_jfqx , 		-- 交费期限	  			 	 
			c_jobnm,
			c_operator, 
			c_ip
		) 
		values
		(  
			@c_plan_bookid ,	
			@c_companyid ,		-- 保险公司
			@c_productid , 		-- 产品险种id	 
			@c_basetype ,		-- 基数类型
			@c_base , 		-- 基数 
			@c_bxqtype ,		-- 保险期间N年
			@c_bxq ,		-- 保险期间至N周岁 
			@c_jfqtype ,		-- 交费期间N年
			@c_jfq ,		-- 交费期间至N周岁
			@c_jfqx , 		-- 交费期限  		 
			@c_jobnm,
			@c_operator, 
			@c_ip
		)	 
	end		 
return 0
go
--计划书险种过程-计算险种保费、保额
if exists(select name from sysobjects where name='ph_plan_books_do')
	drop procedure ph_plan_books_do
go
create procedure ph_plan_books_do
	@c_plan_bookid int,
	@c_companyid int ,	-- 保险公司
	@c_productid int , 	-- 产品险种id	
	@c_bdnd int  		-- 保单年度
as 	  
declare @c_bxf decimal(15,2) , 	-- 年度保费  
	@c_bxje decimal(15,2) , 	-- 基本保额 
	@c_mage int  ,			-- 保险期间的被保人最大年龄	
	@c_age int, 			-- 年龄
	@c_bbrsex int, 			-- 性别 
	@c_basetype int,
	@c_base decimal(15,2) , 	-- 基数 
	@c_bxqtype int,
	@c_bxq int,
	@c_jfqtype int,
	@c_jfq int ,
	@c_jfqx int ,
	@c_male decimal(15,2) , 		
	@c_female decimal(15,2) , 		 
	@c_base_temp decimal(15,2) , 	--  	
	@c_base2 decimal(15,2)   	--  	 
	select @c_bxf=0,@c_bxje=0,@c_mage=0  
	select 	@c_age=c_age,@c_bbrsex=c_bbrsex from t_plan_book where c_no=@c_plan_bookid 	 	
	select 	@c_basetype=c_basetype,
		@c_base=c_base,
		@c_bxqtype=c_bxqtype,
		@c_bxq=c_bxq,
		@c_jfqtype=c_jfqtype,
		@c_jfq=c_jfq,
		@c_jfqx=c_jfqx 
		from t_plan_books 
		where c_plan_bookid=@c_plan_bookid and c_companyid=@c_companyid and c_productid=@c_productid
	select 	@c_base_temp=c_base,@c_male=c_male,@c_female=c_female from t_ptrate 
		where  c_companyid=@c_companyid and c_productid=@c_productid 
			and c_type=@c_basetype and c_bxqlx=@c_bxqtype  and c_bxq=@c_bxq 
			and  c_jfqlx=@c_jfqtype and c_jfq=@c_jfq and  c_age=@c_age 			
	print '-*-'
	print @c_companyid
	print @c_productid
	print @c_basetype
	print @c_bxqtype
	print @c_bxq
	print @c_jfqtype
	print @c_jfq
	print @c_age 
	print '-%-'
	print @c_base_temp
	print @c_male
	print @c_female	
	if @c_bbrsex=1	--男
	begin
		set @c_base2=@c_male * (@c_base/@c_base_temp)		
	end			
	if @c_bbrsex=2	-- 女
	begin
		set @c_base2=@c_female * (@c_base/@c_base_temp)
	end
	-- 保额
	if @c_basetype=1
	begin
		 select @c_bxje=@c_base,@c_bxf=@c_base2
	end 
	-- 保费
	if @c_basetype=2
	begin
		select @c_bxje=@c_base2,@c_bxf=@c_base			
	end			
	if @c_bdnd > @c_jfqx
	begin
		set @c_bxf=0
	end
	if @c_bxqtype=0
	begin
		--终身
		set @c_mage=110
	end
	if @c_bxqtype=1
	begin
		--保*年
		set @c_mage=@c_age+@c_bxq
	end
	if @c_bxqtype=2
	begin
		--保至*岁
		set @c_mage=@c_bxq
	end		
	select @c_bxf c_bxf,@c_bxje c_bxje,@c_mage c_mage
return 0
go