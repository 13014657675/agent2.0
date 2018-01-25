--��Ʒ����
if exists(select name from sysobjects where name='p_goodstype')
	drop procedure p_goodstype
go
create procedure p_goodstype
	@c_no int , 
	@c_libraryid int ,		--�� 1 �ʲ����� 2 �칫��Ʒ 3 ��ͨ��֤
	@c_name char (50),  		--������ 	 
	@c_jobnm char (10),
	@c_operator char(10) ,	
	@c_ip char (25) 
as 	  
	if @c_jobnm='add'
	begin 
		if exists(select * from t_goodstype where c_libraryid=@c_libraryid and c_name=@c_name)
		begin
			raiserror ('������ %s �Ѿ����� ��', 16,1 ,@c_name )
			return @@error
		end			
		insert  t_goodstype   	
		(	 
			c_libraryid,	--��
			c_name,  	--������ 	 
			c_jobnm,
			c_operator,
			c_ip 
		) 
		values
		( 
			@c_libraryid,	--��
			@c_name,  	--������  
			@c_jobnm,
			@c_operator,
			@c_ip 
		)	
	end	
	if @c_jobnm='update'
	begin
		update t_goodstype
			set c_name=@c_name,  	--������ 
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
--��Ʒ����
if exists(select name from sysobjects where name='p_goods')
	drop procedure p_goods
go
create procedure p_goods
	@c_no int ,
	@c_orgid int ,			--����id 	
	@c_libraryid int ,		--�� 1 �ʲ����� 2 �칫��Ʒ 3 ��ͨ��֤
	@c_goodstypeid int ,		--������id
	@c_name char (50),  		--��Ʒ��	  
	@c_factory char (100),  	--����
	@c_address char (150),  	--��ַ	 
	@c_jobnm char (10),
	@c_operator char(10) ,	
	@c_ip char (25) 
as 	  
	if @c_jobnm='add'
	begin 
		if not exists(select * from t_goodstype where c_no=@c_goodstypeid)
		begin
			raiserror ('��������%s ������ ��', 16,1 )
			return @@error
		end
		if exists(select * from t_goods where c_orgid=@c_orgid and c_libraryid=@c_libraryid and c_name=@c_name)
		begin
			raiserror ('��Ʒ����%s �Ѿ����� ��', 16,1 ,@c_name )
			return @@error
		end			
		insert  t_goods   	
		(	
			c_orgid,	--����
			c_libraryid,	--��
			c_goodstypeid,	--������
			c_name,  	--��Ʒ��	 
			c_factory,  	--����
			c_address,  	--��ַ	
			c_jobnm,
			c_operator,
			c_ip 
		) 
		values
		(
			@c_orgid,	--����
			@c_libraryid,	--��
			@c_goodstypeid,	--������
			@c_name,  	--��Ʒ�� 
			@c_factory,  	--����
			@c_address,  	--��ַ	
			@c_jobnm,
			@c_operator,
			@c_ip 
		)	
	end	
	if @c_jobnm='update'
	begin
		update t_goods
			set c_goodstypeid=@c_goodstypeid,	--������id 
			c_name=@c_name,  	--��Ʒ��	 
			c_factory=@c_factory,  	--����
			c_address=@c_address,  	--��ַ	
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
--���Ź���
if exists(select name from sysobjects where name='p_goodsrecord')
	drop procedure p_goodsrecord
go
create  procedure p_goodsrecord
	@c_orgid int ,			--ִ�л���	
	@c_libraryid int ,		--1 �ʲ����� 2 �칫��Ʒ 3 ��ͨ��֤
	@c_recordid bigint ,		--�ⵥ�ţ� 4+8 	 
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
		c_orgid  ,		--ִ�л���	
		c_libraryid ,
		c_recordid ,		--�ⵥ�ţ� 4+8				 
		c_jobnm ,		 
		c_operator ,
		c_datime,
		c_ip 
	)
	values
	(
		@c_orgid  ,		--ִ�л���	
		@c_libraryid ,
		@c_recordid ,		--�ⵥ�ţ� 4+8 		 
		@c_jobnm ,		 
		@c_operator ,
		@c_datime,
		@c_ip 
	)
	if @@error <> 0
	begin
		rollback transaction tr_goodsrecord
	  	raiserror ('��Ʒ��¼���̱���', 16, 1)
	  	return @@error
	end 	 		 
	commit transaction tr_goodsrecord	 
return 0
go
--��Ʒ������¼����
if exists(select name from sysobjects where name='p_goodsbatch')
	drop procedure p_goodsbatch
go
create  procedure p_goodsbatch
	@c_orgid int ,			--ִ�л���	 
	@c_libraryid int ,		--1 �ʲ����� 2 �칫��Ʒ 3 ��ͨ��֤
	@c_recordid bigint ,		--�ⵥ�ţ� 4+8 
	@c_goodsid int , 		--��Ʒ
	@c_number int ,			--����		
	@c_p char(100) ,		--ǩ����
	@c_o int,
	@c_jobnm char (10)  ,
	@c_operator char(10) ,		
	@c_ip char (25) 
