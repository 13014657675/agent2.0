if exists(select name from sysobjects where name='p_agentcommission')
           drop procedure p_agentcommission
go
create procedure p_agentcommission
	@c_year		int,				--佣金计算年份
	@c_month	int,				--佣金计算月份		 
	@c_orgid 	int,				--机构
	@c_jobnumber 	char(10),			--工号
	@c_str		varchar(2000) ,			--工资条（明细）	   
	@c_strv		decimal(15,2) 			--工资条（合计）      
as
declare @c_name 	char(20),			--姓名
	@c_system 	int,	 	 		--政策  
	@c_type 	int  	   
  	select @c_system=c_system,@c_name=c_name,@c_type=c_type from v_sxagent where c_jobnumber=@c_jobnumber
  	insert t_agentcommission
  	(
	  	c_year		,			--佣金计算年份
		c_month		,			--佣金计算月份		 
		c_orgid 	, 
		c_jobnumber 	,	 	 
		c_name		,			--业务员工号
		c_system	,			--业务员姓名	   
		c_type 		, 
		c_str		,			--公式	   
		c_strv		 			--    	
  	) 
  	values
  	(
  		@c_year		,			--佣金计算年份
		@c_month	,			--佣金计算月份		 
		@c_orgid 	, 
		@c_jobnumber 	,	 	 
		@c_name		,			--业务员工号
		@c_system	,			--业务员姓名	   
		@c_type 	, 
		@c_str		,			--公式	   
		@c_strv		 
  	
  	)   	 
return 0
go
--直营
--首年度佣金
if exists(select name from sysobjects where name='pb_agentyj1_1')
	drop proc pb_agentyj1_1
go
create proc pb_agentyj1_1
	@c_year	int,@c_month int,@c_orgid int,@c_jobnumber char(10)
as 
declare @c_dec decimal(15, 3),
	@c_system int, 
	@c_type int,
	@c_bxfy decimal(15,3)   	 
	set @c_system=1
	if not exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
	begin
		raiserror ('代理人工号：%s 无效', 16, 1,@c_jobnumber)
		return @@error	
	end 
	--代理人职位代码
	select @c_type=c_type from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 
	--代理人首期佣金
	select @c_bxfy=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year and a.c_month=@c_month and a.c_bdnd=1
		and b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnumber=@c_jobnumber
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd
	if @c_bxfy is null
		set @c_bxfy=0	
	if @c_type=10	--10理财顾问80%佣金
	begin
		set @c_dec=@c_bxfy * 0.8
	end
	else
	begin
		set @c_dec=@c_bxfy
	end
	select @c_dec
return 0
go
--续年度佣金
if exists(select name from sysobjects where name='pb_agentyj1_2')
	drop proc pb_agentyj1_2
go
create proc pb_agentyj1_2
	@c_year	int,@c_month int,@c_orgid int,@c_jobnumber char(10)
as 
declare @c_dec decimal(15, 3),
	@c_system int,
	@c_type_temp int,
	@c_type int,
	@c_bxfy1 decimal(15,3),
	@c_bxfy2 decimal(15,3)   	 
	set @c_system=1
	if not exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
	begin
		raiserror ('代理人工号：%s 无效', 16, 1,@c_jobnumber)
		return @@error	
	end 	 	
	set @c_dec=0
	--代理人续期佣金 
	select @c_bxfy1=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year and a.c_month=@c_month and a.c_bdnd>1
		and b.c_type_xq=1 and b.c_jobnumber_xq=@c_jobnumber	--1.正常情况
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd	
	select @c_bxfy2=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year and a.c_month=@c_month and a.c_bdnd>1
		and b.c_type_xq=2 and b.c_jobnumber_xq=@c_jobnumber	--2.递归情况
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd	
	if @c_bxfy1 is null 
		set @c_bxfy1=0	
	if @c_bxfy2 is null 
		set @c_bxfy2=0		 
	set @c_dec=@c_bxfy1 + @c_bxfy2 * 0.5 	
	select @c_dec
return 0
go
--月度奖金
if exists(select name from sysobjects where name='pb_agentyj1_3')
	drop proc pb_agentyj1_3
