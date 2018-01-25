--�����ѱ���<��ͳ��>����
if exists(select name from sysobjects where name='p_srate')
	drop procedure p_srate
go
create procedure p_srate
	@c_no int , 
	@c_companyid int ,
	@c_productid int , 
	@c_jfqx int ,
	@c_bdnd int ,
	@c_srate decimal(9, 4), 
	@c_jobnm char (10),
	@c_operator char (20),
	@c_ip char (25)
as
declare @c_datime	datetime  
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 
		if @c_srate>0 
		begin		
			insert t_srate  
			( 
				c_companyid,
				c_productid, 
				c_jfqx,
				c_bdnd,
				c_srate, 
				c_jobnm,
				c_operator,
				c_ip 
			)
			values
			( 
				@c_companyid,
				@c_productid, 
				@c_jfqx,
				@c_bdnd,
				@c_srate, 
				@c_jobnm,
				@c_operator,
				@c_ip 
			)
		end
	end	
	if @c_jobnm='update'
	begin 
		update t_srate set
			c_srate=@c_srate,		 
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,
			c_datime=@c_datime,
			c_ip=@c_ip		 
		where 	c_companyid=@c_companyid and c_productid=@c_productid 
			and c_jfqx=@c_jfqx and c_bdnd=@c_bdnd 
	end	
	if @c_jobnm='check'
	begin
		update t_srate set
			c_srate=@c_srate,		 
			c_jobnm='0',
			c_operator=@c_operator,
			c_datime=@c_datime,
			c_ip=@c_ip		 
		where 	c_no=@c_no
	end 	 	
	if @c_jobnm='del'
	begin
		delete t_srate where 	c_no=@c_no
	end 	
return 0
go 
--Ӷ����Ŀ
if exists(select name from sysobjects where name='p_exptype')
	drop procedure p_exptype
