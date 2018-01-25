<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../../tool/styles/main.css">		
	<script type="text/javascript">
	function js_check(f)
	{		
		if(f.type[0].checked)
		{
			if(f.date1.value==''||f.date2.value=='')
			{	
			alert("请输入日期区间")
			return false;
			}		
		}
		else
		{		
			if(f.c_recordid.value=='')
			{
			alert("请输入报废单号")
			return false;
			}	
		}		
		return true;	
	}	
	</script>
</head>		
	<body >		 		
		<form action="../../../../toModule.do?prefix=/oa&page=/shop/record/bf/query3.jsp" method="post" onsubmit="return js_check(this)">
		<input type="hidden" name="c_orgid" value="${param.c_orgid }">
		<input type="hidden" name="c_libraryid" value="${param.c_libraryid }">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../../tool/images/112.gif" width="16" height="15" />
						报废查询
					</div>
				</td>
			</tr> 			 
			<tr id="tr1">
				<td  align="right" width="50%">
				<input type="radio"  name="type" value="1" checked="checked">日期区间
				</td>		
				<td><input name="date1" value=""  size="10" maxlength="8">-<input name="date2" value="" size="10" maxlength="8"></td>												
			</tr>
			<tr id="tr2">
				<td   align="right" >
				<input type="radio" name="type" value="2">报废单号
				</td>				
				<td><input name="c_recordid" size="25" value=""></td>												
			</tr>
			<tr>
				<td width="48%" align="right"><html:submit value=" 下一步 "/></td>
				<td width="52%" colspan="2"> 
				</td> 
			</tr>		
		</table>	
	</form>
	</body> 
</html:html>
