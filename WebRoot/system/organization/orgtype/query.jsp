<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true"> 
<head>
	<html:base/>
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
	<body>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						类型查询
					</div>
				</td>
			</tr>
			<tr>
			<td width="30%"><div align="center">顺序</div></td> 
			<td width="30%"><div align="center">类型名称</div></td> 
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_orgtype order by c_order"></sql:query>
			<c:forEach items="${q2.rows }" var="row">
			<tr>
			<td><div align="center">${row.c_order }</div></td> 
			<td><div align="center">${row.c_name }</div></td>
			</tr>
			</c:forEach></table>
			</body> 
	
</html:html>
