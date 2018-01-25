--寿险机构业绩表  
if exists(select name from sysobjects where name='p_2001')
           drop procedure p_2001
go
create procedure p_2001
	@c_time		bigint,		
	@c_orgid	int,	 	--机构id
	@c_system	int,		--政策id 1 直营 2 渠道
	@c_year		int, 		--年
	@c_ksrq		char(8), 	--投保开始日期
	@c_jsrq		char(8) 	--投保结束日期
as	
declare	@c_deptid	int,
	@c_code		int,		--报表代码
	@c_oname	char(50),	--机构名称 
	@c_orgtypeid	int,		--机构类型id
	@c_tname	char(50),	--机构类型名称 
	@c_path		varchar(15),	
	@c_order	int,	
	@c_sname	char(30),	--政策名称
	@c_row		int,		--行
	@c_col		int,		--列 
	@c_num		int,		-- 
	@c_bxf		decimal(15,2), 	--   	 
	@c_bxfbz	decimal(15,2), 	--   	
	@c_yksrq	char(8), 	--年投保开始日期
	@c_yjsrq	char(8), 	--年投保结束日期	
	@c_no2		int,
	@c_num2		int,
	@c_name2	char(50),	--机构名称 
	@c_no3		int,
	@c_name3	char(50)	--机构名称  
	set @c_code=2001	
	--清除数据
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0'
	select @c_yksrq=str(@c_year-1,4)+'1226',@c_yjsrq=str(@c_year,4)+'1225'
	--标题
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'时间段','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_ksrq+'------'+@c_jsrq,'c',7) 	
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'市','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'县','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'当月（预收）','c',3)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'当年（实收）','c',3) 
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'件数','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'规模保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'标准保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'件数','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'规模保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'标准保费','n',0) 
	select @c_col=@c_col+1	
	--正文		
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_oname,'c',2) 
	select @c_num=0,@c_bxf=0,@c_bxfbz=0
	select @c_num=count(distinct str(c_companyid)+c_tbd) from v_sxbdxx where c_orgid_sq=@c_orgid 
		and c_tbrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
	select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx where c_orgid_sq=@c_orgid 
		and c_tbrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0) 
	
	select @c_num=0,@c_bxf=0,@c_bxfbz=0
	select @c_num=count(distinct str(a.c_companyid)+a.c_tbd) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq=@c_orgid 
		and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_system_sq=@c_system and a.c_jobnm ='0'
		and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
	select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq=@c_orgid 
		and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_system_sq=@c_system and a.c_jobnm ='0'
		and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0) 
	----------------------
	set @c_deptid=0
	select @c_deptid=c_no from t_dept where c_orgid=@c_orgid and c_system=@c_system
	declare c_cursor_org2 cursor for 	
	select  c_no,c_name from t_organization where c_parent=@c_orgid and c_deptid=@c_deptid  and c_flag='0'
	open	c_cursor_org2
	fetch	next from c_cursor_org2 into @c_no2,@c_name2
	while	(@@fetch_status = 0)
	begin	
		select @c_num=0,@c_bxf=0,@c_bxfbz=0
		select @c_num2=count(*) from t_organization where c_parent=@c_no2  	
		select @c_row=@c_row+1,@c_col=1	  
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_name2,'r',@c_num2+1)
		--县
		declare c_cursor_org3 cursor for 	
		select  c_no,c_name from t_organization where c_parent=@c_no2 and c_flag='0'
		open	c_cursor_org3
		fetch	next from c_cursor_org3 into @c_no3,@c_name3
		while	(@@fetch_status = 0)
		begin	
			select @c_num=0,@c_bxf=0,@c_bxfbz=0 	
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_name3,'c',0)	 
			select @c_num=count(distinct str(c_companyid)+c_tbd) from v_sxbdxx where c_orgid_sq=@c_no3
				and c_tbrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
			select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx where c_orgid_sq=@c_no3
				and c_tbrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0) 
			
			select @c_num=0,@c_bxf=0,@c_bxfbz=0
			select @c_num=count(distinct str(a.c_companyid)+a.c_tbd) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq=@c_no3
				and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_system_sq=@c_system and a.c_jobnm ='0'
				and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
			select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq=@c_no3
				and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_system_sq=@c_system and a.c_jobnm ='0'
				and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0) 	  			
			
			select @c_row=@c_row+1,@c_col=1	  
			fetch	next from c_cursor_org3 into @c_no3,@c_name3
		end
		close c_cursor_org3
		deallocate c_cursor_org3 	
		
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'合计','n',0) 
		select @c_num=0,@c_bxf=0,@c_bxfbz=0
		select @c_num=count(distinct str(c_companyid)+c_tbd) from v_sxbdxx where c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' )
			and c_tbrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
		select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx where c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' )
			and c_tbrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0) 
		
		select @c_num=0,@c_bxf=0,@c_bxfbz=0
		select @c_num=count(distinct str(a.c_companyid)+a.c_tbd) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' )
			and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_system_sq=@c_system and a.c_jobnm ='0'
			and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
		select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' )
			and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_system_sq=@c_system and a.c_jobnm ='0'
			and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0) 
	
		fetch	next from c_cursor_org2 into @c_no2,@c_name2
	end
	close c_cursor_org2
	deallocate c_cursor_org2 
	
	select @c_row=@c_row+1,@c_col=1	   
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'总计','c',2)  
	select @c_num=0,@c_bxf=0,@c_bxfbz=0
	select @c_num=count(distinct str(c_companyid)+c_tbd) from v_sxbdxx where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and c_tbrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
	select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and c_tbrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0)
	
	select @c_num=0,@c_bxf=0,@c_bxfbz=0
	select @c_num=count(distinct str(a.c_companyid)+a.c_tbd) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_system_sq=@c_system and a.c_jobnm ='0'
		and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
	select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_system_sq=@c_system and a.c_jobnm ='0'
		and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0) 
	