go
create proc pb_agentyj1_3
	@c_year	int,@c_month int,@c_orgid int,@c_jobnumber char(10)
as 
declare @c_dec decimal(15, 3),
	@c_system int,
	@c_type int, 
	@c_bxfy decimal(15,3)   	 
	set @c_system=1
	if not exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
	begin
		raiserror ('代理人工号：%s 无效', 16, 1,@c_jobnumber)
		return @@error	
	end 	  
	--代理人职位代码
	select @c_type=c_type from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 
	--代理人首期佣金
	select @c_bxfy=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year and a.c_month=@c_month and a.c_bdnd=1
		and b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnumber=@c_jobnumber
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd 
	if @c_bxfy is null
		set @c_bxfy=0	
	if @c_type>=11	--11理财主任
	begin
		if @c_bxfy<1000
		begin
			set @c_dec=0
		end 
		if @c_bxfy>=1000 and @c_bxfy<1500
		begin
			set @c_dec=300
		end 
		if @c_bxfy>=1500 and @c_bxfy<2000
		begin
			set @c_dec=500
		end 
		if @c_bxfy>=2000 and @c_bxfy<2500
		begin
			set @c_dec=750
		end 
		if @c_bxfy>=2500 and @c_bxfy<3000
		begin
			set @c_dec=1000
		end 
		if @c_bxfy>=3000 and @c_bxfy<4000
		begin
			set @c_dec=@c_bxfy * 0.4
		end 
		if @c_bxfy>=4000 and @c_bxfy<6000
		begin
			set @c_dec=@c_bxfy * 0.45
		end 
		if @c_bxfy>=6000 and @c_bxfy<8000
		begin
			set @c_dec=@c_bxfy * 0.5
		end 
		if @c_bxfy>=8000
		begin
			set @c_dec=@c_bxfy * 0.55
		end 
	end 
	select @c_dec
return 0
go
--增员奖金
if exists(select name from sysobjects where name='pb_agentyj1_4')
	drop proc pb_agentyj1_4
go
create proc pb_agentyj1_4
	@c_year	int,@c_month int,@c_orgid int,@c_jobnumber char(10)
as 
declare @c_dec decimal(15, 3),
	@c_system int,
	@c_type int, 
	@t_jobnumber char(10),	--临时工号
	@t_sxrgh char(10),	--临时工号
	@x_jobnumber char(10),	--临时工号 
	@c_bxfy decimal(15,3)   	 
	set @c_system=1
	if not exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
	begin
		raiserror ('代理人工号：%s 无效', 16, 1,@c_jobnumber)
		return @@error	
	end 	 
	set @c_dec=0
	--代理人职位代码
	select @c_type=c_type from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'   
	if @c_type>=11	--11理财主任
	begin 
		select  c_jobnumber,c_sxrgh into #t_temp1 from t_agentset 
			where c_orgid=@c_orgid and c_system=@c_system and c_tjrgh=@c_jobnumber or c_cxrgh=@c_jobnumber 
		declare c_cursor cursor for 	
		select 	c_jobnumber,c_sxrgh from #t_temp1
		open	c_cursor
		fetch	next from c_cursor into @t_jobnumber,@t_sxrgh			
		while	(@@fetch_status = 0)
		begin	
			set @x_jobnumber=null
			if exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@t_jobnumber and c_flag='0')
			begin	--本人
				set @x_jobnumber=@t_jobnumber
			end
			else
			begin
				if exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@t_sxrgh and c_flag='0')
				begin	--增员世袭人
					set @x_jobnumber=@t_sxrgh
				end
			end
			set @c_bxfy=null
			select @c_bxfy=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year and a.c_month=@c_month and a.c_bdnd=1
				and b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnumber=@x_jobnumber
				and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd
			if @c_bxfy is null
				set @c_bxfy=0	
			set @c_dec=@c_dec+@c_bxfy * 0.1	
			fetch	next from c_cursor into @t_jobnumber,@t_sxrgh		
		end
		close c_cursor
		deallocate c_cursor  	
		drop table #t_temp1	
	end 
	select @c_dec
