--目录过程
if exists(select name from sysobjects where name='p_catalog')
	drop procedure p_catalog
go
create procedure p_catalog
	@c_no int ,
	@c_sys int ,	 
	@c_name char (30) ,   
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as 	  
	if @c_jobnm='add'
	begin
		insert  t_catalog   	
		(	 
			c_sys , 
			c_name ,   
			c_jobnm ,
			c_operator , 
			c_ip
		) 
		values
		(
			@c_sys , 
			@c_name ,   
			@c_jobnm ,
			@c_operator , 
			@c_ip
		)	
	end
	if @c_jobnm='update'
	begin
		update t_catalog  set c_name=@c_name
			where c_no=@c_no	
	end	
	if @c_jobnm='del'
	begin
		delete t_catalog where c_no=@c_no	
	end	
return 0
go
--文件过程
if exists(select name from sysobjects where name='p_file')
	drop procedure p_file
go
create procedure p_file
	@c_no int ,
	@c_sys int ,		 
	@c_catalogid int ,  
	@c_name char (200) ,  	--文件名
	@c_save char (50) ,  	--文件名	
	@c_url char (150) ,  	--物理地址
	@c_flag char (1) ,
	@c_jobnm char (10) ,
	@c_operator char(10) ,	
	@c_ip char (25) 
as 	  
	if @c_jobnm='add'
	begin
		insert  t_file   	
		(	  
			c_sys ,		 
			c_catalogid ,  
			c_name ,  	 
			c_save ,	
			c_url  ,  
			c_flag ,	 
			c_jobnm ,
			c_operator ,
			c_ip 
		) 
		values
		(
			@c_sys ,		 
			@c_catalogid ,  
			@c_name ,  
			@c_save ,	 	
			@c_url  ,  	
			@c_flag , 
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)	
		select c_no from t_file where c_sys=@c_sys and c_url=@c_url
	end	
	if @c_jobnm='update'
	begin
		update t_file set c_flag=@c_flag where c_no=@c_no	
	end	
	if @c_jobnm='del'
	begin
		delete t_file where c_no=@c_no	
	end
return 0
go
--系统角色过程
if exists(select name from sysobjects where name='p_role')
	drop procedure p_role
go
create procedure p_role
	@c_no int ,
	@c_sys int ,			 
	@c_jobnumber char(10),		
	@c_role int ,		 
	@c_jobnm char (10),
	@c_operator char(10) ,	
	@c_ip char (25)  
as 	  
	if @c_jobnm='add'
	begin
		if not exists(select * from t_staff where c_jobnumber =@c_jobnumber and c_quitdate is null )
		begin
			raiserror ('工号录入有误！', 16,1 )
			return @@error
		end			
		insert  t_role   	
		(	
			c_sys ,			 
			c_jobnumber,
			c_role,			  
			c_jobnm,
			c_operator,
			c_ip 
		) 
		values
		(
			@c_sys ,		 
			@c_jobnumber,
			@c_role,		  
			@c_jobnm,
			@c_operator,
			@c_ip 
		)	
	end	
	if @c_jobnm='del'
	begin
		delete t_role where c_no=@c_no	
	end	
return 0
go
--分管总设置过程
if exists(select name from sysobjects where name='p_roleset')
	drop procedure p_roleset
go
create procedure p_roleset
	@c_no int ,
	@c_sys int ,			 
	@c_jobnumber char(10),		
	@c_orgid int ,		 
	@c_deptid int ,	
	@c_jobnm char (10),
	@c_operator char(10) ,	
	@c_ip char (25)  
