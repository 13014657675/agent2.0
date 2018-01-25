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
						工具目录修改
					</div>
				</td>
			</tr>
			<tr> 
			<td width="50%"><div align="center">目录名</div></td>
			<td width="50%"><div align="center">修改</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql=" select * from t_catalog where c_sys = 2  "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<html:form  action="/tool" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="catalog_add_delete"/>
			<nested:nest property="file">	
			<nested:hidden property="c_jobnm" value="update"></nested:hidden> 		
			<nested:hidden property="c_sys" value="2"></nested:hidden> 	 
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>
			<tr>
			<td><div align="center"><nested:text property="c_name" value="${row.c_name }" size="30"></nested:text></div></td>  		
			<td   valign="middle" align="center">				   
			<html:submit value="修 改"/>
			</nested:nest>			 
			</html:form> 
			
			</c:forEach></table>
			</body> 
	
</html:html>