return 0
go
--管理津贴
if exists(select name from sysobjects where name='pb_agentyj1_5')
	drop proc pb_agentyj1_5
go
create proc pb_agentyj1_5
	@c_year	int,@c_month int,@c_orgid int,@c_jobnumber char(10)
as 
declare @c_r1 decimal(7,4) , 
	@c_r2 decimal(7,4) ,   
	@c_count_temp int ,
	@c_dec_temp decimal(15, 3),
	@c_dec decimal(15, 3),
	@c_ksrq char(8) ,
	@c_jsrq char(8) ,
	@c_system int,
	@c_type int, 
	@t_jobnumber char(10),	--临时工号 
	@x_jobnumber char(10),	--临时工号 
	@c_bxfy decimal(15,3)   	 
	set @c_system=1
	if not exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
	begin
		raiserror ('代理人工号：%s 无效', 16, 1,@c_jobnumber)
		return @@error	
	end 	 
	set @c_dec=0
	--代理人职位代码
	select @c_type=c_type from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'   
	if @c_type>=20	--20理财经理
	begin
		-- 直辖室月累计FYC
		set @c_dec_temp=0
		select c_jobnumber into #t_temp1 from t_agentls 
			where c_orgid=@c_orgid and c_system=@c_system and c_director=@c_jobnumber and c_type in (10,11)
			and c_flag='0'
			or c_jobnumber=@c_jobnumber
		declare c_cursor cursor for 	
		select 	distinct c_jobnumber from #t_temp1
		open	c_cursor
		fetch	next from c_cursor into @t_jobnumber			
		while	(@@fetch_status = 0)
		begin	 
			set @c_bxfy=null
			select @c_bxfy=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year and a.c_month=@c_month and a.c_bdnd=1
				and b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnumber=@t_jobnumber
				and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd
			if @c_bxfy is null
				set @c_bxfy=0			 
			set @c_dec_temp=@c_dec_temp+@c_bxfy	
			fetch	next from c_cursor into @t_jobnumber	
		end
		close c_cursor
		deallocate c_cursor  			
		drop table #t_temp1	
		-- 月累计新增客户 
		exec p_zjbd_1_month
			@c_year		,	--年
			@c_month	,	--月  
			@c_ksrq	output  ,	-- 
			@c_jsrq	output	  	-- 
		select @c_count_temp=count(*) from t_agentset where c_orgid=@c_orgid and c_system=@c_system
			and c_tjrgh=@c_jobnumber and c_datime between @c_ksrq and @c_jsrq
			and c_flag='0'
		-- 计提比例		
		set @c_r1=0	
		if @c_dec_temp < 2000
		begin
			set @c_r1=0.05
		end 
		if @c_dec_temp >= 2000 and @c_dec_temp < 3000
		begin
			set @c_r1=0.1
		end 
		if @c_dec_temp >= 3000 and @c_dec_temp < 4500
		begin
			set @c_r1=0.15
		end 
		if @c_dec_temp >= 4500 and @c_dec_temp < 6000
		begin
			set @c_r1=0.2
		end 
		if @c_dec_temp >= 6000
		begin
			set @c_r1=0.25
		end  
		-- 补贴比例
		set @c_r2=0	
		if @c_count_temp >= 4 and @c_count_temp < 6
		begin
			set @c_r2=0.03
		end 
		if @c_count_temp >= 6 and @c_count_temp < 8
		begin
			set @c_r2=0.05
		end 
		if @c_count_temp >= 8 and @c_count_temp < 10
		begin
			set @c_r2=0.07
		end 
		if @c_count_temp >= 10
		begin
			set @c_r2=0.1
		end  
		set @c_dec=@c_dec_temp * ( @c_r1 + @c_r2 )
	end 
	select @c_dec
return 0
go
--育成津贴
if exists(select name from sysobjects where name='pb_agentyj1_6')
	drop proc pb_agentyj1_6
go
create proc pb_agentyj1_6
	@c_year	int,@c_month int,@c_orgid int,@c_jobnumber char(10)
