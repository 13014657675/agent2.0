--物品分类
if exists(select name from sysobjects where name='p_goodstype')
	drop procedure p_goodstype
go
create procedure p_goodstype
	@c_no int , 
	@c_libraryid int ,		--库 1 资产管理 2 办公用品 3 普通单证
	@c_name char (50),  		--分类名 	 
	@c_jobnm char (10),
	@c_operator char(10) ,	
	@c_ip char (25) 
as 	  
	if @c_jobnm='add'
	begin 
		if exists(select * from t_goodstype where c_libraryid=@c_libraryid and c_name=@c_name)
		begin
			raiserror ('分类名 %s 已经存在 ！', 16,1 ,@c_name )
			return @@error
		end			
		insert  t_goodstype   	
		(	 
			c_libraryid,	--库
			c_name,  	--分类名 	 
			c_jobnm,
			c_operator,
			c_ip 
		) 
		values
		( 
			@c_libraryid,	--库
			@c_name,  	--分类名  
			@c_jobnm,
			@c_operator,
			@c_ip 
		)	
	end	
	if @c_jobnm='update'
	begin
		update t_goodstype
			set c_name=@c_name,  	--分类名 
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,
			c_ip=@c_ip 
		where c_no=@c_no	 
	end	
	if @c_jobnm='del'
	begin
		delete t_goodstype where c_no=@c_no	
	end	
return 0
go
--物品过程
if exists(select name from sysobjects where name='p_goods')
	drop procedure p_goods
go
create procedure p_goods
	@c_no int ,
	@c_orgid int ,			--机构id 	
	@c_libraryid int ,		--库 1 资产管理 2 办公用品 3 普通单证
	@c_goodstypeid int ,		--分类名id
	@c_name char (50),  		--物品名	  
	@c_factory char (100),  	--厂商
	@c_address char (150),  	--地址	 
	@c_jobnm char (10),
	@c_operator char(10) ,	
	@c_ip char (25) 
as 	  
	if @c_jobnm='add'
	begin 
		if not exists(select * from t_goodstype where c_no=@c_goodstypeid)
		begin
			raiserror ('分类名：%s 不存在 ！', 16,1 )
			return @@error
		end
		if exists(select * from t_goods where c_orgid=@c_orgid and c_libraryid=@c_libraryid and c_name=@c_name)
		begin
			raiserror ('物品名：%s 已经存在 ！', 16,1 ,@c_name )
			return @@error
		end			
		insert  t_goods   	
		(	
			c_orgid,	--机构
			c_libraryid,	--库
			c_goodstypeid,	--分类名
			c_name,  	--物品名	 
			c_factory,  	--厂商
			c_address,  	--地址	
			c_jobnm,
			c_operator,
			c_ip 
		) 
		values
		(
			@c_orgid,	--机构
			@c_libraryid,	--库
			@c_goodstypeid,	--分类名
			@c_name,  	--物品名 
			@c_factory,  	--厂商
			@c_address,  	--地址	
			@c_jobnm,
			@c_operator,
			@c_ip 
		)	
	end	
	if @c_jobnm='update'
	begin
		update t_goods
			set c_goodstypeid=@c_goodstypeid,	--分类名id 
			c_name=@c_name,  	--物品名	 
			c_factory=@c_factory,  	--厂商
			c_address=@c_address,  	--地址	
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,
			c_ip=@c_ip 
		where c_no=@c_no	 
	end	
	if @c_jobnm='del'
	begin
		delete t_goods where c_no=@c_no	
	end	
return 0
go
--批号过程
if exists(select name from sysobjects where name='p_goodsrecord')
	drop procedure p_goodsrecord
go
create  procedure p_goodsrecord
	@c_orgid int ,			--执行机构	
	@c_libraryid int ,		--1 资产管理 2 办公用品 3 普通单证
	@c_recordid bigint ,		--库单号： 4+8 	 
	@c_jobnm char (10)  ,
	@c_operator char(10) ,		
	@c_ip char (25) 
