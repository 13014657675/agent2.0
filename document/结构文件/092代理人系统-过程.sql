--代理人修改机构过程
if exists(select name from sysobjects where name='p_agent_org')
	drop procedure p_agent_org
go
create procedure p_agent_org 
	@c_orgid int ,				--机构id
	@c_jobnumber char (10) ,		--工号
	@o_orgid int ,				--目标机构id 
	@c_operator char(10) ,	
	@c_ip char (25)
as 	
	update t_staff 
		set c_orgid=@o_orgid 
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber
	delete t_agentset   
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber
	delete t_agentls   
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber
	delete t_agentgx
		where c_ycgh=@c_jobnumber or c_bycgh=@c_jobnumber	
return 0
go 
--离司代理人恢复工号过程
if exists(select name from sysobjects where name='p_agent_back')
	drop procedure p_agent_back
go
create procedure p_agent_back
	@c_orgid int ,				--机构id
	@c_jobnumber char (10) ,		--工号
	@o_orgid int ,				--目标机构id 
	@c_operator char(10) ,	
	@c_ip char (25)
as 	
	update t_staff 
		set c_orgid=@o_orgid,c_quitdate=null
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber
	delete t_agentset   
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber
	delete t_agentls   
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber
	delete t_agentgx
		where c_ycgh=@c_jobnumber or c_bycgh=@c_jobnumber	
return 0
go 
--返回主管工号过程
if exists(select name from sysobjects where name='p_director')
	drop procedure p_director
go
create procedure p_director 
	@i_jobnumber	char(10),	--工号	
	@i_system	int,		--政策
	@i_type		int,		--工号的职级 	
	@o_jobnumber	char(10) output	--主管工号
	
as
declare	@c_tjrgh	char(10),	--工号  
	@c_ycgh		char(10),	--工号  
	@c_level 	int 	 
	if @i_system=1	--直营事业部
	begin
		select @c_level=c_level from t_pzjdy where c_system=@i_system and c_type=@i_type
		if @c_level = 1
		begin
			--原组育成人
			select top 1 @c_ycgh=c_ycgh from t_agentgx where c_system=@i_system and c_bycgh=@i_jobnumber and c_byczj between 20 and 29 
					 order by c_byczj,c_layer
			if exists (select * from t_agentset where c_system=@i_system and c_jobnumber=@c_ycgh and c_type>=20 and c_flag='0' ) 
			begin
				set @o_jobnumber=@c_ycgh	 
			 	return 0  
			end		
			select  @c_tjrgh=c_tjrgh from t_agentset where c_system=@i_system and c_jobnumber=@i_jobnumber 			  
			if exists(select * from t_agentset where c_system=@i_system and c_jobnumber=@c_tjrgh and c_type>=20 and c_flag='0' ) 
				or @c_tjrgh ='0000000000'
			begin	 	
			 	set @o_jobnumber=@c_tjrgh	 
			 	return 0
			end
			else
			begin	  
			 	 exec p_director @c_tjrgh,@i_system,@i_type,@o_jobnumber output 			 
			end	
		end	
		if @c_level = 2
		begin 
			--原组育成人的上级主管
			select top 1 @c_ycgh=c_ycgh from t_agentgx where c_system=@i_system and c_bycgh=@i_jobnumber and c_byczj between 20 and 29 
					 order by c_byczj,c_layer
			if exists (select * from t_agentset where c_system=@i_system and c_jobnumber=@c_ycgh and c_type between 20 and 29  and c_flag='0' ) 
			begin
				select  @o_jobnumber=c_director from t_agentls where c_system=@i_system and c_jobnumber=@c_ycgh and c_flag='0'  
			 	return 0  
			end	
			if exists (select * from t_agentset where c_system=@i_system and c_jobnumber=@c_ycgh and c_type between 30 and 39  and c_flag='0' ) 
			begin
				set @o_jobnumber=@c_ycgh	 
				return 0
			end		
			select  @c_tjrgh=c_tjrgh from t_agentset where c_system=@i_system and c_jobnumber=@i_jobnumber 			
			if exists(select * from t_agentset where c_system=@i_system and c_jobnumber=@c_tjrgh and c_type>=30 and c_flag='0' ) 
				or @c_tjrgh ='0000000000'
			begin	 	
			 	set @o_jobnumber=@c_tjrgh	 
			 	return 0
			end
			else
			begin	  
			 	 exec p_director @c_tjrgh,@i_system,@i_type,@o_jobnumber output 	 
			end 
		end 
		if @c_level = 3 or @i_jobnumber='0000000000'
		begin
			set @o_jobnumber='0000000000'	 
			return 0
		end 
	end 
	if @i_system=2	--银行渠道事业部
	begin
		set @o_jobnumber='0000000000'	 
		return 0
	end 
	if @i_system=11	--产险事业部
	begin
		set @o_jobnumber='0000000000'	 
		return 0
	end 
return 0
go
--血缘关系添加过程
if exists(select name from sysobjects where name='p_relation')
	drop procedure p_relation
go
create procedure p_relation 
	@c_orgid 	int , 		--机构id 
	@c_jobnumber	char(10),	--工号	
	@c_system	int,		--政策
	@c_tjrgh	char(10),	--推荐人工号 
	@c_ksrq		char(8),	--开始日期 
	@c_jobnm	char(10),	--
	@c_operator 	char(10),	
	@c_ip 		char(25)
