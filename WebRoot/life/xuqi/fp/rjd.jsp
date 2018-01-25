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
						续期发票日结单打印
					</div>
				</td>
			</tr>		
			<tr>
			<td align="right" width="50%">日期</td>
			<td>
			<input name="c_date" value="" maxlength="8" id="req" title="日期必须填写">
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
