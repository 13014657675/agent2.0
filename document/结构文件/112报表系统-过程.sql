--���ջ���ҵ����  
if exists(select name from sysobjects where name='p_2001')
           drop procedure p_2001
go
create procedure p_2001
	@c_time		bigint,		
	@c_orgid	int,	 	--����id
	@c_system	int,		--����id 1 ֱӪ 2 ����
	@c_year		int, 		--��
	@c_ksrq		char(8), 	--Ͷ����ʼ����
	@c_jsrq		char(8) 	--Ͷ����������
as	
declare	@c_deptid	int,
	@c_code		int,		--�������
	@c_oname	char(50),	--�������� 
	@c_orgtypeid	int,		--��������id
	@c_tname	char(50),	--������������ 
	@c_path		varchar(15),	
	@c_order	int,	
	@c_sname	char(30),	--��������
	@c_row		int,		--��
	@c_col		int,		--�� 
	@c_num		int,		-- 
	@c_bxf		decimal(15,2), 	--   	 
	@c_bxfbz	decimal(15,2), 	--   	
	@c_yksrq	char(8), 	--��Ͷ����ʼ����
	@c_yjsrq	char(8), 	--��Ͷ����������	
	@c_no2		int,
	@c_num2		int,
	@c_name2	char(50),	--�������� 
	@c_no3		int,
	@c_name3	char(50)	--��������  
	set @c_code=2001	
	--�������
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0'
	select @c_yksrq=str(@c_year-1,4)+'1226',@c_yjsrq=str(@c_year,4)+'1225'
	--����
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'ʱ���','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_ksrq+'------'+@c_jsrq,'c',7) 	
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'���£�Ԥ�գ�','c',3)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'���꣨ʵ�գ�','c',3) 
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��ģ����','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��׼����','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��ģ����','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��׼����','n',0) 
	select @c_col=@c_col+1	
	--����		
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
		--��
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
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�ϼ�','n',0) 
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
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�ܼ�','c',2)  
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
--���չ�Ӧ��ҵ����  
if exists(select name from sysobjects where name='p_2002')
           drop procedure p_2002
go
create procedure p_2002
	@c_time		bigint,		
	@c_orgid	int,	 	--����id
	@c_year		int, 		--��
	@c_ksrq		char(8), 	--Ͷ����ʼ����
	@c_jsrq		char(8) 	--Ͷ����������
as	
declare	@c_code		int,		--�������
	@c_oname	char(50),	--�������� 
	@c_orgtypeid	int,		--��������id
	@c_tname	char(50),	--������������ 
	@c_path		varchar(15),	
	@c_order	int,
	@c_system	int,		--����id 
	@c_sname	char(30),	--��������
	@c_row		int,		--��
	@c_col		int,		--�� 
	@c_num		int,		-- 
	@c_bxf		decimal(15,2), 	--   	 
	@c_bxfbz	decimal(15,2), 	--   	
	@c_yksrq	char(8), 	--��Ͷ����ʼ����
	@c_yjsrq	char(8), 	--��Ͷ����������	
	@c_no2		int,
	@c_num2		int,
	@c_name2	char(50),	--�������� 
	@c_no3		int,
	@c_name3	char(50)	--�������� 
	
	set @c_code=2002	
	--�������
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0'
	select @c_yksrq=str(@c_year-1,4)+'1226',@c_yjsrq=str(@c_year,4)+'1225'
	--����
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'ʱ���','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_ksrq+'------'+@c_jsrq,'c',6) 	
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'���£�Ԥ�գ�','c',3)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'���꣨ʵ�գ�','c',3) 
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��ģ����','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��׼����','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��ģ����','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��׼����','n',0) 
	select @c_col=@c_col+1	
	--����			
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
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�ϼ�','n',0)
	  
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
--���������սɽ��ȱ�  
if exists(select name from sysobjects where name='p_2003')
           drop procedure p_2003
go
create procedure p_2003
	@c_time		bigint,		
	@c_orgid	int,	 	--����id 
	@c_system	int,		--����id 1 ֱӪ 2 ����
	@c_year		int, 		--��
	@c_month 	int  		--�� 	
