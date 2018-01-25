<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head> 
		<body>	 		  
		<sql:query var="q1" dataSource="${db_mssql }" sql=" select distinct c_pcoefficient  from t_pcoefficientset  where c_orgid=${param.c_orgid } "></sql:query>
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="4" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							薪酬系数值删除
						</div>
					</td>
				</tr>	
				<tr>
				<td align="center" width="25%">基本系数名称</td>
				<td align="center" width="25%">对应指标名称</td>
				<td align="center" width="25%">有效期</td>
				<td align="center" width="25%">删除</td>
				</tr>
				<c:forEach items="${q1.rows }" var="row">
					<sql:query var="q2" dataSource="${db_mssql }" sql=" select * from t_pcoefficient  where c_no=${row.c_pcoefficient } "></sql:query>
					<sql:query var="q3" dataSource="${db_mssql }" sql=" select c_year,c_number from t_pcoefficientset  
						where c_orgid=${param.c_orgid } and c_pcoefficient=${row.c_pcoefficient } group by c_year,c_number "></sql:query>
					<c:forEach items="${q3.rows }" var="row3">
					<tr>
					<td align="center" width="25%">${q2.rows[0].c_var }</td>
					<td align="center" width="25%">${q2.rows[0].c_name }</td>
					<td align="center" width="25%">
					<c:choose>
					<c:when test="${q2.rows[0].c_period eq 1}">
					${row3.c_year }年
					第${row3.c_number }月
					</c:when>
					<c:when test="${q2.rows[0].c_period eq 3}">
					${row3.c_year }年
					第${row3.c_number }季
					</c:when>
					<c:when test="${q2.rows[0].c_period eq 12}">
					${row3.c_year }年					
					</c:when> 
					</c:choose>						
					</td>
					<td align="center" width="25%">
					<a href="../../../toModule.do?prefix=/person&page=/pay/coefficientset/delete3.jsp?c_orgid=${param.c_orgid }&c_pcoefficient=${row.c_pcoefficient }&c_year=${row3.c_year }&c_number=${row3.c_number }&c_period=${q2.rows[0].c_period }">删除</a>					
					</td>
					</tr>  	 
					</c:forEach> 	
				</c:forEach> 	 
				</table>
		
			</body>			 
</html:html>