as 
declare @c_dec_temp decimal(15, 3),
	@c_dec decimal(15, 3), 
	@c_system int,
	@c_type int, 
	@c_bycgh char(10),	--临时工号 
	@t_jobnumber char(10),	--临时工号 
	@c_bxfy decimal(15,3)   	 
	set @c_system=1
	if not exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
	begin
		raiserror ('代理人工号：%s 无效', 16, 1,@c_jobnumber)
		return @@error	
	end 	 
	set @c_dec=0
	--代理人职位代码
	select @c_type=c_type from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'   
	if @c_type>=11	--11理财主任
	begin
		select c_bycgh into #t_temp1 from t_agentgx 
			where c_system=@c_system and c_layer=1 and c_ycgh=@c_jobnumber and c_byczj=20
		declare c_cursor1 cursor for 	
		select 	distinct c_bycgh from #t_temp1
		open	c_cursor1
		fetch	next from c_cursor1 into @c_bycgh			
		while	(@@fetch_status = 0)
		begin	
			-- 直辖室月累计FYC
			set @c_dec_temp=0
			select c_jobnumber into #t_temp2 from t_agentls 
				where c_orgid=@c_orgid and c_system=@c_system and c_director=@c_bycgh and c_type in (10,11)
				and c_flag='0'
				or c_jobnumber=@c_bycgh
			declare c_cursor2 cursor for 	
			select 	distinct c_jobnumber from #t_temp2
			open	c_cursor2
			fetch	next from c_cursor2 into @t_jobnumber			
			while	(@@fetch_status = 0)
			begin	 
				set @c_bxfy=null
				select @c_bxfy=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year and a.c_month=@c_month and a.c_bdnd=1
					and b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnumber=@t_jobnumber
					and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd
				if @c_bxfy is null
					set @c_bxfy=0			 
				set @c_dec_temp=@c_dec_temp+@c_bxfy	
				fetch	next from c_cursor2 into @t_jobnumber			
			end
			close c_cursor2
			deallocate c_cursor2 			
			drop table #t_temp2
			set @c_dec=@c_dec + @c_dec_temp * 0.08
		fetch	next from c_cursor1 into @c_bycgh	
		end
		close c_cursor1
		deallocate c_cursor1		
		drop table #t_temp1		 
	end 
	select @c_dec
return 0
go
--辅导津贴
if exists(select name from sysobjects where name='pb_agentyj1_7')
	drop proc pb_agentyj1_7
go
create proc pb_agentyj1_7
	@c_year	int,@c_month int,@c_orgid int,@c_jobnumber char(10)
