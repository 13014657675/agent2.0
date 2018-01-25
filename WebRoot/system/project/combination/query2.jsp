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
						项目查询
					</div>
				</td>
			</tr>
			<tr>   
			<td width="25%"><div align="center">中文名称</div></td>
			<td width="50%"><div align="center">公式</div></td>
			<td width="25%"><div align="center">查询</div></td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from tb_combination where c_projectclass=${param.c_projectclass } order by c_cid"></sql:query>
			<c:forEach items="${q2.rows }" var="row">
			<tr>  
			<td><div align="center">
			 ${row.c_name }
			</div></td>
			<td><div align="left">   
			（<c:choose>
			<c:when test="${row.c_t1 eq 1 }">
				<sql:query var="q32" dataSource="${db_mssql }" sql="select * from vb_processor where c_o=${row.c_o1 }"></sql:query> 
				${q32.rows[0].c_name }
			</c:when>
			<c:when test="${row.c_t1 eq 2 }">
			${row.c_x1 }
			</c:when>
			</c:choose>）
						 
			<c:choose>
			<c:when test="${row.c_op eq 1 }">加</c:when>
			<c:when test="${row.c_op eq 2 }">减</c:when>
			<c:when test="${row.c_op eq 3 }">乘</c:when>
			<c:when test="${row.c_op eq 4 }">除</c:when>
			</c:choose>
			
			（<c:choose>
			<c:when test="${row.c_t2 eq 1 }">
				<sql:query var="q42" dataSource="${db_mssql }" sql="select * from vb_processor where c_o=${row.c_o2 }"></sql:query> 
				${q42.rows[0].c_name }
			</c:when>
			<c:when test="${row.c_t2 eq 2 }">
			${row.c_x2 }
			</c:when>
			</c:choose>）						
			</div></td>
			<td width="33%" valign="middle" align="center"> 		
			<a href="../../../toModule.do?prefix=/system&page=/project/combination/query3.jsp?c_cid=${row.c_cid }">查询</a> 
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