as
declare @c_type		int,		--职级	 
	@c_director	char(10),	--主管工号	
 	@c_sql		char(500)  
 	if not (isdate(@c_ksrq)=1 and len(@c_ksrq)=8)
	begin
		raiserror ('开始日期格式错误!', 16, 1)
		return @@error
	end	
	--添加血缘关系
	if @c_jobnm='add' 	
	begin 
		select @c_type=min(c_type) from t_pzjdy	where c_system=@c_system   
		if exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
		begin
			raiserror ('代理人工号：%s 已添加血缘关系', 16, 1,@c_jobnumber)
			return @@error
		end	 
		if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_tjrgh and c_flag='0' )
			and @c_tjrgh<>'0000000000'
		begin	
			raiserror ('推荐人工号：%s 无效', 16, 1,@c_tjrgh)
			return @@error		 
		end	 	  
		begin transaction tr_xyadd 		 
		update  t_agentset set c_flag='1'
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
			insert  t_agentset
			( 
				c_orgid,			--机构id  
				c_system,			--政策体系  	
				c_jobnumber,			--工号
				c_tjrgh,			--推荐人工号
				c_type,				--职级
				c_jobnm,
				c_operator,
				c_ip 
			)	
			values
			( 
				@c_orgid,			--机构id  
				@c_system,			--政策体系  	
				@c_jobnumber,			--工号
				@c_tjrgh,			--推荐人工号
				@c_type,			--职级
				@c_jobnm,
				@c_operator,
				@c_ip 
			)	
			if @@error <>0
			begin
				rollback transaction tr_xyadd
				raiserror ('添加血缘关系报错', 16, 1)
				return @@error 
			end 		
			set @c_director=null				
			exec p_director  @c_jobnumber,@c_system,@c_type,@c_director output	 		
			if @c_director ='1111111111'
			begin			
				rollback transaction tr_xyadd
				raiserror ('代理人工号：%s 的主管不存在', 16, 1,@c_jobnumber)	 			
				return @@error
			end		 
			update  t_agentls set c_flag='1'
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
			insert t_agentls
			(
				c_orgid ,	--机构
				c_system ,	--政策体系  	
				c_jobnumber ,	--工号
				c_type ,	--职级
				c_director ,	--上级主管
				c_ksrq , 
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(
				@c_orgid ,	--机构
				@c_system ,	--政策体系  	
				@c_jobnumber ,	--工号
				@c_type ,	--职级
				@c_director ,	--上级主管
				@c_ksrq , 
				@c_jobnm,
				@c_operator ,
				@c_ip 
			)
			if @@error <>0
			begin
				rollback transaction tr_xyadd
				raiserror ('添加血缘关系报错', 16, 1)
				return @@error 
			end 	
			--删除育成关系
			delete t_agentgx
				where c_system=@c_system and c_ycgh=@c_jobnumber or c_bycgh=@c_jobnumber	 	
			if @@error <>0
			begin 
				rollback transaction tr_xyadd
				raiserror ('删除育成关系报错', 16, 1)
				return @@error 
			end 	   	 		 		 
		commit transaction tr_xyadd	  
	end
	--修改血缘关系
	if @c_jobnm='update'	
	begin 
		select @c_type=min(c_type) from t_pzjdy	where c_system=@c_system    
		if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_tjrgh and c_flag='0' )
			and @c_tjrgh<>'0000000000'
		begin	
			raiserror ('推荐人工号：%s 无效', 16, 1,@c_tjrgh)
			return @@error		 
		end	 	  
		begin transaction tr_xyadd 		
			update  t_agentset set c_flag='1'
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
			insert  t_agentset
			( 
				c_orgid,			--机构id  
				c_system,			--政策体系  	
				c_jobnumber,			--工号
				c_tjrgh,			--推荐人工号
				c_type,				--职级
				c_jobnm,
				c_operator,
				c_ip 
			)	
			values
			( 
				@c_orgid,			--机构id  
				@c_system,			--政策体系  	
				@c_jobnumber,			--工号
				@c_tjrgh,			--推荐人工号
				@c_type,			--职级
				@c_jobnm,
				@c_operator,
				@c_ip 
			)	
			if @@error <>0
			begin
				rollback transaction tr_xyadd
				raiserror ('添加血缘关系报错', 16, 1)
				return @@error 
			end 		
			set @c_director=null				
			exec p_director  @c_jobnumber,@c_system,@c_type,@c_director output	 		
			if @c_director ='1111111111'
			begin			
				rollback transaction tr_xyadd
				raiserror ('代理人工号：%s 的主管不存在', 16, 1,@c_jobnumber)	 			
				return @@error
			end		 
			update  t_agentls set c_flag='1'
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
			insert  t_agentls
			(
				c_orgid ,	--机构
				c_system ,	--政策体系  	
				c_jobnumber ,	--工号
				c_type ,	--职级
				c_director ,	--上级主管
				c_ksrq , 
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(
				@c_orgid ,	--机构
				@c_system ,	--政策体系  	
				@c_jobnumber ,	--工号
				@c_type ,	--职级
				@c_director ,	--上级主管
				@c_ksrq , 
				@c_jobnm,
				@c_operator ,
				@c_ip 
			)
			if @@error <>0
			begin
				rollback transaction tr_xyadd
				raiserror ('添加血缘关系报错', 16, 1)
				return @@error 
			end 	 		 
			--删除育成关系
			delete t_agentgx
				where c_system=@c_system and c_bycgh=@c_jobnumber	 	
			if @@error <>0
			begin 
				rollback transaction tr_xyadd
				raiserror ('删除育成关系报错', 16, 1)
				return @@error 
			end 	   				 
		commit transaction tr_xyadd
	end	
return 0
go
--建立与育成人的关系过程
if exists(select name from sysobjects where name='p_ycgx')
	drop procedure p_ycgx
go
create procedure p_ycgx 
	@i_jobnumber_base char(10),	--基本工号	
	@i_jobnumber	  char(10),	--工号	
	@i_system	  int,		--政策
	@i_type		  int,		--工号的职级 	
	@c_operator 	  char(10),	
	@c_ip 		  char(25)  
as
declare	@c_errors	int,	 
	@c_director	char(10),	--工号		
	@c_level int   	 	
	if @i_system=1	--直营
	begin
		select @c_level=c_level from t_pzjdy where c_system=@i_system and c_type=@i_type
		if @c_level = 2	--组育成
		begin 
			select  @c_director=c_director from t_agentls where c_system=@i_system and c_jobnumber=@i_jobnumber and c_flag='0' 
			insert t_agentgx	--一代
			(
				c_system ,		--政策体系  	
				c_layer ,		--层数 
				c_ycgh ,		--育成人工号
				c_byczj ,		--被育成人职级
				c_bycgh ,		--被育成人工号  
				c_operator , 
				c_ip 
			)
			values
			(
				@i_system ,		--政策体系  	
				1,			--层数 
				@c_director ,		--育成人工号
				@i_type ,		--被育成人职级
				@i_jobnumber ,		--被育成人工号  
				@c_operator , 
				@c_ip 
			)						
		end 	
		if @c_level = 3	--部育成
		begin		 
			select  @c_director=c_director from t_agentls where c_system=@i_system and c_jobnumber=@i_jobnumber and c_flag='0' 
			insert t_agentgx	--一代
			(
				c_system ,		--政策体系  	
				c_layer ,		--层数 
				c_ycgh ,		--育成人工号
				c_byczj ,		--被育成人职级
				c_bycgh ,		--被育成人工号  
				c_operator , 
				c_ip 
			)
			values
			(
				@i_system ,		--政策体系  	
				1,			--层数 
				@c_director ,		--育成人工号
				@i_type ,		--被育成人职级
				@i_jobnumber ,		--被育成人工号  
				@c_operator , 
				@c_ip 
			) 
		end 
	end	
return 0
go
--直营取经理过程 
if exists(select name from sysobjects where name='p_zjbd_1_jl')
	drop procedure p_zjbd_1_jl
go
create procedure p_zjbd_1_jl 
	@c_system	int,		--政策
	@c_jobnumber	char(10),	--工号	
	@c_type		int 		--职级 
as
declare @c_director	char(10)	--主管	  	  
	if @c_system = 1 	--直营
	begin 
		if exists(select * from t_pzjdy where c_system=@c_system and c_type=@c_type and c_level>=2 )
		begin
			select * from t_staff where c_jobnumber=@c_jobnumber
		end
		else
		begin
			select @c_director=c_director from t_agentls where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
			select * from t_staff where c_jobnumber=@c_director
		end
	end	 
return 0
go 
--直营取组育成人过程 
if exists(select name from sysobjects where name='p_zjbd_1_zyc')
	drop procedure p_zjbd_1_zyc
go
create procedure p_zjbd_1_zyc 
	@c_system	int,		--政策
	@c_jobnumber	char(10) 	--工号（主管）		 
as
declare @c_ycgh		char(10)	--育成人工号	  	  
	if @c_system = 1 	--直营
	begin				
		if @c_jobnumber='0000000000'
		begin
			select * from t_staff where c_jobnumber=@c_jobnumber
		end
		if exists(select * from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber 
				and c_byczj in (select c_type from t_pzjdy where c_system=@c_system and c_level=2) and c_flag='0')
		begin
			select @c_ycgh=c_ycgh from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber 
				and c_byczj in (select c_type from t_pzjdy where c_system=@c_system and c_level=2) and c_flag='0'
			select * from t_staff where c_jobnumber=@c_ycgh
		end  
		else
		begin
			set @c_jobnumber='0000000000'
			select * from t_staff where c_jobnumber=@c_jobnumber
		end
	end	 
return 0
go 
--直营取总监过程 
if exists(select name from sysobjects where name='p_zjbd_1_zj')
	drop procedure p_zjbd_1_zj
go
create procedure p_zjbd_1_zj 
	@c_system	int,		--政策
	@c_jobnumber	char(10),	--工号（主管）	
	@c_type		int 		--职级 
as
declare @c_director	char(10)	--主管	  	  
	if @c_system = 1 	--直营
	begin
		if @c_jobnumber='0000000000'
		begin
			select * from t_staff where c_jobnumber=@c_jobnumber
		end
		if exists(select * from t_pzjdy where c_system=@c_system and c_type=@c_type and c_level=3 )
		begin
			select * from t_staff where c_jobnumber=@c_jobnumber
		end
		if exists(select * from t_pzjdy where c_system=@c_system and c_type=@c_type and c_level=2 )
		begin
			select @c_director=c_director from t_agentls where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
			select * from t_staff where c_jobnumber=@c_director
		end
		if exists(select * from t_pzjdy where c_system=@c_system and c_type=@c_type and c_level=1 )
		begin
			select @c_director=c_director from t_agentls where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 
			
			if @c_director='0000000000'
			begin
				select * from t_staff where c_jobnumber=@c_director
			end
		
			if exists(select * from t_agentset where c_system=@c_system and c_jobnumber=@c_director and c_flag='0'
				and c_type in (select c_type from t_pzjdy where c_system=@c_system  and c_level=3) ) 
			begin
				select * from t_staff where c_jobnumber=@c_director
			end
			
			if exists(select * from t_agentset where c_system=@c_system and c_jobnumber=@c_director and c_flag='0'
				and c_type in (select c_type from t_pzjdy where c_system=@c_system  and c_level=2) )  
			begin
				select @c_director=c_director from t_agentls where c_system=@c_system and c_jobnumber=@c_director and c_flag='0'
				select * from t_staff where c_jobnumber=@c_director
			end 
		end
	end	 
return 0
go 
--直营取部育成人过程 
if exists(select name from sysobjects where name='p_zjbd_1_byc')
	drop procedure p_zjbd_1_byc
go
create procedure p_zjbd_1_byc 
	@c_system	int,		--政策
	@c_jobnumber	char(10) 	--工号（总监）	
as
declare @c_ycgh		char(10)	--育成人工号	  	  
	if @c_system = 1 	--直营
	begin				
		if @c_jobnumber='0000000000'
		begin
			select * from t_staff where c_jobnumber=@c_jobnumber
		end
		if exists(select * from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber 
				and c_byczj in (select c_type from t_pzjdy where c_system=@c_system and c_level=3) and c_flag='0')
		begin
			select @c_ycgh=c_ycgh from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber 
				and c_byczj in (select c_type from t_pzjdy where c_system=@c_system and c_level=3) and c_flag='0'
			select * from t_staff where c_jobnumber=@c_ycgh
		end 
		else
		begin
			set @c_jobnumber='0000000000'
			select * from t_staff where c_jobnumber=@c_jobnumber
		end
	end	 
return 0
go 
--返回月初、月末日期过程 
if exists(select name from sysobjects where name='p_zjbd_1_month')
	drop procedure p_zjbd_1_month
go
create procedure p_zjbd_1_month
	@c_year	 int,		--年
	@c_month int,		--月
	@c_ksrq  char(8) output,--月初日期
	@c_jsrq  char(8) output --月末日期
as
  	if @c_month=1
  	begin
  		set @c_ksrq=str(@c_year-1,4)+'1225'
  		set @c_jsrq=str(@c_year,4)+'0126'
  		return 0
  	end  
  	if @c_month<10
  	begin
  		set @c_ksrq=str(@c_year,4)+'0'+str(@c_month-1,1)+'25'
  		set @c_jsrq=str(@c_year,4)+'0'+str(@c_month,1)+'26'
  		return 0
  	end  
	if @c_month=10
  	begin
  		set @c_ksrq=str(@c_year,4)+'0'+str(@c_month-1,1)+'25'
  		set @c_jsrq=str(@c_year,4)+str(@c_month,2)+'26'
  	end   
  	if @c_month>10
  	begin
  		set @c_ksrq=str(@c_year,4)+str(@c_month-1,2)+'25'
  		set @c_jsrq=str(@c_year,4)+str(@c_month,2)+'26'
  	end 
return 0
go 
--直营职级变动过程 
if exists(select name from sysobjects where name='p_zjbd_1')
	drop procedure p_zjbd_1
go
create procedure p_zjbd_1
	@c_orgid	int,		--机构
	@c_system	int,		--政策
	@c_jobnumber	char(10),	--工号	
	@c_type		int,		--职级
	@c_ksrq		char(8),	--开始日期 
	@c_jobnm	char(10),	--作业名称	js晋升  jj降级
	@c_operator	char(10),	--操作员
	@c_ip		char(25)	--操作电脑的ip 
as
declare @c_errors	int,   
	@i_type		int,		--目标职位 	   
	@i_level	int,		--目标职级   	   
	@c_director	char(10),	--主管	 
	@t_jobnumber	char(10),	--临时工号
	@t_type		int		--临时职位 	
	if not (isdate(@c_ksrq)=1 and len(@c_ksrq)=8)
	begin
		raiserror ('开始日期格式错误!', 16, 1)
		return @@error
	end 	  
	--晋升
	if @c_jobnm='js'
	begin
		select @i_type=min(c_type) from t_pzjdy where c_system=@c_system and c_type>@c_type 
		select @i_level=c_level from t_pzjdy where c_system=@c_system and c_type=@i_type   
		if @i_level = 1 --底层
		begin 
			set @c_director=null				
			exec p_director  @c_jobnumber,@c_system,@i_type,@c_director output	 		
			if @c_director ='1111111111'
			begin			 
				raiserror ('代理人工号：%s 的主管不存在', 16, 1,@c_jobnumber)	 			
				return @@error
			end	
			begin transaction tr_zjbd01					 
			update t_agentset set c_type=@i_type 
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
			if @@error <>0
			begin
				rollback transaction tr_zjbd01
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 	 	 			
			update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
			if @@error <>0
			begin
				rollback transaction tr_zjbd01
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 	
			insert t_agentls
			(
				c_orgid ,			--机构id  
				c_system ,			--政策体系  	
				c_jobnumber ,			--工号
				c_type ,			--职级
				c_director ,			--上级主管
				c_ksrq ,
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(	@c_orgid ,			--机构id  
				@c_system ,			--政策体系  	
				@c_jobnumber ,			--工号
				@i_type ,			--职级
				@c_director ,			--上级主管
				@c_ksrq ,
				@c_jobnm ,
				@c_operator ,
				@c_ip 
			)			
			if @@error <>0
			begin
				rollback transaction tr_zjbd01
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 			 	
			commit transaction tr_zjbd01
		end
		if @i_level = 2	--中层（组 ）
		begin 					 	  		
			--查找主管
			set @c_director=null				
			exec p_director  @c_jobnumber,@c_system,@i_type,@c_director output	 		
			if @c_director ='1111111111'
			begin			 
				raiserror ('代理人工号：%s 的主管不存在', 16, 1,@c_jobnumber)	 			
				return @@error
			end	 
			begin transaction tr_zjbd02	
			--建立新育成关系 
			exec p_ycgx  @c_jobnumber,@c_jobnumber,@c_system,@i_type,@c_operator,@c_ip	
			--删除原育成关系
			delete t_agentgx where c_system=@c_system and c_flag='1' and c_bycgh=@c_jobnumber or c_ycgh=@c_jobnumber  				
			--修改基础数据
			update t_agentset set c_type=@i_type 
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
			if @@error <>0
			begin
				rollback transaction tr_zjbd02
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 	  
			--修改历史状态
			update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
			if @@error <>0
			begin
				rollback transaction tr_zjbd02
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 	 
			insert t_agentls
			(
				c_orgid ,			--机构id  
				c_system ,			--政策体系  	
				c_jobnumber ,			--工号
				c_type ,			--职级
				c_director ,			--上级主管
				c_ksrq ,
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(	@c_orgid ,			--机构id  
				@c_system ,			--政策体系  	
				@c_jobnumber ,			--工号
				@i_type ,			--职级
				@c_director ,			--上级主管
				@c_ksrq ,
				@c_jobnm ,
				@c_operator ,
				@c_ip 
			)			
			if @@error <>0
			begin
				rollback transaction tr_zjbd02
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 						 		
			select 	c_jobnumber,c_type into #t_temp1 from t_agentset
				where c_orgid=@c_orgid and c_system=@c_system 
				and c_type in (select c_type from t_pzjdy where c_system=@c_system and c_level = 1  ) 
				and c_flag ='0'  
			declare c_zjbd02 cursor for 	
			select 	c_jobnumber,c_type from #t_temp1
			open	c_zjbd02
			fetch	next from c_zjbd02 into @t_jobnumber,@t_type			
			while	(@@fetch_status = 0)
			begin			
				--查找主管
				set @c_director=null				
				exec p_director  @t_jobnumber,@c_system,@t_type,@c_director output	 		
				if @c_director ='1111111111'
				begin			 
					close c_zjbd02
					deallocate c_zjbd02
					drop table #t_temp1
					rollback transaction tr_zjbd02
					raiserror ('代理人工号：%s 的主管不存在', 16, 1,@t_jobnumber)	 			
					return @@error
				end	 				 	
				if @c_director <> @c_jobnumber 
				begin			 	  
					fetch	next from c_zjbd02 into @t_jobnumber,@t_type
					continue
				end				
				--变更主管
				update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 	where c_system=@c_system and c_jobnumber=@t_jobnumber and c_flag='0'  
				if @@error <>0
				begin
					close c_zjbd02
					deallocate c_zjbd02
					drop table #t_temp1
					rollback transaction tr_zjbd02
					raiserror ('职级变动报错', 16, 1)
					return @@error 
				end 	  
				insert t_agentls
				(
					c_orgid ,			--机构id  
					c_system ,			--政策体系  	
					c_jobnumber ,			--工号
					c_type ,			--职级
					c_director ,			--上级主管
					c_ksrq ,
					c_jobnm ,
					c_operator ,
					c_ip 
				)
				values
				(	@c_orgid ,			--机构id  
					@c_system ,			--政策体系  	
					@t_jobnumber ,			--工号
					@t_type ,			--职级
					@c_jobnumber ,			--上级主管
					@c_ksrq ,
					@c_jobnm ,
					@c_operator ,
					@c_ip 
				)			
				if @@error <>0
				begin
					close c_zjbd02
					deallocate c_zjbd02
					drop table #t_temp1
					rollback transaction tr_zjbd02
					raiserror ('职级变动报错', 16, 1)
					return @@error 
				end 		 	
				fetch	next from c_zjbd02 into @t_jobnumber,@t_type		
			end
			close c_zjbd02
			deallocate c_zjbd02  	
			drop table #t_temp1		
			commit transaction tr_zjbd02	
		end 
		if @i_level = 3	--高层（部 ）
		begin 							
			--查找主管
			set @c_director=null				
			exec p_director  @c_jobnumber,@c_system,@i_type,@c_director output	 		
			if @c_director ='1111111111'
			begin			 
				raiserror ('代理人工号：%s 的主管不存在', 16, 1,@c_jobnumber)	 			
				return @@error
			end	 
			begin transaction tr_zjbd03		
			--建立新育成关系  
			exec p_ycgx  @c_jobnumber,@c_jobnumber,@c_system,@i_type,@c_operator,@c_ip   
			--修改基础数据
			update t_agentset set c_type=@i_type 
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
			if @@error <>0
			begin
				rollback transaction tr_zjbd03
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 	  
			--修改历史状态
			update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
			if @@error <>0
			begin
				rollback transaction tr_zjbd03
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 	 
			insert t_agentls
			(
				c_orgid ,			--机构id  
				c_system ,			--政策体系  	
				c_jobnumber ,			--工号
				c_type ,			--职级
				c_director ,			--上级主管
				c_ksrq ,
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(	@c_orgid ,			--机构id  
				@c_system ,			--政策体系  	
				@c_jobnumber ,			--工号
				@i_type ,			--职级
				@c_director ,			--上级主管
				@c_ksrq ,
				@c_jobnm ,
				@c_operator ,
				@c_ip 
			)			
			if @@error <>0
			begin
				rollback transaction tr_zjbd03
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 		
			select  c_bycgh,c_byczj into #t_temp2 from t_agentgx where c_system=@c_system and c_ycgh=@c_jobnumber and c_flag='0'				 		
			declare c_zjbd03 cursor for 	
			select 	c_bycgh,c_byczj from #t_temp2
			open	c_zjbd03
			fetch	next from c_zjbd03 into @t_jobnumber,@t_type			
			while	(@@fetch_status = 0)
			begin			
				--变更主管			 	
				update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 	where c_system=@c_system and c_jobnumber=@t_jobnumber and c_flag='0'  
				if @@error <>0
				begin
					close c_zjbd03
					deallocate c_zjbd03 
					drop table #t_temp2
					rollback transaction tr_zjbd03
					raiserror ('职级变动报错', 16, 1)
					return @@error 
				end 	  
				insert t_agentls
				(
					c_orgid ,			--机构id  
					c_system ,			--政策体系  	
					c_jobnumber ,			--工号
					c_type ,			--职级
					c_director ,			--上级主管
					c_ksrq ,
					c_jobnm ,
					c_operator ,
					c_ip 
				)
				values
				(	@c_orgid ,			--机构id  
					@c_system ,			--政策体系  	
					@t_jobnumber ,			--工号
					@t_type ,			--职级
					@c_jobnumber ,			--上级主管
					@c_ksrq ,
					@c_jobnm ,
					@c_operator ,
					@c_ip 
				)			
				if @@error <>0
				begin
					close c_zjbd03
					deallocate c_zjbd03 
					drop table #t_temp2
					rollback transaction tr_zjbd03
					raiserror ('职级变动报错', 16, 1)
					return @@error 
				end 		 	
				fetch	next from c_zjbd03 into @t_jobnumber,@t_type		
			end
			close c_zjbd03
			deallocate c_zjbd03 
			drop table #t_temp2
			commit transaction tr_zjbd03
		end 		
	end	
	--降级
	if @c_jobnm='jj'
	begin
		select @i_type=max(c_type) from t_pzjdy where c_system=@c_system and c_type<@c_type 
		select @i_level=c_level from t_pzjdy where c_system=@c_system and c_type=@i_type    		
		if @i_level = 2	--中层
		begin  
			set @c_director=null	
			if exists(select * from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber and c_byczj between 30 and 39 )
			begin	--原部育成人
				select @c_director=c_ycgh from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber and c_byczj between 30 and 39 
					 order by c_byczj,c_layer
			end
			else
			begin	--查找主管			
				exec p_director  @c_jobnumber,@c_system,@i_type,@c_director output	 		
				if @c_director ='1111111111'
				begin			 
					raiserror ('代理人工号：%s 的主管不存在', 16, 1,@c_jobnumber)	 			
					return @@error
				end	 
			end		
			begin transaction tr_zjbd04	
			update t_agentset set c_type=@i_type 
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
			if @@error <>0
			begin
				rollback transaction tr_zjbd04
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 	  
			update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
			if @@error <>0
			begin
				rollback transaction tr_zjbd04
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 	 
			insert t_agentls
			(
				c_orgid ,			--机构id  
				c_system ,			--政策体系  	
				c_jobnumber ,			--工号
				c_type ,			--职级
				c_director ,			--上级主管
				c_ksrq ,
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(	@c_orgid ,			--机构id  
				@c_system ,			--政策体系  	
				@c_jobnumber ,			--工号
				@i_type ,			--职级
				@c_director ,			--上级主管
				@c_ksrq ,
				@c_jobnm ,
				@c_operator ,
				@c_ip 
			)			
			if @@error <>0
			begin
				rollback transaction tr_zjbd04
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 	
			select 	b.c_jobnumber,b.c_type into #t_temp3 from t_agentls a,t_agentset b
				where a.c_jobnumber=b.c_jobnumber and a.c_system=b.c_system
				and b.c_system=@c_system and a.c_flag='0' and b.c_flag='0' 
				and a.c_director=@c_jobnumber and b.c_orgid=@c_orgid 
				and b.c_type in (select c_type from t_pzjdy where c_system=@c_system and c_level = 2  ) 
			declare c_zjbd04 cursor for 	
			select 	c_jobnumber,c_type  from #t_temp3
			open	c_zjbd04
			fetch	next from c_zjbd04 into @t_jobnumber,@t_type					
			while	(@@fetch_status = 0)
			begin			
				update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 	where c_system=@c_system and c_jobnumber=@t_jobnumber and c_flag='0'  
				if @@error <>0
				begin
					close c_zjbd04
					deallocate c_zjbd04
					drop table #t_temp3
					rollback transaction tr_zjbd04
					raiserror ('职级变动报错', 16, 1)
					return @@error 
				end 	 
				insert t_agentls
				(
					c_orgid ,			--机构id  
					c_system ,			--政策体系  	
					c_jobnumber ,			--工号
					c_type ,			--职级
					c_director ,			--上级主管
					c_ksrq ,
					c_jobnm ,
					c_operator ,
					c_ip 
				)
				values
				(	@c_orgid ,			--机构id  
					@c_system ,			--政策体系  	
					@t_jobnumber ,			--工号
					@t_type ,			--职级
					@c_director ,			--上级主管
					@c_ksrq ,
					@c_jobnm ,
					@c_operator ,
					@c_ip 
				)			
				if @@error <>0
				begin
					close c_zjbd04
					deallocate c_zjbd04
					drop table #t_temp3
					rollback transaction tr_zjbd04
					raiserror ('职级变动报错', 16, 1)
					return @@error 
				end 	
				fetch	next from c_zjbd04 into @t_jobnumber,@t_type			
			end
			close c_zjbd04
			deallocate c_zjbd04  
			drop table #t_temp3								 		
			commit transaction tr_zjbd04
		end  
		if @i_level =1	--底层
		begin 
			set @c_director=null	
			if exists(select * from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber and c_byczj between 20 and 29 )
			begin	-- 原组育成人
				select @c_director=c_ycgh from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber and c_byczj between 20 and 29 
					 order by c_byczj,c_layer
			end
			else
			begin	--查找主管			
				exec p_director  @c_jobnumber,@c_system,@i_type,@c_director output	 		
				if @c_director ='1111111111'
				begin			 
					raiserror ('代理人工号：%s 的主管不存在', 16, 1,@c_jobnumber)	 			
					return @@error
				end	 
			end		
			begin transaction tr_zjbd05	
			update t_agentset set c_type=@i_type 
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
			if @@error <>0
			begin
				rollback transaction tr_zjbd05
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 	  
			update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
			if @@error <>0
			begin
				rollback transaction tr_zjbd05
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 	 
			insert t_agentls
			(
				c_orgid ,			--机构id  
				c_system ,			--政策体系  	
				c_jobnumber ,			--工号
				c_type ,			--职级
				c_director ,			--上级主管
				c_ksrq ,
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(	@c_orgid ,			--机构id  
				@c_system ,			--政策体系  	
				@c_jobnumber ,			--工号
				@i_type ,			--职级
				@c_director ,			--上级主管
				@c_ksrq ,
				@c_jobnm ,
				@c_operator ,
				@c_ip 
			)			
			if @@error <>0
			begin
				rollback transaction tr_zjbd05
				raiserror ('职级变动报错', 16, 1)
				return @@error 
			end 		
			select 	b.c_jobnumber,b.c_type into #t_temp4 from t_agentls a,t_agentset b
				where a.c_jobnumber=b.c_jobnumber and a.c_system=b.c_system
				and b.c_system=@c_system and a.c_flag='0' and b.c_flag='0' 
				and a.c_director=@c_jobnumber and b.c_orgid=@c_orgid  
				and b.c_type in (select c_type from t_pzjdy where c_system=@c_system and c_level = 1  )
			declare c_zjbd05 cursor for 	
			select 	c_jobnumber,c_type  from #t_temp4
			open	c_zjbd05
			fetch	next from c_zjbd05 into @t_jobnumber,@t_type					
			while	(@@fetch_status = 0)
			begin			
				update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 	where c_system=@c_system and c_jobnumber=@t_jobnumber and c_flag='0'  
				if @@error <>0
				begin
					close c_zjbd05
					deallocate c_zjbd05
					drop table #t_temp4
					rollback transaction tr_zjbd05
					raiserror ('职级变动报错', 16, 1)
					return @@error 
				end 	 
				insert t_agentls
				(
					c_orgid ,			--机构id  
					c_system ,			--政策体系  	
					c_jobnumber ,			--工号
					c_type ,			--职级
					c_director ,			--上级主管
					c_ksrq ,
					c_jobnm ,
					c_operator ,
					c_ip 
				)
				values
				(	@c_orgid ,			--机构id  
					@c_system ,			--政策体系  	
					@t_jobnumber ,			--工号
					@t_type ,			--职级
					@c_director ,			--上级主管
					@c_ksrq ,
					@c_jobnm ,
					@c_operator ,
					@c_ip 
				)			
				if @@error <>0
				begin
					close c_zjbd05
					deallocate c_zjbd05
					drop table #t_temp4
					rollback transaction tr_zjbd05
					raiserror ('职级变动报错', 16, 1)
					return @@error 
				end 	        	
				fetch	next from c_zjbd05 into @t_jobnumber,@t_type			
			end
			close c_zjbd05
			deallocate c_zjbd05
			drop table #t_temp4
			--降级至理财顾问职级，停发育成利益，保留育成关系
			if @i_type=10
			begin
				update t_agentgx set c_flag='1' where c_system=@c_system and c_bycgh=@c_jobnumber or c_ycgh=@c_jobnumber  	
				if @@error <>0
				begin 
					rollback transaction tr_zjbd05
					raiserror ('解除育成关系报错', 16, 1)
					return @@error 
				end 
			end	   			 		
			commit transaction tr_zjbd05
		end  
	end 	
return 0
go
--直营离职过程 
if exists(select name from sysobjects where name='p_zjbd_1_ls')
	drop procedure p_zjbd_1_ls
go
create procedure p_zjbd_1_ls
	@c_orgid	 int,		--机构
	@c_system	 int,		--政策
	@c_jobnumber	 char(10),	--工号	
	@c_type		 int,		--职级 
	@c_type_sxr	 int,		--世袭类型 1 指定人，2 无世袭人	  
	@c_jobnumber_sxr char(10),	--世袭工号
	@c_type_xq	 int,		--续期类型 1 指定人，2 自动递归		  
	@c_jobnumber_xq	 char(10),	--续期工号 
	@c_operator	 char(10),	--操作员
	@c_ip		 char(25)	--操作电脑的ip 
as
declare @c_errors	int,       
	@c_ksrq		char(8),	--开始日期 
	@c_tjrgh	char(10),	--推荐人工号
	@c_director	char(10),	--主管	 
	@c_level	int 		--职级   	        
	set @c_ksrq=convert(char(8),getdate(),112) 
	--检查工号是否合法
	if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' )
	begin
		raiserror ('工号无效!', 16, 1)
		return @@error 
	end
	select @c_level=c_level from t_pzjdy where c_system=@c_system and c_type=@c_type  	
	if @c_level=3
	begin
		begin transaction 	tr_ls	
		exec @c_errors=p_zjbd_1
			@c_orgid	,	--机构
			@c_system	,	--政策
			@c_jobnumber	,	--工号	
			@c_type		,	--职级
			@c_ksrq		,	--开始日期 
			'jj'		,	--作业名称	js晋升  jj降级
			@c_operator	,	--操作员
			@c_ip			--操作电脑的ip 
		if @c_errors <>0
		begin
			rollback transaction	tr_ls
			raiserror ('代理人工号：%s 离职报错', 16, 1,@c_jobnumber)	 			
			return @@error 
		end 		
		exec @c_errors=p_zjbd_1
			@c_orgid	,	--机构
			@c_system	,	--政策
			@c_jobnumber	,	--工号	
			@c_type		,	--职级
			@c_ksrq		,	--开始日期 
			'jj'		,	--作业名称	js晋升  jj降级
			@c_operator	,	--操作员
			@c_ip			--操作电脑的ip 
		if @c_errors <>0
		begin
			rollback transaction	tr_ls
			raiserror ('代理人工号：%s 离职报错', 16, 1,@c_jobnumber)	 			
			return @@error 
		end 				
	end
	if @c_level=2
	begin
		begin transaction 	tr_ls	
		exec @c_errors=p_zjbd_1
			@c_orgid	,	--机构
			@c_system	,	--政策
			@c_jobnumber	,	--工号	
			@c_type		,	--职级
			@c_ksrq		,	--开始日期 
			'jj'		,	--作业名称	js晋升  jj降级
			@c_operator	,	--操作员
			@c_ip			--操作电脑的ip 
		if @c_errors <>0
		begin
			rollback transaction	tr_ls
			raiserror ('代理人工号：%s 离职报错', 16, 1,@c_jobnumber)	 			
			return @@error 
		end 		
	end 	
	--增员世袭
	if @c_type_sxr = 1
	begin
		if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber_sxr and c_flag='0')  
		begin
			rollback transaction	tr_ls
			raiserror ('增员世袭人工号 %s 无效', 16, 1, @c_jobnumber_sxr)
			return @@error
		end  
		--增员世袭人 对上给予利益
		update t_agentset set c_sxrgh=@c_jobnumber_sxr
			where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
		--利益承袭人 对下收取利益		
		update t_agentset set c_cxrgh=@c_jobnumber_sxr
			where c_system=@c_system and c_tjrgh=@c_jobnumber or c_cxrgh=@c_jobnumber and c_flag='0'
	end
	--客服服务指定人
	if @c_type_xq = 1
	begin 
		if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber_xq and c_flag='0')  
		begin
			rollback transaction	tr_ls
			raiserror ('客服服务继承人工号 %s 无效', 16, 1, @c_jobnumber_xq)
			return @@error
		end  
		--客服服务指定人
		update t_agentset set c_jcrgh=@c_jobnumber_xq
			where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
		--保单归属	
		update t_sxbd set c_jobnumber_xq=@c_jobnumber_xq  
			where c_system_sq=@c_system and c_jobnumber_xq=@c_jobnumber and c_flag='0'
	end	
	--客服服务自动递归
	if @c_type_xq = 2
	begin		
		select @c_tjrgh=c_tjrgh from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
		select @c_director=c_director from t_agentls where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'		
		if exists(select * from t_agentset where c_jobnumber=@c_tjrgh and c_flag='0' )
		begin
			set @c_jobnumber_xq=@c_tjrgh
		end 	
		else
		begin
			set @c_jobnumber_xq=@c_director
		end 
		--客服服务指定人
		update t_agentset set c_jcrgh=@c_jobnumber_xq
			where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
		--保单归属	
		update t_sxbd set c_jobnumber_xq=@c_jobnumber_xq,c_type_xq=@c_type_xq 
			where c_system_sq=@c_system and c_jobnumber_xq=@c_jobnumber and c_flag='0'
	end
	--修改入司资料
	update t_staff set c_quitdate=@c_ksrq,c_jobnm='ls' 
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber  		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('离职报错', 16, 1)
		return @@error 
	end 	  
	--修改基础数据
	update t_agentset set c_flag='1',c_jobnm='ls' 
		where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('离职报错', 16, 1)
		return @@error 
	end 	  
	--修改历史状态
	update t_agentls set c_flag='1',c_jsrq=@c_ksrq
		 where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('离职报错', 16, 1)
		return @@error 
	end 	  
	commit transaction tr_ls	
return 0
go
--银行渠道职级变动过程 
if exists(select name from sysobjects where name='p_zjbd_2')
	drop procedure p_zjbd_2
go
create procedure p_zjbd_2
	@c_orgid	int,		--机构
	@c_system	int,		--政策
	@c_jobnumber	char(10),	--工号	
	@c_type		int,		--职级
	@c_ksrq		char(8),	--开始日期 
	@c_jobnm	char(10),	--作业名称	js晋升  jj降级
	@c_operator	char(10),	--操作员
	@c_ip		char(25)	--操作电脑的ip 
as
declare @c_errors	int,   
	@i_type		int,		--目标职位 	   
	@i_level	int,		--目标职级   	   
	@c_director	char(10),	--主管	 
	@t_jobnumber	char(10),	--临时工号
	@t_type		int		--临时职位 
	if not (isdate(@c_ksrq)=1 and len(@c_ksrq)=8)
	begin
		raiserror ('开始日期格式错误!', 16, 1)
		return @@error
	end	 	  
	--晋升
	if @c_jobnm='js'
	begin
		select @i_type=min(c_type) from t_pzjdy where c_system=@c_system and c_type>@c_type  
		select @i_level=c_level from t_pzjdy where c_system=@c_system and c_type=@i_type 
		 
		begin transaction tr_zjbd01	
		update t_agentset set c_type=@i_type 
			where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
		if @@error <>0
		begin
			rollback transaction tr_zjbd01
			raiserror ('职级变动报错', 16, 1)
			return @@error 
		end 	  
		update t_agentls set c_flag='1',c_jsrq=@c_ksrq
			 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
		if @@error <>0
		begin
			rollback transaction tr_zjbd01
			raiserror ('职级变动报错', 16, 1)
			return @@error 
		end 	 
		insert t_agentls
		(
			c_orgid ,			--机构id  
			c_system ,			--政策体系  	
			c_jobnumber ,			--工号
			c_type ,			--职级
			c_director ,			--上级主管
			c_ksrq ,
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(	@c_orgid ,			--机构id  
			@c_system ,			--政策体系  	
			@c_jobnumber ,			--工号
			@i_type ,			--职级
			'0000000000' ,			--上级主管
			@c_ksrq ,
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)			
		if @@error <>0
		begin
			rollback transaction tr_zjbd01
			raiserror ('职级变动报错', 16, 1)
			return @@error 
		end 		
		commit transaction tr_zjbd01 
	end	
	--降级
	if @c_jobnm='jj'
	begin
		select @i_type=max(c_type) from t_pzjdy where c_system=@c_system and c_type<@c_type 
		select @i_level=c_level from t_pzjdy where c_system=@c_system and c_type=@i_type 
		 
		begin transaction tr_zjbd02	
		update t_agentset set c_type=@i_type 
			where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
		if @@error <>0
		begin
			rollback transaction tr_zjbd02
			raiserror ('职级变动报错', 16, 1)
			return @@error 
		end 	  
		update t_agentls set c_flag='1',c_jsrq=@c_ksrq
			 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
		if @@error <>0
		begin
			rollback transaction tr_zjbd02
			raiserror ('职级变动报错', 16, 1)
			return @@error 
		end 	 
		insert t_agentls
		(
			c_orgid ,			--机构id  
			c_system ,			--政策体系  	
			c_jobnumber ,			--工号
			c_type ,			--职级
			c_director ,			--上级主管
			c_ksrq ,
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(	@c_orgid ,			--机构id  
			@c_system ,			--政策体系  	
			@c_jobnumber ,			--工号
			@i_type ,			--职级
			'0000000000' ,			--上级主管
			@c_ksrq ,
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)			
		if @@error <>0
		begin
			rollback transaction tr_zjbd02
			raiserror ('职级变动报错', 16, 1)
			return @@error 
		end 		
		commit transaction tr_zjbd02		 	
	end	
return 0
go 
--银行渠道离职过程 
if exists(select name from sysobjects where name='p_zjbd_2_ls')
	drop procedure p_zjbd_2_ls
go
create procedure p_zjbd_2_ls
	@c_orgid	 int,		--机构
	@c_system	 int,		--政策
	@c_jobnumber	 char(10),	--工号	 
	@c_operator	 char(10),	--操作员
	@c_ip		 char(25)	--操作电脑的ip 
as
declare @c_errors	int,       
	@c_ksrq		char(8),	--开始日期 
	@c_tjrgh	char(10),	--推荐人工号
	@c_director	char(10),	--主管	 
	@c_level	int 		--职级   	        
	set @c_ksrq=convert(char(8),getdate(),112) 
	--检查工号是否合法
	if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' )
	begin
		raiserror ('工号无效!', 16, 1)
		return @@error 
	end
	begin transaction tr_ls		
	--修改入司资料
	update t_staff set c_quitdate=@c_ksrq,c_jobnm='ls' 
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber  		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('离职报错', 16, 1)
		return @@error 
	end 	  
	--修改基础数据
	update t_agentset set c_flag='1',c_jobnm='ls' 
		where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('离职报错', 16, 1)
		return @@error 
	end 	  
	--修改历史状态
	update t_agentls set c_flag='1',c_jsrq=@c_ksrq
		 where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('离职报错', 16, 1)
		return @@error 
	end 	  
	commit transaction tr_ls	
return 0
go
--产险离职过程 
if exists(select name from sysobjects where name='p_zjbd_11_ls')
	drop procedure p_zjbd_11_ls
go
create procedure p_zjbd_11_ls
	@c_orgid	 int,		--机构
	@c_system	 int,		--政策
	@c_jobnumber	 char(10),	--工号	 
	@c_operator	 char(10),	--操作员
	@c_ip		 char(25)	--操作电脑的ip 
as
declare @c_errors	int,       
	@c_ksrq		char(8),	--开始日期 
	@c_tjrgh	char(10),	--推荐人工号
	@c_director	char(10),	--主管	 
	@c_level	int 		--职级   	        
	set @c_ksrq=convert(char(8),getdate(),112) 
	--检查工号是否合法
	if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' )
	begin
		raiserror ('工号无效!', 16, 1)
		return @@error 
	end
	begin transaction tr_ls		
	--修改入司资料
	update t_staff set c_quitdate=@c_ksrq,c_jobnm='ls' 
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber  		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('离职报错', 16, 1)
		return @@error 
	end 	  
	--修改基础数据
	update t_agentset set c_flag='1',c_jobnm='ls' 
		where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('离职报错', 16, 1)
		return @@error 
	end 	  
	--修改历史状态
	update t_agentls set c_flag='1',c_jsrq=@c_ksrq
		 where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('离职报错', 16, 1)
		return @@error 
	end 	  
	commit transaction tr_ls	
return 0
go

--代理人佣金过程
if exists(select name from sysobjects where name='p_agentcommission')
	drop procedure p_agentcommission
go
create procedure p_agentcommission	
	@c_orgid int ,			-- 机构	
	@c_year int ,			-- 年 
	@c_month int ,			-- 月  	
	@c_jobnumber char(10) ,		-- 工号
	@c_system int ,			-- 政策体系   
	@c_str varchar (2000)  ,	-- 工资条（明细）
	@c_strv decimal(15, 2) ,	-- 工资条（合计）  
	@c_add decimal(15, 2) ,		-- 加扣款  	 
	@c_jobnm char (10) ,		-- add 添加， 0 发放
	@c_operator char(10) , 
	@c_ip char (25)   
as
declare	@c_yfje decimal(15, 2),		-- 临时变量  
	@c_yys  decimal(15, 2),		-- 临时变量  
	@c_temp decimal(15, 2),		-- 临时变量  
	@c_grs  decimal(15, 2),		-- 临时变量  
	@c_sfje decimal(15, 2),		-- 临时变量  
	@c_sql	 char(200) 		-- 
	if  @c_jobnm='add'	--添加 
	begin
		if exists ( select * from t_agentcommission
			where   c_orgid=@c_orgid and c_year=@c_year and c_month=@c_month and c_jobnumber=@c_jobnumber and c_system=@c_system and c_jobnm='0' )
		begin
			raiserror ('佣金已经发放，不能再重新计算', 16, 1)
			return @@error
		end		
		--删除已添加的行
		delete t_agentcommission
			where   c_orgid=@c_orgid and c_year=@c_year and c_month=@c_month and c_jobnumber=@c_jobnumber and c_system=@c_system 
		--应发金额
		set @c_yfje=@c_strv + @c_add		
		--营业税
		if  @c_yfje >= 20000
		begin
			set @c_yys=@c_yfje * 0.056	
		end		
		else
		begin
			set @c_yys=0
		end
		--个人税基数
		set @c_temp=@c_yfje * 0.6 - @c_yys	
		--个人税
		if  @c_temp <= 800
		begin
			set @c_grs=0
		end
		if  @c_temp > 800 and @c_temp <= 4000
		begin
			set @c_grs=(@c_temp-800)*0.2
		end
		if  @c_temp > 4000 and @c_temp <= 25000
		begin
			set @c_grs=@c_temp*0.8*0.2
		end
		if  @c_temp > 25000 and @c_temp <= 62500
		begin
			set @c_grs=@c_temp*0.24-2000
		end
		if  @c_temp > 62500
		begin
			set @c_grs=@c_temp*0.32-7000
		end
		--实发金额
		set @c_sfje=@c_yfje-@c_yys-@c_grs
		insert t_agentcommission
		(
			c_orgid ,		-- 机构	
			c_year ,		-- 年 
			c_month ,		-- 月  	
			c_jobnumber ,		-- 工号
			c_system ,		-- 政策体系   
			c_str ,			-- 工资条（明细）
			c_strv ,		-- 工资条（合计）  
			c_add ,			-- 加扣款  
			c_yfje ,		-- 应发金额=工资条（合计）+ 加扣款	
			c_yys ,			-- 营业税
			c_grs ,			-- 个人税
			c_yfje ,		-- 实发金额
			c_jobnm ,
			c_operator ,	
			c_ip 
		)
		values
		(
			@c_orgid ,		-- 机构	
			@c_year ,		-- 年 
			@c_month ,		-- 月  	
			@c_jobnumber ,		-- 工号
			@c_system ,		-- 政策体系   
			@c_str ,		-- 工资条（明细）
			@c_strv ,		-- 工资条（合计）  
			@c_add ,		-- 加扣款  	
			@c_yfje,		-- 应发金额=工资条（合计）+ 加扣款	
			@c_yys,			-- 营业税
			@c_grs,			-- 个人税
			@c_yfje ,		-- 实发金额
			@c_jobnm ,
			@c_operator ,	
			@c_ip 	 
		)	
	end	
	if  @c_jobnm='0'	--发放
	begin
		if not exists ( select * from t_agentcommission
			where c_orgid=@c_orgid and c_year=@c_year and c_month=@c_month and c_jobnumber=@c_jobnumber and c_system=@c_system and c_jobnm='add' )
		begin
			raiserror ('佣金未添加运算，不能发放', 16, 1)
			return @@error
		end		
		--设置为发放状态
		update t_agentcommission set c_jobnm='0'
			where c_orgid=@c_orgid and c_year=@c_year and c_month=@c_month and c_jobnumber=@c_jobnumber and c_system=@c_system and c_jobnm='add' 		
	end	
return 0
go 