return 0
go
--寿险供应商业绩表  
if exists(select name from sysobjects where name='p_2002')
           drop procedure p_2002
go
create procedure p_2002
	@c_time		bigint,		
	@c_orgid	int,	 	--机构id
	@c_year		int, 		--年
	@c_ksrq		char(8), 	--投保开始日期
	@c_jsrq		char(8) 	--投保结束日期
as	
declare	@c_code		int,		--报表代码
	@c_oname	char(50),	--机构名称 
	@c_orgtypeid	int,		--机构类型id
	@c_tname	char(50),	--机构类型名称 
	@c_path		varchar(15),	
	@c_order	int,
	@c_system	int,		--政策id 
	@c_sname	char(30),	--政策名称
	@c_row		int,		--行
	@c_col		int,		--列 
	@c_num		int,		-- 
	@c_bxf		decimal(15,2), 	--   	 
	@c_bxfbz	decimal(15,2), 	--   	
	@c_yksrq	char(8), 	--年投保开始日期
	@c_yjsrq	char(8), 	--年投保结束日期	
	@c_no2		int,
	@c_num2		int,
	@c_name2	char(50),	--机构名称 
	@c_no3		int,
	@c_name3	char(50)	--机构名称 
	
	set @c_code=2002	
	--清除数据
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0'
	select @c_yksrq=str(@c_year-1,4)+'1226',@c_yjsrq=str(@c_year,4)+'1225'
	--标题
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'时间段','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_ksrq+'------'+@c_jsrq,'c',6) 	
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'分类','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'当月（预收）','c',3)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'当年（实收）','c',3) 
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'件数','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'规模保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'标准保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'件数','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'规模保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'标准保费','n',0) 
	select @c_col=@c_col+1	
	--正文			
	declare c_cursor_org2 cursor for 	
	select c_no,c_name from t_company where c_type=3001 order by c_no
	open	c_cursor_org2
	fetch	next from c_cursor_org2 into @c_no2,@c_name2
	while	(@@fetch_status = 0)
	begin	
		select @c_num=0,@c_bxf=0,@c_bxfbz=0 	
		select @c_row=@c_row+1,@c_col=1	  
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_name2,'n',0)
		  
		select @c_num=0,@c_bxf=0,@c_bxfbz=0
		select @c_num=count(distinct str(c_companyid)+c_tbd) from v_sxbdxx where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
			and c_companyid=@c_no2 and c_tbrq between @c_ksrq and @c_jsrq and c_jobnm ='0'  
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
		select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
			and c_companyid=@c_no2 and c_tbrq between @c_ksrq and @c_jsrq and c_jobnm ='0'  
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0) 
		
		select @c_num=0,@c_bxf=0,@c_bxfbz=0
		select @c_num=count(distinct str(a.c_companyid)+a.c_tbd) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
			and a.c_companyid=@c_no2 and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_jobnm ='0'
			and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
		select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
			and a.c_companyid=@c_no2 and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_jobnm ='0'
			and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0)  
	
		fetch	next from c_cursor_org2 into @c_no2,@c_name2
	end
	close c_cursor_org2
	deallocate c_cursor_org2 
	
	select @c_num=0,@c_bxf=0,@c_bxfbz=0 	
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'合计','n',0)
	  
	select @c_num=0,@c_bxf=0,@c_bxfbz=0
	select @c_num=count(distinct str(c_companyid)+c_tbd) from v_sxbdxx where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and c_tbrq between @c_ksrq and @c_jsrq and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
	select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and c_tbrq between @c_ksrq and @c_jsrq and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0) 
	
	select @c_num=0,@c_bxf=0,@c_bxfbz=0
	select @c_num=count(distinct str(a.c_companyid)+a.c_tbd) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_jobnm ='0'
		and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
	select @c_bxf=sum(c_bxf),@c_bxfbz=sum(c_bxfbz) from v_sxbdxx a,t_sxbdzt b where a.c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and a.c_tbrq between @c_yksrq and @c_yjsrq and a.c_jobnm ='0'
		and a.c_companyid=b.c_companyid and a.c_tbd=b.c_tbd and b.c_type=1   
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxfbz,'n',0)  
	