as 	  
	if @c_jobnm='add'
	begin
		if not exists(select * from t_staff where c_jobnumber =@c_jobnumber and c_quitdate is null )
		begin
			raiserror ('工号录入有误！', 16,1 )
			return @@error
		end	
		if not exists(select * from t_dept where c_no=@c_deptid)
		begin
			raiserror ('部门不存在！', 16,1 )
			return @@error
		end		
		insert  t_roleset   	
		(	
			c_sys ,			 
			c_jobnumber,
			c_orgid,	
			c_deptid,			  
			c_jobnm,
			c_operator,
			c_ip 
		) 
		values
		(
			@c_sys ,		 
			@c_jobnumber,
			@c_orgid,	
			@c_deptid,		  
			@c_jobnm,
			@c_operator,
			@c_ip 
		)	
	end	
	if @c_jobnm='del'
	begin
		delete t_roleset where c_no=@c_no	
	end	
return 0
go
--文件签发过程
if exists(select name from sysobjects where name='p_filesigned')
	drop procedure p_filesigned
go
create procedure p_filesigned 
	 @c_dname  char  (30) ,	 
	 @c_dcode  char  (30) ,	 
	 @c_write  char  (30) ,		 
	 @c_check  char  (30) ,		 
	 @c_fileid  int  ,		
	 @c_note  char(200) , 	
	 @c_jobnm   char  (10) ,
	 @c_operator char (10) ,	
	 @c_ip   char  (25) 
as 	  
	if @c_jobnm='add'
	begin
		insert  t_filesigned  	
		(	   
			 c_dname ,	 
			 c_dcode ,	 
			 c_write ,		 
			 c_check ,	  
			 c_fileid  ,		
			 c_note , 	
			 c_jobnm ,
			 c_operator ,
			 c_ip 
		) 
		values
		( 
			 @c_dname ,	 
			 @c_dcode ,	 
			 @c_write ,		 
			 @c_check ,	 
			 @c_fileid  ,		
			 @c_note , 	 	
			 @c_jobnm ,
			 @c_operator ,
			 @c_ip 
		)	
		select max(c_no) c_no from t_filesigned where c_operator=@c_operator
	end	 
return 0
go
--文件权限过程
if exists(select name from sysobjects where name='p_fileJT')
	drop procedure p_fileJT
go
create procedure p_fileJT  
	 @c_fileid   int ,		--文件id   	 	 
	 @c_postid   int , 
	 @c_jobnm   char(10) ,
	 @c_operator char(10) ,	
	 @c_ip   char(25) 
as 	  
	if @c_jobnm='add'
	begin
		if not exists(select * from t_fileJT where c_fileid=@c_fileid and c_postid=@c_postid )
		begin		
			insert  t_fileJT 	
			(	   
				 c_fileid ,		--文件id   	 	 
				 c_postid  ,
				 c_jobnm ,
				 c_operator ,
				 c_ip 
			) 
			values
			( 
				 @c_fileid ,		--文件id   	 	 
				 @c_postid  ,
				 @c_jobnm ,
				 @c_operator ,
				 @c_ip 
			)	
		end		
	end		 
return 0
go
--文件阅读记录过程
if exists(select name from sysobjects where name='p_fileRD')
	drop procedure p_fileRD
go
create procedure p_fileRD
	@c_fileid   int ,			
	@c_jobnm   char(10)  ,
	@c_operator char(10) ,	
	@c_ip   char(25)  
as 	  
declare @c_jobnumber char(10) ,
	@c_postid   int , 
	@c_count int   
	if @c_jobnm='add'
	begin
		declare c_fileRD cursor for	 	 	
	 	select c_postid from t_fileJT where c_fileid=@c_fileid and c_flag='0'
		open c_fileRD
		fetch next from c_fileRD into @c_postid 
		while	(@@fetch_status = 0)
		begin
			declare c_post cursor for	 	 	
		 	select c_jobnumber from t_postset where c_postid =@c_postid
			open c_post
			fetch next from c_post into @c_jobnumber 
			while	(@@fetch_status = 0)
			begin
				if not exists (select * from t_fileRD where c_fileid=@c_fileid and c_jobnumber=@c_jobnumber )
				begin
					insert  t_fileRD 	
					(	   
						 c_fileid ,		--文件id   	 	 
						 c_jobnumber ,
						 c_times ,		--次数   
						 c_jobnm ,
						 c_operator ,
						 c_ip  
					) 
					values
					( 
						 @c_fileid ,		--文件id   	 	 
						 @c_jobnumber ,
						 0 ,			--次数   
						 @c_jobnm ,
						 @c_operator ,
						 @c_ip  
					)		
				end 
				fetch next from c_post into @c_jobnumber 
			end 
			close c_post
			deallocate c_post		
			fetch next from c_fileRD into @c_postid 
		end 
		close c_fileRD
		deallocate c_fileRD  	 		
	end	 
