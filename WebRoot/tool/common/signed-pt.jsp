<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 		
<script type="text/javascript" src="../js/msg.js"></script>   			
<script type='text/javascript' src='../../dwr/engine.js'> </script>
<script type='text/javascript' src='../../dwr/util.js'> </script>
<script type='text/javascript' src='../../dwr/interface/File.js'></script> 	 
<script type='text/javascript' src='../../dwr/interface/Filesigned.js'></script> 	 
<script type='text/javascript' src='../../dwr/interface/Signed.js'></script> 	 		
<script type="text/javascript">		 
	function setsigned()
	{   
		Signed.get_signed('${sessionScope.c_jobnumber }',getsigned)  
		return false;
	} 	
	function getsigned(datas)
	{	 	    				
  		// 新项目签报
		if (datas)
		{					 
			document.getElementById("msg").value=document.getElementById("msg").value+'<br><a href=\"#\" onClick=\"window.parent.parent.main.location.href=\'../../toModule.do?prefix=/oa&page=/signed/process/return.jsp\'\">有新的签报</a><br>';	  		
  			document.getElementById("flag").value='b1';	 	
  		}
  		setprompt()		
	} 	 
	function setprompt()
	{   
		Signed.get_prompt('${sessionScope.c_jobnumber }',getprompt)  
		return false;
	}
	function getprompt(datas)
	{	 	    				
  		// 签报结束
		if (datas)
		{					 
			document.getElementById("msg").value=document.getElementById("msg").value+'<br><a href=\"#\" onClick=\"window.parent.parent.main.location.href=\'../../toModule.do?prefix=/oa&page=/signed/process/query2.jsp?type=3\'\">签报结束</a><br>';	  		
  			document.getElementById("flag").value='b2';	 	
  		}   
  		OnAlert();	  		
	} 	     
 	    
</script>  