return 0
go
--寿险续期收缴进度表  
if exists(select name from sysobjects where name='p_2003')
           drop procedure p_2003
go
create procedure p_2003
	@c_time		bigint,		
	@c_orgid	int,	 	--机构id 
	@c_system	int,		--政策id 1 直营 2 渠道
	@c_year		int, 		--年
	@c_month 	int  		--月 	
as	
declare @c_deptid	int,
	@c_code		int,		--报表代码
	@c_oname	char(50),	--机构名称 
	@c_orgtypeid	int,		--机构类型id
	@c_tname	char(50),	--机构类型名称 
	@c_path		varchar(15),	
	@c_order	int,	
	@c_row		int,		--行
	@c_col		int,		--列 
	@c_skrq char (8),		-- 收款日期
	@c_date char (8),		-- 
	@c_bdnd	int,			-- 保单年度
	@c_companyid int ,		-- 保险公司
	@c_bd char (30) ,		-- 保单
	@c_num2		int,
	@c_no2		int,
	@c_name2	char(50),	--   机构名称 
	@c_no3		int,
	@c_name3	char(50),	--   机构名称  
	@c_percent	varchar(30), 	--   百分比
	@c_bxf_ss	decimal(15,2), 	--   实收
	@c_bxf_ys	decimal(15,2) 	--   应收
	set @c_code=2003	
	--清除数据
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0' 
	--------------------------------------------------------------------------------------------------------------------------
	create table #t_xqjd
	(
		c_skrq char (8),		-- 收款日期
		c_bdnd int,			-- 保单年度
		c_orgid_sq int,			-- 机构		
		c_system_sq int ,		-- 政策体系  
		c_companyid int ,		-- 保险公司 
		c_bd char (30)  ,		-- 保单号			
		c_productid int , 		-- 产品险种id	  
		c_bxf decimal(15,2) , 		-- 保险费		
		c_cbrq char (8),		-- 承保日期
		c_jobnumber char(10) ,		-- 代理人工号
		c_outletsid int ,		-- 网点
		c_jobnm char (10)  		--		  
	)   
	insert #t_xqjd
		(
		c_skrq ,		-- 收款日期
		c_bdnd ,		-- 保单年度
		c_orgid_sq ,		-- 机构		
		c_system_sq ,		-- 政策体系  
		c_companyid ,		-- 保险公司 
		c_bd ,			-- 保单号			
		c_productid , 		-- 产品险种id			
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
		c.c_productid, 		
		c.c_bxf,
		a.c_date,
		b.c_jobnumber,
		b.c_outletsid,		
		rtrim(b.c_jobnm)  from t_sxbdzt a,t_sxbd b,t_sxtb c 
		where a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_companyid=c.c_companyid and a.c_bd=c.c_bd and a.c_type=1 
		and b.c_orgid_sq in (select c_no from t_organization where c_path like @c_path )
		and b.c_jobnm in ('0','5')  and month(a.c_date)=@c_month and year(a.c_date)< @c_year
		order by a.c_companyid,b.c_orgid_sq  
		
	declare c_temp1 cursor for	
	select c_skrq,c_bdnd,c_companyid,c_bd from #t_xqjd
	open	c_temp1
	fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
	while (@@fetch_status = 0)
	begin  	
		--前年度未缴费，后年度不显示
		if not exists(select * from t_sxtb_xq where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd-1) and @c_bdnd>2
		begin
			delete #t_xqjd where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
			fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
			continue
		end
		--当年度退保，当年度显示，后年度不显示
		set @c_date=null
		select @c_date=c_date from t_sxbdzt where c_companyid=@c_companyid and c_bd=@c_bd and c_type=5
		if @c_date is not null and DATEPART(year,@c_skrq)>DATEPART(year,@c_date)
		begin
			delete #t_xqjd where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
			fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
			continue
		end 
		fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
	end
	close c_temp1
	deallocate  c_temp1 	
	--------------------------------------------------------------------------------------------------------------------------		
	--标题
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'年','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_year,'n',0) 	
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'月','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_month,'n',0) 
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'市','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'县','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'不含退保','c',3)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'含退保','c',3)	 
	select @c_row=@c_row+1,@c_col=1	  	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'实收保费','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'应收保费','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'达成率','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'实收保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'应收保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'达成率','n',0)  
	--正文		
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_oname,'c',2)   
	select @c_bxf_ys=0,@c_bxf_ss=0
	select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq=@c_orgid and c_system_sq=@c_system and c_jobnm in ('0') 
	select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnm in ('0') 
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
	if @c_bxf_ys is null set @c_bxf_ys=0	
	if @c_bxf_ss is null set @c_bxf_ss=0
	if @c_bxf_ys=0 set @c_percent='--'
	else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
	print @c_percent
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)  
	
	select @c_bxf_ys=0,@c_bxf_ss=0
	select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq=@c_orgid and c_system_sq=@c_system and c_jobnm in ('0','5') 
	select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_jobnm in ('0','5') 
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
	if @c_bxf_ys is null set @c_bxf_ys=0	
	if @c_bxf_ss is null set @c_bxf_ss=0
	if @c_bxf_ys=0 set @c_percent='--'
	else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)  
	----------------------
	set @c_deptid=0
	select @c_deptid=c_no from t_dept where c_orgid=@c_orgid and c_system=@c_system
	declare c_cursor_org2 cursor for 	
	select  c_no,c_name from t_organization where c_parent=@c_orgid and c_deptid=@c_deptid  and c_flag='0'
	open	c_cursor_org2
	fetch	next from c_cursor_org2 into @c_no2,@c_name2
	while	(@@fetch_status = 0)
	begin	 
		select @c_num2=count(*) from t_organization where c_parent=@c_no2  	
		select @c_row=@c_row+1,@c_col=1	  
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_name2,'r',@c_num2+1)
		--县
		declare c_cursor_org3 cursor for 	
		select  c_no,c_name from t_organization where c_parent=@c_no2 and c_flag='0'
		open	c_cursor_org3
		fetch	next from c_cursor_org3 into @c_no3,@c_name3
		while	(@@fetch_status = 0)
		begin	 
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_name3,'c',0)	
			 
			select @c_bxf_ys=0,@c_bxf_ss=0
			select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq=@c_no3 and c_system_sq=@c_system and c_jobnm in ('0') 
			select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq=@c_no3 and b.c_system_sq=@c_system and b.c_jobnm in ('0') 
				and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
			if @c_bxf_ys is null set @c_bxf_ys=0	
			if @c_bxf_ss is null set @c_bxf_ss=0
			if @c_bxf_ys=0 set @c_percent='--'
			else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)  
			
			select @c_bxf_ys=0,@c_bxf_ss=0
			select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq=@c_no3 and c_system_sq=@c_system and c_jobnm in ('0','5') 
			select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq=@c_no3 and b.c_system_sq=@c_system and b.c_jobnm in ('0','5') 
				and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
			if @c_bxf_ys is null set @c_bxf_ys=0	
			if @c_bxf_ss is null set @c_bxf_ss=0
			if @c_bxf_ys=0 set @c_percent='--'
			else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)    			
			
			select @c_row=@c_row+1,@c_col=1	  
			fetch	next from c_cursor_org3 into @c_no3,@c_name3
		end
		close c_cursor_org3
		deallocate c_cursor_org3 	
		
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'合计','n',0) 
		
		select @c_bxf_ys=0,@c_bxf_ss=0
		select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' ) and c_system_sq=@c_system and c_jobnm in ('0') 
		select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' ) and b.c_system_sq=@c_system and b.c_jobnm in ('0') 
			and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
		if @c_bxf_ys is null set @c_bxf_ys=0	
		if @c_bxf_ss is null set @c_bxf_ss=0
		if @c_bxf_ys=0 set @c_percent='--'
		else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)  
		
		select @c_bxf_ys=0,@c_bxf_ss=0
		select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' ) and c_system_sq=@c_system and c_jobnm in ('0','5') 
		select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' ) and b.c_system_sq=@c_system and b.c_jobnm in ('0','5') 
			and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
		if @c_bxf_ys is null set @c_bxf_ys=0	
		if @c_bxf_ss is null set @c_bxf_ss=0
		if @c_bxf_ys=0 set @c_percent='--'
		else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)     
	
		fetch	next from c_cursor_org2 into @c_no2,@c_name2
	end
	close c_cursor_org2
	deallocate c_cursor_org2 
	
	select @c_row=@c_row+1,@c_col=1	   
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'总计','c',2)  
	 
	select @c_bxf_ys=0,@c_bxf_ss=0
	select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0') and c_system_sq=@c_system and c_jobnm in ('0') 
	select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0') and b.c_system_sq=@c_system and b.c_jobnm in ('0') 
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
	if @c_bxf_ys is null set @c_bxf_ys=0	
	if @c_bxf_ss is null set @c_bxf_ss=0
	if @c_bxf_ys=0 set @c_percent='--'
	else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)  
	
	select @c_bxf_ys=0,@c_bxf_ss=0
	select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0') and c_system_sq=@c_system and c_jobnm in ('0','5') 
	select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0') and b.c_system_sq=@c_system and b.c_jobnm in ('0','5')
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
	if @c_bxf_ys is null set @c_bxf_ys=0	
	if @c_bxf_ss is null set @c_bxf_ss=0
	if @c_bxf_ys=0 set @c_percent='--'
	else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)   
	 