return 0
go
--文件阅读过程
if exists(select name from sysobjects where name='p_fileRead')
	drop procedure p_fileRead
go
create procedure p_fileRead
	@c_fileid  int	,
	@c_jobnumber  char(10) 				 
as 	  
	update t_fileRD set c_times=c_times+1	
		where c_jobnumber =@c_jobnumber and c_fileid=@c_fileid 		
	select * from t_file where c_no=@c_fileid
return 0
go
--签报提示录入过程
if exists(select name from sysobjects where name='p_sprompt')
	drop procedure p_sprompt
go
create procedure p_sprompt
	 @c_sys   int  ,		--1 文件管理 ；3 签报管理 
	 @c_sid   int  			--签报id  	 
as 	    	 
declare	 @c_jobnumber  char(10)

	declare c_sprompt cursor for	 	 	
	 	select c_send from t_sprocess where c_sys=@c_sys and c_sid=@c_sid and c_flag='1'
	open c_sprompt
	fetch next from c_sprompt into @c_jobnumber 
	while	(@@fetch_status = 0)
	begin
		insert  t_sprompt	
		(	   
			 c_sys ,		--文件id   	 	 
			 c_sid ,
			 c_jobnumber 		-- 	 
		) 
		values
		( 
			 @c_sys ,		--文件id   	 	 
			 @c_sid ,
			 @c_jobnumber 		-- 	
		)  
		fetch next from c_sprompt into @c_jobnumber 
	end
	close c_sprompt
	deallocate c_sprompt 	
return 0
go
--签报流转过程	
if exists(select name from sysobjects where name='p_sprocess')
	drop procedure p_sprocess
go
create procedure p_sprocess 
	 @c_no    int , 
	 @c_sys   int ,		 
	 @c_sid   int ,		 	
	 @c_return   int ,		 	 
	 @c_note  char(200) ,	  	 	
	 @c_send  char(10) ,
	 @c_opname char(20) ,	
	 @c_jobnm char(10) ,
	 @c_operator char(10) ,	
	 @c_ip   char(25) 
