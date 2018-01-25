<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>		
	<body>		
		<form action="../../../toModule.do?prefix=/system&page=/organization/organization/update2.jsp" method="post">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构修改
					</div>
				</td>
			</tr> 		
			<tr>
				<td width="48%"><div align="right">机构类型</div></td>
				<td width="52%" >
				<div align="left">
					<select name="c_orgtypeid" style="width: 120">
					<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_orgtype order by c_order "></sql:query>
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr>  
			<tr>
				<td width="48%" align="right"><input type="submit" value="下一步"></td>
				<td width="52%" colspan="2"> 
				</td> 
			</tr>		
		</table>	
	</form>
	</body> 
</html:html>