as
declare @c_datime datetime   
	set @c_datime=getdate()	 
	begin transaction tr_goodsrecord 
	update t_goodsrecord set c_flag='1' where c_orgid=@c_orgid and c_libraryid=@c_libraryid and c_recordid=@c_recordid
	update t_goodsbatch set c_flag='1' where c_orgid=@c_orgid and c_libraryid=@c_libraryid and c_recordid=@c_recordid
	insert t_goodsrecord
	(
		c_orgid  ,		--执行机构	
		c_libraryid ,
		c_recordid ,		--库单号： 4+8				 
		c_jobnm ,		 
		c_operator ,
		c_datime,
		c_ip 
	)
	values
	(
		@c_orgid  ,		--执行机构	
		@c_libraryid ,
		@c_recordid ,		--库单号： 4+8 		 
		@c_jobnm ,		 
		@c_operator ,
		@c_datime,
		@c_ip 
	)
	if @@error <> 0
	begin
		rollback transaction tr_goodsrecord
	  	raiserror ('物品记录过程报错', 16, 1)
	  	return @@error
	end 	 		 
	commit transaction tr_goodsrecord	 
return 0
go
--物品批量记录过程
if exists(select name from sysobjects where name='p_goodsbatch')
	drop procedure p_goodsbatch
go
create  procedure p_goodsbatch
	@c_orgid int ,			--执行机构	 
	@c_libraryid int ,		--1 资产管理 2 办公用品 3 普通单证
	@c_recordid bigint ,		--库单号： 4+8 
	@c_goodsid int , 		--物品
	@c_number int ,			--数量		
	@c_p char(100) ,		--签字人
	@c_o int,
	@c_jobnm char (10)  ,
	@c_operator char(10) ,		
	@c_ip char (25) 
as
declare @c_datime datetime , 
	@count    int,    	       	--循环变量
	@errors	  int			--错误数  
	set @c_datime=getdate()	 
	begin transaction tr_goodsbatch 
	if @c_number = 0
	begin
		raiserror (' 数量不能为 0 ', 16, 1 )
	  	return @@error
	end		
	insert t_goodsbatch
	(
		c_orgid  ,		--执行机构	
		c_libraryid , 
		c_recordid ,		--库单号： 4+8		 
		c_goodsid , 
		c_number ,		--数量	
		c_p,			--签字人
		c_o,
		c_jobnm ,		 
		c_operator ,
		c_datime,
		c_ip 
	)
	values
	(
		@c_orgid  ,		--执行机构	 
		@c_libraryid , 
		@c_recordid ,		--库单号： 4+8 
		@c_goodsid , 
		@c_number ,		--数量	
		@c_p,			--签字人
		@c_o,
		@c_jobnm ,		 
		@c_operator ,
		@c_datime,
		@c_ip 
	)
	if @@error <> 0
	begin
		rollback transaction tr_goodsbatch
	  	raiserror ('物品记录过程报错', 16, 1)
	  	return @@error
	end 	 	
	--普通单证，最少剩余库存为30份
	if @c_libraryid=3 and @c_jobnm='ck'
	begin
		select @count=count(*)-@c_number from t_goodsstate where c_orgid=@c_orgid and c_goodsid=@c_goodsid and c_jobnm in ('rk2','dj','hk') and c_flag='0'
		if @count < 30
		begin
			rollback transaction tr_goodsbatch
			raiserror ('出库数过大！库存应至少剩余30份普通单证！', 16, 1)
	  		return @@error
		end
	end
	--调用物品批量变动过程 
	exec @errors=p_goodsstate
		@c_orgid ,
		@c_libraryid , 
		@c_recordid,
		@c_goodsid ,	 
		@c_number  ,
		@c_p,			--签字人
		@c_o,
		@c_jobnm ,		 
		@c_operator , 
		@c_ip 
	if @errors <> 0
	begin
	  	rollback transaction tr_goodsbatch
	  	raiserror ('物品记录过程报错', 16, 1)
	  	return @@error
	end  	
	commit transaction tr_goodsbatch	 
