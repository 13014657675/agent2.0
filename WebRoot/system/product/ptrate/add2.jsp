<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>���ַ��ʶ���</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
		
<body >	
	<form action="../../../toModule.do?prefix=/system&page=/product/ptrate/add3.jsp" method="post" onsubmit="return js_submit()">
		<input type="hidden" name="c_companyid" value="${param.c_companyid }">
		<input type="hidden" name="c_productid" value="${param.c_productid }">
		<input type="hidden" name="c_type" value="${param.c_type }">
		<input type="hidden" name="c_base" value="${param.c_base }">		 		
		<table width="100%" border="1" cellspacing="0">		
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						�������
				</td>
			</tr>	
			<tr> 		
			<td align="right" width="50%">�����ڼ�
			<td  >
			<input type="radio" name="c_bxqlx" value="0">
			<input name="c_bxq0" value="0" type="hidden" >����
			</td>
			</tr> 
			<tr> 
			<td align="right">
			<Td  >			 
			<input type="radio" name="c_bxqlx" value="1" checked="checked">
			��<input name="c_bxq1" value="0" size="5">��			 
			</tr>
			<tr>  			
			<td align="right"> 
			<td>
			<input type="radio" name="c_bxqlx" value="2">
			����<input name="c_bxq2" value="0"  size="5">�� 
			</td>
			</tr>				 						 
			 <tr> 
				<td align="right">�����ڼ�
				<Td  >				 
				<input type="radio" name="c_jfqlx" value="0" >
				<input name="c_jfq0" value="0" type="hidden">����
				</td>
				</tr>
				<tr> 
				<td align="right"> 
				<td>	 			 
				<input type="radio" name="c_jfqlx" value="1" checked="checked">
				��<input name="c_jfq1" value="0" size="5">��
				</td>
				</tr> 
				<tr> 
				<td align="right"> 
				<td>	 			 
				<input type="radio" name="c_jfqlx" value="2">
				����<input name="c_jfq2" value="0" size="5">�� 
				</td>
				</tr>  			 
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="��һ��">
				</td>				
			</tr>
		</table>
	</form> 	
	</body>
</html:html>
