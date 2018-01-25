<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	
</head>		
	<body>		
		<form action="../../../toModule.do?prefix=/person&page=/check/ontype2/delete2.jsp" method="post">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构考勤项目删除
					</div>
				</td>
			</tr> 	
			<tr>	
			<td width="48%"><div align="right">机构名称</div></td>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization 
					where c_no in (select c_orgid from t_postset where c_jobnumber = '${sessionScope.c_jobnumber }' )"></sql:query>
			<td width="52%" >	
					<select name="c_orgid" id="c_orgid" >
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
			</td></tr>				 
			<tr>
				<td width="48%" align="right"><input type="submit" value=" 下一步 "></td>
				<td width="52%" colspan="2"> 
					 
				</td> 
			</tr>		
		</table>	
	</form> 
	</body> 
</html:html>
