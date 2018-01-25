--�������޸Ļ�������
if exists(select name from sysobjects where name='p_agent_org')
	drop procedure p_agent_org
go
create procedure p_agent_org 
	@c_orgid int ,				--����id
	@c_jobnumber char (10) ,		--����
	@o_orgid int ,				--Ŀ�����id 
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
--��˾�����˻ָ����Ź���
if exists(select name from sysobjects where name='p_agent_back')
	drop procedure p_agent_back
go
create procedure p_agent_back
	@c_orgid int ,				--����id
	@c_jobnumber char (10) ,		--����
	@o_orgid int ,				--Ŀ�����id 
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
--�������ܹ��Ź���
if exists(select name from sysobjects where name='p_director')
	drop procedure p_director
go
create procedure p_director 
	@i_jobnumber	char(10),	--����	
	@i_system	int,		--����
	@i_type		int,		--���ŵ�ְ�� 	
	@o_jobnumber	char(10) output	--���ܹ���
	
as
declare	@c_tjrgh	char(10),	--����  
	@c_ycgh		char(10),	--����  
	@c_level 	int 	 
	if @i_system=1	--ֱӪ��ҵ��
	begin
		select @c_level=c_level from t_pzjdy where c_system=@i_system and c_type=@i_type
		if @c_level = 1
		begin
			--ԭ��������
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
			--ԭ�������˵��ϼ�����
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
	if @i_system=2	--����������ҵ��
	begin
		set @o_jobnumber='0000000000'	 
		return 0
	end 
	if @i_system=11	--������ҵ��
	begin
		set @o_jobnumber='0000000000'	 
		return 0
	end 
return 0
go
--ѪԵ��ϵ��ӹ���
if exists(select name from sysobjects where name='p_relation')
	drop procedure p_relation
go
create procedure p_relation 
	@c_orgid 	int , 		--����id 
	@c_jobnumber	char(10),	--����	
	@c_system	int,		--����
	@c_tjrgh	char(10),	--�Ƽ��˹��� 
	@c_ksrq		char(8),	--��ʼ���� 
	@c_jobnm	char(10),	--
	@c_operator 	char(10),	
	@c_ip 		char(25)
