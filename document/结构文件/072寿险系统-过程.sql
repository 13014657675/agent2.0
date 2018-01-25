--客户过程
if exists(select name from sysobjects where name='p_customer')
	drop procedure p_customer
go
create procedure p_customer
	@c_no int , 
	@c_name char (30) ,	--姓名
	@c_nation char (30) ,	--国籍
	@c_sex int ,		--性别
	@c_birthy int ,		--出生年
	@c_birthm int ,		--出生月
	@c_birthd int ,		--出生日
	@c_marriage int , 	--0 单身 1 已婚
	@c_cardtype char (4)  ,	--证件类型
	@c_cardnum char (40)  ,	--证件号码
	@c_cardperiod char (8) ,--证件有效期
	@c_education char (4) ,	--学历
	@c_email char (50)  ,	--email
	@c_phone char (30)  ,	--固定电话 
	@c_mobile char (30)  ,	--移动电话 
	@c_company char (50)  , --工作单位或学校名称
	@c_post char (20)  ,	--职务
	@c_postcode char (20) ,	--职业代码	
	@c_hddr char (80)  ,	--常住地址
	@c_hzip char (20)  , 	--常住邮编
	@c_cddr char (80)  ,	--单位地址
	@c_czip char (20)  ,    --单位邮编
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
			raiserror ('证件号码不能为空!', 16, 1)
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
			c_name,			--姓名
			c_nation,		--国籍
			c_sex,			--性别
			c_birthy,		--出生年
			c_birthm,		--出生月
			c_birthd,		--出生日
			c_marriage, 		--0 单身 1 已婚
			c_cardtype,		--证件类型
			c_cardnum,		--证件号码
			c_cardperiod,		--证件有效期
			c_education,		--学历
			c_email,		--email
			c_phone,		--固定电话 
			c_mobile,		--移动电话 
			c_company, 		--工作单位或学校名称
			c_post,			--职务
			c_postcode,		--职业代码	
			c_hddr,			--常住地址
			c_hzip, 		--常住邮编
			c_cddr,			--单位地址
			c_czip,    		--单位邮编
			c_jobnm,
			c_operator, 
			c_ip
		) 
		values
		( 
			@c_no,
			@c_name,		--姓名
			@c_nation,		--国籍
			@c_sex,			--性别
			@c_birthy,		--出生年
			@c_birthm,		--出生月
			@c_birthd,		--出生日
			@c_marriage, 		--0 单身 1 已婚
			@c_cardtype,		--证件类型
			@c_cardnum,		--证件号码
			@c_cardperiod,		--证件有效期
			@c_education,		--学历
			@c_email,		--email
			@c_phone,		--固定电话 
			@c_mobile,		--移动电话 
			@c_company, 		--工作单位或学校名称
			@c_post,		--职务
			@c_postcode,		--职业代码	
			@c_hddr,		--常住地址
			@c_hzip, 		--常住邮编
			@c_cddr,		--单位地址
			@c_czip,    		--单位邮编
			@c_jobnm,
			@c_operator, 
			@c_ip
		)	
	end	
	if @c_jobnm='update'
	begin
		update t_customer set 
			c_name=@c_name,			--姓名
			c_nation=@c_nation,		--国籍
			c_sex=@c_sex,			--性别
			c_birthy=@c_birthy,		--出生年
			c_birthm=@c_birthm,		--出生月
			c_birthd=@c_birthd,		--出生日
			c_marriage=@c_marriage, 	--0 单身 1 已婚
			c_cardtype=@c_cardtype,		--证件类型
			c_cardnum=@c_cardnum,		--证件号码
			c_cardperiod=@c_cardperiod,	--证件有效期
			c_education=@c_education,	--学历
			c_email=@c_email,		--email
			c_phone=@c_phone,		--固定电话 
			c_mobile=@c_mobile,		--移动电话 
			c_company=@c_company, 		--工作单位或学校名称
			c_post=@c_post,			--职务
			c_postcode=@c_postcode,		--职业代码	
			c_hddr=@c_hddr,			--常住地址
			c_hzip=@c_hzip, 		--常住邮编
			c_cddr=@c_cddr,			--单位地址
			c_czip=@c_czip,    		--单位邮编
			c_jobnm=@c_jobnm,
			c_operator=@c_operator, 
			c_datime=@c_datime,
			c_ip=@c_ip
		where c_no=@c_no	 
	end	 
	select @c_no
return 0
go
--寿险保单过程
if exists(select name from sysobjects where name='p_sxbd')
	drop procedure p_sxbd
