<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>险种费率定义</title>
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
						费率添加
				</td>
			</tr>	
			<tr> 		
			<td align="right" width="50%">保险期间
			<td  >
			<input type="radio" name="c_bxqlx" value="0">
			<input name="c_bxq0" value="0" type="hidden" >终身
			</td>
			</tr> 
			<tr> 
			<td align="right">
			<Td  >			 
			<input type="radio" name="c_bxqlx" value="1" checked="checked">
			保<input name="c_bxq1" value="0" size="5">年			 
			</tr>
			<tr>  			
			<td align="right"> 
			<td>
			<input type="radio" name="c_bxqlx" value="2">
			保至<input name="c_bxq2" value="0"  size="5">岁 
			</td>
			</tr>				 						 
			 <tr> 
				<td align="right">交费期间
				<Td  >				 
				<input type="radio" name="c_jfqlx" value="0" >
				<input name="c_jfq0" value="0" type="hidden">趸交
				</td>
				</tr>
				<tr> 
				<td align="right"> 
				<td>	 			 
				<input type="radio" name="c_jfqlx" value="1" checked="checked">
				缴<input name="c_jfq1" value="0" size="5">年
				</td>
				</tr> 
				<tr> 
				<td align="right"> 
				<td>	 			 
				<input type="radio" name="c_jfqlx" value="2">
				缴至<input name="c_jfq2" value="0" size="5">岁 
				</td>
				</tr>  			 
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="下一步">
				</td>				
			</tr>
		</table>
	</form> 	
	</body>
</html:html>
