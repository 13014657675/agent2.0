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
				<td height="33" colspan="4" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						参数删除
					</div>
				</td>
			</tr>
			<tr>   
			<td width="25%"><div align="center">参数类型ID</div></td>
			<td width="25%"><div align="center">参数类型</div></td>
			<td width="25%"><div align="center">参数名称</div></td>
			<td width="25%"><div align="center">删除</div></td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from tb_param order by c_pid"></sql:query>
			<c:forEach items="${q2.rows }" var="row">
			<tr>  
			<td align="center">${row.c_pid }</td>
			<td><div align="center">
			<c:choose>
			<c:when test="${row.c_type eq 1 }">字符</c:when>
			<c:when test="${row.c_type eq 2 }">数字</c:when>
			</c:choose>
			</div></td>
			<td><div align="center">${row.c_name }</div></td>
			<td width="33%" valign="middle" align="center"> 		
			<html:form  action="/project" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="param"/>
			<nested:nest property="processor">	
			<nested:hidden property="c_jobnm" value="del"></nested:hidden>
			<nested:hidden property="c_pid" value="${row.c_pid }"></nested:hidden>   
			<html:submit value="删 除"/>
			</nested:nest>			 
			</html:form> 
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
