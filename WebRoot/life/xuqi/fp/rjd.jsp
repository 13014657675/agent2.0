<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>
<form action="../../../toModule.do?prefix=/life&page=/xuqi/fp/rjd2.jsp"  method="post" onsubmit="return check_form(this)">  
		<input type="hidden" name="c_orgid" value="${sessionScope.Staff.c_orgid }">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						���ڷ�Ʊ�սᵥ��ӡ
					</div>
				</td>
			</tr>		
			<tr>
			<td align="right" width="50%">����</td>
			<td>
			<input name="c_date" value="" maxlength="8" id="req" title="���ڱ�����д">
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
