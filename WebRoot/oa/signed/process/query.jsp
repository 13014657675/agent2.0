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
			alert("请输入日期区间")
			return false;
			}		
		}
		else
		{		
			if(f.c_sid.value=='')
			{
			alert("请输入签报号")
			return false;
			}	
		}		
		return true;	
	}	
	function getksrq()
	{					 			
		var c_yc=26
		var myDate = new Date();
		if (myDate.getDate()<c_yc) {
			myDate.setMonth(myDate.getMonth()-1);				 
			} 				
			myDate.setDate(26);			 
		var formatStr="yyyyMMdd"
		Y=myDate.getFullYear();
		formatStr=formatStr.replace("yyyy",String(Y));   
		M=myDate.getMonth()+1
		formatStr=formatStr.replace("MM",M>9?String(M):'0'+String(M));   
		D=myDate.getDate()
		formatStr=formatStr.replace("dd",D>9?String(D):'0'+String(D));   		 		
		return formatStr;
	}
	function getjsrq()
	{	 
		var c_yc=26
		var myDate = new Date();
		if (myDate.getDate()>=c_yc) { 
			myDate.setMonth(myDate.getMonth()+1);	
			}
		myDate.setDate(25);			 
		var formatStr="yyyyMMdd"
		Y=myDate.getFullYear();
		formatStr=formatStr.replace("yyyy",String(Y));   
		M=myDate.getMonth()+1
		formatStr=formatStr.replace("MM",M>9?String(M):'0'+String(M));   
		D=myDate.getDate()
		formatStr=formatStr.replace("dd",D>9?String(D):'0'+String(D));   		 		
		return formatStr;
	} 		
	</script>
</head>		
	<body onload="document.getElementsByName('date1')[0].value=getksrq();document.getElementsByName('date2')[0].value=getjsrq();">  
		<form action="../../../toModule.do?prefix=/oa&page=/signed/process/query2.jsp" method="post" onsubmit="return js_check(this)">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						签报查询
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
				<input type="radio" name="type" value="2">签报号
				</td>				
				<td><input name="c_sid" size="25"></td>												
			</tr>
			<tr >
				<td   align="right" >
					<input type="submit" value=" 确 定 ">				
				</td>				
				<td> 
				</td>												
			</tr>		
		</table>		
		</form>
	</body> 
</html:html>
