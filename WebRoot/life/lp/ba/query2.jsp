<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>
<body>	 
	<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxlp 
		where c_orgid=${param.c_orgid } and c_companyid=${param.c_companyid } and c_jobnm='ba'"></sql:query>
	<table width="100%" border="1" cellspacing="0" id="table">
			<tr >
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">						
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						报案查询
					</div>
				</td>
			</tr>
			<tr>
			<td width="25%" align="center">保险公司</td>
			<td width="40%">保单号</td>
			<td width="10%">报案日期</td>
			<td width="25%">查询</td>
			</tr>	 
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td width="25%" align="center">
			<sql:query var="q2"  sql="select * from t_company where c_no=${row.c_companyid }" dataSource="${db_mssql}"></sql:query>
			${q2.rows[0].c_name }
			</td>
			<td width="40%">${row.c_bd }</td>
			<td width="10%">${row.c_barq }</td>
			<td width="25%">
			<A href="../../../toModule.do?prefix=/life&page=/lp/ba/query3.jsp?c_no=${row.c_no }">查询</A>
			</td>
			</tr>
			</c:forEach>			 
		</table> 
</body>
</html:html>