as	
declare @c_deptid	int,
	@c_code		int,		--�������
	@c_oname	char(50),	--�������� 
	@c_orgtypeid	int,		--��������id
	@c_tname	char(50),	--������������ 
	@c_path		varchar(15),	
	@c_order	int,	
	@c_row		int,		--��
	@c_col		int,		--�� 
	@c_skrq char (8),		-- �տ�����
	@c_date char (8),		-- 
	@c_bdnd	int,			-- �������
	@c_companyid int ,		-- ���չ�˾
	@c_bd char (30) ,		-- ����
	@c_num2		int,
	@c_no2		int,
	@c_name2	char(50),	--   �������� 
	@c_no3		int,
	@c_name3	char(50),	--   ��������  
	@c_percent	varchar(30), 	--   �ٷֱ�
	@c_bxf_ss	decimal(15,2), 	--   ʵ��
	@c_bxf_ys	decimal(15,2) 	--   Ӧ��
	set @c_code=2003	
	--�������
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0' 
	--------------------------------------------------------------------------------------------------------------------------
	create table #t_xqjd
	(
		c_skrq char (8),		-- �տ�����
		c_bdnd int,			-- �������
		c_orgid_sq int,			-- ����		
		c_system_sq int ,		-- ������ϵ  
		c_companyid int ,		-- ���չ�˾ 
		c_bd char (30)  ,		-- ������			
		c_productid int , 		-- ��Ʒ����id	  
		c_bxf decimal(15,2) , 		-- ���շ�		
		c_cbrq char (8),		-- �б�����
		c_jobnumber char(10) ,		-- �����˹���
		c_outletsid int ,		-- ����
		c_jobnm char (10)  		--		  
	)   
	insert #t_xqjd
		(
		c_skrq ,		-- �տ�����
		c_bdnd ,		-- �������
		c_orgid_sq ,		-- ����		
		c_system_sq ,		-- ������ϵ  
		c_companyid ,		-- ���չ�˾ 
		c_bd ,			-- ������			
		c_productid , 		-- ��Ʒ����id			
		c_bxf , 		-- ���շ�		
		c_cbrq ,		-- �б�����
		c_jobnumber ,		-- �����˹���
		c_outletsid ,		-- ����
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
		--ǰ���δ�ɷѣ�����Ȳ���ʾ
		if not exists(select * from t_sxtb_xq where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd-1) and @c_bdnd>2
		begin
			delete #t_xqjd where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
			fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
			continue
		end
		--������˱����������ʾ������Ȳ���ʾ
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
	--����
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_year,'n',0) 	
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_month,'n',0) 
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�����˱�','c',3)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'���˱�','c',3)	 
	select @c_row=@c_row+1,@c_col=1	  	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'ʵ�ձ���','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'Ӧ�ձ���','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�����','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'ʵ�ձ���','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'Ӧ�ձ���','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�����','n',0)  
	--����		
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
		--��
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
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�ϼ�','n',0) 
		
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
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�ܼ�','c',2)  
	 
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
--���������սɽ��ȱ�  
if exists(select name from sysobjects where name='p_2004')
           drop procedure p_2004
go
create procedure p_2004
	@c_time		bigint,		
	@c_orgid	int,	 	--����id 
	@c_system	int,		--����id 1 ֱӪ 2 ����
	@c_year		int, 		--��
	@c_month 	int  		--�� 	
as	
declare @c_deptid	int,
	@c_code		int,		--�������
	@c_oname	char(50),	--�������� 
	@c_orgtypeid	int,		--��������id
	@c_tname	char(50),	--������������ 
	@c_path		varchar(15),	
	@c_order	int,	
	@c_row		int,		--��
	@c_col		int,		--�� 
	@c_skrq char (8),		-- �տ�����
	@c_date char (8),		-- 
	@c_bdnd	int,			-- �������
	@c_companyid int ,		-- ���չ�˾
	@c_bd char (30) ,		-- ����
	@c_num2		int,
	@c_no2		int,
	@c_name2	char(50),	--   �������� 
	@c_no3		int,
	@c_name3	char(50),	--   ��������  
	@c_percent	varchar(30), 	--   �ٷֱ�
	@c_bxf_ss	decimal(15,2), 	--   ʵ��
	@c_bxf_ys	decimal(15,2) 	--   Ӧ��
	set @c_code=2004	
	--�������
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0' 
	--------------------------------------------------------------------------------------------------------------------------
	create table #t_xqjd
	(
		c_skrq char (8),		-- �տ�����
		c_bdnd int,			-- �������
		c_orgid_sq int,			-- ����		
		c_system_sq int ,		-- ������ϵ  
		c_companyid int ,		-- ���չ�˾ 
		c_bd char (30)  ,		-- ������			
		c_productid int , 		-- ��Ʒ����id	  
		c_bxf decimal(15,2) , 		-- ���շ�		
		c_cbrq char (8),		-- �б�����
		c_jobnumber char(10) ,		-- �����˹���
		c_outletsid int ,		-- ����
		c_jobnm char (10)  		--		  
	)   
	insert #t_xqjd
		(
		c_skrq ,		-- �տ�����
		c_bdnd ,		-- �������
		c_orgid_sq ,		-- ����		
		c_system_sq ,		-- ������ϵ  
		c_companyid ,		-- ���չ�˾ 
		c_bd ,			-- ������			
		c_productid , 		-- ��Ʒ����id			
		c_bxf , 		-- ���շ�		
		c_cbrq ,		-- �б�����
		c_jobnumber ,		-- �����˹���
		c_outletsid ,		-- ����
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
		--ǰ���δ�ɷѣ�����Ȳ���ʾ
		if not exists(select * from t_sxtb_xq where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd-1) and @c_bdnd>2
		begin
			delete #t_xqjd where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
			fetch next from c_temp1 into  @c_skrq,@c_bdnd,@c_companyid,@c_bd
			continue
		end
		--������˱����������ʾ������Ȳ���ʾ
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
	--����
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_year,'n',0) 	
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_month,'n',0) 
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'13��','c',3)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'25��','c',3)	
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'37��','c',3)	 
	select @c_row=@c_row+1,@c_col=1	  	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'ʵ�ձ���','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'Ӧ�ձ���','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'������','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'ʵ�ձ���','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'Ӧ�ձ���','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'������','n',0)  
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'ʵ�ձ���','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'Ӧ�ձ���','n',0) 
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'������','n',0) 
	--����		
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
		--��
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
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�ϼ�','n',0) 
		
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
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�ܼ�','c',2)  
	 
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
--���ջ���ҵ����  
if exists(select name from sysobjects where name='p_3001')
           drop procedure p_3001
