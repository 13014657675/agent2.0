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
				<td height="33" colspan="5" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						薪酬项目删除
					</div>
				</td>
			</tr>
			<tr> 
			<td width="33%"><div align="center">类别名称</div></td>
			<td width="33%"><div align="center">项目名称</div></td>
			<td width="33%"><div align="center">删除</div></td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_pproject order by c_type "></sql:query>
			<c:forEach items="${q2.rows }" var="row">
			<tr> 
			<td><div align="center">
			<c:choose>
			<c:when test="${row.c_type eq 1 }">基本项目</c:when>
			<c:when test="${row.c_type eq 2 }">社保项目</c:when>
			</c:choose>
			</div></td>			
			<td><div align="center">${row.c_name }</div></td>	
			<td   valign="middle" align="center"> 		
			<html:form  action="/pay" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="pproject"/>
			<nested:nest property="pay">	
			<nested:hidden property="c_jobnm" value="del"></nested:hidden>
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<html:submit value="删 除"/>
			</nested:nest>			 
			</html:form> 
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
