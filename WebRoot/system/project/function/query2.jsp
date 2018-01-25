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
						函数查询
					</div>
				</td>
			</tr>
			<tr>   
			<td width="33%"><div align="center">中文名称</div></td>
			<td width="33%"><div align="center">英文名称</div></td>
			<td width="33%"><div align="center">查询</div></td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from tb_function where c_projectclass=${param.c_projectclass } order by c_fid"></sql:query>
			<c:forEach items="${q2.rows }" var="row">
			<tr>  
			<td><div align="center">
			 ${row.c_name }
			</div></td>
			<td><div align="center">${row.c_proc }</div></td>
			<td width="33%" valign="middle" align="center"> 		
			<a href="../../../toModule.do?prefix=/system&page=/project/function/query3.jsp?c_fid=${row.c_fid }">查询</a> 
			</td></tr>
			</c:forEach></table>
			</body> 	
</html:html>
