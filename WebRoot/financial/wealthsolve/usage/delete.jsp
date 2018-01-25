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
						使用性质删除
					</div>
				</td>
			</tr>
			<tr>  
			<td width="33%"><div align="center">业务政策</div></td>
			<td width="33%"><div align="center">项目名称</div></td>
			<td width="33%"><div align="center">删除</div></td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_usage order by c_no"></sql:query>
			<c:forEach items="${q2.rows }" var="row">
			<tr>  
			<td><div align="center">
			<sql:query var="a1"	sql="select * from t_policy where c_system=${row.c_system } "	dataSource="${db_mssql}"></sql:query>
			${a1.rows[0].c_name }
			</div></td>
			<td><div align="center">${row.c_name }</div></td>
			<td width="50%" valign="middle" align="center"> 		
			<html:form  action="/wealthsolve" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="usage"/>
			<nested:nest property="product">	
			<nested:hidden property="c_jobnm" value="del"></nested:hidden>
			<nested:hidden property="c_system" value="${row.c_system }"></nested:hidden>
			<nested:hidden property="c_name" value="${row.c_name }"></nested:hidden>
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<html:submit value="删 除"/>
			</nested:nest>			 
			</html:form> 
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
