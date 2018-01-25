/*

���ն���
1.	���չ�˾���ݣ�ǩ�����ڻ������ڣ� ���͵��£�yyyyMM���������ݵ�excel��
2.	excel���а��� ���Ѻͳ���˰ 2��������

*/
  
--���ն��˹���
if exists(select name from sysobjects where name='p_cxdz')
	drop procedure p_cxdz
go
create procedure p_cxdz
	@c_orgid	int,				--����
	@c_sjlx		int,				--1 ���� 
	@c_companyid	int,				--���չ�˾����
	@c_year		int,				--��
	@c_month	int,				--��
	@c_operator	char(20),			--����Ա
	@c_ip		char(25) 			--����Աip
as
declare @c_hdny		char(6),			--�˶�����  
	@c_bd		char(30),			--������ 
	@c_bxf		decimal(15,2),			--����
	@c_ccs		decimal(15,2),			--����˰
	@c_sxf		decimal(15,2),			--����Ӷ��   
	@c_bxf_xt	decimal(15,2),			--��Ȼ���� 
	@c_sxf_xt	decimal(15,2)			--����Ӷ��	 
	 			
	if @c_sjlx=1	--���ں˶�
	begin			
		if not exists(select * from t_cxdz where c_orgid=@c_orgid and c_companyid=@c_companyid and c_year=@c_year and c_month=@c_month) 
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
		--
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
			if exists(select * from t_sxbd where c_orgid=@c_orgid and c_companyid=@c_companyid and c_bd=@c_bd and c_jobnm in('0','5') ) 								  
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
return 0
go