as 	  
declare	 @c_datime datetime ,			--操作时间 		
 	 @c_fileid  int,
	 @c_cost decimal(15, 2),
	 @c_orgid int,	   
	 @c_deptid int,	 
	 @c_jobnumber1 char(10),
	 @c_jobnumber2 char(10),
	 @c_jobnumber_temp char(10),  
	 @c_to  int,
	 @c_type int,
	 @c_receive char(10) 
	set @c_datime=getdate()	
	--文件签报流程	
	if @c_sys=1
	begin
		select @c_orgid=c_orgid from t_staff where c_jobnumber=@c_send				
		if @c_jobnm='add'
		begin			
			if not exists (select * from t_staff where c_orgid=@c_orgid and c_name=@c_opname and c_quitdate is null  )
			begin
				raiserror ('姓名：%s 不存在 ！', 16 , 1 ,@c_opname )
				return @@error
			end
			select @c_receive=c_jobnumber from t_staff where c_orgid=@c_orgid and c_name=@c_opname and c_quitdate is null 
			insert  t_sprocess  	
			(	    
				 c_sys  ,		--1 文件管理 ；3 签报管理 
				 c_sid  ,		--签报id   	
				 c_return  ,		--1:同意 2:不同意 	 
				 c_note  ,		--备注   
				 c_send  ,
				 c_receive  ,	
				 c_jobnm ,
				 c_operator ,
				 c_ip 
			) 
			values
			( 
				 @c_sys  ,		--1 文件管理 ；3 签报管理 
				 @c_sid  ,		--签报id   	
				 1,			--1:同意 2:不同意 	 
				 @c_note  ,		--备注   
				 @c_send  ,
				 @c_receive  ,		
				 @c_jobnm ,
				 @c_operator ,
				 @c_ip 
			)	
		end	 
		if @c_jobnm='return'
		begin
			if not exists (select * from t_role where c_sys=@c_sys and c_jobnumber=@c_send and c_role='101') and @c_return=1	
			begin				
				if not exists (select * from t_staff where c_orgid=@c_orgid and c_name=@c_opname and c_quitdate is null  )
				begin
					raiserror ('姓名：%s 不存在 ！', 16 , 1 ,@c_opname )
					return @@error
				end
				select @c_receive=c_jobnumber from t_staff where c_orgid=@c_orgid and c_name=@c_opname and c_quitdate is null 
				update t_sprocess set c_flag='1' 
					where c_sys=@c_sys and c_sid=@c_sid and c_flag='0'
				insert  t_sprocess  	
				(	    
					 c_sys  ,		--1 文件管理 ；3 签报管理 
					 c_sid  ,		--签报id   	
					 c_return  ,		--1:同意 2:不同意 	 
					 c_note  ,		--备注   
					 c_send  ,
					 c_receive  ,	
					 c_jobnm ,
					 c_operator ,
					 c_ip 
				) 
				values
				( 
					 @c_sys  ,		--1 文件管理 ；3 签报管理 
					 @c_sid  ,		--签报id   	
					 @c_return ,		--1:同意 2:不同意 	 
					 @c_note  ,		--备注   
					 @c_send  ,
					 @c_receive  ,		
					 @c_jobnm ,
					 @c_operator ,
					 @c_ip 
				)
			end
			else
			begin
				update t_sprocess set c_flag='1' 
					where c_sys=@c_sys and c_sid=@c_sid and c_flag='0'
				insert  t_sprocess  	
				(	    
					 c_sys  ,		--1 文件管理 ；3 签报管理 
					 c_sid  ,		--签报id   	
					 c_return  ,		--1:同意 2:不同意 	 
					 c_note  ,		--备注   
					 c_send  ,
					 c_receive  ,	
					 c_jobnm ,
					 c_operator ,
					 c_ip 
				) 
				values
				( 
					 @c_sys  ,		--1 文件管理 ；3 签报管理 
					 @c_sid  ,		--签报id   	
					 @c_return ,		--1:同意 2:不同意 	 
					 @c_note  ,		--备注   
					 @c_send  ,
					 @c_receive  ,	
					 @c_jobnm ,
					 @c_operator ,
					 @c_ip 
				) 	
				update t_filesigned set c_jobnm='zz' where c_no =@c_sid
				exec p_sprompt @c_sys , @c_sid 		
				select @c_fileid=c_fileid from t_filesigned where c_no =@c_sid	
				if @c_return=1	--同意
				begin
										
					update t_file set c_flag='0' where c_no=@c_fileid	
					exec p_fileRD @c_fileid,'add',@c_operator,@c_ip   
				end
				else
				begin
					update t_fileJT set c_flag='1' where c_fileid=@c_fileid
				end 				
				return 0
			end			
		end	 	
	end
	--签报流程
	if @c_sys=3
	begin
		select @c_orgid=c_orgid from t_staff where c_jobnumber=@c_send	
		if @c_jobnm='add'
		begin
			if not exists (select * from t_staff where c_orgid=@c_orgid and c_name=@c_opname and c_quitdate is null  )
			begin
				raiserror ('姓名：%s 不存在 ！', 16 , 1 ,@c_opname )
				return @@error
			end
			select @c_receive=c_jobnumber from t_staff where c_orgid=@c_orgid and c_name=@c_opname and c_quitdate is null 
			insert  t_sprocess  	
			(	    
				 c_sys  ,		--1 文件管理 ；3 签报管理 
				 c_sid  ,		--签报id   	
				 c_return  ,		--1:同意 2:不同意 	 
				 c_note  ,		--备注   
				 c_send  ,
				 c_receive  ,	
				 c_jobnm ,
				 c_operator ,
				 c_ip 
			) 
			values
			( 
				 @c_sys  ,		--1 文件管理 ；3 签报管理 
				 @c_sid  ,		--签报id   	
				 1,			--1:同意 2:不同意 	 
				 @c_note  ,		--备注   
				 @c_send  ,
				 @c_receive  ,	
				 @c_jobnm ,
				 @c_operator ,
				 @c_ip 
			)	
		end	 
		if @c_jobnm='return'
		begin
			if not exists (select * from t_role where c_sys=@c_sys and c_jobnumber=@c_send and c_role='301') and @c_return=1	
			begin 			
				select top 1 @c_deptid=c_deptid2 from t_orgsigned where c_sys=3 and c_sid=@c_sid 
					and c_orgid2=@c_orgid order by c_no desc
				
				--部门长
				if exists (select * from t_post where c_no in (select c_postid from t_postset where c_jobnumber=@c_operator) 
					and c_deptid=@c_deptid and c_ishead='0')
				begin				
					update t_sprocess set c_flag='1' 
					where c_sys=@c_sys and c_sid=@c_sid and c_flag='0'
					--分管总
					select top 1 @c_jobnumber1=c_jobnumber from t_roleset where c_deptid=@c_deptid
					insert  t_sprocess  	
					(	    
						 c_sys  ,		--1 文件管理 ；3 签报管理 
						 c_sid  ,		--签报id   	
						 c_return  ,		--1:同意 2:不同意 	 
						 c_note  ,		--备注   
						 c_send  ,
						 c_receive  ,	
						 c_jobnm ,
						 c_datime,
						 c_operator ,
						 c_ip 
					) 
					values
					( 
						 @c_sys  ,		--1 文件管理 ；3 签报管理 
						 @c_sid  ,		--签报id   	
						 @c_return ,		--1:同意 2:不同意 	 
						 @c_note  ,		--备注   
						 @c_send  ,
						 @c_jobnumber1  ,	
						 @c_jobnm ,
						 @c_datime,
						 @c_operator ,
						 @c_ip 
					)
					--费用签报
					if exists (select * from t_signed where c_no =@c_sid and @c_type=32 )
					begin
						--财务
						select @c_jobnumber2=c_jobnumber from t_role where c_role=302
						insert  t_sprocess  	
						(	    
							 c_sys  ,		--1 文件管理 ；3 签报管理 
							 c_sid  ,		--签报id   	
							 c_return  ,		--1:同意 2:不同意 	 
							 c_note  ,		--备注   
							 c_send  ,
							 c_receive  ,	
							 c_jobnm ,
							 c_datime,
							 c_operator ,
							 c_ip 
						) 
						values
						( 
							 @c_sys  ,		--1 文件管理 ；3 签报管理 
							 @c_sid  ,		--签报id   	
							 @c_return ,		--1:同意 2:不同意 	 
							 @c_note  ,		--备注   
							 @c_send  ,
							 @c_jobnumber2  ,	
							 @c_jobnm ,
							 @c_datime ,
							 @c_operator ,
							 @c_ip 
						)	
					end					
					select @c_cost=c_cost,@c_type=c_type from t_signed where c_no =@c_sid				 
					if exists (select * from t_grant where c_jobnumber=@c_send and c_money >= @c_cost) and @c_type=32	
					begin
						update t_signed set c_jobnm='zz' where c_no =@c_sid
						exec p_sprompt @c_sys , @c_sid 		
						return 0
					end 
					return 0				
				end				
				--分管总,财务负责人
				if exists (select * from t_roleset where c_deptid=@c_deptid and c_jobnumber=@c_operator)
					or exists (select * from t_role where c_role=302 and c_jobnumber=@c_operator)					
				begin 					
					update t_sprocess set c_flag='1' 
						where c_sys=@c_sys and c_sid=@c_sid and c_receive=@c_operator and c_flag='0'
					insert  t_sprocess  	
					(	    
						 c_sys  ,		--1 文件管理 ；3 签报管理 
						 c_sid  ,		--签报id   	
						 c_return  ,		--1:同意 2:不同意 	 
						 c_note  ,		--备注   
						 c_send  ,
						 c_receive  ,	
						 c_flag ,
						 c_jobnm ,
						 c_operator ,
						 c_ip 
					) 
					values
					( 
						 @c_sys  ,		--1 文件管理 ；3 签报管理 
						 @c_sid  ,		--签报id   	
						 @c_return ,		--1:同意 2:不同意 	 
						 @c_note  ,		--备注   
						 @c_send  ,
						 null  ,	
						 '1' ,
						 @c_jobnm ,
						 @c_operator ,
						 @c_ip 
					)	
					if not exists(select * from t_sprocess where c_sys=@c_sys and c_sid=@c_sid and c_flag='0') 						
					begin
						if not exists(select * from t_sprocess where c_sys=@c_sys and c_sid=@c_sid and c_return=2)
						begin
							select @c_jobnumber_temp=c_jobnumber from t_organization where c_no=@c_orgid 
							insert  t_sprocess  	
							(	    
								 c_sys  ,		--1 文件管理 ；3 签报管理 
								 c_sid  ,		--签报id   	
								 c_return  ,		--1:同意 2:不同意 	 
								 c_note  ,		--备注   
								 c_send  ,
								 c_receive  ,	
								 c_jobnm ,
								 c_operator ,
								 c_ip 
							) 
							values
							( 
								 @c_sys  ,		--1 文件管理 ；3 签报管理 
								 @c_sid  ,		--签报id   	
								 @c_return ,		--1:同意 2:不同意 	 
								 @c_note  ,		--备注   
								 @c_send  ,
								 @c_jobnumber_temp  ,	
								 @c_jobnm ,
								 @c_operator ,
								 @c_ip 
							)
						end
						else
						begin
							update t_signed set c_jobnm='zz' where c_no =@c_sid
							exec p_sprompt @c_sys , @c_sid 		
							return 0
						end						
					end 
					select @c_cost=c_cost,@c_type=c_type from t_signed where c_no =@c_sid				 
					if exists (select * from t_grant where c_jobnumber=@c_send and c_money >= @c_cost) and @c_type=32	
					begin
						update t_signed set c_jobnm='zz' where c_no =@c_sid
						exec p_sprompt @c_sys , @c_sid 		
						return 0
					end 
					return 0	
				end						
				--机构负责人
				if exists (select * from t_organization where c_no=@c_orgid and c_jobnumber=@c_send)
				begin 				
					select top 1 @c_to=c_to from t_orgsigned where c_sid=@c_sid and c_orgid=@c_orgid order by c_no desc 
					if @c_to = 1
					begin   --结束
						update t_sprocess set c_flag='1' 
							where c_sys=@c_sys and c_sid=@c_sid and c_flag='0'
						insert  t_sprocess  	
						(	    
							 c_sys  ,		--1 文件管理 ；3 签报管理 
							 c_sid  ,		--签报id   	
							 c_return  ,		--1:同意 2:不同意 	 
							 c_note  ,		--备注   
							 c_send  ,
							 c_receive  ,	
							 c_jobnm ,
							 c_operator ,
							 c_ip 
						) 
						values
						( 
							 @c_sys  ,		--1 文件管理 ；3 签报管理 
							 @c_sid  ,		--签报id   	
							 @c_return ,		--1:同意 2:不同意 	 
							 @c_note  ,		--备注   
							 @c_send  ,
							 @c_receive  ,	
							 @c_jobnm ,
							 @c_operator ,
							 @c_ip 
						)
						update t_signed set c_jobnm='zz' where c_no =@c_sid
						exec p_sprompt @c_sys , @c_sid 	
						return 0
					end
					if @c_to = 2
					begin   --发送审批人
						select @c_receive=c_jobnumber from t_role where c_sys=@c_sys and c_role='301'
					end
					if @c_to = 3
					begin   --上级机构接收人
						select top 1 @c_receive=c_jobnumber2 from t_orgsigned where c_sid=@c_sid and c_orgid=@c_orgid order by c_no desc 
					end					
				end
				else
				begin
					if not exists (select * from t_staff where c_orgid=@c_orgid and c_name=@c_opname and c_quitdate is null  )
					begin
						raiserror ('姓名：%s 不存在 ！', 16 , 1 ,@c_opname )
						return @@error
					end
					select @c_receive=c_jobnumber from t_staff where c_orgid=@c_orgid and c_name=@c_opname and c_quitdate is null 
				end				
				update t_sprocess set c_flag='1' 
					where c_sys=@c_sys and c_sid=@c_sid and c_flag='0'
				insert  t_sprocess  	
				(	    
					 c_sys  ,		--1 文件管理 ；3 签报管理 
					 c_sid  ,		--签报id   	
					 c_return  ,		--1:同意 2:不同意 	 
					 c_note  ,		--备注   
					 c_send  ,
					 c_receive  ,	
					 c_jobnm ,
					 c_operator ,
					 c_ip 
				) 
				values
				( 
					 @c_sys  ,		--1 文件管理 ；3 签报管理 
					 @c_sid  ,		--签报id   	
					 @c_return ,		--1:同意 2:不同意 	 
					 @c_note  ,		--备注   
					 @c_send  ,
					 @c_receive  ,	
					 @c_jobnm ,
					 @c_operator ,
					 @c_ip 
				)
				select @c_cost=c_cost,@c_type=c_type from t_signed where c_no =@c_sid				 
				if exists (select * from t_grant where c_jobnumber=@c_send and c_money >= @c_cost) and @c_type=32	
				begin
					update t_signed set c_jobnm='zz' where c_no =@c_sid
					exec p_sprompt @c_sys , @c_sid 		
					return 0
				end 
			end
			else
			begin
				update t_sprocess set c_flag='1' 
					where c_sys=@c_sys and c_sid=@c_sid and c_receive=@c_operator and c_flag='0'					
				if not exists(select * from t_sprocess where c_sys=@c_sys and c_sid=@c_sid and c_flag='0')
				begin
					update t_signed set c_jobnm='zz' where c_no =@c_sid
					exec p_sprompt @c_sys , @c_sid 		
				end 
				insert  t_sprocess  	
				(	    
					 c_sys  ,		--1 文件管理 ；3 签报管理 
					 c_sid  ,		--签报id   	
					 c_return  ,		--1:同意 2:不同意 	 
					 c_note  ,		--备注   
					 c_send  ,
					 c_receive  ,	
					 c_flag ,
					 c_jobnm ,
					 c_operator ,
					 c_ip 
				) 
				values
				( 
					 @c_sys  ,		--1 文件管理 ；3 签报管理 
					 @c_sid  ,		--签报id   	
					 @c_return ,		--1:同意 2:不同意 	 
					 @c_note  ,		--备注   
					 @c_send  ,
					 @c_receive  ,	
					 '1' ,
					 @c_jobnm ,
					 @c_operator ,
					 @c_ip 
				)	 						
				return 0
			end 
		end		
	end	