return 0
go
--寿险续期收缴进度表  
if exists(select name from sysobjects where name='p_2004')
           drop procedure p_2004
go
create procedure p_2004
	@c_time		bigint,		
	@c_orgid	int,	 	--机构id 
	@c_system	int,		--政策id 1 直营 2 渠道
	@c_year		int, 		--年
	@c_month 	int  		--月 	
as	
declare @c_deptid	int,
	@c_code		int,		--报表代码
	@c_oname	char(50),	--机构名称 
	@c_orgtypeid	int,		--机构类型id
	@c_tname	char(50),	--机构类型名称 
	@c_path		varchar(15),	
	@c_order	int,	
	@c_row		int,		--行
	@c_col		int,		--列 
	@c_skrq char (8),		-- 收款日期
	@c_date char (8),		-- 
	@c_bdnd	int,			-- 保单年度
	@c_companyid int ,		-- 保险公司
	@c_bd char (30) ,		-- 保单
	@c_num2		int,
	@c_no2		int,
	@c_name2	char(50),	--   机构名称 
	@c_no3		int,
	@c_name3	char(50),	--   机构名称  
	@c_percent	varchar(30), 	--   百分比
	@c_bxf_ss	decimal(15,2), 	--   实收
	@c_bxf_ys	decimal(15,2) 	--   应收
	set @c_code=2004	
	--清除数据
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0' 
	--------------------------------------------------------------------------------------------------------------------------
	create table #t_xqjd
	(
		c_skrq char (8),		-- 收款日期
		c_bdnd int,			-- 保单年度
		c_orgid_sq int,			-- 机构		
		c_system_sq int ,		-- 政策体系  
		c_companyid int ,		-- 保险公司 
		c_bd char (30)  ,		-- 保单号			
		c_productid int , 		-- 产品险种id	  
		c_bxf decimal(15,2) , 		-- 保险费		
		c_cbrq char (8),		-- 承保日期
		c_jobnumber char(10) ,		-- 代理人工号
		c_outletsid int ,		-- 网点
		c_jobnm char (10)  		--		  
	)   
	insert #t_xqjd
		(
		c_skrq ,		-- 收款日期
		c_bdnd ,		-- 保单年度
		c_orgid_sq ,		-- 机构		
		c_system_sq ,		-- 政策体系  
		c_companyid ,		-- 保险公司 
		c_bd ,			-- 保单号			
		c_productid , 		-- 产品险种id			
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
		c.c_productid, 		
		c.c_bxf,
		a.c_date,
		b.c_jobnumber,
		b.c_outletsid,		
		rtrim(b.c_jobnm)  from t_sxbdzt a,t_sxbd b,t_sxtb c 
		where a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_companyid=c.c_companyid and a.c_bd=c.c_bd and a.c_type=1 
		and b.c_orgid_sq in (select c_no from t_organization where c_path like @c_path )
		and b.c_jobnm in ('0','5')  and month(a.c_date)=@c_month and year(a.c_date)< @c_year
		order by a.c_companyid,b.c_orgid_sq  
		
	declare c_temp1 cursor for	
	select c_skrq,c_bdnd,c_companyid,c_bd from #t_xqjd
	open	c_temp1
	fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
	while (@@fetch_status = 0)
	begin  	
		--前年度未缴费，后年度不显示
		if not exists(select * from t_sxtb_xq where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd-1) and @c_bdnd>2
		begin
			delete #t_xqjd where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
			fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
			continue
		end
		--当年度退保，当年度显示，后年度不显示
		set @c_date=null
		select @c_date=c_date from t_sxbdzt where c_companyid=@c_companyid and c_bd=@c_bd and c_type=5
		if @c_date is not null and DATEPART(year,@c_skrq)>DATEPART(year,@c_date)
		begin
			delete #t_xqjd where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
			fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
			continue
		end 
		fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
	end
	close c_temp1
	deallocate  c_temp1 	
	--------------------------------------------------------------------------------------------------------------------------		
	--标题
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'年','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_year,'n',0) 	
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'月','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_month,'n',0) 
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'市','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'县','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'13月','c',3)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'25月','c',3)	
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'37月','c',3)	 
	select @c_row=@c_row+1,@c_col=1	  	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'实收保费','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'应收保费','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'继续率','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'实收保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'应收保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'继续率','n',0)  
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'实收保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'应收保费','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'继续率','n',0) 
	--正文		
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_oname,'c',2)   
	select @c_bxf_ys=0,@c_bxf_ss=0
	select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq=@c_orgid and c_system_sq=@c_system and c_bdnd=2 
	select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_bdnd=2 
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
	if @c_bxf_ys is null set @c_bxf_ys=0	
	if @c_bxf_ss is null set @c_bxf_ss=0
	if @c_bxf_ys=0 set @c_percent='--'
	else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
	print @c_percent
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)  
	
	select @c_bxf_ys=0,@c_bxf_ss=0
	select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq=@c_orgid and c_system_sq=@c_system and c_bdnd=3 
	select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_bdnd=3 
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
	if @c_bxf_ys is null set @c_bxf_ys=0	
	if @c_bxf_ss is null set @c_bxf_ss=0
	if @c_bxf_ys=0 set @c_percent='--'
	else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)  
	
	select @c_bxf_ys=0,@c_bxf_ss=0
	select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq=@c_orgid and c_system_sq=@c_system and c_bdnd=4 
	select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq=@c_orgid and b.c_system_sq=@c_system and b.c_bdnd=4 
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
	if @c_bxf_ys is null set @c_bxf_ys=0	
	if @c_bxf_ss is null set @c_bxf_ss=0
	if @c_bxf_ys=0 set @c_percent='--'
	else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)
	----------------------
	set @c_deptid=0
	select @c_deptid=c_no from t_dept where c_orgid=@c_orgid and c_system=@c_system
	declare c_cursor_org2 cursor for 	
	select  c_no,c_name from t_organization where c_parent=@c_orgid and c_deptid=@c_deptid  and c_flag='0'
	open	c_cursor_org2
	fetch	next from c_cursor_org2 into @c_no2,@c_name2
	while	(@@fetch_status = 0)
	begin	 
		select @c_num2=count(*) from t_organization where c_parent=@c_no2  	
		select @c_row=@c_row+1,@c_col=1	  
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_name2,'r',@c_num2+1)
		--县
		declare c_cursor_org3 cursor for 	
		select  c_no,c_name from t_organization where c_parent=@c_no2 and c_flag='0'
		open	c_cursor_org3
		fetch	next from c_cursor_org3 into @c_no3,@c_name3
		while	(@@fetch_status = 0)
		begin	 
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_name3,'c',0)	
			 
			select @c_bxf_ys=0,@c_bxf_ss=0
			select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq=@c_no3 and c_system_sq=@c_system and c_bdnd=2 
			select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq=@c_no3 and b.c_system_sq=@c_system and b.c_bdnd=2 
				and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
			if @c_bxf_ys is null set @c_bxf_ys=0	
			if @c_bxf_ss is null set @c_bxf_ss=0
			if @c_bxf_ys=0 set @c_percent='--'
			else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)  
			
			select @c_bxf_ys=0,@c_bxf_ss=0
			select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq=@c_no3 and c_system_sq=@c_system and c_bdnd=3 
			select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq=@c_no3 and b.c_system_sq=@c_system and b.c_bdnd=3 
				and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
			if @c_bxf_ys is null set @c_bxf_ys=0	
			if @c_bxf_ss is null set @c_bxf_ss=0
			if @c_bxf_ys=0 set @c_percent='--'
			else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)    
			
			select @c_bxf_ys=0,@c_bxf_ss=0
			select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq=@c_no3 and c_system_sq=@c_system and c_bdnd=4 
			select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq=@c_no3 and b.c_system_sq=@c_system and b.c_bdnd=4
				and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
			if @c_bxf_ys is null set @c_bxf_ys=0	
			if @c_bxf_ss is null set @c_bxf_ss=0
			if @c_bxf_ys=0 set @c_percent='--'
			else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
			select @c_col=@c_col+1	
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)   			
			
			select @c_row=@c_row+1,@c_col=1	  
			fetch	next from c_cursor_org3 into @c_no3,@c_name3
		end
		close c_cursor_org3
		deallocate c_cursor_org3 	
		
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'合计','n',0) 
		
		select @c_bxf_ys=0,@c_bxf_ss=0
		select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' ) and c_system_sq=@c_system and c_bdnd=2
		select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' ) and b.c_system_sq=@c_system and b.c_bdnd=2
			and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
		if @c_bxf_ys is null set @c_bxf_ys=0	
		if @c_bxf_ss is null set @c_bxf_ss=0
		if @c_bxf_ys=0 set @c_percent='--'
		else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)  
		
		select @c_bxf_ys=0,@c_bxf_ss=0
		select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' ) and c_system_sq=@c_system and c_bdnd=3
		select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' ) and b.c_system_sq=@c_system and b.c_bdnd=3
			and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
		if @c_bxf_ys is null set @c_bxf_ys=0	
		if @c_bxf_ss is null set @c_bxf_ss=0
		if @c_bxf_ys=0 set @c_percent='--'
		else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)     
		
		select @c_bxf_ys=0,@c_bxf_ss=0
		select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' ) and c_system_sq=@c_system and c_bdnd=4
		select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' ) and b.c_system_sq=@c_system and b.c_bdnd=4
			and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
		if @c_bxf_ys is null set @c_bxf_ys=0	
		if @c_bxf_ss is null set @c_bxf_ss=0
		if @c_bxf_ys=0 set @c_percent='--'
		else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
		select @c_col=@c_col+1	
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)   
	
		fetch	next from c_cursor_org2 into @c_no2,@c_name2
	end
	close c_cursor_org2
	deallocate c_cursor_org2 
	
	select @c_row=@c_row+1,@c_col=1	   
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'总计','c',2)  
	 
	select @c_bxf_ys=0,@c_bxf_ss=0
	select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0') and c_system_sq=@c_system and c_bdnd=2
	select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0') and b.c_system_sq=@c_system and b.c_bdnd=2
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
	if @c_bxf_ys is null set @c_bxf_ys=0	
	if @c_bxf_ss is null set @c_bxf_ss=0
	if @c_bxf_ys=0 set @c_percent='--'
	else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)  
	
	select @c_bxf_ys=0,@c_bxf_ss=0
	select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0') and c_system_sq=@c_system and c_bdnd=3
	select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0') and b.c_system_sq=@c_system and b.c_bdnd=3
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
	if @c_bxf_ys is null set @c_bxf_ys=0	
	if @c_bxf_ss is null set @c_bxf_ss=0
	if @c_bxf_ys=0 set @c_percent='--'
	else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)   
	
	select @c_bxf_ys=0,@c_bxf_ss=0
	select @c_bxf_ys=sum(c_bxf) from #t_xqjd where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0') and c_system_sq=@c_system and c_bdnd=4
	select @c_bxf_ss=sum(a.c_bxf) from t_sxtb_xq a,#t_xqjd b where b.c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0') and b.c_system_sq=@c_system and b.c_bdnd=4
		and a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and a.c_productid=b.c_productid and a.c_bdnd=b.c_bdnd
	if @c_bxf_ys is null set @c_bxf_ys=0	
	if @c_bxf_ss is null set @c_bxf_ss=0
	if @c_bxf_ys=0 set @c_percent='--'
	else set @c_percent=str(@c_bxf_ss/@c_bxf_ys*100)+'%'
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ss,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf_ys,'n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_percent,'n',0)   
	 
