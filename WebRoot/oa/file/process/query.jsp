<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	 
	<script type="text/javascript">
	function js_check(f)
	{		
		if(f.type[0].checked)
		{
			if(f.date1.value==''||f.date2.value=='')
			{	
			alert("��������������")
			return false;
			}		
		}
		else
		{		
			if(f.c_sid.value=='')
			{
			alert("�������ļ�ǩ����")
			return false;
			}	
		}		
		return true;	
	}	
	</script>
</head>		
	<body>  
		<form action="../../../toModule.do?prefix=/oa&page=/file/process/query2.jsp" method="post" onsubmit="return js_check(this)">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						ǩ����ѯ
					</div>
				</td>
			</tr> 			
			<tr id="tr1" >
				<td  align="right" width="50%">
				<input type="radio"  name="type" value="1" checked="checked">�������� 
				</td>		
				<td><input name="date1" value=""  size="10" maxlength="8">-<input name="date2" value="" size="10" maxlength="8"></td>												
			</tr>
			<tr id="tr2">
				<td   align="right" >
				<input type="radio" name="type" value="2">ǩ����
				</td>				
				<td><input name="c_sid" size="25"></td>												
			</tr>
			<tr >
				<td   align="right" >
					<input type="submit" value=" ȷ �� ">				
				</td>				
				<td> 
				</td>												
			</tr>		
		</table>		
		</form>
	</body> 
</html:html>