return 0
go
--签报过程
if exists(select name from sysobjects where name='p_signed')
	drop procedure p_signed
go
create procedure p_signed 	    
	 @c_type int ,
	 @c_cost   decimal(15, 2) ,		  
	 @c_note varchar(2000) ,   	  
	 @c_fileid  int ,		
	 @c_jobnm   char  (10) ,
	 @c_operator char (10) ,	
	 @c_ip   char(25)  
as 	
declare @c_no	 int,
	@c_date  char(8) 
	set @c_date=convert(char(8),getdate(),112)	  
	if @c_jobnm='add'
	begin
		set @c_no=1
		if exists(select * from t_signed)
		begin
			select @c_no=max(c_no)+1 from t_signed
		end
		insert  t_signed  	
		(	   
			 c_no ,
			 c_type ,
			 c_apply ,		   
			 c_cost ,	   
			 c_fileid ,	
			 c_note ,	 	
			 c_jobnm ,
			 c_operator ,
			 c_ip 
		) 
		values
		( 
			 @c_no ,
			 @c_type ,
			 @c_date ,		   
			 @c_cost ,	   
			 @c_fileid ,		
			 @c_note , 	
			 @c_jobnm ,
			 @c_operator ,
			 @c_ip 
		)	
		select @c_no c_no
	end	 