as
declare @c_datime datetime , 
	@count    int,    	       	--ѭ������
	@errors	  int			--������  
	set @c_datime=getdate()	 
	begin transaction tr_goodsbatch 
	if @c_number = 0
	begin
		raiserror (' ��������Ϊ 0 ', 16, 1 )
	  	return @@error
	end		
	insert t_goodsbatch
	(
		c_orgid  ,		--ִ�л���	
		c_libraryid , 
		c_recordid ,		--�ⵥ�ţ� 4+8		 
		c_goodsid , 
		c_number ,		--����	
		c_p,			--ǩ����
		c_o,
		c_jobnm ,		 
		c_operator ,
		c_datime,
		c_ip 
	)
	values
	(
		@c_orgid  ,		--ִ�л���	 
		@c_libraryid , 
		@c_recordid ,		--�ⵥ�ţ� 4+8 
		@c_goodsid , 
		@c_number ,		--����	
		@c_p,			--ǩ����
		@c_o,
		@c_jobnm ,		 
		@c_operator ,
		@c_datime,
		@c_ip 
	)
	if @@error <> 0
	begin
		rollback transaction tr_goodsbatch
	  	raiserror ('��Ʒ��¼���̱���', 16, 1)
	  	return @@error
	end 	 	
	--��ͨ��֤������ʣ����Ϊ30��
	if @c_libraryid=3 and @c_jobnm='ck'
	begin
		select @count=count(*)-@c_number from t_goodsstate where c_orgid=@c_orgid and c_goodsid=@c_goodsid and c_jobnm in ('rk2','dj','hk') and c_flag='0'
		if @count < 30
		begin
			rollback transaction tr_goodsbatch
			raiserror ('���������󣡿��Ӧ����ʣ��30����ͨ��֤��', 16, 1)
	  		return @@error
		end
	end
	--������Ʒ�����䶯���� 
	exec @errors=p_goodsstate
		@c_orgid ,
		@c_libraryid , 
		@c_recordid,
		@c_goodsid ,	 
		@c_number  ,
		@c_p,			--ǩ����
		@c_o,
		@c_jobnm ,		 
		@c_operator , 
		@c_ip 
	if @errors <> 0
	begin
	  	rollback transaction tr_goodsbatch
	  	raiserror ('��Ʒ��¼���̱���', 16, 1)
	  	return @@error
	end  	
	commit transaction tr_goodsbatch	 
return 0
go
--��Ʒ�����䶯����
if exists(select name from sysobjects where name='p_goodsstate')
	drop procedure p_goodsstate
go
create procedure p_goodsstate
	@c_orgid int,
	@c_libraryid int, 
	@c_recordid bigint,
	@c_goodsid int,		  
	@c_number  int,
	@c_p char(100) ,		--ǩ����
	@c_o int,	
	@c_jobnm char(10),		 
	@c_operator char(10) ,	
	@c_ip varchar(25)
as
declare @c_code char(14), 		--��Ʒ��ˮ�� 
	@c_code_temp char(14), 		--��Ʒ��ˮ�� 
	@c_no   int,    	       	--��ʱ����
	@count  int,    	       	--ѭ������
	@i      int,    	       	--ѭ������
	@n      int  	         	--ѭ������ 		 
	if @c_jobnm='rk'		--���
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
				c_orgid ,		--ִ�л���
				c_goodsid ,	 
				c_code , 		--��Ʒ��ˮ��
				c_p,			--ǩ����
				c_o,
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--ִ�л���
				@c_goodsid ,	 
				@c_code , 		--��Ʒ��ˮ��
				@c_p,			--ǩ����
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
	if @c_jobnm='rk-del'		--���ɾ��
	begin   		
		delete t_goodsstate where c_orgid=@c_orgid and c_recordid=@c_recordid
		return 0
	end		
	if @c_jobnm='ck'		--����
	begin   	
		select @count=count(*) from t_goodsstate where c_orgid=@c_orgid and c_goodsid=@c_goodsid and c_jobnm in ('rk2','dj','hk') and c_flag='0'
		if @c_number > @count 
		begin
			raiserror ('����������', 16, 1)
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
				raiserror ('���û�������Ϊ��������', 16, 1)
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
				c_orgid ,		--ִ�л���
				c_goodsid ,	 
				c_code , 		--��Ʒ��ˮ��
				c_p,			--ǩ����
				c_o,
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--ִ�л���
				@c_goodsid ,	 
				@c_code , 		--��Ʒ��ˮ��
				@c_p,			--ǩ����
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
	if @c_jobnm='rk2'		--�������
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
				c_orgid ,		--ִ�л���
				c_goodsid ,	 
				c_code , 		--��Ʒ��ˮ��
				c_p,			--ǩ����
				c_o,
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--ִ�л���
				@c_goodsid ,	 
				@c_code , 		--��Ʒ��ˮ��
				@c_p,			--ǩ����
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
	if @c_jobnm='hk'		--�ؿ�
	begin   	
		select @count=count(*) from t_goodsstate where c_orgid=@c_orgid and c_goodsid=@c_goodsid and c_p=@c_p and c_jobnm in ('ck') and c_flag='0'
		if @c_number > @count 
		begin
			raiserror ('�ؿ�������', 16, 1)
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
				c_orgid ,		--ִ�л���
				c_goodsid ,	 
				c_code , 		--��Ʒ��ˮ��  
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--ִ�л���
				@c_goodsid ,	 
				@c_code , 		--��Ʒ��ˮ��  
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
	if @c_jobnm='bf'		--����
	begin   	
		select @count=count(*) from t_goodsstate where c_orgid=@c_orgid and c_goodsid=@c_goodsid and c_jobnm in ('rk2','dj','hk') and c_flag='0'
		if @c_number > @count 
		begin
			raiserror ('����������', 16, 1)
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
				c_orgid ,		--ִ�л���
				c_goodsid ,	 
				c_code , 		--��Ʒ��ˮ�� 
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--ִ�л���
				@c_goodsid ,	 
				@c_code , 		--��Ʒ��ˮ�� 
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
--��Ʒ����䶯����
if exists(select name from sysobjects where name='p_goodssingle')
	drop procedure p_goodssingle