as 
declare @c_dec_temp1 decimal(15, 3),
	@c_dec_temp2 decimal(15, 3),
	@c_dec decimal(15, 3), 
	@c_system int,
	@c_type int, 
	@x_jobnumber char(10),	--临时工号 
	@t_jobnumber char(10),	--临时工号 
	@c_bxfy decimal(15,3)   	 
	set @c_system=1
	if not exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
	begin
		raiserror ('代理人工号：%s 无效', 16, 1,@c_jobnumber)
		return @@error	
	end 	 
	set @c_dec=0
	set @c_dec_temp1=0
	--代理人职位代码
	select @c_type=c_type from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'   
	if @c_type=30	--30理财总监
	begin
		select c_jobnumber into #t_temp1 from t_agentls 
			where c_orgid=@c_orgid and c_system=@c_system and c_director=@c_jobnumber and c_type=20
			and c_flag='0'
		declare c_cursor1 cursor for 	
		select 	distinct c_jobnumber from #t_temp1
		open	c_cursor1
		fetch	next from c_cursor1 into @x_jobnumber			
		while	(@@fetch_status = 0)
		begin	
			-- 直辖室月累计FYC
			set @c_dec_temp2=0
			select c_jobnumber into #t_temp2 from t_agentls 
				where c_orgid=@c_orgid and c_system=@c_system and c_director=@x_jobnumber
				and c_flag='0'
				or c_jobnumber=@x_jobnumber
			declare c_cursor2 cursor for 	
			select 	distinct c_jobnumber from #t_temp2
			open	c_cursor2
			fetch	next from c_cursor2 into @t_jobnumber			
			while	(@@fetch_status = 0)
			begin	 
				set @c_bxfy=null
				select @c_bxfy=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year and a.c_month=@c_month and a.c_bdnd=1
					and b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnumber=@t_jobnumber
					and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd
				if @c_bxfy is null
					set @c_bxfy=0			 
				set @c_dec_temp2=@c_dec_temp2+@c_bxfy	
				fetch	next from c_cursor2 into @t_jobnumber			
			end
			close c_cursor2
			deallocate c_cursor2 			
			drop table #t_temp2
			set @c_dec_temp1=@c_dec_temp1 + @c_dec_temp2
		fetch	next from c_cursor1 into @x_jobnumber	
		end
		close c_cursor1
		deallocate c_cursor1		
		drop table #t_temp1	
		if @c_dec_temp1 < 6000
		begin
			set @c_dec=@c_dec_temp1 * 0.02
		end
		if @c_dec_temp1 >= 6000 and @c_dec_temp1 < 10000
		begin
			set @c_dec=@c_dec_temp1 * 0.05
		end
		if @c_dec_temp1 >= 10000 and @c_dec_temp1 < 15000
		begin
			set @c_dec=@c_dec_temp1 * 0.07
		end
		if @c_dec_temp1 >= 15000 and @c_dec_temp1 < 20000
		begin
			set @c_dec=@c_dec_temp1 * 0.09
		end
		if @c_dec_temp1 >= 20000 and @c_dec_temp1 < 30000
		begin
			set @c_dec=@c_dec_temp1 * 0.11
		end
		if @c_dec_temp1 >= 30000 
		begin
			set @c_dec=@c_dec_temp1 * 0.13
		end	 
	end 
	select @c_dec
return 0
go
--总监育成津贴
if exists(select name from sysobjects where name='pb_agentyj1_8')
	drop proc pb_agentyj1_8
go
create proc pb_agentyj1_8
	@c_year	int,@c_month int,@c_orgid int,@c_jobnumber char(10)
