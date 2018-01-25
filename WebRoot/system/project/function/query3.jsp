<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true"> 
<head>
	<html:base/>
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
	<body>
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from tb_function where c_fid=${param.c_fid } "></sql:query>
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
			<td width="33%"><div align="center">参数</div></td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from tb_fparam where c_fid=${param.c_fid } order by c_order"></sql:query>
			<c:forEach items="${q2.rows }" var="row">
			<tr>  
			<td><div align="center">
			 ${q1.rows[0].c_name }
			</div></td>
			<td><div align="center">${q1.rows[0].c_proc }</div></td>
			<td width="33%" valign="middle" align="center"> 		
			<sql:query var="q31" dataSource="${db_mssql }" sql="select * from tb_param where c_pid=${row.c_xid }"></sql:query>
			<sql:query var="q32" dataSource="${db_mssql }" sql="select * from vb_processor where c_o=${row.c_xid }"></sql:query> 
			<c:choose>
			<c:when test="${ not empty q31.rows }">${q31.rows[0].c_name }</c:when>
			<c:when test="${ not empty q32.rows }">${q32.rows[0].c_name }</c:when> 
			</c:choose>
			</td></tr>
			</c:forEach></table>
			</body> 	
</html:html>
