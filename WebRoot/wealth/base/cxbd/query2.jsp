<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">   
	<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
	</head>
	<body >   
		<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_cxbd 
			where c_orgid=${param.c_orgid } and c_customer='${param.c_name }' and c_flag='0'"></sql:query>
	 
		<table width="100%" border="0" cellspacing="0" align="center" >
				<tr>
					<td height="33" colspan="8" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							保单查询
						</div>
					</td>
				</tr>			
				<tr>
				<td width="20%">保险公司</td> 
				<td width="40%">保单</td> 
				<td width="20%">被保险人姓名</td>
				<td width="20%">查询</td>
				</tr>
				<c:forEach items="${q2.rows }" var="row">
				<tr>
				<td width="20%">
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
					${q3.rows[0].c_name }
				</td> 
				<td width="40%">${row.c_bd }</td>
				<td width="20%">${row.c_customer }</td> 
				<td width="20%">
				<a href="../../../toModule.do?prefix=/wealth&page=/base/cxbd/query3.jsp?c_orgid=${param.c_orgid }&c_companyid=${row.c_companyid }&c_bd=${row.c_bd }">查询</a>
				</td>
				</tr>
				</c:forEach>
			</table>  
	</body>
</html:html> 