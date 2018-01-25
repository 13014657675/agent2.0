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
			<td width="25%"><div align="center">参数</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from tb_cparam where c_cid=${param.c_cid } order by c_order"></sql:query>			
			<c:forEach items="${q1.rows }" var="row">
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from tb_combination where c_cid=${param.c_cid } "></sql:query>
			<tr>  
			<td><div align="center">
			 ${q2.rows[0].c_name }
			</div></td>
			<td><div align="left">   
			（<c:choose>
			<c:when test="${q2.rows[0].c_t1 eq 1 }">
				<sql:query var="q32" dataSource="${db_mssql }" sql="select * from vb_processor where c_o=${q2.rows[0].c_o1 }"></sql:query> 
				${q32.rows[0].c_name }				
			</c:when>
			<c:when test="${q2.rows[0].c_t1 eq 2 }">
			${q2.rows[0].c_x1 }
			</c:when>
			</c:choose>）
						 
			<c:choose>
			<c:when test="${q2.rows[0].c_op eq 1 }">加</c:when>
			<c:when test="${q2.rows[0].c_op eq 2 }">减</c:when>
			<c:when test="${q2.rows[0].c_op eq 3 }">乘</c:when>
			<c:when test="${q2.rows[0].c_op eq 4 }">除</c:when>
			</c:choose>
			
			（<c:choose>
			<c:when test="${q2.rows[0].c_t2 eq 1 }">
				<sql:query var="q42" dataSource="${db_mssql }" sql="select * from vb_processor where c_o=${q2.rows[0].c_o2 }"></sql:query> 
				${q42.rows[0].c_name }
			</c:when>
			<c:when test="${q2.rows[0].c_t2 eq 2 }">
			${q2.rows[0].c_x2 }
			</c:when>
			</c:choose>）						
			</div></td>
			<td width="33%" valign="middle" align="center"> 		
			<sql:query var="q51" dataSource="${db_mssql }" sql="select * from tb_param where c_pid=${row.c_xid }"></sql:query>
			<sql:query var="q52" dataSource="${db_mssql }" sql="select * from vb_processor where c_o=${row.c_xid }"></sql:query> 
			<c:choose>
			<c:when test="${ not empty q51.rows }">${q51.rows[0].c_name }</c:when>
			<c:when test="${ not empty q52.rows }">${q52.rows[0].c_name }</c:when> 
			</c:choose>
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