go
create procedure p_exptype
	@c_no int , 
	@c_system int ,
	@c_name char (50) ,  
	@c_jobnm char (10) ,
	@c_operator char(20),	
	@c_ip char (25)   
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_exptype
		(  
			c_system,
			c_name,  
			c_jobnm,
			c_operator,
			c_ip
		)
		values
		(  
			@c_system,
			@c_name,  
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_exptype set c_name=@c_name,
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime,
				c_ip=@c_ip   
			where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_exptype  where c_no=@c_no
	end 
return 0
go
--Ӷ�����<��ͳ��>���� 
if exists(select name from sysobjects where name='p_expsrate')
	drop procedure p_expsrate
go
create procedure p_expsrate
	@c_no int , 
	@c_companyid int ,
	@c_productid int , 	
	@c_jfqx int ,
	@c_bdnd int ,
	@c_system int ,
	@c_exptypeid int ,
	@c_srate decimal(9, 4), 
	@c_jobnm char (10),
	@c_operator char (20),
	@c_ip char (25)
as
declare @c_datime	datetime  
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 
		insert t_expsrate  
		( 
			c_companyid,
			c_productid, 			
			c_jfqx,
			c_bdnd,
			c_system,
			c_exptypeid,
			c_srate, 
			c_jobnm,
			c_operator,
			c_ip 
		)
		values
		( 
			@c_companyid,
			@c_productid,  
			@c_jfqx,
			@c_bdnd,
			@c_system,
			@c_exptypeid,
			@c_srate, 
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end	
	if @c_jobnm='update'
	begin 
		update t_expsrate set
			c_srate=@c_srate,		 
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,
			c_datime=@c_datime,
			c_ip=@c_ip		 
		where 	c_companyid=@c_companyid and c_productid=@c_productid and c_jfqx=@c_jfqx and c_bdnd=@c_bdnd 
		 	and c_system=@c_system and c_exptypeid=@c_exptypeid
	end	
	if @c_jobnm='check'
	begin
		update t_expsrate set
			c_srate=@c_srate,		 
			c_jobnm='0',
			c_operator=@c_operator,
			c_datime=@c_datime,
			c_ip=@c_ip		 
		where 	c_no=@c_no
	end 	 	
	if @c_jobnm='del'
	begin
		delete t_expsrate where c_no=@c_no
	end 	
return 0
go 
--��������Ӷ��������ݼ������
if exists(select name from sysobjects where name='p_sxsqjs')
	drop procedure p_sxsqjs
go
create procedure p_sxsqjs
	@c_companyid int ,			--���չ�˾
	@c_tbd char (30) ,			--Ͷ������
	@c_productid int , 			--����id 
	@c_bxfr1	decimal(7,3) output,	--����Ӷ�����
	@c_bxfr2	decimal(7,3) output,	--֧��Ӷ�����
	@c_bxfy1	decimal(15,3) output,	--����Ӷ��
	@c_bxfy2	decimal(15,3) output,	--֧��Ӷ��	
	@c_bxfxs	decimal(7,3) output,	--��׼����ϵ��	
	@c_bxfbz	decimal(15,2) output,	--��׼����
	@c_bxgsxs	decimal(7,3) output,	--���չ�˾�걣ϵ��	
	@c_bxgsbz	decimal(15,2) output	--���չ�˾�걣
as
declare @c_pttypeid int, 	--��Ʒ����
	@c_ptclassid int,	--��Ʒ����
	@c_system_sq int,	--������ϵ
	@c_jfqx int,		--�ɷ�����
	@c_bxf decimal(15,2)	--����
	select @c_bxfr1=0,@c_bxfr2=0,@c_bxfy1=0,@c_bxfy2=0,@c_bxf=0,@c_jfqx=0		 
	select @c_system_sq=c_system_sq from t_sxbd where c_companyid=@c_companyid and c_tbd=@c_tbd	
	select @c_jfqx=c_jfqx,@c_bxf=c_bxf from t_sxtb where c_companyid=@c_companyid and c_tbd=@c_tbd and c_productid=@c_productid 
	select @c_bxfr1=c_srate from t_srate
		where c_companyid=@c_companyid and c_productid=@c_productid and c_jfqx=@c_jfqx and c_bdnd=1 		
	select @c_bxfr2=c_srate from t_expsrate
		where c_companyid=@c_companyid and c_productid=@c_productid and c_jfqx=@c_jfqx and c_bdnd=1	
			and c_system=@c_system_sq  and c_exptypeid=0	 
	select @c_bxfy1=@c_bxf*@c_bxfr1,@c_bxfy2=@c_bxf*@c_bxfr2 	
	select @c_bxfxs=0,@c_bxfbz=0  			 
 	if @c_system_sq=1	--ֱӪ
 	begin 
		if @c_bxfr2/0.35 < 1
		begin
			set @c_bxfxs=@c_bxfr2/0.35
		end		
		else
		begin
			set @c_bxfxs=1
		end 
 	end
 	if @c_system_sq=2	--��������
 	begin 
		if @c_jfqx=1
		begin
			set @c_bxfxs=0.1
		end	
		if @c_jfqx between 2 and 5
		begin
			set @c_bxfxs=0.3
		end	
		if @c_jfqx between 6 and 10
		begin
			set @c_bxfxs=0.6
		end
		if @c_jfqx between 11 and 15
		begin
			set @c_bxfxs=0.7
		end
		if @c_jfqx between 16 and 19
		begin
			set @c_bxfxs=0.8
		end 
		if @c_jfqx>=20
		begin
			set @c_bxfxs=1
		end
 	end	 		
 	set @c_bxfbz=@c_bxf * @c_bxfxs 	 
 	select @c_bxgsxs=0,@c_bxgsbz=0  	 	 
return 0
go
--��������Ӷ��������ݼ������
if exists(select name from sysobjects where name='p_sxsqjs2')
	drop procedure p_sxsqjs2
go
create procedure p_sxsqjs2
	@c_companyid int ,		--���չ�˾
	@c_tbd char (30) 		--Ͷ������ 
as	
declare	@c_no 		int,		--�Զ����
	@c_bxf		decimal(15,2),	--���շ�
	@c_productid 	int , 		--����id  
	@c_bxfr1	decimal(7,3) ,	--����Ӷ�����
	@c_bxfr2	decimal(7,3) ,	--֧��Ӷ�����
	@c_bxfy1	decimal(15,3) ,	--����Ӷ��
	@c_bxfy2	decimal(15,3) ,	--֧��Ӷ��	
	@c_bxfxs	decimal(7,3) ,	--��׼����ϵ��	
	@c_bxfbz	decimal(15,2) ,	--��׼����
	@c_bxgsxs	decimal(7,3) ,	--���չ�˾�걣ϵ��	
	@c_bxgsbz	decimal(15,2) 	--���չ�˾�걣	
	declare c_sxyjjs cursor for
	select 	c_no,c_productid
	from 	t_sxtb
	where   c_companyid=@c_companyid and c_tbd=@c_tbd 
	open	c_sxyjjs
	fetch	next from c_sxyjjs into @c_no,@c_productid
	while	(@@fetch_status = 0)
	begin 	 						
		exec p_sxsqjs
			@c_companyid	,	--���չ�˾����
			@c_tbd		,	--Ͷ������� 
			@c_productid 	,	--����id 
			@c_bxfr1	output,	--����Ӷ�����
			@c_bxfr2	output,	--֧��Ӷ�����
			@c_bxfy1	output,	--����Ӷ��
			@c_bxfy2	output,	--֧��Ӷ��
			@c_bxfxs	output,	--�۱�ϵ��				
			@c_bxfbz	output,	--��׼����  	 
			@c_bxgsxs	output,	--���չ�˾�걣ϵ��				
			@c_bxgsbz	output 	--���չ�˾�걣  				
		update 	t_sxtb set 			
			c_bxfr1=@c_bxfr1,	--����Ӷ�����
			c_bxfr2=@c_bxfr2,	--֧��Ӷ�����
			c_bxfy1=@c_bxfy1,	--����Ӷ��1
			c_bxfy2=@c_bxfy2,	--֧��Ӷ��1		
			c_bxfxs=@c_bxfxs,	--�۱�ϵ��
			c_bxfbz=@c_bxfbz, 	--��׼���� 	
			c_bxgsxs=@c_bxgsxs,	--���չ�˾�걣ϵ��	
			c_bxgsbz=@c_bxgsbz 	--���չ�˾�걣  			 
		where 	c_no=@c_no		  	
	fetch	next from c_sxyjjs into @c_no,@c_productid
	end							
	close c_sxyjjs
	deallocate c_sxyjjs
return 0
go
--��������Ӷ��������ݼ������
if exists(select name from sysobjects where name='p_sxxqjs')
	drop procedure p_sxxqjs
go
create procedure p_sxxqjs
	@c_companyid int ,			--���չ�˾
	@c_bd char (30) ,			--������
	@c_productid int , 			--����id 
	@c_bdnd int ,				--�������
	@c_bxfr1	decimal(7,3) output,	--����Ӷ�����
	@c_bxfr2	decimal(7,3) output,	--֧��Ӷ�����
	@c_bxfy1	decimal(15,3) output,	--����Ӷ��
	@c_bxfy2	decimal(15,3) output	--֧��Ӷ��	 
as
declare @c_pttypeid int, 	--��Ʒ����
	@c_ptclassid int,	--��Ʒ����
	@c_system_sq int,	--������ϵ
	@c_jfqx int,		--�ɷ�����
	@c_bxf decimal(15,2)	--����
	select @c_bxfr1=0,@c_bxfr2=0,@c_bxfy1=0,@c_bxfy2=0,@c_bxf=0,@c_jfqx=0		  	
	select @c_jfqx=c_jfqx from t_sxtb where c_companyid=@c_companyid and c_bd=@c_bd and c_productid=@c_productid 
	select @c_bxf=c_bxf from t_sxtb_xq where c_companyid=@c_companyid and c_bd=@c_bd and c_productid=@c_productid and c_bdnd=@c_bdnd
	select @c_bxfr1=c_srate from t_srate
		where c_companyid=@c_companyid and c_productid=@c_productid and c_jfqx=@c_jfqx and c_bdnd=@c_bdnd			
	select @c_bxfr2=c_srate from t_expsrate
		where c_companyid=@c_companyid and c_productid=@c_productid and c_jfqx=@c_jfqx and c_bdnd=@c_bdnd	
			and c_system=1  and c_exptypeid=0	
	select @c_bxfy1=@c_bxf*@c_bxfr1,@c_bxfy2=@c_bxf*@c_bxfr2 		 	 
return 0
go
--��������Ӷ��������ݼ������
if exists(select name from sysobjects where name='p_sxxqjs2')
	drop procedure p_sxxqjs2
go
create procedure p_sxxqjs2
	@c_companyid int ,		--���չ�˾
	@c_bd char (30) ,		--������
	@c_bdnd int 			--�������
as	
declare	@c_no 		int,		--�Զ����
	@c_bxf		decimal(15,2),	--���շ�
	@c_productid 	int , 		--����id  
	@c_bxfr1	decimal(7,3) ,	--����Ӷ�����
	@c_bxfr2	decimal(7,3) ,	--֧��Ӷ�����
	@c_bxfy1	decimal(15,3) ,	--����Ӷ��
	@c_bxfy2	decimal(15,3) ,	--֧��Ӷ��	
	@c_bxfxs	decimal(7,3) ,	--��׼����ϵ��	
	@c_bxfbz	decimal(15,2) ,	--��׼����
	@c_bxgsxs	decimal(7,3) ,	--���չ�˾�걣ϵ��	
	@c_bxgsbz	decimal(15,2) 	--���չ�˾�걣	
	declare c_sxyjjs cursor for
	select 	c_no,c_productid
	from 	t_sxtb_xq
	where   c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
	open	c_sxyjjs
	fetch	next from c_sxyjjs into @c_no,@c_productid
	while	(@@fetch_status = 0)
	begin 	 						
		exec p_sxxqjs
			@c_companyid	,	--���չ�˾����
			@c_bd		,	--������� 
			@c_productid 	,	--����id 
			@c_bdnd		,	--�������
			@c_bxfr1	output,	--����Ӷ�����
			@c_bxfr2	output,	--֧��Ӷ�����
			@c_bxfy1	output,	--����Ӷ��
			@c_bxfy2	output	--֧��Ӷ�� 				
		update 	t_sxtb_xq set 			
			c_bxfr1=@c_bxfr1,	--����Ӷ�����
			c_bxfr2=@c_bxfr2,	--֧��Ӷ�����
			c_bxfy1=@c_bxfy1,	--����Ӷ��1
			c_bxfy2=@c_bxfy2	--֧��Ӷ��1 			 
		where 	c_no=@c_no		  	
	fetch	next from c_sxyjjs into @c_no,@c_productid
	end							
	close c_sxyjjs
	deallocate c_sxyjjs
return 0
go
--���ն��˹���
if exists(select name from sysobjects where name='p_sxdz')
	drop procedure p_sxdz
go
create procedure p_sxdz
	@c_orgid	int,				--����
	@c_sjlx		int,				--1 ���� ��2 ����
	@c_companyid	int,				--���չ�˾����
	@c_year		int,				--��
	@c_month	int,				--��
	@c_operator	char(20),			--����Ա
	@c_ip		char(25) 			--����Աip
as
declare @c_hdny		char(6),			--�˶����� 
	@c_tbd		char(30),			--Ͷ������ 
	@c_bd		char(30),			--������ 
	@c_bdnd		int,				--  
	@c_tbrnum	int,
	@c_bbrnum	int,
	@c_tbrname	char(30),
	@c_tbrname_xt	char(30),
	@c_bbrname	char(30),	
	@c_bbrname_xt	char(30),	
	@c_cbrq		char(8),
	@c_cbrq_xt	char(8), 
	@c_bxf		decimal(15,2),			--��Ȼ����
	@c_sxf		decimal(15,2),			--����Ӷ��   
	@c_bxf_xt	decimal(15,2),			--��Ȼ���� 
	@c_sxf_xt	decimal(15,2),			--����Ӷ��	 
	@c_hxrq_ks 	char(8),
	@c_hxrq_js 	char(8),
	@c_hxrq_xt 	char(8) 				
	if @c_sjlx=1	--���ں˶�
	begin			
		if not exists(select * from t_sxdz where c_orgid=@c_orgid and c_companyid=@c_companyid and c_year=@c_year and c_month=@c_month) 
		begin
			raiserror ('û�ж�������Ҫ�ı��չ�˾����', 16, 1)
			return @@error
		end  
		if @c_month>9
		begin
			set @c_hdny=str(@c_year,4)+str(@c_month,2)
		end
		else
		begin
			set @c_hdny=str(@c_year,4)+'0'+str(@c_month,1)
		end
		set @c_hxrq_ks=convert(char(8),dateadd(month,0,@c_hdny+'11'),112)
		set @c_hxrq_js=convert(char(8),dateadd(month,1,@c_hdny+'10'),112) 
		declare c_duizhang1 cursor for	
		select  c_bd,c_tbrname,c_bbrname,convert(char(8),c_cbrq,112) c_cbrq ,sum(c_bxf),sum(c_sxf)  from t_sxdz
		where   c_orgid=@c_orgid and c_companyid=@c_companyid and c_year=@c_year and c_month=@c_month
			group by  c_bd,c_tbrname,c_bbrname,c_cbrq 
		open	c_duizhang1
		fetch next from c_duizhang1 into  @c_bd,@c_tbrname,@c_bbrname,@c_cbrq,@c_bxf,@c_sxf
		while (@@fetch_status = 0)
		begin 			
			select @c_tbd=c_tbd from t_sxbd where c_companyid=@c_companyid and c_bd=@c_bd 
			exec p_sxsqjs2 @c_companyid,@c_tbd
			if exists(select * from t_sxbd where c_companyid=@c_companyid and c_bd=@c_bd and c_jobnm in('0','5') ) 								  
			begin		   							
				select @c_bxf_xt=0, @c_sxf_xt=0,@c_cbrq_xt=null,@c_hxrq_xt=null,@c_tbrname_xt=null,@c_bbrname_xt=null 	 
				select @c_bxf_xt=sum(c_bxf),@c_sxf_xt=sum(c_bxfy1)  from t_sxtb 
					where c_companyid=@c_companyid and c_bd=@c_bd   	 	 				 		 	
				select @c_cbrq_xt=c_date from  t_sxbdzt where c_companyid =@c_companyid 
					and c_bd=@c_bd and c_type=1  
				select @c_hxrq_xt=convert(char(8),c_datime,112) from  t_sxbdzt where c_companyid =@c_companyid 
					and c_bd=@c_bd and c_type=3  					
				select @c_tbrnum=c_tbrnum,@c_bbrnum=c_bbrnum  from t_sxbd 
					where c_companyid=@c_companyid and c_bd=@c_bd   		
				select @c_tbrname_xt=c_name from t_customer where c_no=@c_tbrnum	 
				select @c_bbrname_xt=c_name from t_customer where c_no=@c_bbrnum		 
				--�˶� 				
				if  @c_hxrq_xt between @c_hxrq_ks and @c_hxrq_js
					and @c_tbrname=@c_tbrname_xt
					and @c_bbrname=@c_bbrname_xt 
					and DATEPART(month, @c_cbrq)=DATEPART(month, @c_cbrq_xt)
					and DATEDIFF(day, @c_cbrq, @c_cbrq_xt) < =3
					and abs(@c_bxf_xt-@c_bxf) <1  and abs(@c_sxf_xt-@c_sxf) <1  
				begin						
					update t_sxtb set c_check=@c_hdny  where  c_companyid=@c_companyid and c_bd=@c_bd 
					
					update t_sxdz set c_jobnm='0',c_operator=@c_operator,c_ip=@c_ip where c_orgid=@c_orgid and c_companyid=@c_companyid 
						and c_year=@c_year and c_month=@c_month and c_bd=@c_bd 									
				end 
				else
				begin		
					if @c_hxrq_xt is null or @c_hxrq_xt < @c_hxrq_ks or @c_hxrq_xt > @c_hxrq_js	--�������� 
					begin  
						update t_sxdz set c_jobnm='hxrq',c_operator=@c_operator,c_ip=@c_ip where c_orgid=@c_orgid and c_companyid=@c_companyid 
							and c_year=@c_year and c_month=@c_month and c_bd=@c_bd 						
						fetch next from c_duizhang1 into  @c_bd,@c_tbrname,@c_bbrname,@c_cbrq,@c_bxf,@c_sxf
						continue	
					end						 									 
					if @c_cbrq_xt is null or DATEPART(month, @c_cbrq)<>DATEPART(month, @c_cbrq_xt)  
						or DATEDIFF(day, @c_cbrq, @c_cbrq_xt) >3				--�б����� 
					begin  
						update t_sxdz set c_jobnm='cbrq',c_operator=@c_operator,c_ip=@c_ip where c_orgid=@c_orgid and c_companyid=@c_companyid 
							and c_year=@c_year and c_month=@c_month and c_bd=@c_bd 						
						fetch next from c_duizhang1 into  @c_bd,@c_tbrname,@c_bbrname,@c_cbrq,@c_bxf,@c_sxf
						continue	
					end	
					if @c_tbrname_xt is null or @c_tbrname_xt<>@c_tbrname				--Ͷ��������
					begin  
						update t_sxdz set c_jobnm='tbr',c_operator=@c_operator,c_ip=@c_ip where c_orgid=@c_orgid and c_companyid=@c_companyid 
							and c_year=@c_year and c_month=@c_month and c_bd=@c_bd 						
						fetch next from c_duizhang1 into  @c_bd,@c_tbrname,@c_bbrname,@c_cbrq,@c_bxf,@c_sxf
						continue	
					end	
					if @c_bbrname_xt is null or @c_bbrname_xt<>@c_bbrname				--����������
					begin  
						update t_sxdz set c_jobnm='bbr',c_operator=@c_operator,c_ip=@c_ip where c_orgid=@c_orgid and c_companyid=@c_companyid 
							and c_year=@c_year and c_month=@c_month and c_bd=@c_bd 						
						fetch next from c_duizhang1 into  @c_bd,@c_tbrname,@c_bbrname,@c_cbrq,@c_bxf,@c_sxf
						continue	
					end					
					if ( abs(@c_bxf_xt-@c_bxf) >= 1 )						--���շ�
					begin
						update t_sxdz set c_jobnm='bxf',c_operator=@c_operator,c_ip=@c_ip where c_orgid=@c_orgid and c_companyid=@c_companyid 
							and c_year=@c_year and c_month=@c_month and c_bd=@c_bd 		 
						fetch next from c_duizhang1 into  @c_bd,@c_tbrname,@c_bbrname,@c_cbrq,@c_bxf,@c_sxf
						continue						 
					end
					if ( abs(@c_sxf_xt-@c_sxf) >= 1 )						--������
					begin 						
						update t_sxdz set c_jobnm='sxf',c_operator=@c_operator,c_ip=@c_ip where c_orgid=@c_orgid and c_companyid=@c_companyid 
							and c_year=@c_year and c_month=@c_month and c_bd=@c_bd 						
						fetch next from c_duizhang1 into  @c_bd,@c_tbrname,@c_bbrname,@c_cbrq,@c_bxf,@c_sxf
						continue	 
					end									
				end					 
			end							
			fetch next from c_duizhang1 into  @c_bd,@c_tbrname,@c_bbrname,@c_cbrq,@c_bxf,@c_sxf
		end
		close c_duizhang1
		deallocate  c_duizhang1	
		--surplus ���չ�˾������ 
		insert into t_sxdz
		(
			c_orgid,			--����
			c_year,				--��
			c_month,			--��
			c_companyid,			--���չ�˾
			c_bd,				--���� 
			c_jobnm,			--��ҵ����
			c_operator,			--����Ա
			c_ip				--����ip
		) 
		select
			@c_orgid,			--����
			@c_year,			--��
			@c_month,			--��
			@c_companyid,			--���չ�˾
			a.c_bd, 			--����
			'surplus',			--��ҵ����
			@c_operator,			--����Ա
			@c_ip				--����ip
		from t_sxbd a,t_sxbdzt b
		where a.c_companyid=b.c_companyid and b.c_type=3 and a.c_bd=b.c_bd
			and a.c_orgid=@c_orgid and a.c_companyid=@c_companyid	
			and a.c_jobnm in ('0','5')	
			and convert(char(8),b.c_datime,112) between @c_hxrq_ks and @c_hxrq_js
			and a.c_bd not in (select c_bd from t_sxdz
				where  c_orgid=@c_orgid and c_companyid=@c_companyid and c_year=@c_year and c_month=@c_month )			  		
	end	
	--------------------------------------------------------------------------------------------------------------------------
	if @c_sjlx=2	--���ں˶�
	begin			
		if not exists(select * from t_sxdz_xq where c_orgid=@c_orgid and c_companyid=@c_companyid and c_year=@c_year and c_month=@c_month) 
		begin
			raiserror ('û�ж�������Ҫ�ı��չ�˾����', 16, 1)
			return @@error
		end  
		if @c_month>9
		begin
			set @c_hdny=str(@c_year,4)+str(@c_month,2)
		end
		else
		begin
			set @c_hdny=str(@c_year,4)+'0'+str(@c_month,1)
		end
		 
		declare c_duizhang1 cursor for	
		select  c_bd,c_bdnd,sum(c_bxf),sum(c_sxf)  from t_sxdz_xq
		where   c_orgid=@c_orgid and c_companyid=@c_companyid and c_year=@c_year and c_month=@c_month
			group by  c_bd,c_bdnd
		open	c_duizhang1
		fetch next from c_duizhang1 into  @c_bd,@c_bdnd,@c_bxf,@c_sxf
		while (@@fetch_status = 0)
		begin 			 
			exec p_sxxqjs2 @c_companyid,@c_bd,@c_bdnd
			if exists(select * from t_sxtb_xq where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd ) 								  
			begin		   							
				select @c_bxf_xt=0, @c_sxf_xt=0 
				select @c_bxf_xt=sum(c_bxf),@c_sxf_xt=sum(c_bxfy1)  from t_sxtb_xq 
					where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
				--�˶� 				
				if  abs(@c_bxf_xt-@c_bxf) <1  and abs(@c_sxf_xt-@c_sxf) <1  
				begin						
					update t_sxtb_xq set c_check=@c_hdny  where  c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
					
					update t_sxdz_xq set c_jobnm='0',c_operator=@c_operator,c_ip=@c_ip where c_orgid=@c_orgid and c_companyid=@c_companyid 
						and c_year=@c_year and c_month=@c_month and c_bd=@c_bd and c_bdnd=@c_bdnd								
				end 
				else
				begin				
					if ( abs(@c_bxf_xt-@c_bxf) >= 1 )						--���շ�
					begin
						update t_sxdz_xq set c_jobnm='bxf',c_operator=@c_operator,c_ip=@c_ip where c_orgid=@c_orgid and c_companyid=@c_companyid 
							and c_year=@c_year and c_month=@c_month and c_bd=@c_bd and c_bdnd=@c_bdnd	 
						fetch next from c_duizhang1 into  @c_bd,@c_bdnd,@c_bxf,@c_sxf
						continue						 
					end
					if ( abs(@c_sxf_xt-@c_sxf) >= 1 )						--������
					begin 						
						update t_sxdz_xq set c_jobnm='sxf',c_operator=@c_operator,c_ip=@c_ip where c_orgid=@c_orgid and c_companyid=@c_companyid 
							and c_year=@c_year and c_month=@c_month and c_bd=@c_bd and c_bdnd=@c_bdnd						
						fetch next from c_duizhang1 into  @c_bd,@c_bdnd,@c_bxf,@c_sxf
						continue	 
					end									
				end					 
			end							
			fetch next from c_duizhang1 into  @c_bd,@c_bdnd,@c_bxf,@c_sxf
		end
		close c_duizhang1
		deallocate  c_duizhang1	
		--surplus ���չ�˾������ 
		insert into t_sxdz_xq
		(
			c_orgid,			--����
			c_year,				--��
			c_month,			--��
			c_companyid,			--���չ�˾
			c_bd,				--���� 
			c_bdnd,				--������� 
			c_jobnm,			--��ҵ����
			c_operator,			--����Ա
			c_ip				--����ip
		) 
		select
			@c_orgid,			--����
			@c_year,			--��
			@c_month,			--��
			@c_companyid,			--���չ�˾
			c_bd,	 			--����
			c_bdnd,				--�������
			'surplus',			--��ҵ����
			@c_operator,			--����Ա
			@c_ip				--����ip
		from t_sxtb_xq  
		where c_orgid=@c_orgid and c_companyid=@c_companyid		
			and DATEPART(year, c_fprq)=@c_year
			and DATEPART(month, c_fprq)=@c_month		  
			and c_bd+str(c_bdnd) not in (select c_bd+str(c_bdnd) from t_sxdz_xq
				where  c_orgid=@c_orgid and c_companyid=@c_companyid and c_year=@c_year and c_month=@c_month )			  		
	end	
return 0
go
--���ն��˴��󱨸����
if exists(select name from sysobjects where name='p_sxdz_bg')
	drop procedure p_sxdz_bg
go
create procedure p_sxdz_bg
	@c_orgid	int,				--����
	@c_sjlx		int,				--1 ���� ��2 ����
	@c_companyid	int,				--���չ�˾����
	@c_year		int,				--��
	@c_month	int 				--�� 
as 
declare @c_hdny		char(6),			--�˶����� 
	@c_bd		char(30),			--������ 
	@c_bdnd		int,				--  
	@c_tbrnum	int,
	@c_bbrnum	int,
	@c_jobnm	char(10),
	@c_tbrname	char(30),
	@c_tbrname_xt	char(30),
	@c_bbrname	char(30),	
	@c_bbrname_xt	char(30),	
	@c_cbrq		char(8),
	@c_cbrq_xt	char(8), 
	@c_bxf		decimal(15,2),			--��Ȼ����
	@c_sxf		decimal(15,2),			--����Ӷ��   
	@c_bxf_xt	decimal(15,2),			--��Ȼ���� 
	@c_sxf_xt	decimal(15,2),			--����Ӷ��	 
	@c_hxrq_ks 	char(8),
	@c_hxrq_js 	char(8),
	@c_hxrq_xt 	char(8) 		
	if @c_sjlx=1					--����
	begin 	
		create table #t_temp1
		(
			c_bd		char(30), 
			c_type		char(30),
			c_x_xt		char(30),
			c_x_gs		char(30)
		) 
		if @c_month>9
		begin
			set @c_hdny=str(@c_year,4)+str(@c_month,2)
		end
		else
		begin
			set @c_hdny=str(@c_year,4)+'0'+str(@c_month,1)
		end
		set @c_hxrq_ks=convert(char(8),dateadd(month,0,@c_hdny+'11'),112)
		set @c_hxrq_js=convert(char(8),dateadd(month,1,@c_hdny+'10'),112)  
		declare c_temp1 cursor for	
		select  c_bd,c_jobnm,c_tbrname,c_bbrname,convert(char(8),c_cbrq,112) c_cbrq ,sum(c_bxf),sum(c_sxf)  from t_sxdz
		where   c_orgid=@c_orgid and c_companyid=@c_companyid and c_year=@c_year and c_month=@c_month and c_jobnm<>'0'
			group by  c_bd,c_jobnm,c_tbrname,c_bbrname,c_cbrq 
		open	c_temp1
		fetch next from c_temp1 into  @c_bd,@c_jobnm,@c_tbrname,@c_bbrname,@c_cbrq,@c_bxf,@c_sxf
		while (@@fetch_status = 0)
		begin  			
			select @c_bxf_xt=0, @c_sxf_xt=0,@c_cbrq_xt=null,@c_hxrq_xt=null,@c_tbrname_xt=null,@c_bbrname_xt=null 	 
			select @c_bxf_xt=sum(c_bxf),@c_sxf_xt=sum(c_bxfy1)  from t_sxtb 
				where c_companyid=@c_companyid and c_bd=@c_bd   	 	 				 		 	
			select @c_cbrq_xt=c_date from  t_sxbdzt where c_companyid =@c_companyid 
				and c_bd=@c_bd and c_type=1  
			select @c_hxrq_xt=convert(char(8),c_datime,112) from  t_sxbdzt where c_companyid =@c_companyid 
				and c_bd=@c_bd and c_type=3  				
			select @c_tbrnum=c_tbrnum,@c_bbrnum=c_bbrnum  from t_sxbd 
				where c_companyid=@c_companyid and c_bd=@c_bd   		
			select @c_tbrname_xt=c_name from t_customer where c_no=@c_tbrnum	 
			select @c_bbrname_xt=c_name from t_customer where c_no=@c_bbrnum				 			 	
			insert #t_temp1
			(
				c_bd		, 
				c_type		,
				c_x_xt		,
				c_x_gs	
			) 
		        values
		       (
				@c_bd		, 
				null	 	,
				null		,
				null	
			) 		
			if @c_jobnm='surplus'	--���չ�˾������ 
			begin   
				update  #t_temp1
					set c_type='���չ�˾������',
					    c_x_xt=null,
					    c_x_gs=null
				where c_bd =@c_bd  	
			end	 	
			if @c_jobnm='add'	--ϵͳ������ 
			begin   
				update  #t_temp1
					set c_type='ϵͳ������',
					    c_x_xt=null,
					    c_x_gs=null
				where c_bd =@c_bd  	
			end		
			if @c_jobnm='hxrq'	--�������� 
			begin   
				update  #t_temp1
					set c_type='�������ڲ�һ��',
					    c_x_xt=@c_hxrq_xt,
					    c_x_gs=@c_hxrq_ks+' �� '+@c_hxrq_js+' �ڼ�'
				where c_bd =@c_bd  	
			end						 									 
			if @c_jobnm='cbrq'	--�б����� 
			begin   
				update  #t_temp1
					set c_type='�б����ڲ�һ��',
					    c_x_xt=@c_cbrq_xt,
					    c_x_gs=@c_cbrq
				where c_bd =@c_bd 
			end	
			if @c_jobnm='tbr'	--Ͷ��������
			begin  
				update  #t_temp1
					set c_type='Ͷ����������һ��',
					    c_x_xt=@c_tbrname_xt,
					    c_x_gs=@c_tbrname
				where c_bd =@c_bd  
			end	
			if @c_jobnm='bbr'	--����������
			begin  
				update  #t_temp1
					set c_type='������������һ��',
					    c_x_xt=@c_bbrname_xt,
					    c_x_gs=@c_bbrname
				where c_bd =@c_bd  
			end					
			if @c_jobnm='bxf'	--���շ�
			begin
				update  #t_temp1
					set c_type='���շѲ�һ��',
					    c_x_xt=@c_bxf_xt,
					    c_x_gs=@c_bxf
				where c_bd =@c_bd  
			end
			if @c_jobnm='sxf'	--������
			begin 				
				update  #t_temp1
					set c_type='�����Ѳ�һ��',
					    c_x_xt=@c_sxf_xt,
					    c_x_gs=@c_sxf
				where c_bd =@c_bd  
			end					 
			fetch next from c_temp1 into  @c_bd,@c_jobnm,@c_tbrname,@c_bbrname,@c_cbrq,@c_bxf,@c_sxf
		end
		close c_temp1
		deallocate  c_temp1	
		select 	* from #t_temp1 order by c_type		
		drop table #t_temp1
	end 
	--------------------------------------------------------------------------------------------------------------------------
	if @c_sjlx=2					--����
	begin 	
		create table #t_temp2
		(
			c_bd		char(30), 
			c_bdnd		int,
			c_type		char(30),
			c_x_xt		char(30),
			c_x_gs		char(30)
		) 
		if @c_month>9
		begin
			set @c_hdny=str(@c_year,4)+str(@c_month,2)
		end
		else
		begin
			set @c_hdny=str(@c_year,4)+'0'+str(@c_month,1)
		end
		 
		declare c_temp2 cursor for	
		select  c_bd,c_jobnm,c_bdnd,sum(c_bxf),sum(c_sxf)  from t_sxdz_xq
		where   c_orgid=@c_orgid and c_companyid=@c_companyid and c_year=@c_year and c_month=@c_month and c_jobnm<>'0'
			group by  c_bd,c_jobnm,c_bdnd
		open	c_temp2
		fetch next from c_temp2 into  @c_bd,@c_jobnm,@c_bdnd,@c_bxf,@c_sxf
		while (@@fetch_status = 0)
		begin  			
			select @c_bxf_xt=0, @c_sxf_xt=0 	 
			select @c_bxf_xt=sum(c_bxf),@c_sxf_xt=sum(c_bxfy1)  from t_sxtb_xq 
				where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd  
			insert #t_temp2
			(
				c_bd		,
				c_bdnd		, 
				c_type		,
				c_x_xt		,
				c_x_gs	
			) 
		        values
		       (
				@c_bd		, 
				@c_bdnd		,
				null	 	,
				null		,
				null	
			) 		
			if @c_jobnm='surplus'	--���չ�˾������ 
			begin   
				update  #t_temp2
					set c_type='���չ�˾������',
					    c_x_xt=null,
					    c_x_gs=null
				where c_bd =@c_bd and c_bdnd=@c_bdnd   	
			end	 	
			if @c_jobnm='add'	--ϵͳ������ 
			begin   
				update  #t_temp2
					set c_type='ϵͳ������',
					    c_x_xt=null,
					    c_x_gs=null
				where c_bd =@c_bd and c_bdnd=@c_bdnd    	
			end									
			if @c_jobnm='bxf'	--���շ�
			begin
				update  #t_temp2
					set c_type='���շѲ�һ��',
					    c_x_xt=@c_bxf_xt,
					    c_x_gs=@c_bxf
				where c_bd =@c_bd and c_bdnd=@c_bdnd   
			end
			if @c_jobnm='sxf'	--������
			begin 				
				update  #t_temp2
					set c_type='�����Ѳ�һ��',
					    c_x_xt=@c_sxf_xt,
					    c_x_gs=@c_sxf
				where c_bd =@c_bd and c_bdnd=@c_bdnd    
			end					 
			fetch next from c_temp2 into  @c_bd,@c_jobnm,@c_bdnd,@c_bxf,@c_sxf
		end
		close c_temp2
		deallocate  c_temp2	
		select 	* from #t_temp2 order by c_type		
		drop table #t_temp2
	end 		
return 0
go
--���ս������
if exists(select name from sysobjects where name='p_sxjs')
	drop procedure p_sxjs
go
create procedure p_sxjs	
	@c_orgid	int,				--����
	@c_sjlx		int,				--1 ���� ��2 ����
	@c_companyid	int,				--���չ�˾����
	@c_year		int,				--��
	@c_month	int, 				--�� 
	@c_bd		char(30),			--������ 
	@c_bdnd		int,			
	@c_operator	char(20),			--����Ա
	@c_ip		char(25) 			--����Աip
as
declare	@c_hdny		char(6),		--�˶����� 
	@c_datime	datetime,		--����ʱ��  
	@c_sql		char(200)		-- 	  
	if   @c_sjlx=1		--����
	begin	
		if exists ( select c_bd from t_sxdz
			where   c_orgid=@c_orgid and c_companyid=@c_companyid and c_year=@c_year and c_month=@c_month and c_jobnm not in ('0','solve') )
		begin
			raiserror ('���󱨸�δ��գ����ܽ���', 16, 1)
			return @@error
		end	 
		if @c_month>9
		begin
			set @c_hdny=str(@c_year,4)+str(@c_month,2)
		end
		else
		begin
			set @c_hdny=str(@c_year,4)+'0'+str(@c_month,1)
		end 						 
		select 	distinct b.c_bd into #t_sxjs1
		from 	t_sxtb a,t_sxbd b 
		where   a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and b.c_orgid=@c_orgid
			and b.c_companyid=@c_companyid and b.c_bd=@c_bd and a.c_check is not null
		declare c_sxjs1 cursor for		
		select 	c_bd from #t_sxjs1
		open c_sxjs1
		fetch next from c_sxjs1 into @c_bd 		
		while	(@@fetch_status = 0)
		begin		
			update t_sxdz set c_jobnm='solve'	
				where c_companyid=@c_companyid and c_bd=@c_bd 			
			update t_sxtb set c_solve=@c_hdny	
				where c_companyid=@c_companyid and c_bd=@c_bd 
			delete t_sxjs where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=1	
			insert t_sxjs
			(
				c_orgid ,	-- ����
				c_year ,	-- �� 
				c_month ,	-- ��  
				c_companyid ,	-- ���չ�˾
				c_bd ,		-- ����  
				c_productid,	-- ����
				c_bdnd ,	-- �������  
				c_bxf ,		-- ���շ�  
				c_bxfr1 ,	-- �������
				c_bxfr2 ,	-- ֧������
				c_bxfy1 ,	-- ����
				c_bxfy2 , 	-- ֧��  
				c_operator,
				c_ip
			)
			select 	@c_orgid ,	-- ����
				@c_year ,	-- �� 
				@c_month ,	-- ��  
				@c_companyid ,	-- ���չ�˾
				@c_bd ,		-- ����  
				c_productid,	-- ����
				1 ,		-- �������  
				c_bxf ,		-- ���շ�  
				c_bxfr1 ,	-- �������
				c_bxfr2 ,	-- ֧������
				c_bxfy1 ,	-- ����
				c_bxfy2 , 	-- ֧��  
				@c_operator,
				@c_ip
			from t_sxtb where c_companyid=@c_companyid and c_bd=@c_bd 
			fetch next from c_sxjs1 into @c_bd 			
		end
		close c_sxjs1
		deallocate c_sxjs1	
		drop table #t_sxjs1		 				
	end	
	--------------------------------------------------------------------------------------------------------------------------
	if   @c_sjlx=2		--����
	begin	
		if exists ( select c_bd from t_sxdz_xq
			where   c_orgid=@c_orgid and c_companyid=@c_companyid and c_year=@c_year and c_month=@c_month and c_jobnm not in ('0','solve') )
		begin
			raiserror ('���󱨸�δ��գ����ܽ���', 16, 1)
			return @@error
		end	 
		if @c_month>9
		begin
			set @c_hdny=str(@c_year,4)+str(@c_month,2)
		end
		else
		begin
			set @c_hdny=str(@c_year,4)+'0'+str(@c_month,1)
		end 						 
		select 	distinct b.c_bd,a.c_bdnd into #t_sxjs2
		from 	t_sxtb_xq a,t_sxbd b 
		where   a.c_companyid=b.c_companyid and a.c_bd=b.c_bd and b.c_orgid=@c_orgid
			and b.c_companyid=@c_companyid and b.c_bd=@c_bd and a.c_bdnd=@c_bdnd and a.c_check is not null
		declare c_sxjs1 cursor for		
		select 	c_bd,c_bdnd from #t_sxjs2
		open c_sxjs1
		fetch next from c_sxjs1 into @c_bd,@c_bdnd		
		while	(@@fetch_status = 0)
		begin		
			update t_sxdz_xq set c_jobnm='solve'	
				where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd			
			update t_sxtb_xq set c_solve=@c_hdny	
				where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd
			delete t_sxjs where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd	
			insert t_sxjs
			(
				c_orgid ,	-- ����
				c_year ,	-- �� 
				c_month ,	-- ��  
				c_companyid ,	-- ���չ�˾
				c_bd ,		-- ����  
				c_productid,	-- ����
				c_bdnd ,	-- �������  
				c_bxf ,		-- ���շ�  
				c_bxfr1 ,	-- �������
				c_bxfr2 ,	-- ֧������
				c_bxfy1 ,	-- ����
				c_bxfy2 , 	-- ֧��  
				c_operator,
				c_ip
			)
			select 	@c_orgid ,	-- ����
				@c_year ,	-- �� 
				@c_month ,	-- ��  
				@c_companyid ,	-- ���չ�˾
				@c_bd ,		-- ����  
				c_productid,	-- ����
				@c_bdnd,	-- �������  
				c_bxf ,		-- ���շ�  
				c_bxfr1 ,	-- �������
				c_bxfr2 ,	-- ֧������
				c_bxfy1 ,	-- ����
				c_bxfy2 , 	-- ֧��  
				@c_operator,
				@c_ip
			from t_sxtb_xq where c_companyid=@c_companyid and c_bd=@c_bd and c_bdnd=@c_bdnd	
			fetch next from c_sxjs1 into @c_bd,@c_bdnd			
		end
		close c_sxjs1
		deallocate c_sxjs1	
		drop table #t_sxjs2		 				
	end
return 0
go
--ʹ�����ʹ���
if exists(select name from sysobjects where name='p_usage')
	drop procedure p_usage
go
create procedure p_usage
	@c_no int , 
	@c_system int ,
	@c_name char (50) ,  
	@c_jobnm char (10) ,
	@c_operator char(20),	
	@c_ip char (25)   
as
declare	@c_datime	datetime	--����ʱ�� 
	set @c_datime=getdate()
	if @c_jobnm='add'
	begin 		
		insert  t_usage
		(  
			c_system,
			c_name,  
			c_jobnm,
			c_operator,
			c_ip
		)
		values
		(  
			@c_system,
			@c_name,  
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end 
	if @c_jobnm='update'
	begin
		update t_usage set c_name=@c_name,
				c_jobnm=@c_jobnm,
				c_operator=@c_operator,
				c_datime=@c_datime,
				c_ip=@c_ip   
			where c_no=@c_no
	end
	if @c_jobnm='del'
	begin
		delete t_usage  where c_no=@c_no
	end 
return 0
go
--�������ʹ���
if exists(select name from sysobjects where name='p_crate')
	drop procedure p_crate
go
create procedure p_crate
	@c_no int , 
	@c_orgid int,		--����
	@c_usageid int,		--ʹ������id
	@c_companyid int ,
	@c_productid int , 
	@c_type int ,
	@c_ksrq char (8) , 
	@c_rate decimal(9, 4),  
	@c_jobnm char (10),
	@c_operator char (20),
	@c_ip char (25)
as
declare @c_datime	datetime  
	set @c_datime=getdate()	
	if @c_jobnm='add'
	begin 
		if not (isdate(@c_ksrq)=1 and len(@c_ksrq)=8)
		begin
			raiserror ('��ʼ���ڸ�ʽ����!', 16, 1)
			return @@error
		end
		if exists(select * from t_crate where c_orgid=@c_orgid and c_usageid=@c_usageid 
			and c_companyid=@c_companyid and c_productid=@c_productid and c_type<>@c_type)
		begin
			raiserror ('���������ݵ����ڱ���Ψһָ��������', 16, 1)
			return @@error
		end
		insert t_crate  
		( 
			c_orgid,
			c_usageid,
			c_companyid,
			c_productid, 
			c_type,
			c_ksrq,
			c_rate, 		
			c_jobnm,
			c_operator,
			c_ip 
		)
		values
		( 
			@c_orgid,
			@c_usageid,
			@c_companyid,
			@c_productid, 
			@c_type,
			@c_ksrq,
			@c_rate, 
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end	
	if @c_jobnm='update'
	begin 
		update t_crate set
			c_rate=@c_rate, 	 
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,
			c_datime=@c_datime,
			c_ip=@c_ip		 
		where 	c_no=@c_no
	end	  	
	if @c_jobnm='del'
	begin
		delete t_crate where 	c_no=@c_no
	end 	
return 0
go 
--����˰�����������
if exists(select name from sysobjects where name='p_ctax')
	drop procedure p_ctax
go
create procedure p_ctax
	@c_no int , 
	@c_orgid int,		--����
	@c_usageid int,		--ʹ������id
	@c_companyid int ,
	@c_productid int , 
	@c_type int ,
	@c_ksrq char (8) , 
	@c_rate decimal(9, 4),  
	@c_jobnm char (10),
	@c_operator char (20),
	@c_ip char (25)
as
declare @c_datime	datetime  
	set @c_datime=getdate()	
	if @c_jobnm='add'
	begin 
		if not (isdate(@c_ksrq)=1 and len(@c_ksrq)=8)
		begin
			raiserror ('��ʼ���ڸ�ʽ����!', 16, 1)
			return @@error
		end
		if exists(select * from t_ctax where c_orgid=@c_orgid and c_usageid=@c_usageid 
			and c_companyid=@c_companyid and c_productid=@c_productid and c_type<>@c_type)
		begin
			raiserror ('���������ݵ����ڱ���Ψһָ��������', 16, 1)
			return @@error
		end
		insert t_ctax  
		( 
			c_orgid,
			c_usageid,
			c_companyid,
			c_productid, 
			c_type,
			c_ksrq,
			c_rate, 			
			c_jobnm,
			c_operator,
			c_ip 
		)
		values
		( 
			@c_orgid,
			@c_usageid,
			@c_companyid,
			@c_productid, 
			@c_type,
			@c_ksrq,
			@c_rate, 
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end	
	if @c_jobnm='update'
	begin 
		update t_ctax set
			c_rate=@c_rate, 	 
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,
			c_datime=@c_datime,
			c_ip=@c_ip		 
		where 	c_no=@c_no
	end	  	
	if @c_jobnm='del'
	begin
		delete t_ctax where 	c_no=@c_no
	end 	
return 0
go 
--Ӷ���ʹ���
if exists(select name from sysobjects where name='p_expcrate')
	drop procedure p_expcrate
go
create procedure p_expcrate
	@c_no int , 
	@c_orgid int,		--����
	@c_usageid int,		--ʹ������id
	@c_companyid int ,
	@c_productid int , 
	@c_type int ,
	@c_ksrq char (8) , 
	@c_rate decimal(9, 4),  
	@c_jobnm char (10),
	@c_operator char (20),
	@c_ip char (25)
as
declare @c_datime	datetime  
	set @c_datime=getdate()	
	if @c_jobnm='add'
	begin 
		if not (isdate(@c_ksrq)=1 and len(@c_ksrq)=8)
		begin
			raiserror ('��ʼ���ڸ�ʽ����!', 16, 1)
			return @@error
		end
		if exists(select * from t_expcrate where c_orgid=@c_orgid and c_usageid=@c_usageid 
			and c_companyid=@c_companyid and c_productid=@c_productid and c_type<>@c_type)
		begin
			raiserror ('���������ݵ����ڱ���Ψһָ��������', 16, 1)
			return @@error
		end
		insert t_expcrate  
		( 
			c_orgid,
			c_usageid,
			c_companyid,
			c_productid, 
			c_type,
			c_ksrq,
			c_rate, 		
			c_jobnm,
			c_operator,
			c_ip 
		)
		values
		( 
			@c_orgid,
			@c_usageid,
			@c_companyid,
			@c_productid, 
			@c_type,
			@c_ksrq,
			@c_rate, 
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end	
	if @c_jobnm='update'
	begin 
		update t_expcrate set
			c_rate=@c_rate, 	 
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,
			c_datime=@c_datime,
			c_ip=@c_ip		 
		where 	c_no=@c_no
	end	  	
	if @c_jobnm='del'
	begin
		delete t_expcrate where 	c_no=@c_no
	end 	
return 0
go 
--����˰֧����������
if exists(select name from sysobjects where name='p_expctax')
	drop procedure p_expctax
go
create procedure p_expctax
	@c_no int , 
	@c_orgid int,		--����
	@c_usageid int,		--ʹ������id
	@c_companyid int ,
	@c_productid int , 
	@c_type int ,
	@c_ksrq char (8) , 
	@c_rate decimal(9, 4),  
	@c_jobnm char (10),
	@c_operator char (20),
	@c_ip char (25)
as
declare @c_datime	datetime  
	set @c_datime=getdate()	
	if @c_jobnm='add'
	begin 
		if not (isdate(@c_ksrq)=1 and len(@c_ksrq)=8)
		begin
			raiserror ('��ʼ���ڸ�ʽ����!', 16, 1)
			return @@error
		end
		if exists(select * from t_expctax where c_orgid=@c_orgid and c_usageid=@c_usageid 
			and c_companyid=@c_companyid and c_productid=@c_productid and c_type<>@c_type)
		begin
			raiserror ('���������ݵ����ڱ���Ψһָ��������', 16, 1)
			return @@error
		end
		insert t_expctax  
		( 
			c_orgid,
			c_usageid,
			c_companyid,
			c_productid, 
			c_type,
			c_ksrq,
			c_rate, 		
			c_jobnm,
			c_operator,
			c_ip 
		)
		values
		( 
			@c_orgid,
			@c_usageid,
			@c_companyid,
			@c_productid, 
			@c_type,
			@c_ksrq,
			@c_rate, 
			@c_jobnm,
			@c_operator,
			@c_ip 
		)
	end	
	if @c_jobnm='update'
	begin 
		update t_expctax set
			c_rate=@c_rate, 	 
			c_jobnm=@c_jobnm,
			c_operator=@c_operator,
			c_datime=@c_datime,
			c_ip=@c_ip		 
		where 	c_no=@c_no
	end	  	
	if @c_jobnm='del'
	begin
		delete t_expctax where 	c_no=@c_no
	end 	
return 0
go 
--����Ԥ��Ӷ�����
if exists(select name from sysobjects where name='p_cxytyj')
	drop procedure p_cxytyj
go
create procedure p_cxytyj
	@c_no int ,
	@c_orgid int ,				-- ����
	@c_companyid int ,			-- ���չ�˾  
	@c_ffrq char(8) ,			-- �������� 	
	@c_bd char (30) ,			-- ����  	
	@c_jobnm char (10)  ,
	@c_operator char(10)  , 
	@c_ip char (25)  
as
declare @c_datime	datetime  
	set @c_datime=getdate()	
	if @c_jobnm='add'
	begin 
		if not (isdate(@c_ffrq)=1 and len(@c_ffrq)=8)
		begin
			raiserror ('�������ڸ�ʽ����!', 16, 1)
			return @@error
		end		 
		insert t_cxytyj
		( 
			c_orgid ,		-- ����
			c_companyid ,		-- ���չ�˾ 
			c_ffrq ,		-- ��������			
			c_productid , 		-- ��Ʒid
			c_bd ,			-- ����  
			c_bxf ,			-- ���շ�
			c_ccs ,			-- ����˰
			c_bxfr2 ,		-- Ӷ�����
			c_bxfy2 ,		-- Ӷ��
			c_ccsr2 ,		-- ֧��˰����
			c_ccsy2 ,		-- ֧��˰	  
			c_jobnm ,
			c_operator , 
			c_ip 
		)
		select	@c_orgid ,		-- ����
			@c_companyid ,		-- ���չ�˾ 
			@c_ffrq ,		-- �������� 			
			c_productid , 		-- ��Ʒid
			@c_bd ,			-- ����  
			c_bxf ,			-- ���շ�
			c_ccs ,			-- ����˰ 
			c_bxfr2 ,		-- Ӷ����� 
			c_bxfy2 ,		-- Ӷ�� 
			c_ccsr2 ,		-- ֧��˰���� 
			c_ccsy2 ,		-- ֧��˰	  
			@c_jobnm ,
			@c_operator , 
			@c_ip 
		from t_cxbd where c_companyid=@c_companyid and c_bd=@c_bd		
	end	
	if @c_jobnm='del'
	begin
		delete t_cxytyj where 	c_companyid=@c_companyid and c_bd=@c_bd	
	end 		
return 0
go 
--��������Ӷ��������ݼ������
if exists(select name from sysobjects where name='p_cxsqjs')
	drop procedure p_cxsqjs
go
create procedure p_cxsqjs
	@c_companyid int ,			--���չ�˾
	@c_bd char (30) ,			--������
	@c_productid int , 			--����id 
	@c_bxfr1	decimal(7,3) output,	--����Ӷ�����
	@c_bxfr2	decimal(7,3) output,	--֧��Ӷ�����
	@c_ccsr1	decimal(7,3) output,	--˰����Ӷ�����
	@c_ccsr2	decimal(7,3) output,	--˰֧��Ӷ�����
	@c_bxfy1	decimal(15,3) output,	--����Ӷ��
	@c_bxfy2	decimal(15,3) output,	--֧��Ӷ��	
	@c_ccsy1	decimal(15,3) output,	--˰����Ӷ��
	@c_ccsy2	decimal(15,3) output	--˰֧��Ӷ��		
as
declare @c_lrrq char (8)   , 			-- ǩ������
	@c_cbrq char (8)   , 			-- ������	
	@c_type int,		--���� 1 ǩ������ 2 ������
	@c_orgid_sq int ,	--����
	@c_usageid int ,	--ʹ������	
	@c_system_sq int,	--������ϵ 
	@c_bxf decimal(15,2),	--����
	@c_ccs decimal(15,2)	--����˰
	select @c_bxfr1=0,@c_bxfr2=0,@c_bxfy1=0,@c_bxfy2=0,@c_bxf=0,@c_ccs=0
	select @c_ccsr1=0,@c_ccsr2=0,@c_ccsy1=0,@c_ccsy2=0 
	
	select @c_bxf=c_bxf,@c_ccs=c_ccs,@c_orgid_sq=c_orgid_sq,@c_usageid=c_usageid,@c_lrrq=c_lrrq,@c_cbrq=c_cbrq 
		from t_cxbd where c_companyid=@c_companyid and c_bd=@c_bd and c_productid=@c_productid	
	-----------------------------------------��������
	set @c_type=0
	select top 1 @c_type=c_type from t_crate
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid order by c_ksrq desc			
	--����ǩ������		
	if @c_type = 1
	begin
		select top 1 @c_bxfr1=c_rate from t_crate
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid and c_ksrq<=@c_lrrq order by c_ksrq desc	
	end 
	--����������		
	if @c_type = 2
	begin
		select top 1 @c_bxfr1=c_rate from t_crate
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid and c_ksrq<=@c_cbrq order by c_ksrq desc	
	end  
	-----------------------------------------Ӷ����
	set @c_type=0
	select top 1 @c_type=c_type from t_expcrate
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid order by c_ksrq desc			
	--����ǩ������		
	if @c_type = 1
	begin
		select top 1 @c_bxfr2=c_rate from t_expcrate
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid and c_ksrq<=@c_lrrq order by c_ksrq desc	
	end 
	--����������		
	if @c_type = 2
	begin
		select top 1 @c_bxfr2=c_rate from t_expcrate
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid and c_ksrq<=@c_cbrq order by c_ksrq desc	
	end  
	------------------------------------------����˰������
	set @c_type=0
	select top 1 @c_type=c_type from t_ctax
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid order by c_ksrq desc			
	--����ǩ������		
	if @c_type = 1
	begin
		select top 1 @c_ccsr1=c_rate from t_ctax
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid and c_ksrq<=@c_lrrq order by c_ksrq desc	
	end 
	--����������		
	if @c_type = 2
	begin
		select top 1 @c_ccsr1=c_rate from t_ctax
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid and c_ksrq<=@c_cbrq order by c_ksrq desc	
	end  
	------------------------------------------����˰֧����
	set @c_type=0
	select top 1 @c_type=c_type from t_expctax
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid order by c_ksrq desc			
	--����ǩ������		
	if @c_type = 1
	begin
		select top 1 @c_ccsr2=c_rate from t_expctax
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid and c_ksrq<=@c_lrrq order by c_ksrq desc	
	end 
	--����������		
	if @c_type = 2
	begin
		select top 1 @c_ccsr2=c_rate from t_expctax
		where c_orgid=@c_orgid_sq and c_usageid=@c_usageid
			and c_companyid=@c_companyid and c_productid=@c_productid and c_ksrq<=@c_cbrq order by c_ksrq desc	
	end  
	 
	select @c_bxfy1=@c_bxf*@c_bxfr1,@c_bxfy2=@c_bxf*@c_bxfr2 	 
 	select @c_ccsy1=@c_ccs*@c_ccsr1,@c_ccsy2=@c_ccs*@c_ccsr2 		 	 
return 0
go
--��������Ӷ��������ݼ������
if exists(select name from sysobjects where name='p_cxsqjs2')
	drop procedure p_cxsqjs2
go
create procedure p_cxsqjs2
	@c_companyid int ,		--���չ�˾
	@c_bd char (30) 		--������ 
as	
declare	@c_no 		int,		--�Զ����
	@c_bxf		decimal(15,2),	--���շ�
	@c_productid 	int , 		--����id  
	@c_bxfr1	decimal(7,3) ,	--����Ӷ�����
	@c_bxfr2	decimal(7,3) ,	--֧��Ӷ�����
	@c_ccsr1	decimal(7,3) ,	--˰����Ӷ�����
	@c_ccsr2	decimal(7,3) ,	--˰֧��Ӷ�����
	@c_bxfy1	decimal(15,3) ,	--����Ӷ��
	@c_bxfy2	decimal(15,3) ,	--֧��Ӷ��	
	@c_ccsy1	decimal(15,3) ,	--˰����Ӷ��
	@c_ccsy2	decimal(15,3) 	--˰֧��Ӷ��	
	
	declare c_cxyjjs cursor for
	select 	c_no,c_productid
	from 	t_cxbd
	where   c_companyid=@c_companyid and c_bd=@c_bd 
	open	c_cxyjjs
	fetch	next from c_cxyjjs into @c_no,@c_productid
	while	(@@fetch_status = 0)
	begin 	 						
		exec p_cxsqjs
			@c_companyid	,	--���չ�˾����
			@c_bd		,	--Ͷ������� 
			@c_productid 	,	--����id 
			@c_bxfr1	output,	--����Ӷ�����
			@c_bxfr2	output,	--֧��Ӷ�����
			@c_ccsr1	output,	--˰����Ӷ�����
			@c_ccsr2	output,	--˰֧��Ӷ�����
			@c_bxfy1	output,	--����Ӷ��
			@c_bxfy2	output,	--֧��Ӷ��
			@c_ccsy1	output,	--˰����Ӷ��
			@c_ccsy2	output	--˰֧��Ӷ��
						
		update 	t_cxbd set 			
			c_bxfr1=@c_bxfr1,	--����Ӷ�����
			c_bxfr2=@c_bxfr2,	--֧��Ӷ�����
			c_ccsr1=@c_ccsr1,	--˰����Ӷ�����
			c_ccsr2=@c_ccsr2,	--˰֧��Ӷ�����
			c_bxfy1=@c_bxfy1,	--����Ӷ��1
			c_bxfy2=@c_bxfy2,	--֧��Ӷ��1
			c_ccsy1=@c_ccsy1,	--˰����Ӷ��1
			c_ccsy2=@c_ccsy2	--˰֧��Ӷ��1							 
		where 	c_no=@c_no		  	
	fetch	next from c_cxyjjs into @c_no,@c_productid
	end							
	close c_cxyjjs
	deallocate c_cxyjjs
return 0
go