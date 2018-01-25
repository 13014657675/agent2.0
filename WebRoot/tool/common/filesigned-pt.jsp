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
		//新文件签批
		if (datas)
		{					 
			document.getElementById("msg").value=document.getElementById("msg").value+'<br><a href=\"#\" onClick=\"window.parent.parent.main.location.href=\'../../toModule.do?prefix=/oa&page=/file/process/return.jsp\'\">有新的文件签批</a><br>';	  		
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
  		// 文件签批结束
		if (datas)
		{					 
			document.getElementById("msg").value=document.getElementById("msg").value+'<br><a href=\"#\" onClick=\"window.parent.parent.main.location.href=\'../../toModule.do?prefix=/oa&page=/file/process/query2.jsp?type=3\'\">文件签批结束</a><br>';	  		
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
  		// 文件上挂
		if (datas)
		{					 
			document.getElementById("msg").value=document.getElementById("msg").value+'<br><a href=\"#\" onClick=\"window.parent.parent.main.location.href=\'../../toModule.do?prefix=/oa&page=/file/file/read3.jsp\'\">有新上挂的文件</a><br>';	  		
  			document.getElementById("flag").value='a3';	 	
  		} 
  		setsigned()
  		//OnAlert();	
	} 		     
</script> 