go
create procedure p_sxbd
	@c_no int ,		--id
	@c_orgid int ,		-- 机构
	@c_companyid int ,	-- 保险公司
	@c_tbd char (30) ,	-- 投保单号
	@c_bd char (30) ,	-- 保单号
	@c_address char (80) ,	-- 通讯地址
	@c_zip char (20) ,    	-- 通讯邮编
	@c_tbrnum int ,		-- 投保人编号
	@c_bbrnum int ,		-- 被保人编号
	@c_tbrrel char (20) ,	-- 是投保人的*	
	@c_name1 char (20)  ,	-- 受益人姓名
	@c_sex1 char (1)  ,	-- 受益人性别
	@c_bbrrel1 char (20) , 	-- 是被保人的*	
	@c_sysx1 int ,		-- 受益顺序
	@c_sybl1 decimal(7, 2) ,-- 受益比例
	@c_cardtype1 char (4)  ,-- 证件类型
	@c_cardnum1 char (20)  ,-- 证件号码	
	@c_name2 char (20) ,	-- 受益人姓名
	@c_sex2 char (1)  ,	-- 受益人性别
	@c_bbrrel2 char (20) , 	-- 是被保人的*	
	@c_sysx2 int ,		-- 受益顺序
	@c_sybl2 decimal(7, 2) ,-- 受益比例
	@c_cardtype2 char (4) ,	-- 证件类型
	@c_cardnum2 char (20) ,	-- 证件号码	
	@c_name3 char (20) ,	-- 受益人姓名
	@c_sex3 char (1)  ,	-- 受益人性别
	@c_bbrrel3 char (20) , 	-- 是被保人的*	
	@c_sysx3 int ,		-- 受益顺序
	@c_sybl3 decimal(7, 2) ,-- 受益比例
	@c_cardtype3 char (4)  ,-- 证件类型
	@c_cardnum3 char (20)  ,-- 证件号码 	 
	@c_pay int ,		-- 交费方式
	@c_pad int ,		-- 垫交方式
	@c_controversy int ,	-- 争议处理方式	
	@c_bank char (4) ,	-- 银行
	@c_bankcode char (50) ,	-- 银行卡号
	@c_jobnumber char (10) ,-- 工号	
	@c_outletsid int ,
	@c_tbrq char (8) ,  
	@c_jobnm char (10) ,
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_system_sq int,
	@c_orgid_sq int,
	@c_companyid_temp int ,
	@c_tbd_temp char (30) ,	-- 投保单号
	@c_datime datetime   
	set @c_datime=getdate()		
	if not (isdate(@c_tbrq)=1 and len(@c_tbrq)=8)
	begin
		raiserror ('投保日期格式错误!', 16, 1)
		return @@error
	end
	select @c_orgid_sq=c_orgid,@c_system_sq=c_system from t_agentset where c_jobnumber=@c_jobnumber and c_flag='0'
	if @c_jobnm='add'
	begin  	 
		if not exists (	select c_jobnumber from t_staff where c_jobnumber=@c_jobnumber and c_quitdate is null )
		begin		
			raiserror ('工号：%s 无效！', 16, 1, @c_jobnumber)
			return @@error
		end
		if not exists (	select * from t_agentset where c_jobnumber=@c_jobnumber and c_system in(1,2) and c_flag='0' )
		begin		
			raiserror ('工号：%s 无效！, 请添加代理人所属事业部血缘关系', 16, 1, @c_jobnumber)
			return @@error
		end	
		insert  t_sxbd  	
		(	 
			c_orgid  ,		-- 机构
			c_companyid  ,		-- 保险公司
			c_tbd ,			-- 投保单号 
			c_bd ,			-- 保单号
			c_address ,		-- 通讯地址
			c_zip ,    		-- 通讯邮编
			c_tbrnum ,		-- 投保人编号
			c_bbrnum ,		-- 被保人编号
			c_tbrrel ,		-- 是投保人的*	
			c_name1 ,		-- 受益人姓名
			c_sex1 ,		-- 受益人性别
			c_bbrrel1 , 		-- 是被保人的*	
			c_sysx1 ,		-- 受益顺序
			c_sybl1 ,		-- 受益比例
			c_cardtype1 ,		-- 证件类型
			c_cardnum1 ,		-- 证件号码	
			c_name2 ,		-- 受益人姓名
			c_sex2 ,		-- 受益人性别
			c_bbrrel2 , 		-- 是被保人的*	
			c_sysx2 ,		-- 受益顺序
			c_sybl2 ,		-- 受益比例
			c_cardtype2 ,		-- 证件类型
			c_cardnum2 ,		-- 证件号码	
			c_name3 ,		-- 受益人姓名
			c_sex3 ,		-- 受益人性别
			c_bbrrel3 , 		-- 是被保人的*	
			c_sysx3 ,		-- 受益顺序
			c_sybl3 ,		-- 受益比例
			c_cardtype3 ,		-- 证件类型
			c_cardnum3 ,		-- 证件号码 	 
			c_pay ,			-- 交费方式
			c_pad ,			-- 垫交方式
			c_controversy ,		-- 争议处理方式	
			c_bank ,		-- 银行
			c_bankcode ,		-- 银行卡号
			c_jobnumber ,		-- 工号	
			c_outletsid ,		-- 网点
			c_orgid_sq,		-- 机构
			c_system_sq,		-- 政策体系
			c_tbrq ,  		-- 投保日期
			c_type_xq ,		 
			c_jobnumber_xq ,
			c_jobnm ,
			c_operator , 
			c_ip 
		) 
		values
		( 
			@c_orgid  ,		-- 机构
			@c_companyid  ,		-- 保险公司
			@c_tbd ,		-- 投保单号 
			@c_bd ,			-- 保单号
			@c_address ,		-- 通讯地址
			@c_zip ,    		-- 通讯邮编
			@c_tbrnum ,		-- 投保人编号
			@c_bbrnum ,		-- 被保人编号
			@c_tbrrel ,		-- 是投保人的*	
			@c_name1 ,		-- 受益人姓名
			@c_sex1 ,		-- 受益人性别
			@c_bbrrel1 , 		-- 是被保人的*	
			@c_sysx1 ,		-- 受益顺序
			@c_sybl1 ,		-- 受益比例
			@c_cardtype1 ,		-- 证件类型
			@c_cardnum1 ,		-- 证件号码	
			@c_name2 ,		-- 受益人姓名
			@c_sex2 ,		-- 受益人性别
			@c_bbrrel2 , 		-- 是被保人的*	
			@c_sysx2 ,		-- 受益顺序
			@c_sybl2 ,		-- 受益比例
			@c_cardtype2 ,		-- 证件类型
			@c_cardnum2 ,		-- 证件号码	
			@c_name3 ,		-- 受益人姓名
			@c_sex3 ,		-- 受益人性别
			@c_bbrrel3 , 		-- 是被保人的*	
			@c_sysx3 ,		-- 受益顺序
			@c_sybl3 ,		-- 受益比例
			@c_cardtype3 ,		-- 证件类型
			@c_cardnum3 ,		-- 证件号码 	 
			@c_pay ,		-- 交费方式
			@c_pad ,		-- 垫交方式
			@c_controversy ,	-- 争议处理方式	
			@c_bank ,		-- 银行
			@c_bankcode ,		-- 银行卡号
			@c_jobnumber ,		-- 工号	
			@c_outletsid ,		-- 网点
			@c_orgid_sq,		-- 机构
			@c_system_sq,		-- 政策体系
			@c_tbrq ,  		-- 投保日期
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
			c_orgid=@c_orgid  ,		-- 机构
			c_companyid=@c_companyid  ,	-- 保险公司
			c_tbd=@c_tbd ,			-- 投保单号 
			c_address=@c_address ,		-- 通讯地址
			c_zip=@c_zip ,    		-- 通讯邮编
			c_tbrnum=@c_tbrnum ,		-- 投保人编号
			c_bbrnum=@c_bbrnum ,		-- 被保人编号
			c_tbrrel=@c_tbrrel ,		-- 是投保人的*	
			c_name1=@c_name1 ,		-- 受益人姓名
			c_sex1=@c_sex1 ,		-- 受益人性别
			c_bbrrel1=@c_bbrrel1 , 		-- 是被保人的*	
			c_sysx1=@c_sysx1 ,		-- 受益顺序
			c_sybl1=@c_sybl1 ,		-- 受益比例
			c_cardtype1=@c_cardtype1 ,	-- 证件类型
			c_cardnum1=@c_cardnum1 ,	-- 证件号码	
			c_name2=@c_name2 ,		-- 受益人姓名
			c_sex2=@c_sex2 ,		-- 受益人性别
			c_bbrrel2=@c_bbrrel2 , 		-- 是被保人的*	
			c_sysx2=@c_sysx2 ,		-- 受益顺序
			c_sybl2=@c_sybl2 ,		-- 受益比例
			c_cardtype2=@c_cardtype2 ,	-- 证件类型
			c_cardnum2=@c_cardnum2 ,	-- 证件号码	
			c_name3=@c_name3 ,		-- 受益人姓名
			c_sex3=@c_sex3 ,		-- 受益人性别
			c_bbrrel3=@c_bbrrel3 , 		-- 是被保人的*	
			c_sysx3=@c_sysx3 ,		-- 受益顺序
			c_sybl3=@c_sybl3 ,		-- 受益比例
			c_cardtype3=@c_cardtype3 ,	-- 证件类型
			c_cardnum3=@c_cardnum3 ,	-- 证件号码 	 
			c_pay=@c_pay ,			-- 交费方式
			c_pad=@c_pad ,			-- 垫交方式
			c_controversy=@c_controversy ,	-- 争议处理方式	
			c_bank=@c_bank ,		-- 银行
			c_bankcode=@c_bankcode ,	-- 银行卡号
			c_jobnumber=@c_jobnumber ,	-- 工号	
			c_outletsid=@c_outletsid ,	-- 网点
			c_orgid_sq=@c_orgid_sq,		-- 机构
			c_system_sq=@c_system_sq,	-- 政策体系
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
			c_orgid=@c_orgid  ,		-- 机构
			c_companyid=@c_companyid  ,	-- 保险公司
			c_tbd=@c_tbd ,			-- 投保单号
			c_bd=@c_bd ,			-- 保单号
			c_address=@c_address ,		-- 通讯地址
			c_zip=@c_zip ,    		-- 通讯邮编
			c_tbrnum=@c_tbrnum ,		-- 投保人编号
			c_bbrnum=@c_bbrnum ,		-- 被保人编号
			c_tbrrel=@c_tbrrel ,		-- 是投保人的*	
			c_name1=@c_name1 ,		-- 受益人姓名
			c_sex1=@c_sex1 ,		-- 受益人性别
			c_bbrrel1=@c_bbrrel1 , 		-- 是被保人的*	
			c_sysx1=@c_sysx1 ,		-- 受益顺序
			c_sybl1=@c_sybl1 ,		-- 受益比例
			c_cardtype1=@c_cardtype1 ,	-- 证件类型
			c_cardnum1=@c_cardnum1 ,	-- 证件号码	
			c_name2=@c_name2 ,		-- 受益人姓名
			c_sex2=@c_sex2 ,		-- 受益人性别
			c_bbrrel2=@c_bbrrel2 , 		-- 是被保人的*	
			c_sysx2=@c_sysx2 ,		-- 受益顺序
			c_sybl2=@c_sybl2 ,		-- 受益比例
			c_cardtype2=@c_cardtype2 ,	-- 证件类型
			c_cardnum2=@c_cardnum2 ,	-- 证件号码	
			c_name3=@c_name3 ,		-- 受益人姓名
			c_sex3=@c_sex3 ,		-- 受益人性别
			c_bbrrel3=@c_bbrrel3 , 		-- 是被保人的*	
			c_sysx3=@c_sysx3 ,		-- 受益顺序
			c_sybl3=@c_sybl3 ,		-- 受益比例
			c_cardtype3=@c_cardtype3 ,	-- 证件类型
			c_cardnum3=@c_cardnum3 ,	-- 证件号码 	 
			c_pay=@c_pay ,			-- 交费方式
			c_pad=@c_pad ,			-- 垫交方式
			c_controversy=@c_controversy ,	-- 争议处理方式	
			c_bank=@c_bank ,		-- 银行
			c_bankcode=@c_bankcode ,	-- 银行卡号
			c_jobnumber=@c_jobnumber ,	-- 工号	
			c_outletsid=@c_outletsid ,	-- 网点
			c_orgid_sq=@c_orgid_sq,		-- 机构
			c_system_sq=@c_system_sq,	-- 政策体系
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
--寿险投保事项过程
if exists(select name from sysobjects where name='p_sxtb')
	drop procedure p_sxtb
go
create procedure p_sxtb
	@c_companyid int ,	-- 保险公司
	@c_tbd char (30) ,	-- 投保单号
	@c_bd char (30) ,	-- 保单号
	@c_productid int , 	-- 产品险种id	 
	@c_bxqtype int ,	-- 保险期间类型
	@c_bxq int ,		-- 保险期间
	@c_jfqtype int ,	-- 交费期间类型
	@c_jfq int ,		-- 交费期间
	@c_jfqx int , 		-- 交费期限
	@c_bxje decimal(15,2) ,	-- 保险金额
	@c_bxf decimal(15,2) , 	-- 保险费  
	@c_jobnm char (10) ,
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_age int,
	@c_bbrnum int,
	@c_birthy int,		--年
	@c_birthm int,		--月
	@c_birthd int,		--日	
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
				@c_birthy	,		--年
				@c_birthm	,		--月
				@c_birthd	,		--日
				@c_age		output	--年龄
			set @c_jfqx=@c_jfq-@c_age
		end
		insert  t_sxtb  	
		(	 
			c_companyid ,	-- 保险公司
			c_tbd ,		-- 投保单号 
			c_bd ,		-- 保单号 
			c_productid , 	-- 产品险种id	 
			c_bxqtype ,	-- 保险期间N年
			c_bxq ,		-- 保险期间至N周岁
			c_jfqtype ,	-- 交费期间N年
			c_jfq ,		-- 交费期间至N周岁
			c_jfqx , 	-- 交费期
			c_bxje ,	-- 保险金额
			c_bxf , 	-- 保险费  
			c_jobnm ,
			c_operator , 
			c_ip   
		) 
		values
		( 
			@c_companyid ,	-- 保险公司
			@c_tbd ,	-- 投保单号 
			@c_bd ,		-- 保单号 
			@c_productid , 	-- 产品险种id	 
			@c_bxqtype ,	-- 保险期间N年
			@c_bxq ,	-- 保险期间至N周岁
			@c_jfqtype ,	-- 交费期间N年
			@c_jfq ,	-- 交费期间至N周岁
			@c_jfqx , 	-- 交费期
			@c_bxje ,	-- 保险金额
			@c_bxf , 	-- 保险费  
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
			c_companyid ,	-- 保险公司
			c_tbd ,		-- 投保单号 
			c_bd ,		-- 保单号 
			c_productid , 	-- 产品险种id	 
			c_bxqtype ,	-- 保险期间N年
			c_bxq ,		-- 保险期间至N周岁
			c_jfqtype ,	-- 交费期间N年
			c_jfq ,		-- 交费期间至N周岁
			c_jfqx , 	-- 交费期
			c_bxje ,	-- 保险金额
			c_bxf , 	-- 保险费  
			c_jobnm ,
			c_operator , 
			c_ip   
		) 
		values
		( 
			@c_companyid ,	-- 保险公司
			@c_tbd ,	-- 投保单号 
			@c_bd ,		-- 保单号 
			@c_productid , 	-- 产品险种id	 
			@c_bxqtype ,	-- 保险期间N年
			@c_bxq ,	-- 保险期间至N周岁
			@c_jfqtype ,	-- 交费期间N年
			@c_jfq ,	-- 交费期间至N周岁
			@c_jfqx , 	-- 交费期
			@c_bxje ,	-- 保险金额
			@c_bxf , 	-- 保险费  
			@c_jobnm ,
			@c_operator , 
			@c_ip   
		)	 
	end		 
return 0
go
--寿险投保单撤单过程
if exists(select name from sysobjects where name='p_sxbd_cd')
	drop procedure p_sxbd_cd
go
create procedure p_sxbd_cd
	@c_companyid int ,	-- 保险公司
	@c_tbd char (30) ,	-- 投保单号 	
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
	update t_sxbd set c_jobnm='4'	-- 4 犹豫期退保 
		where c_companyid=@c_companyid and c_tbd=@c_tbd	 
return 0
go
--寿险保单生效过程
if exists(select name from sysobjects where name='p_sxbd_sx')
	drop procedure p_sxbd_sx
go
create procedure p_sxbd_sx
	@c_companyid int ,	-- 保险公司
	@c_tbd char (30) ,	-- 投保单号 	
	@c_bd char (30) ,	-- 保单号  
	@c_cardnum char (40) ,	-- 投保人证件号码	
	@c_jobnumber char (10) ,-- 代理人工号	
	@c_bxf decimal(15,2) , 	-- 保险费合计 
	@c_date char(8) ,	-- 承保日期 
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
		raiserror ('投保人证件号码不一致!', 16, 1)
		return @@error
	end
	if @c_jobnumber_temp<>@c_jobnumber
	begin
		raiserror ('代理人工号不一致!', 16, 1)
		return @@error
	end
	if abs(@c_bxf_temp-@c_bxf)<1
	begin
		raiserror ('保险费合计不一致!', 16, 1)
		return @@error
	end 
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('承保日期格式错误!', 16, 1)
		return @@error
	end
	if exists(select * from t_sxbd where c_companyid=@c_companyid and c_bd=@c_bd)
	begin
		raiserror ('保单号不可以重复存在！！!', 16, 1)
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
--寿险保单发放过程
if exists(select name from sysobjects where name='p_sxbd_ff')
	drop procedure p_sxbd_ff
go
create procedure p_sxbd_ff
	@c_companyid int ,	-- 保险公司
	@c_tbd char (30) ,	-- 投保单号 	
	@c_bd char (30) ,	-- 保单号   
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
--寿险保单回执过程
if exists(select name from sysobjects where name='p_sxbd_hz')
	drop procedure p_sxbd_hz
go
create procedure p_sxbd_hz
	@c_companyid int ,	-- 保险公司
	@c_tbd char (30) ,	-- 投保单号 	
	@c_bd char (30) ,	-- 保单号   
	@c_date char(8) ,	-- 签字日期 
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_datime datetime   
	set @c_datime=getdate()		  
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('签字日期格式错误!', 16, 1)
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
--寿险保单退保过程
if exists(select name from sysobjects where name='p_sxbd_tb')
	drop procedure p_sxbd_tb
go
create procedure p_sxbd_tb
	@c_companyid int ,	-- 保险公司 
	@c_tbd char (30) ,	-- 投保单号 
	@c_bd char (30) ,	-- 保单号   
	@c_type int ,		-- 4 犹豫期退保 5 正常退保 
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
--寿险保单状态恢复过程
if exists(select name from sysobjects where name='p_sxbd_back')
	drop procedure p_sxbd_back
go
create procedure p_sxbd_back
	@c_companyid int ,	-- 保险公司
	@c_tbd char (30) ,	-- 投保单号 	
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
--寿险保单日期修改过程
if exists(select name from sysobjects where name='p_sxbd_rq')
	drop procedure p_sxbd_rq
go
create procedure p_sxbd_rq
	@c_companyid int ,	-- 保险公司
	@c_tbd char (30) ,	-- 投保单号 	
	@c_jobnm char(10) , 	-- a 投保日期 b 承保日期 c 回执日期
	@c_date char(8) ,	-- 日期 
	@c_operator char(10) , 
	@c_ip char (25)  
as 	  
declare @c_datime datetime   
	set @c_datime=getdate()	 
	if not (isdate(@c_date)=1 and len(@c_date)=8)
	begin
		raiserror ('输入日期格式错误!', 16, 1)
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
--寿险投保单送达书过程
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
		raiserror ('输入日期格式错误!', 16, 1)
		return @@error
	end
	if exists(select * from t_sxtbsds where c_orgid=@c_orgid and c_date=@c_date and c_companyid=@c_companyid)
	begin
		select @c_times=max(c_times)+1 from t_sxtbsds where c_orgid=@c_orgid and c_date=@c_date and c_companyid=@c_companyid
	end	
	insert  t_sxtbsds  	
	(	  
		c_orgid,	-- 机构
		c_companyid,	-- 保险公司 
		c_tbd,		-- 投保单 
		c_tbrnum,	-- 投保人编号   
		c_date,		-- 日期
		c_times,	-- 次数
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
--寿险投保单日结单过程
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
		raiserror ('输入日期格式错误!', 16, 1)
		return @@error
	end
	delete  t_sxtbrjd where c_orgid=@c_orgid and c_date=@c_date
	insert  t_sxtbrjd	
	(	  
		c_orgid,	-- 机构
		c_companyid,	-- 保险公司 
		c_tbd,		-- 投保单 
		c_tbrnum,	-- 投保人编号   
		c_jobnumber,	-- 代理人工号
		c_date,		-- 日期 
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
--寿险保单生效日结单过程
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
		raiserror ('输入日期格式错误!', 16, 1)
		return @@error
	end	
	delete  t_sxsxrjd where c_orgid=@c_orgid and c_date=@c_date
	insert  t_sxsxrjd	
	(	  
		c_orgid,	-- 机构
		c_companyid,	-- 保险公司 
		c_tbd,		-- 投保单 
		c_bd,		-- 保单 		 
		c_date,		-- 日期 
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
--寿险保单发放清单过程
if exists(select name from sysobjects where name='p_sxffqd')
	drop procedure p_sxffqd
go
create procedure p_sxffqd
	@c_companyid 	int ,		-- 保险公司
	@c_bd 		char (30) ,	-- 保单号 		
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
		c_companyid,	-- 保险公司  
		c_bd,		-- 保单 	
		c_orgid,	-- 机构	 
		c_date,		-- 日期 
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
--寿险保单回执送达书过程
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
		raiserror ('输入日期格式错误!', 16, 1)
		return @@error
	end
	if exists(select * from t_sxhzsds where c_orgid=@c_orgid and c_date=@c_date and c_companyid=@c_companyid)
	begin
		select @c_times=max(c_times)+1 from t_sxhzsds where c_orgid=@c_orgid and c_date=@c_date and c_companyid=@c_companyid
	end	
	insert  t_sxhzsds  	
	(	  
		c_orgid,	-- 机构
		c_companyid,	-- 保险公司 
		c_bd,		-- 保单    
		c_date,		-- 日期
		c_times,	-- 次数
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
--寿险保单回执日结单过程
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
		raiserror ('输入日期格式错误!', 16, 1)
		return @@error
	end
	delete  t_sxhzrjd where c_orgid=@c_orgid and c_date=@c_date
	insert  t_sxhzrjd	
	(	  
		c_orgid,	-- 机构
		c_companyid,	-- 保险公司  
		c_bd,		-- 保单 		 
		c_date,		-- 日期 
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
--寿险续期发票过程
if exists(select name from sysobjects where name='p_sxtb_xq')
	drop procedure p_sxtb_xq
go
create procedure p_sxtb_xq
	@c_no int,
	@c_orgid int,
	@c_companyid int ,	-- 保险公司
	@c_bd char (30) ,	-- 保单号
	@c_tbrname char(30),	-- 投保人姓名	
	@c_bdnd int,		-- 保单年度
	@c_code char(8),	-- 发票号码
	@c_fprq char(8),	-- 发票日期
	@c_productid int , 	-- 产品险种id	  
	@c_bxf decimal(15,2) , 	-- 保险费  	
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
		raiserror ('发票日期格式错误!', 16, 1)
		return @@error
	end	
	if @c_jobnm='add'
	begin
		select @c_tbrnum=c_tbrnum from t_sxbd where c_orgid=@c_orgid and c_companyid=@c_companyid and c_bd=@c_bd and c_jobnm='0' and c_flag='0'
		select @c_tbrname_temp=c_name  from t_customer where c_no=@c_tbrnum
		if @c_tbrname_temp <> @c_tbrname
		begin
			raiserror ('投保人姓名不一致!', 16, 1)
			return @@error
		end		
		insert  t_sxtb_xq	
		(	  
			c_orgid ,		-- 机构
			c_companyid ,		-- 保险公司
			c_bd ,			-- 保单
			c_tbrname ,		-- 投保人姓名	
			c_bdnd ,		-- 保单年度
			c_code ,		-- 发票号码
			c_fprq ,		-- 发票日期
			c_productid , 		-- 产品险种id		
			c_bxf , 		-- 保险费  			
			c_jobnm ,
			c_operator , 
			c_ip
		) 
		values
		(
			@c_orgid ,		-- 机构
			@c_companyid ,		-- 保险公司
			@c_bd ,			-- 保单
			@c_tbrname ,		-- 投保人姓名	
			@c_bdnd ,		-- 保单年度
			@c_code ,		-- 发票号码
			@c_fprq ,		-- 发票日期
			@c_productid , 		-- 产品险种id		
			@c_bxf , 		-- 保险费   
			@c_jobnm ,
			@c_operator , 
			@c_ip
		)
	end	
	if @c_jobnm='update'
	begin
		update t_sxtb_xq
			set c_code=@c_code,
			c_fprq=@c_fprq ,		-- 发票日期
			c_productid=@c_productid , 	-- 产品险种id		
			c_bxf=@c_bxf  			-- 保险费   
		where c_no=@c_no	
	end
	if @c_jobnm='del'
	begin
		delete t_sxtb_xq where c_no=@c_no
	end
return 0
go
--催缴查询
if exists(select name from sysobjects where name='p_cjcx_xq')
	drop procedure p_cjcx_xq
go
create procedure p_cjcx_xq 
	@c_orgid int ,		--机构id
	@c_companyid int , 	--公司id	
	@c_year	 int , 		--年
	@c_month int  		--月	 
as  
	 
	create table #t_xqys
	(
		c_companyid int ,		-- 保险公司 
		c_bd char (30)  ,		-- 保单号
		c_tbrnum char(10),		-- 投保人客户号
		c_tbrname char(20),		-- 投保人姓名 
		c_phone char (30)  ,		-- 投保人固定电话 
		c_mobile char (30) ,		-- 投保人移动电话 
		c_hddr char (80)  ,		-- 投保人常住地址
		c_bbrnum char(10),		-- 被保人客户号
		c_bbrname char(20),		-- 被保人姓名 
		c_bank char (4),		-- 银行
		c_bankcode char (50),		-- 银行卡号
		c_cbrq char (8),		-- 承保日期
		c_productid int , 		-- 产品险种id	 
		c_jfqx int , 			-- 交费期限
		c_bdnd int ,			-- 保单年度
		c_bxf decimal(15,2) , 		-- 保险费  			  
		c_orgid int ,			-- 机构
		c_orgname char (50) ,		-- 机构姓名
		c_jobnumber char(10) ,		-- 代理人工号
		c_outletsid int ,		-- 网点
		c_name char(20) ,		-- 代理人姓名
		c_telephone char(20),		-- 代理人固定电话
		c_mobilephone char(20)  	-- 代理人手机 
	)
	insert #t_xqys
	(
		c_companyid ,		-- 保险公司 
		c_bd ,			-- 保单号
		c_tbrnum ,		-- 投保人客户号
		c_bbrnum ,		-- 被保人客户号
		c_bank ,		-- 银行
		c_bankcode ,		-- 银行卡号
		c_cbrq ,		-- 承保日期
		c_productid , 		-- 产品险种id	 
		c_jfqx , 		-- 交费期限
		c_bdnd ,		-- 保单年度
		c_bxf , 		-- 保险费  	 
		c_jobnumber , 		-- 代理人工号
		c_outletsid		-- 网点
	)
	select  a.c_companyid ,		-- 保险公司 
		a.c_bd ,		-- 保单号
		a.c_tbrnum ,		-- 投保人客户号		
		a.c_bbrnum ,		-- 被保人客户号
		a.c_bank ,		-- 银行
		a.c_bankcode ,		-- 银行卡号
		b.c_date ,		-- 承保日期
		d.c_productid , 	-- 产品险种id	 
		d.c_jfqx , 		-- 交费期限 
		datediff(year,b.c_date,str(@c_year,4)+right(b.c_date,4))+1 ,--保单年度 
		d.c_bxf , 		-- 保险费  
		a.c_jobnumber_xq, 	-- 代理人工号
		a.c_outletsid		-- 网点
	from t_sxbd a,t_sxbdzt b,t_staff c,t_sxtb d
	where a.c_companyid=b.c_companyid and a.c_bd=b.c_bd
		and a.c_companyid=d.c_companyid and a.c_bd=d.c_bd
		and a.c_companyid=@c_companyid and a.c_orgid=@c_orgid and b.c_type=1
		and a.c_jobnumber_xq=c.c_jobnumber 
		and month(b.c_date)=@c_month and year(b.c_date)< @c_year		  
		and a.c_flag='0' and a.c_jobnm in ('0','5')		 	 		 		
	--删除无需催缴的行 
	delete #t_xqys where c_jfqx < c_bdnd
	--取投保人姓名
	update #t_xqys set c_tbrname=(select c_name from t_customer where c_no=#t_xqys.c_tbrnum)
	--取投保人固话
	update #t_xqys set c_phone=(select c_phone  from t_customer where c_no=#t_xqys.c_tbrnum)
	--取投保人移动电话
	update #t_xqys set c_mobile=(select c_mobile from t_customer where c_no=#t_xqys.c_tbrnum)	
	--取投保人常住地址
	update #t_xqys set c_hddr=(select c_hddr from t_customer where c_no=#t_xqys.c_tbrnum)
	--取被保人姓名
	update #t_xqys set c_bbrname=(select c_name from t_customer where c_no=#t_xqys.c_bbrnum)
	--机构ID
	update #t_xqys set c_orgid=(select c_orgid from  t_staff where c_jobnumber=#t_xqys.c_jobnumber)  	 
	--机构姓名
	update #t_xqys set c_orgname=(select rtrim(c_name) from t_organization where c_no=#t_xqys.c_orgid)  	 
	--代理人姓名
	update #t_xqys set c_name=(select c_name from  t_staff where c_jobnumber=#t_xqys.c_jobnumber)   
	--代理人固定电话
	update #t_xqys set c_telephone=(select c_telephone from  t_staff where c_jobnumber=#t_xqys.c_jobnumber)  
	--代理人手机 	
	update #t_xqys set c_mobilephone=(select c_mobilephone from  t_staff where c_jobnumber=#t_xqys.c_jobnumber)  	  	
	select * from #t_xqys  order by c_orgid,c_companyid,c_bd,c_bdnd	
return 0
go
--收缴进度查询
if exists(select name from sysobjects where name='p_sjjdcx')
	drop procedure p_sjjdcx
go
create procedure p_sjjdcx 
	@c_orgtypeid int ,	--机构类型id
	@c_orgid int ,		--机构id
	@c_year	 int , 		--年
	@c_month int  		--月 		 
as  
declare @c_order int,
	@c_path varchar (14),
	@c_bdnd	int,			-- 保单年度
	@c_companyid int ,		-- 保险公司
	@c_bd char (30) ,		-- 保单
	@c_skrq char (8),		-- 收款日期
	@c_date char (8)  		-- 退保日期	   	
	create table #t_xqjd
	(
		c_skrq char (8),		-- 收款日期
		c_bdnd int,			-- 保单年度
		c_orgid_sq int,			-- 机构	
		c_system_sq int ,		-- 政策体系  	
		c_companyid int ,		-- 保险公司 
		c_bd char (30)  ,		-- 保单号
		c_tbrnum char(10),		-- 投保人客户号 
		c_bbrnum char(10),		-- 被保人客户号
		c_bank char (4),		-- 银行
		c_bankcode char (50),		-- 银行卡号 
		c_productid int , 		-- 产品险种id	 
		c_jfqx int , 			-- 交费期限
		c_bxf decimal(15,2) , 		-- 保险费		
		c_cbrq char (8),		-- 承保日期
		c_jobnumber char(10) ,		-- 代理人工号
		c_outletsid int ,		-- 网点
		c_jobnm char (10)  		--		  
	)
	select @c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid	 
	insert #t_xqjd
		(
		c_skrq ,		-- 收款日期
		c_bdnd ,		-- 保单年度
		c_orgid_sq ,		-- 机构	
		c_system_sq ,		-- 政策体系  	
		c_companyid ,		-- 保险公司 
		c_bd ,			-- 保单号
		c_tbrnum ,		-- 投保人客户号 
		c_bbrnum ,		-- 被保人客户号
		c_bank ,		-- 银行
		c_bankcode ,		-- 银行卡号 
		c_productid , 		-- 产品险种id	 
		c_jfqx ,		-- 交费期限
		c_bxf , 		-- 保险费		
		c_cbrq ,		-- 承保日期
		c_jobnumber ,		-- 代理人工号
		c_outletsid ,		-- 网点
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

	--删除无需催缴的行 
	delete #t_xqjd where c_jfqx < c_bdnd

	declare c_temp1 cursor for	
	select c_skrq,c_bdnd,c_companyid,c_bd from #t_xqjd
	open	c_temp1
	fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
	while (@@fetch_status = 0)
	begin  	
		--前年度未缴费，后年度不显示
		if not exists(select * from t_sxtb_xq where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd-1) and @c_bdnd>2
		begin
			update #t_xqjd set c_jobnm='del' where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
			fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
			continue
		end
		--当年度退保，当年度显示，后年度不显示
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
--寿险报案过程
if exists(select name from sysobjects where name='p_sxlpba')
	drop procedure p_sxlpba
go
create procedure p_sxlpba
	@c_no int,
	@c_orgid int ,			-- 机构
	@c_companyid int ,		-- 保险公司
	@c_bd char (30) ,		-- 保单
	@c_tbrname char (30) ,		-- 投保人姓名
	@c_barq char (8) ,		-- 报案日期
	@c_basm varchar (1000) ,	-- 报案说明		 
	@c_jobnm char (10) ,		-- 报案：ba  结案: ja
	@c_operator char (10) , 
	@c_ip char (25)   
as 	   
declare @c_tbrnum int,
	@c_tbrname_temp char(30),	
	@c_datime datetime   
	set @c_datime=getdate()		
	if not (isdate(@c_barq)=1 and len(@c_barq)=8)
	begin
		raiserror ('报案日期格式错误!', 16, 1)
		return @@error
	end
	if @c_jobnm='add'
	begin
		select @c_tbrnum=c_tbrnum from t_sxbd where c_orgid=@c_orgid and c_companyid=@c_companyid and c_bd=@c_bd and c_jobnm='0' and c_flag='0'
		select @c_tbrname_temp=c_name  from t_customer where c_no=@c_tbrnum
		if not exists(select * from t_sxbd where c_orgid=@c_orgid and c_companyid=@c_companyid and c_bd=@c_bd 
			and c_jobnm='0' and c_flag='0') or @c_tbrname_temp <> @c_tbrname 
		begin
			raiserror ('保单号不存在或投保人姓名不一致!', 16, 1)
			return @@error
		end
		insert  t_sxlp	
		(	  
			c_orgid ,		-- 机构
			c_companyid ,		-- 保险公司
			c_bd ,			-- 保单
			c_tbrname ,		-- 投保人姓名
			c_barq ,		-- 报案日期
			c_basm ,		-- 报案说明		 
			c_jobnm ,		-- 报案：ba  结案: ja
			c_operator , 
			c_ip    
		) 
		values
		(
			@c_orgid ,		-- 机构
			@c_companyid ,		-- 保险公司
			@c_bd ,			-- 保单
			@c_tbrname ,		-- 投保人姓名
			@c_barq ,		-- 报案日期
			@c_basm ,		-- 报案说明		 
			'ba' ,			-- 报案：ba  结案: ja
			@c_operator , 
			@c_ip    
		)
	end	
	if @c_jobnm='update'
	begin
		update t_sxlp
			set c_barq=@c_barq ,		-- 报案日期
			c_basm=@c_basm ,		-- 报案说明
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
--寿险结案过程
if exists(select name from sysobjects where name='p_sxlpja')
	drop procedure p_sxlpja
go
create procedure p_sxlpja
	@c_no int,
	@c_orgid int ,			-- 机构
	@c_companyid int ,		-- 保险公司
	@c_bd char (30) ,		-- 保单 
	@c_jarq char (8) ,		-- 结案日期
	@c_jasm varchar (1000) ,	-- 结案说明		 
	@c_jajg int ,			-- 结案结果 1 理赔 2 拒赔
	@c_je decimal(15,2),		-- 赔付金额
	@c_bdzt char (10),		-- 保单状态
	@c_jobnm char (10) ,		-- 
	@c_operator char (10) , 
	@c_ip char (25)   
as 	   
declare @c_type int ,
	@c_tbd char (30) ,		-- 投保单 
	@c_datime datetime   
	set @c_datime=getdate()	
	if not (isdate(@c_jarq)=1 and len(@c_jarq)=8)
	begin
		raiserror ('结案日期格式错误!', 16, 1)
		return @@error
	end	
	if @c_jobnm='add'
	begin 
		update t_sxlp
			set c_jarq=@c_jarq ,		-- 结案日期
			c_jasm=@c_jasm ,		-- 结案说明
			c_jajg=@c_jajg ,		-- 结案结果
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
			set c_jarq=@c_jarq ,		-- 结案日期
			c_jasm=@c_jasm ,		-- 结案说明
			c_jajg=@c_jajg ,		-- 结案结果
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