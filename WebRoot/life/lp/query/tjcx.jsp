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
						ͳ�����ݲ�ѯ
					</div>
				</td>
			</tr>					
			<tr>
			<td align="right" width="50%">��������</td>
			<td  align="left">
			 	 <select name="c_jobnm">			 
			 	 <option value="a">��������</option>
			 	 <option value="b">�᰸����</option>
			 	 </select>
			</td>
			</tr>	 
			<tr>
			<td align="right" width="50%">��ʼ����</td>
			<td  align="left">
			 	<input name="c_ksrq" maxlength="8" value="" id="req" title="��ʼ���ڱ�����д"> 
			</td>
			</tr>	 
			<tr>
			<td align="right" width="50%">��������</td>
			<td  align="left">
			 	<input name="c_jsrq" maxlength="8" value="" id="req" title="�������ڱ�����д">  
			</td>
			</tr>	 
			<tr>				
				<td align="right">
				<input type="submit" value=" ȷ �� ">
				</td>			
				<td> 
				<input type="reset" value=" �� �� ">
				</td>			
			</tr>
		</table>
</form> 
</body>
</html:html>
