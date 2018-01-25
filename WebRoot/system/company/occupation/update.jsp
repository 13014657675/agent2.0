<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true">  
<head>
	<html:base/>
	<script src="/tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>
	<form action="../../../toModule.do?prefix=/system&page=/company/occupation/update2.jsp" method="post">	
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						职业代码修改
					</div>
				</td>
			</tr>
			<tr>
			<td width="50%" align="right">保险公司</td><td>
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_company where c_type =3001 order by c_no"></sql:query>					
				<select name="company">
				<c:forEach items="${q1.rows }" var="row">
				<option value="${row.c_no }">${row.c_name }</option>
				</c:forEach>
				</select>
			</td> 
			</tr>
			<tr>
			<td width="50%" align="right"> 
			<input type="submit" value="确 定">
			</td><td>				 
			</td> 
			</tr> 				 	
		</table>
	</form>	
</body>
</html:html>