as 
declare @c_dec_temp1 decimal(15, 3),
	@c_dec_temp2 decimal(15, 3),
	@c_dec decimal(15, 3), 
	@c_system int,
	@c_type int, 
	@c_bycgh char(10),	--临时工号 
	@t_jobnumber char(10),	--临时工号 
	@u_jobnumber char(10),	--临时工号 
	@c_bxfy decimal(15,3)   	 
	set @c_system=1
	if not exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
	begin
		raiserror ('代理人工号：%s 无效', 16, 1,@c_jobnumber)
		return @@error	
	end 	 
	set @c_dec=0
	set @c_dec_temp1=0
	--代理人职位代码
	select @c_type=c_type from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'   
	if @c_type>=11	--11理财主任
	begin
		select c_bycgh into #t_temp1 from t_agentgx 
			where c_system=@c_system and c_layer=1 and c_ycgh=@c_jobnumber and c_byczj=30
		declare c_cursor1 cursor for 	
		select 	distinct c_bycgh from #t_temp1
		open	c_cursor1
		fetch	next from c_cursor1 into @c_bycgh			
		while	(@@fetch_status = 0)
		begin	
			-- 直辖室月累计FYC
			set @c_dec_temp2=0
			select c_jobnumber into #t_temp2 from t_agentls 
				where c_orgid=@c_orgid and c_system=@c_system and c_director=@c_bycgh and c_type in (10,11)
				and c_flag='0'
			declare c_cursor2 cursor for 	
			select 	distinct c_jobnumber from #t_temp2
			open	c_cursor2
			fetch	next from c_cursor2 into @t_jobnumber			
			while	(@@fetch_status = 0)
			begin	 
				set @c_bxfy=null
				select @c_bxfy=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year and a.c_month=@c_month and a.c_bdnd=1
					and b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnumber=@t_jobnumber
					and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd
				if @c_bxfy is null
					set @c_bxfy=0			 
				set @c_dec_temp2=@c_dec_temp2+@c_bxfy	
				fetch	next from c_cursor2 into @t_jobnumber			
			end
			close c_cursor2
			deallocate c_cursor2 			
			drop table #t_temp2
			set @c_dec_temp1=@c_dec_temp1 + @c_dec_temp2
			-- 非直辖室月累计FYC
			set @c_dec_temp2=0
			select c_jobnumber into #t_temp3 from t_agentls 
				where c_orgid=@c_orgid and c_system=@c_system and c_director=@c_bycgh and c_type=20
				and c_flag='0'
			declare c_cursor2 cursor for 	
			select 	distinct c_jobnumber from #t_temp3
			open	c_cursor2
			fetch	next from c_cursor2 into @t_jobnumber			
			while	(@@fetch_status = 0)
			begin	 				
				select c_jobnumber into #t_temp4 from t_agentls 
					where c_orgid=@c_orgid and c_system=@c_system and c_director=@t_jobnumber and c_type in (10,11)
					and c_flag='0'
				declare c_cursor3 cursor for 	
				select 	distinct c_jobnumber from #t_temp4
				open	c_cursor3
				fetch	next from c_cursor3 into @u_jobnumber			
				while	(@@fetch_status = 0)
				begin	 
					set @c_bxfy=null
					select @c_bxfy=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year and a.c_month=@c_month and a.c_bdnd=1
						and b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnumber=@u_jobnumber
						and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd
					if @c_bxfy is null
						set @c_bxfy=0			 
					set @c_dec_temp2=@c_dec_temp2+@c_bxfy	
					fetch	next from c_cursor3 into @u_jobnumber			
				end
				close c_cursor3
				deallocate c_cursor3 			
				drop table #t_temp4					
				fetch	next from c_cursor2 into @t_jobnumber			
			end
			close c_cursor2
			deallocate c_cursor2 			
			drop table #t_temp3
			set @c_dec_temp1=@c_dec_temp1 + @c_dec_temp2			
		fetch	next from c_cursor1 into @c_bycgh	
		end
		close c_cursor1
		deallocate c_cursor1		
		drop table #t_temp1	
		set @c_dec=@c_dec_temp1 * 0.05			 
	end 
	select @c_dec
return 0
go
--年终分红
if exists(select name from sysobjects where name='pb_agentyj1_9')
	drop proc pb_agentyj1_9
go
create proc pb_agentyj1_9
	@c_year	int,@c_month int,@c_orgid int,@c_jobnumber char(10)