return 0
go
--物品批量变动过程
if exists(select name from sysobjects where name='p_goodsstate')
	drop procedure p_goodsstate
go
create procedure p_goodsstate
	@c_orgid int,
	@c_libraryid int, 
	@c_recordid bigint,
	@c_goodsid int,		  
	@c_number  int,
	@c_p char(100) ,		--签字人
	@c_o int,	
	@c_jobnm char(10),		 
	@c_operator char(10) ,	
	@c_ip varchar(25)
as
declare @c_code char(14), 		--物品流水号 
	@c_code_temp char(14), 		--物品流水号 
	@c_no   int,    	       	--临时变量
	@count  int,    	       	--循环变量
	@i      int,    	       	--循环变量
	@n      int  	         	--循环次数 		 
	if @c_jobnm='rk'		--入库
	begin    
		if not exists (select * from t_goodsstate where c_orgid=@c_orgid and c_libraryid=@c_libraryid)
		begin
			set @c_code_temp = str(@c_orgid,4)+str(@c_libraryid,1) + '000000001'
		end
		else
		begin  
			select @c_code_temp=str(cast( max(c_code) as bigint ) + 1 ,14 ) from t_goodsstate 
				where c_orgid=@c_orgid and c_libraryid=@c_libraryid  	
		end
		begin transaction tr_goodsstate_rk  
		select @n=@c_number, @i=0
		create table #tr_goodsstate_rk(c_code char(14))
		while(@i < @n)
		begin
			set @c_code=str(cast( @c_code_temp as bigint ) + @i ,14 )
			insert #tr_goodsstate_rk values(@c_code)
			set @i=@i+1
		end 		 
		declare tr_goodsstate_rk cursor for
		select 	c_code from #tr_goodsstate_rk  
		open 	tr_goodsstate_rk
		fetch 	next from tr_goodsstate_rk into @c_code
		while	(@@fetch_status = 0)
		begin
			insert t_goodsstate
			(
				c_recordid,
				c_libraryid,
				c_orgid ,		--执行机构
				c_goodsid ,	 
				c_code , 		--物品流水号
				c_p,			--签字人
				c_o,
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--执行机构
				@c_goodsid ,	 
				@c_code , 		--物品流水号
				@c_p,			--签字人
				@c_o,
				@c_jobnm ,		 
				@c_operator ,
				@c_ip 
			)				 
			fetch 	next from tr_goodsstate_rk into @c_code	
		end
		close tr_goodsstate_rk
		deallocate tr_goodsstate_rk
		drop table #tr_goodsstate_rk	
		commit transaction tr_goodsstate_rk
		return 0
	end	 
	if @c_jobnm='rk-del'		--入库删除
	begin   		
		delete t_goodsstate where c_orgid=@c_orgid and c_recordid=@c_recordid
		return 0
	end		
	if @c_jobnm='ck'		--出库
	begin   	
		select @count=count(*) from t_goodsstate where c_orgid=@c_orgid and c_goodsid=@c_goodsid and c_jobnm in ('rk2','dj','hk') and c_flag='0'
		if @c_number > @count 
		begin
			raiserror ('出库数过大！', 16, 1)
	  		return @@error
		end
		begin transaction tr_goodsstate_ck  
		select @n=@c_number, @i=0 
		set rowcount @n
		declare c_goodsstate_ck cursor for
		select  c_no,c_code from t_goodsstate where c_orgid=@c_orgid and c_goodsid=@c_goodsid and c_jobnm in ('rk2','dj','hk') and c_flag='0' order by c_no
		open 	c_goodsstate_ck
		fetch 	next from c_goodsstate_ck into @c_no,@c_code		
		while	(@@fetch_status = 0)
		begin
			if @c_orgid = @c_o 
			begin
				raiserror ('领用机构不能为本机构！', 16, 1)
				close c_goodsstate_ck
				deallocate c_goodsstate_ck 
				set rowcount 0
				rollback transaction tr_goodsstate_ck 
		  		return @@error
			end
			update t_goodsstate set c_flag='1' where c_orgid=@c_orgid and c_no=@c_no				
			insert t_goodsstate
			(
				c_recordid,
				c_libraryid,
				c_orgid ,		--执行机构
				c_goodsid ,	 
				c_code , 		--物品流水号
				c_p,			--签字人
				c_o,
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--执行机构
				@c_goodsid ,	 
				@c_code , 		--物品流水号
				@c_p,			--签字人
				@c_o,
				@c_jobnm ,		 
				@c_operator ,
				@c_ip 
			)				 
			fetch 	next from c_goodsstate_ck into @c_no,@c_code		
		end
		close c_goodsstate_ck
		deallocate c_goodsstate_ck 
		set rowcount 0
		commit transaction tr_goodsstate_ck
		return 0
	end
	if @c_jobnm='rk2'		--机构入库
	begin   
		if not exists (select * from t_goodsstate where c_orgid=@c_orgid and c_libraryid=@c_libraryid)
		begin
			set @c_code_temp = str(@c_orgid,4)+str(@c_libraryid,1) + '000000001'
		end
		else
		begin  
			select @c_code_temp=str(cast( max(c_code) as bigint ) + 1 ,14 ) from t_goodsstate 
				where c_orgid=@c_orgid and c_libraryid=@c_libraryid 	
		end
		begin transaction tr_goodsstate_rk2  
		select @n=@c_number, @i=0
		create table #tr_goodsstate_rk2(c_code char(14))
		while(@i < @n)
		begin
			set @c_code=str(cast( @c_code_temp as bigint ) + @i ,14 )
			insert #tr_goodsstate_rk2 values(@c_code)
			set @i=@i+1
		end 		 
		declare tr_goodsstate_rk2 cursor for
		select 	c_code from #tr_goodsstate_rk2  
		open 	tr_goodsstate_rk2
		fetch 	next from tr_goodsstate_rk2 into @c_code
		while	(@@fetch_status = 0)
		begin
			insert t_goodsstate
			(
				c_recordid,
				c_libraryid,
				c_orgid ,		--执行机构
				c_goodsid ,	 
				c_code , 		--物品流水号
				c_p,			--签字人
				c_o,
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--执行机构
				@c_goodsid ,	 
				@c_code , 		--物品流水号
				@c_p,			--签字人
				@c_o,
				@c_jobnm ,		 
				@c_operator ,
				@c_ip 
			)				 
			fetch 	next from tr_goodsstate_rk2 into @c_code	
		end
		close tr_goodsstate_rk2
		deallocate tr_goodsstate_rk2
		drop table #tr_goodsstate_rk2	
		commit transaction tr_goodsstate_rk2
		return 0
	end	
	if @c_jobnm='hk'		--回库
	begin   	
		select @count=count(*) from t_goodsstate where c_orgid=@c_orgid and c_goodsid=@c_goodsid and c_p=@c_p and c_jobnm in ('ck') and c_flag='0'
		if @c_number > @count 
		begin
			raiserror ('回库数过大！', 16, 1)
	  		return @@error
		end
		begin transaction tr_goodsstate_hk  
		select @n=@c_number, @i=0 
		set rowcount @n
		declare c_goodsstate_hk cursor for
		select  c_no,c_code from t_goodsstate where c_orgid=@c_orgid and c_goodsid=@c_goodsid and c_p=@c_p and c_jobnm in ('ck') and c_flag='0' order by c_no
		open 	c_goodsstate_hk
		fetch 	next from c_goodsstate_hk into @c_no,@c_code		
		while	(@@fetch_status = 0)
		begin
			update t_goodsstate set c_flag='1' where c_orgid=@c_orgid and c_no=@c_no				
			insert t_goodsstate
			(
				c_recordid,
				c_libraryid,
				c_orgid ,		--执行机构
				c_goodsid ,	 
				c_code , 		--物品流水号  
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--执行机构
				@c_goodsid ,	 
				@c_code , 		--物品流水号  
				@c_jobnm ,		 
				@c_operator ,
				@c_ip 
			)				 
			fetch 	next from c_goodsstate_hk into @c_no,@c_code		
		end
		close c_goodsstate_hk
		deallocate c_goodsstate_hk 
		set rowcount 0
		commit transaction tr_goodsstate_hk
		return 0
	end		
	if @c_jobnm='bf'		--报废
	begin   	
		select @count=count(*) from t_goodsstate where c_orgid=@c_orgid and c_goodsid=@c_goodsid and c_jobnm in ('rk2','dj','hk') and c_flag='0'
		if @c_number > @count 
		begin
			raiserror ('报废数过大！', 16, 1)
	  		return @@error
		end
		begin transaction tr_goodsstate_bf  
		select @n=@c_number, @i=0 
		set rowcount @n
		declare c_goodsstate_bf cursor for
		select  c_no,c_code from t_goodsstate where c_orgid=@c_orgid and c_goodsid=@c_goodsid and c_jobnm in ('rk2','dj','hk') and c_flag='0' order by c_no
		open 	c_goodsstate_bf
		fetch 	next from c_goodsstate_bf into @c_no,@c_code		
		while	(@@fetch_status = 0)
		begin
			update t_goodsstate set c_flag='1' where c_orgid=@c_orgid and c_no=@c_no				
			insert t_goodsstate
			(
				c_recordid,
				c_libraryid,
				c_orgid ,		--执行机构
				c_goodsid ,	 
				c_code , 		--物品流水号 
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--执行机构
				@c_goodsid ,	 
				@c_code , 		--物品流水号 
				@c_jobnm ,		 
				@c_operator ,
				@c_ip 
			)				 
			fetch 	next from c_goodsstate_bf into @c_no,@c_code		
		end
		close c_goodsstate_bf
		deallocate c_goodsstate_bf
		set rowcount 0
		commit transaction tr_goodsstate_bf
		return 0
	end
