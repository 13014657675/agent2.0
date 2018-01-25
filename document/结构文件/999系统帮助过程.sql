--ȡ�������
if exists(select name from sysobjects where name='pg_age')
	drop proc pg_age
go
create procedure pg_age
	@c_birthy	int,		--��
	@c_birthm	int,		--��
	@c_birthd	int,		--��
	@c_age		int output	--����
as
declare @c_birthy_temp	int,		--��
	@c_birthm_temp	int,		--��
	@c_birthd_temp	int		--��
	select @c_birthy_temp=datepart(year, getdate()),@c_birthm_temp=datepart(month, getdate()),@c_birthd_temp=datepart(day, getdate())	
	if @c_birthm >= @c_birthm_temp
	begin
		if @c_birthd >= @c_birthd_temp
		begin
			select @c_age=@c_birthy_temp-@c_birthy-1
		end
		else
		begin
			select @c_age=@c_birthy_temp-@c_birthy
		end
	end
	else
	begin
		select @c_age=@c_birthy_temp-@c_birthy
	end  
	select @c_age c_age
return 0
go 
--�������¼��㱣�����۱��Ӷ��
if exists(select name from sysobjects where name='help_sxsjjs')
	drop procedure help_sxsjjs
go
create procedure help_sxsjjs	
as	
declare	@id int,		--�Զ����
	@c_companyid int ,	-- ���չ�˾
	@c_bdnd int,
	@c_bd char (30),  	-- ������
	@c_tbd char (30)  	-- Ͷ������
	--�������¼���
	select 	distinct c_companyid,c_tbd into #t_bdxx01
	from	t_sxbd 
	 
	declare c_xzdm1 cursor for
	select 	distinct c_companyid,c_tbd
	from	#t_bdxx01
	open	c_xzdm1
	fetch	next from c_xzdm1 into @c_companyid,@c_tbd
	while	(@@FETCH_STATUS = 0)
	begin
		exec p_sxsqjs2  @c_companyid,@c_tbd
		fetch	next from c_xzdm1 into @c_companyid,@c_tbd
	end
	close c_xzdm1
	deallocate c_xzdm1	
	drop table #t_bdxx01	 
	--�������¼��� 
	select 	distinct c_companyid,c_bd,c_bdnd into #t_bdxx02
	from	t_sxtb_xq 
	 
	declare c_xzdm1 cursor for
	select 	distinct c_companyid,c_bd,c_bdnd
	from	#t_bdxx02
	open	c_xzdm1
	fetch	next from c_xzdm1 into @c_companyid,@c_bd,@c_bdnd
	while	(@@FETCH_STATUS = 0)
	begin
		exec p_sxxqjs2  @c_companyid,@c_bd,@c_bdnd
		fetch	next from c_xzdm1 into @c_companyid,@c_bd,@c_bdnd
	end
	close c_xzdm1
	deallocate c_xzdm1	
	drop table #t_bdxx02
return 0
go	
--�������¼��㱣�����۱��Ӷ��
if exists(select name from sysobjects where name='help_cxsqjs')
	drop procedure help_cxsqjs
go
create procedure help_cxsqjs	
as	
declare	@c_no 		int,		--�Զ����
	@c_companyid    int ,		--���չ�˾
	@c_bd 		char (30) 	--������ 	 
	declare help_cxyjjs cursor for
	select 	c_companyid,c_bd
	from 	t_cxbd 	
	open	help_cxyjjs
	fetch	next from help_cxyjjs into @c_companyid,@c_bd
	while	(@@fetch_status = 0)
	begin 	 						
		exec p_cxsqjs2
			@c_companyid	,	--���չ�˾����
			@c_bd			--Ͷ������� 			 		  	
	fetch	next from help_cxyjjs into @c_companyid,@c_bd
	end							
	close help_cxyjjs
	deallocate help_cxyjjs
return 0
go