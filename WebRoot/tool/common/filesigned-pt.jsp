<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 		
<script type="text/javascript" src="../js/msg.js"></script>   			
<script type='text/javascript' src='../../dwr/engine.js'> </script>
<script type='text/javascript' src='../../dwr/util.js'> </script>
<script type='text/javascript' src='../../dwr/interface/File.js'></script> 	 
<script type='text/javascript' src='../../dwr/interface/Filesigned.js'></script> 	 
<script type='text/javascript' src='../../dwr/interface/Signed.js'></script> 	 		
<script type="text/javascript">	  
	function setfilesigned()
	{   
		Filesigned.get_filesigned('${sessionScope.c_jobnumber }',getfilesigned)   
	}
	function getfilesigned(datas)
	{	 	    
		//���ļ�ǩ��
		if (datas)
		{					 
			document.getElementById("msg").value=document.getElementById("msg").value+'<br><a href=\"#\" onClick=\"window.parent.parent.main.location.href=\'../../toModule.do?prefix=/oa&page=/file/process/return.jsp\'\">���µ��ļ�ǩ��</a><br>';	  		
  			document.getElementById("flag").value='a1';	 	
  		}   			 
  		setfileprompt()
	} 
	function setfileprompt()
	{   
		Filesigned.get_fileprompt('${sessionScope.c_jobnumber }',getfileprompt)   
	}
	function getfileprompt(datas)
	{	 	    				
  		// �ļ�ǩ������
		if (datas)
		{					 
			document.getElementById("msg").value=document.getElementById("msg").value+'<br><a href=\"#\" onClick=\"window.parent.parent.main.location.href=\'../../toModule.do?prefix=/oa&page=/file/process/query2.jsp?type=3\'\">�ļ�ǩ������</a><br>';	  		
  			document.getElementById("flag").value='a2';	 	
  		}  		
  		setfileRD()
	} 	
	function setfileRD()
	{   
		File.fileRD('${sessionScope.c_jobnumber }',getfileRD)   
	}
	function getfileRD(datas)
	{	 	    				
  		// �ļ��Ϲ�
		if (datas)
		{					 
			document.getElementById("msg").value=document.getElementById("msg").value+'<br><a href=\"#\" onClick=\"window.parent.parent.main.location.href=\'../../toModule.do?prefix=/oa&page=/file/file/read3.jsp\'\">�����Ϲҵ��ļ�</a><br>';	  		
  			document.getElementById("flag").value='a3';	 	
  		} 
  		setsigned()
  		//OnAlert();	
	} 		     
</script> 