go
create procedure p_goodssingle
	@c_orgid int,			--����id
	@c_libraryid int, 
	@c_recordid bigint,
	@c_goodsid int,
	@c_code char(14), 		--��Ʒ��ˮ��    
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
			raiserror ('���û�������Ϊ��������', 16, 1)  
			rollback transaction tr_goodssingle 
	  		return @@error
		end
		insert t_goodsstate
		(
			c_recordid,
			c_orgid ,		--ִ�л���
			c_libraryid ,
			c_goodsid ,	 
			c_code , 		--��Ʒ��ˮ��
			c_p,			--ǩ����
			c_o,
			c_jobnm ,		 
			c_operator ,
			c_ip 
		)
		values
		(
			@c_recordid,
			@c_orgid ,		--ִ�л���
			@c_libraryid ,
			@c_goodsid ,	 
			@c_code , 		--��Ʒ��ˮ��
			@c_p,			--ǩ����
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
			c_orgid ,		--ִ�л���
			c_libraryid ,
			c_goodsid ,	 
			c_code , 		--��Ʒ��ˮ�� 
			c_jobnm ,		 
			c_operator ,
			c_ip 
		)
		values
		(
			@c_recordid,
			@c_orgid ,		--ִ�л���
			@c_libraryid ,
			@c_goodsid ,	 
			@c_code , 		--��Ʒ��ˮ�� 
			@c_jobnm ,		 
			@c_operator ,
			@c_ip 
		)							
	end 	 
	commit transaction tr_goodssingle		
return 0
go
--��Ʒ���۹���
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
	@c_code char(14), 		--��Ʒ��ˮ��  
	@c_no   int,    	       	--��ʱ���� 
	@error  int	    	       	--ѭ������ 
	set @c_datime=getdate()	 	 
	if @c_jobnm='dj'		--����
	begin   	 
		begin transaction tr_goodsprice_dj   	 
		insert t_goodsbatch
		(
			c_orgid  ,		--ִ�л���	
			c_libraryid , 
			c_recordid ,		--�ⵥ�ţ� 4+8		 
			c_goodsid , 
			c_number ,		--����	 
			c_inprice ,
			c_outprice ,
			c_jobnm ,		 
			c_operator ,
			c_datime,
			c_ip 
		)
		values
		(
			@c_orgid  ,		--ִ�л���	 
			@c_libraryid , 
			@c_recordid ,		--�ⵥ�ţ� 4+8 
			@c_goodsid , 
			@c_number ,		--����	 			
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
		  	raiserror ('��Ʒ���۹��̱���', 16, 1)
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
				c_orgid ,		--ִ�л���
				c_goodsid ,	 
				c_code , 		--��Ʒ��ˮ��
				c_jobnm ,		 
				c_operator ,
				c_ip 
			)
			values
			(
				@c_recordid,
				@c_libraryid,
				@c_orgid ,		--ִ�л���
				@c_goodsid ,	 
				@c_code , 		--��Ʒ��ˮ��
				@c_jobnm ,		 
				@c_operator ,
				@c_ip 
			)	
			update t_goodsprice set c_flag='1' where c_code=@c_code
			insert t_goodsprice
			(
				c_code, 	--��Ʒ��ˮ��
				c_inprice,	--���۸�
				c_outprice,	--����۸�	 
				c_jobnm,	--						 
				c_operator,
				c_ip 
			)
			values
			(
				@c_code, 	--��Ʒ��ˮ��
				@c_inprice,	--���۸�
				@c_outprice,	--����۸�	 
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