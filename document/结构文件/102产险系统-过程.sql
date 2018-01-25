--产险保单过程
if exists(select name from sysobjects where name='p_cxbd')
	drop procedure p_cxbd
go
create procedure p_cxbd
	@c_no int   ,	
	@c_orgid int   ,			-- 机构
	@c_companyid int  ,			-- 保险公司 
	@c_bd char (30)   ,			-- 保单号
	@c_productid int   , 			-- 产品险种id	 
	@c_bxf decimal(15,2)  , 		-- 保险费 
	@c_ccs decimal(15,2)  , 		-- 车船税 
	@c_platenumber char (30)   ,    	-- 车牌号
	@c_hisnumber char (30)  ,		-- 车驾号
	@c_customer char (20)    ,		-- 被保险人姓名
	@c_cardtype char (4)   ,		-- 证件类型
	@c_cardnum char (40)    ,		-- 证件号码  
	@c_lrrq char (8)   , 			-- 签单日期
	@c_cbrq char (8)   , 			-- 起保日期	
	@c_jobnumber char (10)  ,		-- 代理人工号	
	@c_usageid int  ,			-- 使用性质	
	@c_pay int  ,				-- 付款方式: 1信用卡刷卡 2转账 3现金	
	@c_fpserial char (100)  ,		-- 发票流水号	
	@c_dzserial char (100)  ,		-- 单证流水号	
	@c_jobnm char (10)   ,
	@c_operator char(10)   , 
	@c_ip char (25)   
