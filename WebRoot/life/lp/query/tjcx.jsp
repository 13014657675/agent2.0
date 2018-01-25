<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script type="text/javascript"> 		 
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
<body onload="document.getElementsByName('c_ksrq')[0].value=getksrq();document.getElementsByName('c_jsrq')[0].value=getjsrq();">
<form action="../../../toModule.do?prefix=/life&page=/lp/query/tjcx2.jsp"  method="post" onsubmit="return check_form(this)"> 
		<input type="hidden" name="c_orgid" value="${sessionScope.Staff.c_orgid }">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						统计数据查询
					</div>
				</td>
			</tr>					
			<tr>
			<td align="right" width="50%">日期类型</td>
			<td  align="left">
			 	 <select name="c_jobnm">			 
			 	 <option value="a">报案日期</option>
			 	 <option value="b">结案日期</option>
			 	 </select>
			</td>
			</tr>	 
			<tr>
			<td align="right" width="50%">开始日期</td>
			<td  align="left">
			 	<input name="c_ksrq" maxlength="8" value="" id="req" title="开始日期必须填写"> 
			</td>
			</tr>	 
			<tr>
			<td align="right" width="50%">结束日期</td>
			<td  align="left">
			 	<input name="c_jsrq" maxlength="8" value="" id="req" title="结束日期必须填写">  
			</td>
			</tr>	 
			<tr>				
				<td align="right">
				<input type="submit" value=" 确 定 ">
				</td>			
				<td> 
				<input type="reset" value=" 重 置 ">
				</td>			
			</tr>
		</table>
</form> 
</body>
</html:html>
