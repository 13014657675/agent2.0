--参数过程  
if exists(select name from sysobjects where name='pb_param')
	drop proc pb_param
go
create proc pb_param
	@c_pid	int ,		--参数id
	@c_type int ,		--1 字符 2 数值
	@c_name char (50),	--名称
	@c_jobnm char (10)    	 
as   
	if @c_jobnm='add'
	begin
		if not exists( select * from tb_param )
	 	begin
	 		set @c_pid=1001
	 	end
	 	else
	 	begin
	 		select @c_pid=max(c_pid)+1 from tb_param
	 	end
	 	insert tb_param 
	 	(
	 		c_pid,
	 		c_type,
	 		c_name
	 	)
	 	values
	 	(
	 		@c_pid,
	 		@c_type,
	 		@c_name
	 	) 	
	end
	if @c_jobnm='update'
	begin
		update tb_param set c_type=@c_type,c_name=@c_name where c_pid=@c_pid
	end	
	if @c_jobnm='del'
	begin
		delete tb_param where c_pid=@c_pid
	end	
return 0
go 
--类型过程 
if exists(select name from sysobjects where name='pb_projectclass')
	drop proc pb_projectclass
go
create proc pb_projectclass
	@c_no	int ,		--函数id
	@c_name char(50) ,	--1 中文名称 
	@c_o	int ,		--
	@c_jobnm char (10)    	 
as   
	if @c_jobnm='add'
	begin
	 	insert tb_projectclass 
	 	( 
	 		c_name
	 	)
	 	values
	 	( 
	 		@c_name 
	 	) 		 	
	end
	if @c_jobnm='update'
	begin
		update tb_projectclass set c_name=@c_name where c_no=@c_no 		 
	end
	if @c_jobnm='set'
	begin
		update tb_projectclass set c_o=@c_o where c_no=@c_no 		 
	end	
	if @c_jobnm='del'
	begin
		delete tb_projectclass where c_no=@c_no 		 
	end		 
return 0
go 
--函数过程 
if exists(select name from sysobjects where name='pb_function')
	drop proc pb_function
go
create proc pb_function
	@c_projectclass int ,   --类型
	@c_fid	int ,		--函数id
	@c_name char(50) ,	--1 中文名称
	@c_proc char (30),	-- 
	@c_jobnm char (10)    	 
as   
	if @c_jobnm='add'
	begin
		if not exists( select * from tb_function )
	 	begin
	 		set @c_fid=2001
	 	end
	 	else
	 	begin
	 		select @c_fid=max(c_fid)+1 from tb_function
	 	end
	 	insert tb_function 
	 	(
	 		c_projectclass,
	 		c_fid,
	 		c_name,
	 		c_proc
	 	)
	 	values
	 	(
	 		@c_projectclass,
	 		@c_fid,
	 		@c_name,
	 		@c_proc
	 	) 		 	
	end
	if @c_jobnm='del'
	begin
		delete tb_function where c_fid=@c_fid
		
		delete tb_fparam where c_fid=@c_fid 
	end	
	select @c_fid c_fid
return 0
go 
--函数参数过程  
if exists(select name from sysobjects where name='pb_fparam')
	drop proc pb_fparam
go
create proc pb_fparam
	@c_fid	int ,		--函数id  
	@c_xid int 		--  
as  
declare @c_order int 
	if not exists(select * from tb_fparam where c_fid=@c_fid)
	begin
		set @c_order=1
	end
	else
	begin
		select @c_order=max(c_order)+1 from tb_fparam where c_fid=@c_fid 
	end
	if not exists(select * from tb_fparam where c_fid=@c_fid and c_xid=@c_xid)
 	begin
 		insert tb_fparam 
	 	(
	 		c_fid,
	 		c_order,
	 		c_xid
	 	)
	 	values
	 	(
	 		@c_fid,
	 		@c_order,
	 		@c_xid
	 	) 	
 	end 	 
return 0
go 
--组合过程
if exists(select name from sysobjects where name='pb_combination')
	drop proc pb_combination
go
create proc pb_combination
	@c_projectclass int ,
	@c_cid int ,
	@c_name char(150) ,
	@c_t1 int ,
	@c_o1 int , 
	@c_x1 decimal(12,2) , 
	@c_op int , 	--1 加 2 减 3 乘 4 除 
	@c_t2 int ,
	@c_o2 int ,
	@c_x2 decimal(12,2) , 
	@c_jobnm char (10)    	    	 
as 
	if @c_jobnm='add'
	begin
		if not exists( select * from tb_combination )
	 	begin
	 		set @c_cid=3001
	 	end
	 	else
	 	begin
	 		select @c_cid=max(c_cid)+1 from tb_combination
	 	end
	 	insert tb_combination 
	 	(
	 		c_projectclass,
	 		c_cid,
	 		c_name,
	 		c_t1,
	 		c_o1,
	 		c_x1,
	 		c_op,
	 		c_t2,
	 		c_o2,
	 		c_x2
	 	)
	 	values
	 	(
	 		@c_projectclass,
	 		@c_cid,
	 		@c_name,
	 		@c_t1,
	 		@c_o1,
	 		@c_x1,
	 		@c_op,
	 		@c_t2,
	 		@c_o2,
	 		@c_x2
	 	) 		 	
	end
	if @c_jobnm='del'
	begin
		delete tb_combination where c_cid=@c_cid
		
		delete tb_cparam where c_cid=@c_cid 
	end	
	select @c_cid c_cid
return 0
go 
--组合参数过程
if exists(select name from sysobjects where name='pb_cparam')
	drop proc pb_cparam
go
create proc pb_cparam
	@c_cid	int ,		--函数id 	
	@c_xid int 		-- 
as  
declare @c_order int 
	if not exists(select * from tb_cparam where c_cid=@c_cid)
	begin
		set @c_order=1
	end
	else
	begin
		select @c_order=max(c_order)+1 from tb_cparam where c_cid=@c_cid 
	end
 	if not exists(select * from tb_cparam where c_cid=@c_cid and c_xid=@c_xid)
 	begin
 		if exists(select * from tb_param where c_pid=@c_xid)
 		begin
	 		insert tb_cparam 
		 	(
		 		c_cid,
		 		c_order,
		 		c_xid
		 	)
		 	values
		 	(
		 		@c_cid,
		 		@c_order,
		 		@c_xid
		 	) 	
	 	end 
 	end 
return 0
go 