return 0
go
--机构流转过程
if exists(select name from sysobjects where name='p_orgsigned')
	drop procedure p_orgsigned
go
create procedure p_orgsigned 	    
	@c_no int  , 
	@c_sys int ,		--1 文件管理 ；3 签报管理 
	@c_sid int ,		--签报id   	
	@c_orgid int ,		--始机构id  	 
	@c_to int ,		--去向 1 本机构结束 2 本机构结束后发送给审批人 3 其他机构	
	@c_orgid2 int ,			--接收机构id  
	@c_deptid2 int ,		--接收部门
	@c_jobnumber2 char(10) ,	--接收人 
	@c_jobnm char (10) ,
	@c_operator char(10) ,
	@c_ip char (25)
as 	
declare @c_date   char(8) 
	set @c_date=convert(char(8),getdate(),112)	  
	if @c_jobnm='add'
	begin
		update  t_orgsigned set c_flag='1'
			where c_sys=@c_sys and c_sid=@c_sid
		insert  t_orgsigned  	
		(	   
			c_sys ,		--1 文件管理 ；3 签报管理 
			c_sid ,		--签报id   	
			c_orgid ,		--始机构id  	 
			c_to ,			--去向 1 本机构结束 2 本机构结束后发送给审批人 3 其他机构	
			c_orgid2 ,		--接收机构id  
			c_deptid2 ,		--接收部门
			c_jobnumber2 ,		--接收人
			c_jobnm ,
			c_operator ,
			c_ip 
		) 
		values
		( 
			@c_sys ,		--1 文件管理 ；3 签报管理 
			@c_sid ,		--签报id   	
			@c_orgid ,		--始机构id  	 
			@c_to ,			--去向 1 本机构结束 2 本机构结束后发送给审批人 3 其他机构	
			@c_orgid2 ,		--接收机构id  
			@c_deptid2 ,		--接收部门
			@c_jobnumber2 ,		--接收人
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)	 
	end	
	if @c_jobnm='update'
	begin
		update t_orgsigned set 
			c_to=@c_to ,			--去向 1 本机构结束 2 本机构结束后发送给审批人 3 其他机构	
			c_orgid2=@c_orgid2 ,		--接收机构id  
			c_deptid2=@c_deptid2 ,		--接收部门
			c_jobnumber2=@c_jobnumber2 ,		--接收人
			c_jobnm=@c_jobnm ,
			c_operator=@c_operator ,
			c_ip=@c_ip   
		where c_no=@c_no
	end 
return 0
go
--授权定义过程
if exists(select name from sysobjects where name='p_grant')
	drop procedure p_grant
go
create procedure p_grant
	 @c_no  int ,    	 
	 @c_sys int ,	
	 @c_jobnumber char(10) ,
	 @c_money   decimal(10, 2),		
	 @c_jobnm   char(10) ,
	 @c_operator char(10) ,	
	 @c_ip   char(25) 
as 	  
	if @c_jobnm='add'
	begin
		insert  t_grant 	
		(	   
			 c_sys,
			 c_jobnumber ,
			 c_money ,		
			 c_jobnm ,
			 c_operator ,
			 c_ip  
		) 
		values
		( 
			 @c_sys,
			 @c_jobnumber ,
			 @c_money ,		
			 @c_jobnm ,
			 @c_operator ,
			 @c_ip  
		)	
	end	
	if @c_jobnm='update'
	begin
		update t_grant set c_money=@c_money where c_no=@c_no	
	end	
return 0
go
