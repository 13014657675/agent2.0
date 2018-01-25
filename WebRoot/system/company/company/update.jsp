<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true">  
<head>
	<html:base/>
	<script src="/tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						保险公司修改
					</div>
				</td>
			</tr>
			<tr>
			<td width="33%"><div align="center">性质</div></td> 
			<td width="33%"><div align="center">公司名称</div></td> 
			<td width="33%"><div align="center">修改</div></td>
			</tr> 
			<sql:query var="q1" dataSource="${db_mssql }" sql="select a.*,b.c_name type from t_company a,t_namecode b 
				where b.c_type=30 and a.c_type=b.c_code order by a.c_type "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td><div align="center">${row.type}</div></td> 
			<td><div align="center">${row.c_fullname}</div></td>
			<td><div align="center">
			<a href="../../../toModule.do?prefix=/system&page=/company/company/update2.jsp?c_no=${row.c_no }">
			   修改</a>
			</div></td> 
			</tr>	
			</c:forEach>						 	
		</table>
</body>
</html:html>