as 
declare @c_dec_temp1 decimal(15, 3),
	@c_dec_temp2 decimal(15, 3),
	@c_dec decimal(15, 3), 
	@c_system int,
	@c_type int,  
	@c_num int,  
	@c_ksrq char(8),
	@c_temp1 char(8),
	@c_temp2 char(8),
	@t_jobnumber char(10),	--临时工号 
	@u_jobnumber char(10),	--临时工号 
	@c_bxfy decimal(15,3)   	 
	set @c_system=1
	if not exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
	begin
		raiserror ('代理人工号：%s 无效', 16, 1,@c_jobnumber)
		return @@error	
	end 	 
	set @c_dec=0
	set @c_dec_temp1=0
	--代理人职位代码
	select @c_type=c_type from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'   
	if @c_type=30	--30理财总监
	begin
		 -- 直辖室月累计FYC
		set @c_dec_temp2=0
		select c_jobnumber into #t_temp1 from t_agentls 
			where c_orgid=@c_orgid and c_system=@c_system and c_director=@c_jobnumber and c_type in (10,11)
			and c_flag='0'
		declare c_cursor2 cursor for 	
		select 	distinct c_jobnumber from #t_temp1
		open	c_cursor2
		fetch	next from c_cursor2 into @t_jobnumber			
		while	(@@fetch_status = 0)
		begin	 
			set @c_bxfy=null
			select @c_bxfy=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year-1 and a.c_bdnd=1
				and b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnumber=@t_jobnumber
				and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd
			if @c_bxfy is null
				set @c_bxfy=0			 
			set @c_dec_temp2=@c_dec_temp2+@c_bxfy	
			fetch	next from c_cursor2 into @t_jobnumber			
		end
		close c_cursor2
		deallocate c_cursor2 			
		drop table #t_temp1
		set @c_dec_temp1=@c_dec_temp1 + @c_dec_temp2
		-- 非直辖室月累计FYC
		set @c_dec_temp2=0
		select c_jobnumber into #t_temp2 from t_agentls 
			where c_orgid=@c_orgid and c_system=@c_system and c_director=@c_jobnumber and c_type=20
			and c_flag='0'
		declare c_cursor2 cursor for 	
		select 	distinct c_jobnumber from #t_temp2
		open	c_cursor2
		fetch	next from c_cursor2 into @t_jobnumber			
		while	(@@fetch_status = 0)
		begin	 				
			select c_jobnumber into #t_temp3 from t_agentls 
				where c_orgid=@c_orgid and c_system=@c_system and c_director=@t_jobnumber and c_type in (10,11)
				and c_flag='0'
			declare c_cursor3 cursor for 	
			select 	distinct c_jobnumber from #t_temp3
			open	c_cursor3
			fetch	next from c_cursor3 into @u_jobnumber			
			while	(@@fetch_status = 0)
			begin	 
				set @c_bxfy=null
				select @c_bxfy=sum(a.c_bxfy2) from t_sxjs a,t_sxbd b where a.c_year=@c_year-1 and a.c_bdnd=1
					and b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnumber=@u_jobnumber
					and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd
				if @c_bxfy is null
					set @c_bxfy=0			 
				set @c_dec_temp2=@c_dec_temp2+@c_bxfy	
				fetch	next from c_cursor3 into @u_jobnumber			
			end
			close c_cursor3
			deallocate c_cursor3 			
			drop table #t_temp3					
			fetch	next from c_cursor2 into @t_jobnumber			
		end
		close c_cursor2
		deallocate c_cursor2 			
		drop table #t_temp2
		set @c_dec_temp1=@c_dec_temp1 + @c_dec_temp2			 
		select @c_ksrq=c_ksrq from t_agentls 
			where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'   
		--任职日期
		if datepart(day, @c_ksrq)<26
		begin
			--当月
			set @c_temp1=left(@c_ksrq,6)+'01'
		end
		else
		begin
			--下月
			set @c_temp1=convert(char(8),dateadd(month,1,left(@c_ksrq,6)+'01'),112)  
		end
		--发佣日期
		if @c_month < 10
		begin
			set @c_temp2=str(@c_year,4)+'0'+str(@c_month,1)+'01'
		end
		else
		begin
			set @c_temp2=str(@c_year,4)+str(@c_month,2)+'01'
		end	
		--任职满6个月以上	
		if datediff(month,@c_temp1, @c_temp2)>=6
		begin
			if @c_dec_temp1>=300000 and @c_dec_temp1 <450000
			begin
				set @c_dec=@c_dec_temp1 * 0.05
			end	
			if @c_dec_temp1>=450000 and @c_dec_temp1 <600000
			begin
				set @c_dec=@c_dec_temp1 * 0.06
			end
			if @c_dec_temp1>=600000 
			begin
				set @c_dec=@c_dec_temp1 * 0.07
			end
		end		
	end 
	select @c_dec
return 0
go
--银行渠道
--职级工资
if exists(select name from sysobjects where name='pb_agentyj2_1')
	drop proc pb_agentyj2_1
go
create proc pb_agentyj2_1
	@c_year	int,@c_month int,@c_orgid int,@c_jobnumber char(10)
as 
declare @c_dec decimal(15, 3),
	@c_system int, 
	@c_type int,
	@c_bxfy decimal(15,3)   	 
	set @c_system=2
	if not exists (select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
	begin
		raiserror ('代理人工号：%s 无效', 16, 1,@c_jobnumber)
		return @@error	
	end
	set @c_dec=0
	--代理人职位代码
	select @c_type=c_type from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 
	if @c_type=10
	begin
		set @c_dec=2000
	end  
	if @c_type=20
	begin
		set @c_dec=3000
	end  
	if @c_type=30
	begin
		set @c_dec=5000
	end  
	select @c_dec
return 0
go