as 	  
declare @c_system_sq int,
	@c_orgid_sq int,
	@c_companyid_temp int ,
	@c_bd_temp char (30) ,	-- 保单号
	@c_datime datetime   
	set @c_datime=getdate()	
	if not exists (	select c_jobnumber from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null )
	begin		
		raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
		return @@error
	end
	if not exists (	select * from t_agentset where c_jobnumber=@c_jobnumber and c_system=11 and c_flag='0' )
	begin		
		raiserror ('工号：%s 无效！, 请添加代理人所属事业部血缘关系', 16, 1, @c_jobnumber)
		return @@error
	end	
	if not (isdate(@c_lrrq)=1 and len(@c_lrrq)=8)
	begin
		raiserror ('签单日期格式错误!', 16, 1)
		return @@error
	end
	if not (isdate(@c_cbrq)=1 and len(@c_cbrq)=8)
	begin
		raiserror ('起保日期格式错误!', 16, 1)
		return @@error
	end
	if @c_lrrq > @c_cbrq
	begin
		raiserror ('签单日期不能大于起保日期!', 16, 1)
		return @@error
	end
	select @c_orgid_sq=c_orgid,@c_system_sq=c_system from t_agentset where c_jobnumber=@c_jobnumber and c_flag='0'
	if @c_jobnm='add'
	begin  	 
		insert  t_cxbd  	
		(	 
			c_orgid ,				-- 机构
			c_companyid ,				-- 保险公司 
			c_bd ,					-- 保单号
			c_productid ,		 		-- 产品险种id	 
			c_bxf ,			 		-- 保险费 
			c_ccs ,					-- 车船税
			c_platenumber ,			    	-- 车牌号
			c_hisnumber  ,				-- 车驾号
			c_customer ,				-- 被保险人姓名
			c_cardtype ,				-- 证件类型
			c_cardnum ,				-- 证件号码  
			c_lrrq ,		 		-- 签单日期
			c_cbrq ,		 		-- 起保日期	
			c_jobnumber ,				-- 代理人工号	
			c_usageid ,				-- 使用性质	
			c_pay ,					-- 付款方式: 1信用卡刷卡 2转账 3现金	
			c_fpserial ,				-- 发票流水号	
			c_dzserial ,				-- 单证流水号	
			c_orgid_sq,				-- 机构
			c_system_sq ,				-- 政策体系   
			c_jobnm ,
			c_operator ,
			c_datime ,
			c_ip  
		) 
		values
		( 
			@c_orgid ,				-- 机构
			@c_companyid ,				-- 保险公司 
			@c_bd ,					-- 保单号
			@c_productid ,		 		-- 产品险种id	 
			@c_bxf ,		 		-- 保险费 
			@c_ccs ,				-- 车船税
			@c_platenumber ,			-- 车牌号
			@c_hisnumber  ,				-- 车驾号
			@c_customer ,				-- 被保险人姓名
			@c_cardtype ,				-- 证件类型
			@c_cardnum ,				-- 证件号码  
			@c_lrrq ,		 		-- 签单日期
			@c_cbrq ,		 		-- 起保日期	
			@c_jobnumber ,				-- 代理人工号	
			@c_usageid ,				-- 使用性质	
			@c_pay ,				-- 付款方式: 1信用卡刷卡 2转账 3现金	
			@c_fpserial ,				-- 发票流水号	
			@c_dzserial ,				-- 单证流水号	
			@c_orgid_sq,				-- 机构
			@c_system_sq ,				-- 政策体系   
			@c_jobnm ,
			@c_operator ,
			@c_datime ,
			@c_ip  
		)	 		
	end	
	if @c_jobnm in ('check','0')
	begin 
		update t_cxbd set 
			c_orgid=@c_orgid ,			-- 机构
			c_companyid=@c_companyid ,		-- 保险公司 
			c_bd=@c_bd ,				-- 保单号
			c_productid=@c_productid ,		-- 产品险种id	 
			c_bxf=@c_bxf ,		 		-- 保险费 
			c_ccs=@c_ccs ,				-- 车船税
			c_platenumber=@c_platenumber ,		-- 车牌号
			c_hisnumber=@c_hisnumber  ,		-- 车驾号
			c_customer=@c_customer ,		-- 被保险人姓名
			c_cardtype=@c_cardtype ,		-- 证件类型
			c_cardnum=@c_cardnum ,			-- 证件号码  
			c_lrrq=@c_lrrq ,		 	-- 签单日期
			c_cbrq=@c_cbrq ,		 	-- 起保日期	
			c_jobnumber=@c_jobnumber ,		-- 代理人工号	
			c_usageid=@c_usageid ,			-- 使用性质	
			c_pay=@c_pay ,				-- 付款方式: 1信用卡刷卡 2转账 3现金	
			c_fpserial=@c_fpserial ,		-- 发票流水号	
			c_dzserial=@c_dzserial ,		-- 单证流水号	
			c_orgid_sq=@c_orgid_sq ,		-- 机构
			c_system_sq=@c_system_sq ,		-- 政策体系   
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,
			c_datime=@c_datime ,
			c_ip=@c_ip  
		where c_no=@c_no	 
	end	 
	exec p_cxsqjs2	@c_companyid,@c_bd
return 0
go
--产险保单日结单过程
if exists(select name from sysobjects where name='p_cxbdrjd')
	drop procedure p_cxbdrjd
go
create procedure p_cxbdrjd
	@c_orgid	int,
	@c_date		char(8), 
	@c_operator 	char(10) , 
	@c_ip 		char(25)  
as 	   
declare @c_customer char (20)    ,		-- 客户姓名
	@c_companyid int  ,			-- 保险公司 
	@c_bd char (30)   ,			-- 保单号
	@c_bxf decimal(15,2)  , 		-- 保险费 
	@c_jobnumber char (10)  ,		-- 代理人工号
	@c_datime datetime   
	set @c_datime=getdate()		
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('输入日期格式错误!', 16, 1)
		return @@error
	end
	delete  t_cxbdrjd where c_orgid=@c_orgid and c_date=@c_date
	insert  t_cxbdrjd	
	(	  
		c_orgid,	-- 机构
		c_companyid,	-- 保险公司 
		c_bd,		-- 保单 
		c_customer,	-- 客户姓名   
		c_bxf,		-- 保险费
		c_jobnumber,	-- 代理人工号
		c_date,		-- 日期 
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