as
declare @c_type		int,		--ְ��	 
	@c_director	char(10),	--���ܹ���	
 	@c_sql		char(500)  
 	if not (isdate(@c_ksrq)=1 and len(@c_ksrq)=8)
	begin
		raiserror ('��ʼ���ڸ�ʽ����!', 16, 1)
		return @@error
	end	
	--���ѪԵ��ϵ
	if @c_jobnm='add' 	
	begin 
		select @c_type=min(c_type) from t_pzjdy	where c_system=@c_system   
		if exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0')
		begin
			raiserror ('�����˹��ţ�%s �����ѪԵ��ϵ', 16, 1,@c_jobnumber)
			return @@error
		end	 
		if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_tjrgh and c_flag='0' )
			and @c_tjrgh<>'0000000000'
		begin	
			raiserror ('�Ƽ��˹��ţ�%s ��Ч', 16, 1,@c_tjrgh)
			return @@error		 
		end	 	  
		begin transaction tr_xyadd 		 
		update  t_agentset set c_flag='1'
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
			insert  t_agentset
			( 
				c_orgid,			--����id  
				c_system,			--������ϵ  	
				c_jobnumber,			--����
				c_tjrgh,			--�Ƽ��˹���
				c_type,				--ְ��
				c_jobnm,
				c_operator,
				c_ip 
			)	
			values
			( 
				@c_orgid,			--����id  
				@c_system,			--������ϵ  	
				@c_jobnumber,			--����
				@c_tjrgh,			--�Ƽ��˹���
				@c_type,			--ְ��
				@c_jobnm,
				@c_operator,
				@c_ip 
			)	
			if @@error <>0
			begin
				rollback transaction tr_xyadd
				raiserror ('���ѪԵ��ϵ����', 16, 1)
				return @@error 
			end 		
			set @c_director=null				
			exec p_director  @c_jobnumber,@c_system,@c_type,@c_director output	 		
			if @c_director ='1111111111'
			begin			
				rollback transaction tr_xyadd
				raiserror ('�����˹��ţ�%s �����ܲ�����', 16, 1,@c_jobnumber)	 			
				return @@error
			end		 
			update  t_agentls set c_flag='1'
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
			insert t_agentls
			(
				c_orgid ,	--����
				c_system ,	--������ϵ  	
				c_jobnumber ,	--����
				c_type ,	--ְ��
				c_director ,	--�ϼ�����
				c_ksrq , 
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(
				@c_orgid ,	--����
				@c_system ,	--������ϵ  	
				@c_jobnumber ,	--����
				@c_type ,	--ְ��
				@c_director ,	--�ϼ�����
				@c_ksrq , 
				@c_jobnm,
				@c_operator ,
				@c_ip 
			)
			if @@error <>0
			begin
				rollback transaction tr_xyadd
				raiserror ('���ѪԵ��ϵ����', 16, 1)
				return @@error 
			end 	
			--ɾ�����ɹ�ϵ
			delete t_agentgx
				where c_system=@c_system and c_ycgh=@c_jobnumber or c_bycgh=@c_jobnumber	 	
			if @@error <>0
			begin 
				rollback transaction tr_xyadd
				raiserror ('ɾ�����ɹ�ϵ����', 16, 1)
				return @@error 
			end 	   	 		 		 
		commit transaction tr_xyadd	  
	end
	--�޸�ѪԵ��ϵ
	if @c_jobnm='update'	
	begin 
		select @c_type=min(c_type) from t_pzjdy	where c_system=@c_system    
		if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_tjrgh and c_flag='0' )
			and @c_tjrgh<>'0000000000'
		begin	
			raiserror ('�Ƽ��˹��ţ�%s ��Ч', 16, 1,@c_tjrgh)
			return @@error		 
		end	 	  
		begin transaction tr_xyadd 		
			update  t_agentset set c_flag='1'
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
			insert  t_agentset
			( 
				c_orgid,			--����id  
				c_system,			--������ϵ  	
				c_jobnumber,			--����
				c_tjrgh,			--�Ƽ��˹���
				c_type,				--ְ��
				c_jobnm,
				c_operator,
				c_ip 
			)	
			values
			( 
				@c_orgid,			--����id  
				@c_system,			--������ϵ  	
				@c_jobnumber,			--����
				@c_tjrgh,			--�Ƽ��˹���
				@c_type,			--ְ��
				@c_jobnm,
				@c_operator,
				@c_ip 
			)	
			if @@error <>0
			begin
				rollback transaction tr_xyadd
				raiserror ('���ѪԵ��ϵ����', 16, 1)
				return @@error 
			end 		
			set @c_director=null				
			exec p_director  @c_jobnumber,@c_system,@c_type,@c_director output	 		
			if @c_director ='1111111111'
			begin			
				rollback transaction tr_xyadd
				raiserror ('�����˹��ţ�%s �����ܲ�����', 16, 1,@c_jobnumber)	 			
				return @@error
			end		 
			update  t_agentls set c_flag='1'
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
			insert  t_agentls
			(
				c_orgid ,	--����
				c_system ,	--������ϵ  	
				c_jobnumber ,	--����
				c_type ,	--ְ��
				c_director ,	--�ϼ�����
				c_ksrq , 
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(
				@c_orgid ,	--����
				@c_system ,	--������ϵ  	
				@c_jobnumber ,	--����
				@c_type ,	--ְ��
				@c_director ,	--�ϼ�����
				@c_ksrq , 
				@c_jobnm,
				@c_operator ,
				@c_ip 
			)
			if @@error <>0
			begin
				rollback transaction tr_xyadd
				raiserror ('���ѪԵ��ϵ����', 16, 1)
				return @@error 
			end 	 		 
			--ɾ�����ɹ�ϵ
			delete t_agentgx
				where c_system=@c_system and c_bycgh=@c_jobnumber	 	
			if @@error <>0
			begin 
				rollback transaction tr_xyadd
				raiserror ('ɾ�����ɹ�ϵ����', 16, 1)
				return @@error 
			end 	   				 
		commit transaction tr_xyadd
	end	
return 0
go
--�����������˵Ĺ�ϵ����
if exists(select name from sysobjects where name='p_ycgx')
	drop procedure p_ycgx
go
create procedure p_ycgx 
	@i_jobnumber_base char(10),	--��������	
	@i_jobnumber	  char(10),	--����	
	@i_system	  int,		--����
	@i_type		  int,		--���ŵ�ְ�� 	
	@c_operator 	  char(10),	
	@c_ip 		  char(25)  
as
declare	@c_errors	int,	 
	@c_director	char(10),	--����		
	@c_level int   	 	
	if @i_system=1	--ֱӪ
	begin
		select @c_level=c_level from t_pzjdy where c_system=@i_system and c_type=@i_type
		if @c_level = 2	--������
		begin 
			select  @c_director=c_director from t_agentls where c_system=@i_system and c_jobnumber=@i_jobnumber and c_flag='0' 
			insert t_agentgx	--һ��
			(
				c_system ,		--������ϵ  	
				c_layer ,		--���� 
				c_ycgh ,		--�����˹���
				c_byczj ,		--��������ְ��
				c_bycgh ,		--�������˹���  
				c_operator , 
				c_ip 
			)
			values
			(
				@i_system ,		--������ϵ  	
				1,			--���� 
				@c_director ,		--�����˹���
				@i_type ,		--��������ְ��
				@i_jobnumber ,		--�������˹���  
				@c_operator , 
				@c_ip 
			)						
		end 	
		if @c_level = 3	--������
		begin		 
			select  @c_director=c_director from t_agentls where c_system=@i_system and c_jobnumber=@i_jobnumber and c_flag='0' 
			insert t_agentgx	--һ��
			(
				c_system ,		--������ϵ  	
				c_layer ,		--���� 
				c_ycgh ,		--�����˹���
				c_byczj ,		--��������ְ��
				c_bycgh ,		--�������˹���  
				c_operator , 
				c_ip 
			)
			values
			(
				@i_system ,		--������ϵ  	
				1,			--���� 
				@c_director ,		--�����˹���
				@i_type ,		--��������ְ��
				@i_jobnumber ,		--�������˹���  
				@c_operator , 
				@c_ip 
			) 
		end 
	end	
return 0
go
--ֱӪȡ������� 
if exists(select name from sysobjects where name='p_zjbd_1_jl')
	drop procedure p_zjbd_1_jl
go
create procedure p_zjbd_1_jl 
	@c_system	int,		--����
	@c_jobnumber	char(10),	--����	
	@c_type		int 		--ְ�� 
as
declare @c_director	char(10)	--����	  	  
	if @c_system = 1 	--ֱӪ
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
--ֱӪȡ�������˹��� 
if exists(select name from sysobjects where name='p_zjbd_1_zyc')
	drop procedure p_zjbd_1_zyc
go
create procedure p_zjbd_1_zyc 
	@c_system	int,		--����
	@c_jobnumber	char(10) 	--���ţ����ܣ�		 
as
declare @c_ycgh		char(10)	--�����˹���	  	  
	if @c_system = 1 	--ֱӪ
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
--ֱӪȡ�ܼ���� 
if exists(select name from sysobjects where name='p_zjbd_1_zj')
	drop procedure p_zjbd_1_zj
go
create procedure p_zjbd_1_zj 
	@c_system	int,		--����
	@c_jobnumber	char(10),	--���ţ����ܣ�	
	@c_type		int 		--ְ�� 
as
declare @c_director	char(10)	--����	  	  
	if @c_system = 1 	--ֱӪ
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
--ֱӪȡ�������˹��� 
if exists(select name from sysobjects where name='p_zjbd_1_byc')
	drop procedure p_zjbd_1_byc
go
create procedure p_zjbd_1_byc 
	@c_system	int,		--����
	@c_jobnumber	char(10) 	--���ţ��ܼࣩ	
as
declare @c_ycgh		char(10)	--�����˹���	  	  
	if @c_system = 1 	--ֱӪ
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
--�����³�����ĩ���ڹ��� 
if exists(select name from sysobjects where name='p_zjbd_1_month')
	drop procedure p_zjbd_1_month
go
create procedure p_zjbd_1_month
	@c_year	 int,		--��
	@c_month int,		--��
	@c_ksrq  char(8) output,--�³�����
	@c_jsrq  char(8) output --��ĩ����
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
--ֱӪְ���䶯���� 
if exists(select name from sysobjects where name='p_zjbd_1')
	drop procedure p_zjbd_1
go
create procedure p_zjbd_1
	@c_orgid	int,		--����
	@c_system	int,		--����
	@c_jobnumber	char(10),	--����	
	@c_type		int,		--ְ��
	@c_ksrq		char(8),	--��ʼ���� 
	@c_jobnm	char(10),	--��ҵ����	js����  jj����
	@c_operator	char(10),	--����Ա
	@c_ip		char(25)	--�������Ե�ip 
as
declare @c_errors	int,   
	@i_type		int,		--Ŀ��ְλ 	   
	@i_level	int,		--Ŀ��ְ��   	   
	@c_director	char(10),	--����	 
	@t_jobnumber	char(10),	--��ʱ����
	@t_type		int		--��ʱְλ 	
	if not (isdate(@c_ksrq)=1 and len(@c_ksrq)=8)
	begin
		raiserror ('��ʼ���ڸ�ʽ����!', 16, 1)
		return @@error
	end 	  
	--����
	if @c_jobnm='js'
	begin
		select @i_type=min(c_type) from t_pzjdy where c_system=@c_system and c_type>@c_type 
		select @i_level=c_level from t_pzjdy where c_system=@c_system and c_type=@i_type   
		if @i_level = 1 --�ײ�
		begin 
			set @c_director=null				
			exec p_director  @c_jobnumber,@c_system,@i_type,@c_director output	 		
			if @c_director ='1111111111'
			begin			 
				raiserror ('�����˹��ţ�%s �����ܲ�����', 16, 1,@c_jobnumber)	 			
				return @@error
			end	
			begin transaction tr_zjbd01					 
			update t_agentset set c_type=@i_type 
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
			if @@error <>0
			begin
				rollback transaction tr_zjbd01
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 	 	 			
			update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
			if @@error <>0
			begin
				rollback transaction tr_zjbd01
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 	
			insert t_agentls
			(
				c_orgid ,			--����id  
				c_system ,			--������ϵ  	
				c_jobnumber ,			--����
				c_type ,			--ְ��
				c_director ,			--�ϼ�����
				c_ksrq ,
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(	@c_orgid ,			--����id  
				@c_system ,			--������ϵ  	
				@c_jobnumber ,			--����
				@i_type ,			--ְ��
				@c_director ,			--�ϼ�����
				@c_ksrq ,
				@c_jobnm ,
				@c_operator ,
				@c_ip 
			)			
			if @@error <>0
			begin
				rollback transaction tr_zjbd01
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 			 	
			commit transaction tr_zjbd01
		end
		if @i_level = 2	--�в㣨�� ��
		begin 					 	  		
			--��������
			set @c_director=null				
			exec p_director  @c_jobnumber,@c_system,@i_type,@c_director output	 		
			if @c_director ='1111111111'
			begin			 
				raiserror ('�����˹��ţ�%s �����ܲ�����', 16, 1,@c_jobnumber)	 			
				return @@error
			end	 
			begin transaction tr_zjbd02	
			--���������ɹ�ϵ 
			exec p_ycgx  @c_jobnumber,@c_jobnumber,@c_system,@i_type,@c_operator,@c_ip	
			--ɾ��ԭ���ɹ�ϵ
			delete t_agentgx where c_system=@c_system and c_flag='1' and c_bycgh=@c_jobnumber or c_ycgh=@c_jobnumber  				
			--�޸Ļ�������
			update t_agentset set c_type=@i_type 
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
			if @@error <>0
			begin
				rollback transaction tr_zjbd02
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 	  
			--�޸���ʷ״̬
			update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
			if @@error <>0
			begin
				rollback transaction tr_zjbd02
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 	 
			insert t_agentls
			(
				c_orgid ,			--����id  
				c_system ,			--������ϵ  	
				c_jobnumber ,			--����
				c_type ,			--ְ��
				c_director ,			--�ϼ�����
				c_ksrq ,
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(	@c_orgid ,			--����id  
				@c_system ,			--������ϵ  	
				@c_jobnumber ,			--����
				@i_type ,			--ְ��
				@c_director ,			--�ϼ�����
				@c_ksrq ,
				@c_jobnm ,
				@c_operator ,
				@c_ip 
			)			
			if @@error <>0
			begin
				rollback transaction tr_zjbd02
				raiserror ('ְ���䶯����', 16, 1)
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
				--��������
				set @c_director=null				
				exec p_director  @t_jobnumber,@c_system,@t_type,@c_director output	 		
				if @c_director ='1111111111'
				begin			 
					close c_zjbd02
					deallocate c_zjbd02
					drop table #t_temp1
					rollback transaction tr_zjbd02
					raiserror ('�����˹��ţ�%s �����ܲ�����', 16, 1,@t_jobnumber)	 			
					return @@error
				end	 				 	
				if @c_director <> @c_jobnumber 
				begin			 	  
					fetch	next from c_zjbd02 into @t_jobnumber,@t_type
					continue
				end				
				--�������
				update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 	where c_system=@c_system and c_jobnumber=@t_jobnumber and c_flag='0'  
				if @@error <>0
				begin
					close c_zjbd02
					deallocate c_zjbd02
					drop table #t_temp1
					rollback transaction tr_zjbd02
					raiserror ('ְ���䶯����', 16, 1)
					return @@error 
				end 	  
				insert t_agentls
				(
					c_orgid ,			--����id  
					c_system ,			--������ϵ  	
					c_jobnumber ,			--����
					c_type ,			--ְ��
					c_director ,			--�ϼ�����
					c_ksrq ,
					c_jobnm ,
					c_operator ,
					c_ip 
				)
				values
				(	@c_orgid ,			--����id  
					@c_system ,			--������ϵ  	
					@t_jobnumber ,			--����
					@t_type ,			--ְ��
					@c_jobnumber ,			--�ϼ�����
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
					raiserror ('ְ���䶯����', 16, 1)
					return @@error 
				end 		 	
				fetch	next from c_zjbd02 into @t_jobnumber,@t_type		
			end
			close c_zjbd02
			deallocate c_zjbd02  	
			drop table #t_temp1		
			commit transaction tr_zjbd02	
		end 
		if @i_level = 3	--�߲㣨�� ��
		begin 							
			--��������
			set @c_director=null				
			exec p_director  @c_jobnumber,@c_system,@i_type,@c_director output	 		
			if @c_director ='1111111111'
			begin			 
				raiserror ('�����˹��ţ�%s �����ܲ�����', 16, 1,@c_jobnumber)	 			
				return @@error
			end	 
			begin transaction tr_zjbd03		
			--���������ɹ�ϵ  
			exec p_ycgx  @c_jobnumber,@c_jobnumber,@c_system,@i_type,@c_operator,@c_ip   
			--�޸Ļ�������
			update t_agentset set c_type=@i_type 
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
			if @@error <>0
			begin
				rollback transaction tr_zjbd03
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 	  
			--�޸���ʷ״̬
			update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
			if @@error <>0
			begin
				rollback transaction tr_zjbd03
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 	 
			insert t_agentls
			(
				c_orgid ,			--����id  
				c_system ,			--������ϵ  	
				c_jobnumber ,			--����
				c_type ,			--ְ��
				c_director ,			--�ϼ�����
				c_ksrq ,
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(	@c_orgid ,			--����id  
				@c_system ,			--������ϵ  	
				@c_jobnumber ,			--����
				@i_type ,			--ְ��
				@c_director ,			--�ϼ�����
				@c_ksrq ,
				@c_jobnm ,
				@c_operator ,
				@c_ip 
			)			
			if @@error <>0
			begin
				rollback transaction tr_zjbd03
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 		
			select  c_bycgh,c_byczj into #t_temp2 from t_agentgx where c_system=@c_system and c_ycgh=@c_jobnumber and c_flag='0'				 		
			declare c_zjbd03 cursor for 	
			select 	c_bycgh,c_byczj from #t_temp2
			open	c_zjbd03
			fetch	next from c_zjbd03 into @t_jobnumber,@t_type			
			while	(@@fetch_status = 0)
			begin			
				--�������			 	
				update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 	where c_system=@c_system and c_jobnumber=@t_jobnumber and c_flag='0'  
				if @@error <>0
				begin
					close c_zjbd03
					deallocate c_zjbd03 
					drop table #t_temp2
					rollback transaction tr_zjbd03
					raiserror ('ְ���䶯����', 16, 1)
					return @@error 
				end 	  
				insert t_agentls
				(
					c_orgid ,			--����id  
					c_system ,			--������ϵ  	
					c_jobnumber ,			--����
					c_type ,			--ְ��
					c_director ,			--�ϼ�����
					c_ksrq ,
					c_jobnm ,
					c_operator ,
					c_ip 
				)
				values
				(	@c_orgid ,			--����id  
					@c_system ,			--������ϵ  	
					@t_jobnumber ,			--����
					@t_type ,			--ְ��
					@c_jobnumber ,			--�ϼ�����
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
					raiserror ('ְ���䶯����', 16, 1)
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
	--����
	if @c_jobnm='jj'
	begin
		select @i_type=max(c_type) from t_pzjdy where c_system=@c_system and c_type<@c_type 
		select @i_level=c_level from t_pzjdy where c_system=@c_system and c_type=@i_type    		
		if @i_level = 2	--�в�
		begin  
			set @c_director=null	
			if exists(select * from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber and c_byczj between 30 and 39 )
			begin	--ԭ��������
				select @c_director=c_ycgh from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber and c_byczj between 30 and 39 
					 order by c_byczj,c_layer
			end
			else
			begin	--��������			
				exec p_director  @c_jobnumber,@c_system,@i_type,@c_director output	 		
				if @c_director ='1111111111'
				begin			 
					raiserror ('�����˹��ţ�%s �����ܲ�����', 16, 1,@c_jobnumber)	 			
					return @@error
				end	 
			end		
			begin transaction tr_zjbd04	
			update t_agentset set c_type=@i_type 
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
			if @@error <>0
			begin
				rollback transaction tr_zjbd04
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 	  
			update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
			if @@error <>0
			begin
				rollback transaction tr_zjbd04
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 	 
			insert t_agentls
			(
				c_orgid ,			--����id  
				c_system ,			--������ϵ  	
				c_jobnumber ,			--����
				c_type ,			--ְ��
				c_director ,			--�ϼ�����
				c_ksrq ,
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(	@c_orgid ,			--����id  
				@c_system ,			--������ϵ  	
				@c_jobnumber ,			--����
				@i_type ,			--ְ��
				@c_director ,			--�ϼ�����
				@c_ksrq ,
				@c_jobnm ,
				@c_operator ,
				@c_ip 
			)			
			if @@error <>0
			begin
				rollback transaction tr_zjbd04
				raiserror ('ְ���䶯����', 16, 1)
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
					raiserror ('ְ���䶯����', 16, 1)
					return @@error 
				end 	 
				insert t_agentls
				(
					c_orgid ,			--����id  
					c_system ,			--������ϵ  	
					c_jobnumber ,			--����
					c_type ,			--ְ��
					c_director ,			--�ϼ�����
					c_ksrq ,
					c_jobnm ,
					c_operator ,
					c_ip 
				)
				values
				(	@c_orgid ,			--����id  
					@c_system ,			--������ϵ  	
					@t_jobnumber ,			--����
					@t_type ,			--ְ��
					@c_director ,			--�ϼ�����
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
					raiserror ('ְ���䶯����', 16, 1)
					return @@error 
				end 	
				fetch	next from c_zjbd04 into @t_jobnumber,@t_type			
			end
			close c_zjbd04
			deallocate c_zjbd04  
			drop table #t_temp3								 		
			commit transaction tr_zjbd04
		end  
		if @i_level =1	--�ײ�
		begin 
			set @c_director=null	
			if exists(select * from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber and c_byczj between 20 and 29 )
			begin	-- ԭ��������
				select @c_director=c_ycgh from t_agentgx where c_system=@c_system and c_bycgh=@c_jobnumber and c_byczj between 20 and 29 
					 order by c_byczj,c_layer
			end
			else
			begin	--��������			
				exec p_director  @c_jobnumber,@c_system,@i_type,@c_director output	 		
				if @c_director ='1111111111'
				begin			 
					raiserror ('�����˹��ţ�%s �����ܲ�����', 16, 1,@c_jobnumber)	 			
					return @@error
				end	 
			end		
			begin transaction tr_zjbd05	
			update t_agentset set c_type=@i_type 
				where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
			if @@error <>0
			begin
				rollback transaction tr_zjbd05
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 	  
			update t_agentls set c_flag='1',c_jsrq=@c_ksrq
				 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
			if @@error <>0
			begin
				rollback transaction tr_zjbd05
				raiserror ('ְ���䶯����', 16, 1)
				return @@error 
			end 	 
			insert t_agentls
			(
				c_orgid ,			--����id  
				c_system ,			--������ϵ  	
				c_jobnumber ,			--����
				c_type ,			--ְ��
				c_director ,			--�ϼ�����
				c_ksrq ,
				c_jobnm ,
				c_operator ,
				c_ip 
			)
			values
			(	@c_orgid ,			--����id  
				@c_system ,			--������ϵ  	
				@c_jobnumber ,			--����
				@i_type ,			--ְ��
				@c_director ,			--�ϼ�����
				@c_ksrq ,
				@c_jobnm ,
				@c_operator ,
				@c_ip 
			)			
			if @@error <>0
			begin
				rollback transaction tr_zjbd05
				raiserror ('ְ���䶯����', 16, 1)
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
					raiserror ('ְ���䶯����', 16, 1)
					return @@error 
				end 	 
				insert t_agentls
				(
					c_orgid ,			--����id  
					c_system ,			--������ϵ  	
					c_jobnumber ,			--����
					c_type ,			--ְ��
					c_director ,			--�ϼ�����
					c_ksrq ,
					c_jobnm ,
					c_operator ,
					c_ip 
				)
				values
				(	@c_orgid ,			--����id  
					@c_system ,			--������ϵ  	
					@t_jobnumber ,			--����
					@t_type ,			--ְ��
					@c_director ,			--�ϼ�����
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
					raiserror ('ְ���䶯����', 16, 1)
					return @@error 
				end 	        	
				fetch	next from c_zjbd05 into @t_jobnumber,@t_type			
			end
			close c_zjbd05
			deallocate c_zjbd05
			drop table #t_temp4
			--��������ƹ���ְ����ͣ���������棬�������ɹ�ϵ
			if @i_type=10
			begin
				update t_agentgx set c_flag='1' where c_system=@c_system and c_bycgh=@c_jobnumber or c_ycgh=@c_jobnumber  	
				if @@error <>0
				begin 
					rollback transaction tr_zjbd05
					raiserror ('������ɹ�ϵ����', 16, 1)
					return @@error 
				end 
			end	   			 		
			commit transaction tr_zjbd05
		end  
	end 	
return 0
go
--ֱӪ��ְ���� 
if exists(select name from sysobjects where name='p_zjbd_1_ls')
	drop procedure p_zjbd_1_ls
go
create procedure p_zjbd_1_ls
	@c_orgid	 int,		--����
	@c_system	 int,		--����
	@c_jobnumber	 char(10),	--����	
	@c_type		 int,		--ְ�� 
	@c_type_sxr	 int,		--��Ϯ���� 1 ָ���ˣ�2 ����Ϯ��	  
	@c_jobnumber_sxr char(10),	--��Ϯ����
	@c_type_xq	 int,		--�������� 1 ָ���ˣ�2 �Զ��ݹ�		  
	@c_jobnumber_xq	 char(10),	--���ڹ��� 
	@c_operator	 char(10),	--����Ա
	@c_ip		 char(25)	--�������Ե�ip 
as
declare @c_errors	int,       
	@c_ksrq		char(8),	--��ʼ���� 
	@c_tjrgh	char(10),	--�Ƽ��˹���
	@c_director	char(10),	--����	 
	@c_level	int 		--ְ��   	        
	set @c_ksrq=convert(char(8),getdate(),112) 
	--��鹤���Ƿ�Ϸ�
	if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' )
	begin
		raiserror ('������Ч!', 16, 1)
		return @@error 
	end
	select @c_level=c_level from t_pzjdy where c_system=@c_system and c_type=@c_type  	
	if @c_level=3
	begin
		begin transaction 	tr_ls	
		exec @c_errors=p_zjbd_1
			@c_orgid	,	--����
			@c_system	,	--����
			@c_jobnumber	,	--����	
			@c_type		,	--ְ��
			@c_ksrq		,	--��ʼ���� 
			'jj'		,	--��ҵ����	js����  jj����
			@c_operator	,	--����Ա
			@c_ip			--�������Ե�ip 
		if @c_errors <>0
		begin
			rollback transaction	tr_ls
			raiserror ('�����˹��ţ�%s ��ְ����', 16, 1,@c_jobnumber)	 			
			return @@error 
		end 		
		exec @c_errors=p_zjbd_1
			@c_orgid	,	--����
			@c_system	,	--����
			@c_jobnumber	,	--����	
			@c_type		,	--ְ��
			@c_ksrq		,	--��ʼ���� 
			'jj'		,	--��ҵ����	js����  jj����
			@c_operator	,	--����Ա
			@c_ip			--�������Ե�ip 
		if @c_errors <>0
		begin
			rollback transaction	tr_ls
			raiserror ('�����˹��ţ�%s ��ְ����', 16, 1,@c_jobnumber)	 			
			return @@error 
		end 				
	end
	if @c_level=2
	begin
		begin transaction 	tr_ls	
		exec @c_errors=p_zjbd_1
			@c_orgid	,	--����
			@c_system	,	--����
			@c_jobnumber	,	--����	
			@c_type		,	--ְ��
			@c_ksrq		,	--��ʼ���� 
			'jj'		,	--��ҵ����	js����  jj����
			@c_operator	,	--����Ա
			@c_ip			--�������Ե�ip 
		if @c_errors <>0
		begin
			rollback transaction	tr_ls
			raiserror ('�����˹��ţ�%s ��ְ����', 16, 1,@c_jobnumber)	 			
			return @@error 
		end 		
	end 	
	--��Ա��Ϯ
	if @c_type_sxr = 1
	begin
		if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber_sxr and c_flag='0')  
		begin
			rollback transaction	tr_ls
			raiserror ('��Ա��Ϯ�˹��� %s ��Ч', 16, 1, @c_jobnumber_sxr)
			return @@error
		end  
		--��Ա��Ϯ�� ���ϸ�������
		update t_agentset set c_sxrgh=@c_jobnumber_sxr
			where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
		--�����Ϯ�� ������ȡ����		
		update t_agentset set c_cxrgh=@c_jobnumber_sxr
			where c_system=@c_system and c_tjrgh=@c_jobnumber or c_cxrgh=@c_jobnumber and c_flag='0'
	end
	--�ͷ�����ָ����
	if @c_type_xq = 1
	begin 
		if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber_xq and c_flag='0')  
		begin
			rollback transaction	tr_ls
			raiserror ('�ͷ�����̳��˹��� %s ��Ч', 16, 1, @c_jobnumber_xq)
			return @@error
		end  
		--�ͷ�����ָ����
		update t_agentset set c_jcrgh=@c_jobnumber_xq
			where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
		--��������	
		update t_sxbd set c_jobnumber_xq=@c_jobnumber_xq  
			where c_system_sq=@c_system and c_jobnumber_xq=@c_jobnumber and c_flag='0'
	end	
	--�ͷ������Զ��ݹ�
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
		--�ͷ�����ָ����
		update t_agentset set c_jcrgh=@c_jobnumber_xq
			where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'
		--��������	
		update t_sxbd set c_jobnumber_xq=@c_jobnumber_xq,c_type_xq=@c_type_xq 
			where c_system_sq=@c_system and c_jobnumber_xq=@c_jobnumber and c_flag='0'
	end
	--�޸���˾����
	update t_staff set c_quitdate=@c_ksrq,c_jobnm='ls' 
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber  		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('��ְ����', 16, 1)
		return @@error 
	end 	  
	--�޸Ļ�������
	update t_agentset set c_flag='1',c_jobnm='ls' 
		where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('��ְ����', 16, 1)
		return @@error 
	end 	  
	--�޸���ʷ״̬
	update t_agentls set c_flag='1',c_jsrq=@c_ksrq
		 where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('��ְ����', 16, 1)
		return @@error 
	end 	  
	commit transaction tr_ls	
return 0
go
--��������ְ���䶯���� 
if exists(select name from sysobjects where name='p_zjbd_2')
	drop procedure p_zjbd_2
go
create procedure p_zjbd_2
	@c_orgid	int,		--����
	@c_system	int,		--����
	@c_jobnumber	char(10),	--����	
	@c_type		int,		--ְ��
	@c_ksrq		char(8),	--��ʼ���� 
	@c_jobnm	char(10),	--��ҵ����	js����  jj����
	@c_operator	char(10),	--����Ա
	@c_ip		char(25)	--�������Ե�ip 
as
declare @c_errors	int,   
	@i_type		int,		--Ŀ��ְλ 	   
	@i_level	int,		--Ŀ��ְ��   	   
	@c_director	char(10),	--����	 
	@t_jobnumber	char(10),	--��ʱ����
	@t_type		int		--��ʱְλ 
	if not (isdate(@c_ksrq)=1 and len(@c_ksrq)=8)
	begin
		raiserror ('��ʼ���ڸ�ʽ����!', 16, 1)
		return @@error
	end	 	  
	--����
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
			raiserror ('ְ���䶯����', 16, 1)
			return @@error 
		end 	  
		update t_agentls set c_flag='1',c_jsrq=@c_ksrq
			 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
		if @@error <>0
		begin
			rollback transaction tr_zjbd01
			raiserror ('ְ���䶯����', 16, 1)
			return @@error 
		end 	 
		insert t_agentls
		(
			c_orgid ,			--����id  
			c_system ,			--������ϵ  	
			c_jobnumber ,			--����
			c_type ,			--ְ��
			c_director ,			--�ϼ�����
			c_ksrq ,
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(	@c_orgid ,			--����id  
			@c_system ,			--������ϵ  	
			@c_jobnumber ,			--����
			@i_type ,			--ְ��
			'0000000000' ,			--�ϼ�����
			@c_ksrq ,
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)			
		if @@error <>0
		begin
			rollback transaction tr_zjbd01
			raiserror ('ְ���䶯����', 16, 1)
			return @@error 
		end 		
		commit transaction tr_zjbd01 
	end	
	--����
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
			raiserror ('ְ���䶯����', 16, 1)
			return @@error 
		end 	  
		update t_agentls set c_flag='1',c_jsrq=@c_ksrq
			 where c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0'  
		if @@error <>0
		begin
			rollback transaction tr_zjbd02
			raiserror ('ְ���䶯����', 16, 1)
			return @@error 
		end 	 
		insert t_agentls
		(
			c_orgid ,			--����id  
			c_system ,			--������ϵ  	
			c_jobnumber ,			--����
			c_type ,			--ְ��
			c_director ,			--�ϼ�����
			c_ksrq ,
			c_jobnm ,
			c_operator ,
			c_ip 
		)
		values
		(	@c_orgid ,			--����id  
			@c_system ,			--������ϵ  	
			@c_jobnumber ,			--����
			@i_type ,			--ְ��
			'0000000000' ,			--�ϼ�����
			@c_ksrq ,
			@c_jobnm ,
			@c_operator ,
			@c_ip 
		)			
		if @@error <>0
		begin
			rollback transaction tr_zjbd02
			raiserror ('ְ���䶯����', 16, 1)
			return @@error 
		end 		
		commit transaction tr_zjbd02		 	
	end	
return 0
go 
--����������ְ���� 
if exists(select name from sysobjects where name='p_zjbd_2_ls')
	drop procedure p_zjbd_2_ls
go
create procedure p_zjbd_2_ls
	@c_orgid	 int,		--����
	@c_system	 int,		--����
	@c_jobnumber	 char(10),	--����	 
	@c_operator	 char(10),	--����Ա
	@c_ip		 char(25)	--�������Ե�ip 
as
declare @c_errors	int,       
	@c_ksrq		char(8),	--��ʼ���� 
	@c_tjrgh	char(10),	--�Ƽ��˹���
	@c_director	char(10),	--����	 
	@c_level	int 		--ְ��   	        
	set @c_ksrq=convert(char(8),getdate(),112) 
	--��鹤���Ƿ�Ϸ�
	if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' )
	begin
		raiserror ('������Ч!', 16, 1)
		return @@error 
	end
	begin transaction tr_ls		
	--�޸���˾����
	update t_staff set c_quitdate=@c_ksrq,c_jobnm='ls' 
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber  		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('��ְ����', 16, 1)
		return @@error 
	end 	  
	--�޸Ļ�������
	update t_agentset set c_flag='1',c_jobnm='ls' 
		where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('��ְ����', 16, 1)
		return @@error 
	end 	  
	--�޸���ʷ״̬
	update t_agentls set c_flag='1',c_jsrq=@c_ksrq
		 where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('��ְ����', 16, 1)
		return @@error 
	end 	  
	commit transaction tr_ls	
return 0
go
--������ְ���� 
if exists(select name from sysobjects where name='p_zjbd_11_ls')
	drop procedure p_zjbd_11_ls
go
create procedure p_zjbd_11_ls
	@c_orgid	 int,		--����
	@c_system	 int,		--����
	@c_jobnumber	 char(10),	--����	 
	@c_operator	 char(10),	--����Ա
	@c_ip		 char(25)	--�������Ե�ip 
as
declare @c_errors	int,       
	@c_ksrq		char(8),	--��ʼ���� 
	@c_tjrgh	char(10),	--�Ƽ��˹���
	@c_director	char(10),	--����	 
	@c_level	int 		--ְ��   	        
	set @c_ksrq=convert(char(8),getdate(),112) 
	--��鹤���Ƿ�Ϸ�
	if not exists(select * from t_agentset where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' )
	begin
		raiserror ('������Ч!', 16, 1)
		return @@error 
	end
	begin transaction tr_ls		
	--�޸���˾����
	update t_staff set c_quitdate=@c_ksrq,c_jobnm='ls' 
		where c_orgid=@c_orgid and c_jobnumber=@c_jobnumber  		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('��ְ����', 16, 1)
		return @@error 
	end 	  
	--�޸Ļ�������
	update t_agentset set c_flag='1',c_jobnm='ls' 
		where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 		
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('��ְ����', 16, 1)
		return @@error 
	end 	  
	--�޸���ʷ״̬
	update t_agentls set c_flag='1',c_jsrq=@c_ksrq
		 where c_orgid=@c_orgid and c_system=@c_system and c_jobnumber=@c_jobnumber and c_flag='0' 
	if @@error <>0
	begin
		rollback transaction	tr_ls
		raiserror ('��ְ����', 16, 1)
		return @@error 
	end 	  
	commit transaction tr_ls	
return 0
go

--������Ӷ�����
if exists(select name from sysobjects where name='p_agentcommission')
	drop procedure p_agentcommission
go
create procedure p_agentcommission	
	@c_orgid int ,			-- ����	
	@c_year int ,			-- �� 
	@c_month int ,			-- ��  	
	@c_jobnumber char(10) ,		-- ����
	@c_system int ,			-- ������ϵ   
	@c_str varchar (2000)  ,	-- ����������ϸ��
	@c_strv decimal(15, 2) ,	-- ���������ϼƣ�  
	@c_add decimal(15, 2) ,		-- �ӿۿ�  	 
	@c_jobnm char (10) ,		-- add ��ӣ� 0 ����
	@c_operator char(10) , 
	@c_ip char (25)   
as
declare	@c_yfje decimal(15, 2),		-- ��ʱ����  
	@c_yys  decimal(15, 2),		-- ��ʱ����  
	@c_temp decimal(15, 2),		-- ��ʱ����  
	@c_grs  decimal(15, 2),		-- ��ʱ����  
	@c_sfje decimal(15, 2),		-- ��ʱ����  
	@c_sql	 char(200) 		-- 
	if  @c_jobnm='add'	--��� 
	begin
		if exists ( select * from t_agentcommission
			where   c_orgid=@c_orgid and c_year=@c_year and c_month=@c_month and c_jobnumber=@c_jobnumber and c_system=@c_system and c_jobnm='0' )
		begin
			raiserror ('Ӷ���Ѿ����ţ����������¼���', 16, 1)
			return @@error
		end		
		--ɾ������ӵ���
		delete t_agentcommission
			where   c_orgid=@c_orgid and c_year=@c_year and c_month=@c_month and c_jobnumber=@c_jobnumber and c_system=@c_system 
		--Ӧ�����
		set @c_yfje=@c_strv + @c_add		
		--Ӫҵ˰
		if  @c_yfje >= 20000
		begin
			set @c_yys=@c_yfje * 0.056	
		end		
		else
		begin
			set @c_yys=0
		end
		--����˰����
		set @c_temp=@c_yfje * 0.6 - @c_yys	
		--����˰
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
		--ʵ�����
		set @c_sfje=@c_yfje-@c_yys-@c_grs
		insert t_agentcommission
		(
			c_orgid ,		-- ����	
			c_year ,		-- �� 
			c_month ,		-- ��  	
			c_jobnumber ,		-- ����
			c_system ,		-- ������ϵ   
			c_str ,			-- ����������ϸ��
			c_strv ,		-- ���������ϼƣ�  
			c_add ,			-- �ӿۿ�  
			c_yfje ,		-- Ӧ�����=���������ϼƣ�+ �ӿۿ�	
			c_yys ,			-- Ӫҵ˰
			c_grs ,			-- ����˰
			c_yfje ,		-- ʵ�����
			c_jobnm ,
			c_operator ,	
			c_ip 
		)
		values
		(
			@c_orgid ,		-- ����	
			@c_year ,		-- �� 
			@c_month ,		-- ��  	
			@c_jobnumber ,		-- ����
			@c_system ,		-- ������ϵ   
			@c_str ,		-- ����������ϸ��
			@c_strv ,		-- ���������ϼƣ�  
			@c_add ,		-- �ӿۿ�  	
			@c_yfje,		-- Ӧ�����=���������ϼƣ�+ �ӿۿ�	
			@c_yys,			-- Ӫҵ˰
			@c_grs,			-- ����˰
			@c_yfje ,		-- ʵ�����
			@c_jobnm ,
			@c_operator ,	
			@c_ip 	 
		)	
	end	
	if  @c_jobnm='0'	--����
	begin
		if not exists ( select * from t_agentcommission
			where c_orgid=@c_orgid and c_year=@c_year and c_month=@c_month and c_jobnumber=@c_jobnumber and c_system=@c_system and c_jobnm='add' )
		begin
			raiserror ('Ӷ��δ������㣬���ܷ���', 16, 1)
			return @@error
		end		
		--����Ϊ����״̬
		update t_agentcommission set c_jobnm='0'
			where c_orgid=@c_orgid and c_year=@c_year and c_month=@c_month and c_jobnumber=@c_jobnumber and c_system=@c_system and c_jobnm='add' 		
	end	
return 0
go 