return 0
go
--产险机构业绩表  
if exists(select name from sysobjects where name='p_3001')
           drop procedure p_3001
go
create procedure p_3001
	@c_time		bigint,		
	@c_orgid	int,	 	--机构id  
	@c_system	int,		--政策id 11 产险 
	@c_ksrq		char(8), 	--签单开始日期
	@c_jsrq		char(8) 	--签单结束日期
as	
declare	@c_deptid	int,
	@c_code		int,		--报表代码
	@c_oname	char(50),	--机构名称 
	@c_orgtypeid	int,		--机构类型id
	@c_tname	char(50),	--机构类型名称 
	@c_path		varchar(15),	
	@c_order	int,	
	@c_sname	char(30),	--政策名称
	@c_row		int,		--行
	@c_col		int,		--列 
	@c_num		int,		-- 
	@c_bxf		decimal(15,2), 	--   	 
	@c_bxfbz	decimal(15,2), 	--   	 
	@c_no2		int,
	@c_num2		int,
	@c_name2	char(50),	--机构名称 
	@c_no3		int,
	@c_name3	char(50)	--机构名称  
	set @c_code=3001	
	--清除数据
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0' 
	--标题
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'时间段','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_ksrq+'------'+@c_jsrq,'c',4) 	
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'市','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'县','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'当月','c',2) 
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'件数','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'保费','n',0)  
	--正文		
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_oname,'c',2) 
	select @c_num=0,@c_bxf=0
	select @c_num=count(distinct str(c_companyid)+c_bd) from t_cxbd where c_orgid_sq=@c_orgid 
		and c_lrrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
	select @c_bxf=sum(c_bxf) from t_cxbd where c_orgid_sq=@c_orgid 
		and c_lrrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0)  	
	----------------------
	set @c_deptid=0
	select @c_deptid=c_no from t_dept where c_orgid=@c_orgid and c_system=@c_system
	declare c_cursor_org2 cursor for 	
	select  c_no,c_name from t_organization where c_parent=@c_orgid and c_deptid=@c_deptid  and c_flag='0'
	open	c_cursor_org2
	fetch	next from c_cursor_org2 into @c_no2,@c_name2
	while	(@@fetch_status = 0)
	begin	
		select @c_num=0,@c_bxf=0
		select @c_num2=count(*) from t_organization where c_parent=@c_no2  	
		select @c_row=@c_row+1,@c_col=1	  
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_name2,'r',@c_num2+1)
		--县
		declare c_cursor_org3 cursor for 	
		select  c_no,c_name from t_organization where c_parent=@c_no2 and c_flag='0'
		open	c_cursor_org3
		fetch	next from c_cursor_org3 into @c_no3,@c_name3
		while	(@@fetch_status = 0)
		begin	
			select @c_num=0,@c_bxf=0
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_name3,'c',0)	 
			select @c_num=count(distinct str(c_companyid)+c_bd) from t_cxbd where c_orgid_sq=@c_no3
				and c_lrrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
			select @c_bxf=sum(c_bxf) from t_cxbd where c_orgid_sq=@c_no3
				and c_lrrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
			select @c_col=@c_col+1	 
			insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0)  
						
			select @c_row=@c_row+1,@c_col=1	  
			fetch	next from c_cursor_org3 into @c_no3,@c_name3
		end
		close c_cursor_org3
		deallocate c_cursor_org3 	
		
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'合计','n',0) 
		select @c_num=0,@c_bxf=0
		select @c_num=count(distinct str(c_companyid)+c_bd) from t_cxbd where c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' )
			and c_lrrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
		select @c_bxf=sum(c_bxf) from t_cxbd where c_orgid_sq in (select c_no from t_organization where c_parent=@c_no2 and c_flag='0' )
			and c_lrrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0)  	
	
		fetch	next from c_cursor_org2 into @c_no2,@c_name2
	end
	close c_cursor_org2
	deallocate c_cursor_org2 
	
	select @c_row=@c_row+1,@c_col=1	   
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'总计','c',2)  
	select @c_num=0,@c_bxf=0
	select @c_num=count(distinct str(c_companyid)+c_bd) from t_cxbd where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and c_lrrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
	select @c_bxf=sum(c_bxf) from t_cxbd where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and c_lrrq between @c_ksrq and @c_jsrq and c_system_sq=@c_system and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0)  
	