return 0
go
--物品个别变动过程
if exists(select name from sysobjects where name='p_goodssingle')
	drop procedure p_goodssingle
go
create procedure p_goodssingle
	@c_orgid int,			--机构id
	@c_libraryid int, 
	@c_recordid bigint,
	@c_goodsid int,
	@c_code char(14), 		--物品流水号    
	@c_p char(100) ,		
	@c_o int,	
	@c_jobnm char(10),		 
	@c_operator char(10) ,	
	@c_ip varchar(25)
as 	
	begin transaction tr_goodssingle  
	update t_goodsstate set c_flag='1'
			where c_orgid=@c_orgid and c_code=@c_code and c_flag='0'				
	if @c_jobnm in ('ck','rk2')		 
	begin   	  
		if @c_jobnm='ck' and @c_orgid = @c_o 
		begin
			raiserror ('领用机构不能为本机构！', 16, 1)  
			rollback transaction tr_goodssingle 
	  		return @@error
		end
		insert t_goodsstate
		(
			c_recordid,
			c_orgid ,		--执行机构
			c_libraryid ,
			c_goodsid ,	 
			c_code , 		--物品流水号
			c_p,			--签字人
			c_o,
			c_jobnm ,		 
			c_operator ,
			c_ip 
		)
		values
		(
			@c_recordid,
			@c_orgid ,		--执行机构
			@c_libraryid ,
			@c_goodsid ,	 
			@c_code , 		--物品流水号
			@c_p,			--签字人
			@c_o,
			@c_jobnm ,		 
			@c_operator ,
			@c_ip 
		)							
	end 	 
	if @c_jobnm in ('hk','bf')			
	begin   	  
		insert t_goodsstate
		(
			c_recordid,
			c_orgid ,		--执行机构
			c_libraryid ,
			c_goodsid ,	 
			c_code , 		--物品流水号 
			c_jobnm ,		 
			c_operator ,
			c_ip 
		)
		values
		(
			@c_recordid,
			@c_orgid ,		--执行机构
			@c_libraryid ,
			@c_goodsid ,	 
			@c_code , 		--物品流水号 
			@c_jobnm ,		 
			@c_operator ,
			@c_ip 
		)							
	end 	 
	commit transaction tr_goodssingle		