go
create procedure p_3001
	@c_time		bigint,		
	@c_orgid	int,	 	--����id  
	@c_system	int,		--����id 11 ���� 
	@c_ksrq		char(8), 	--ǩ����ʼ����
	@c_jsrq		char(8) 	--ǩ����������
as	
declare	@c_deptid	int,
	@c_code		int,		--�������
	@c_oname	char(50),	--�������� 
	@c_orgtypeid	int,		--��������id
	@c_tname	char(50),	--������������ 
	@c_path		varchar(15),	
	@c_order	int,	
	@c_sname	char(30),	--��������
	@c_row		int,		--��
	@c_col		int,		--�� 
	@c_num		int,		-- 
	@c_bxf		decimal(15,2), 	--   	 
	@c_bxfbz	decimal(15,2), 	--   	 
	@c_no2		int,
	@c_num2		int,
	@c_name2	char(50),	--�������� 
	@c_no3		int,
	@c_name3	char(50)	--��������  
	set @c_code=3001	
	--�������
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0' 
	--����
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'ʱ���','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_ksrq+'------'+@c_jsrq,'c',4) 	
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'��','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','c',2) 
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','n',0)  
	--����		
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
		--��
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
		insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�ϼ�','n',0) 
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
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�ܼ�','c',2)  
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
--���չ�Ӧ��ҵ����  
if exists(select name from sysobjects where name='p_3002')
           drop procedure p_3002
go
create procedure p_3002
	@c_time		bigint,		
	@c_orgid	int,	 	--����id 
	@c_ksrq		char(8), 	--ǩ����ʼ����
	@c_jsrq		char(8) 	--ǩ����������
as	
declare	@c_code		int,		--�������
	@c_oname	char(50),	--�������� 
	@c_orgtypeid	int,		--��������id
	@c_tname	char(50),	--������������ 
	@c_path		varchar(15),	
	@c_order	int,
	@c_system	int,		--����id 
	@c_sname	char(30),	--��������
	@c_row		int,		--��
	@c_col		int,		--�� 
	@c_num		int,		-- 
	@c_bxf		decimal(15,2), 	--   	 
	@c_bxfbz	decimal(15,2), 	--   	 	
	@c_no2		int,
	@c_num2		int,
	@c_name2	char(50),	--�������� 
	@c_no3		int,
	@c_name3	char(50)	--�������� 
	
	set @c_code=2002	
	--�������
	delete t_bbsj where c_time=@c_time
	select @c_oname=c_name,@c_orgtypeid=c_orgtypeid from t_organization where c_no=@c_orgid   
	select @c_tname=c_name,@c_order=c_order from t_orgtype where c_no=@c_orgtypeid
	select @c_path=left(c_path,@c_order * 2)+'%' from t_organization where c_no=@c_orgid and c_flag='0' 
	--����
	select @c_row=1,@c_col=1
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'ʱ���','n',0)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,@c_ksrq+'------'+@c_jsrq,'c',3) 	
	select @c_row=@c_row+1,@c_col=1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','r',2)
	select @c_col=@c_col+1	
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','c',2) 
	select @c_row=@c_row+1,@c_col=1	  
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','n',0) 
	select @c_col=@c_col+1	 
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'����','n',0)  
	--����			
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
	insert t_bbsj values(@c_time,@c_code,@c_row,@c_col,'�ϼ�','n',0)
	  
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