return 0
go
--产险供应商业绩表  
if exists(select name from sysobjects where name='p_3002')
           drop procedure p_3002
go
create procedure p_3002
	@c_time		bigint,		
	@c_orgid	int,	 	--机构id 
	@c_ksrq		char(8), 	--签单开始日期
	@c_jsrq		char(8) 	--签单结束日期
as	
declare	@c_code		int,		--报表代码
	@c_oname	char(50),	--机构名称 
	@c_orgtypeid	int,		--机构类型id
	@c_tname	char(50),	--机构类型名称 
	@c_path		varchar(15),	
	@c_order	int,
	@c_system	int,		--政策id 
	@c_sname	char(30),	--政策名称
	@c_row		int,		--行
	@c_col		int,		--列 
	@c_num		int,		-- 
	@c_bxf		decimal(15,2), 	--   	 
	@c_bxfbz	decimal(15,2), 	--   	 	
	@c_no2		int,
	@c_num2		int,
	@c_name2	char(50),	--机构名称 
	@c_no3		int,
	@c_name3	char(50)	--机构名称 
	
	set @c_code=2002	
	--清除数据
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0' 
	--标题
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'时间段','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_ksrq+'------'+@c_jsrq,'c',3) 	
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'分类','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'当月','c',2) 
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'件数','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'保费','n',0)  
	--正文			
	declare c_cursor_org2 cursor for 	
	select c_no,c_name from t_company where c_type=3002 order by c_no
	open	c_cursor_org2
	fetch	next from c_cursor_org2 into @c_no2,@c_name2
	while	(@@fetch_status = 0)
	begin	 
		select @c_row=@c_row+1,@c_col=1	  
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_name2,'n',0)
		  
		select @c_num=0,@c_bxf=0
		select @c_num=count(distinct str(c_companyid)+c_bd) from t_cxbd where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
			and c_companyid=@c_no2 and c_lrrq between @c_ksrq and @c_jsrq and c_jobnm ='0'  
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
		select @c_bxf=sum(c_bxf) from t_cxbd where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
			and c_companyid=@c_no2 and c_lrrq between @c_ksrq and @c_jsrq and c_jobnm ='0'  
		select @c_col=@c_col+1	 
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0)  
	
		fetch	next from c_cursor_org2 into @c_no2,@c_name2
	end
	close c_cursor_org2
	deallocate c_cursor_org2 
	 
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'合计','n',0)
	  
	select @c_num=0,@c_bxf=0
	select @c_num=count(distinct str(c_companyid)+c_bd) from t_cxbd where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and c_lrrq between @c_ksrq and @c_jsrq and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,str(@c_num),'n',0) 
	select @c_bxf=sum(c_bxf) from t_cxbd where c_orgid_sq in (select c_no from t_organization where c_path like @c_path and c_flag='0')
		and c_lrrq between @c_ksrq and @c_jsrq and c_jobnm ='0'  
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_bxf,'n',0)  
	
return 0
go