return 0
go
--物品定价过程
if exists(select name from sysobjects where name='p_goodsprice')
	drop procedure p_goodsprice
go
create procedure p_goodsprice
	@c_orgid int,
	@c_libraryid int, 
	@c_recordid bigint,
	@c_goodsid int,		  
	@c_number  int,	
	@c_inprice decimal(15,2),
	@c_outprice decimal(15,2), 
	@c_jobnm char(10),		 
	@c_operator char(10) ,	
	@c_ip varchar(25)
as 	
declare @c_datime datetime ,
	@c_code char(14), 		--物品流水号  
	@c_no   int,    	       	--临时变量 
	@error  int	    	       	--循环变量 
	set @c_datime=getdate()	 	 
	if @c_jobnm='dj'		--定价
	begin   	 
		begin transaction tr_goodsprice_dj   	 
		insert t_goodsbatch
		(
			c_orgid  ,		--执行机构	
			c_libraryid , 
			c_recordid ,		--库单号： 4+8		 
			c_goodsid , 
			c_number ,		--数量	 
			c_inprice ,
			c_outprice ,
			c_jobnm ,		 
			c_operator ,
			c_datime,
			c_ip 
		)
		values
		(
			@c_orgid  ,		--执行机构	 
			@c_libraryid , 
			@c_recordid ,		--库单号： 4+8 
			@c_goodsid , 
			@c_number ,		--数量	 			
			@c_inprice ,
			@c_outprice ,
			@c_jobnm ,		 
			@c_operator ,
			@c_datime,
			@c_ip 
		)
		if @@error <> 0
		begin
			rollback transaction tr_goodsprice_dj
		  	raiserror ('物品定价过程报错', 16, 1)
		  	return @@error
		end 	 		 	 	 			
		declare c_goodsprice_dj cursor for
		select  c_no,c_code from t_goodsstate where c_orgid=@c_orgid and c_libraryid=@c_libraryid and c_recordid=@c_recordid 
			and c_goodsid=@c_goodsid and c_flag='0' order by c_no
		open 	c_goodsprice_dj
		fetch 	next from c_goodsprice_dj into @c_no,@c_code		
		while	(@@fetch_status = 0)
		begin
			update t_goodsstate set c_flag='1' where c_no=@c_no				
			insert t_goodsstate
			(
				c_recordid,
				c_libraryid,
				c_orgid ,		--执行机构
				c_goodsid ,	 
				c_code , 		--物品流水号
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--执行机构
				@c_goodsid ,	 
				@c_code , 		--物品流水号
				@c_jobnm ,		 
				@c_operator ,
				@c_ip 
			)	
			update t_goodsprice set c_flag='1' where c_code=@c_code
			insert t_goodsprice
			(
				c_code, 	--物品流水号
				c_inprice,	--入库价格
				c_outprice,	--出库价格	 
				c_jobnm,	--						 
				c_operator,
				c_ip 
			)
			values
			(
				@c_code, 	--物品流水号
				@c_inprice,	--入库价格
				@c_outprice,	--出库价格	 
				@c_jobnm,	--						 
				@c_operator,
				@c_ip 
			)			 
			fetch 	next from c_goodsprice_dj into @c_no,@c_code		
		end
		close c_goodsprice_dj
		deallocate c_goodsprice_dj  
		commit transaction tr_goodsprice_dj
		return 0
	end		
return 0
go