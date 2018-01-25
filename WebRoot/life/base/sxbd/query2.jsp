<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">   
	<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
	</head>
	<body >   
		<sql:query var="q2" dataSource="${db_mssql }" sql="select c_companyid,c_tbd,c_bd,c_tbrnum,c_bbrnum from t_sxbd 
			where c_tbrnum in (select c_no from t_customer where c_name='${param.c_name }' ) and c_orgid=${param.c_orgid } and c_flag='0' 
			union 
			select c_companyid,c_tbd,c_bd,c_tbrnum,c_bbrnum from t_sxbd 
			where c_bbrnum in (select c_no from t_customer where c_name='${param.c_name }' ) and c_orgid=${param.c_orgid } and c_flag='0' "></sql:query>
	 
		<table width="100%" border="0" cellspacing="0" align="center" >
				<tr>
					<td height="33" colspan="8" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							投保单查询
						</div>
					</td>
				</tr>			
				<tr>
				<td width="10%">保险公司</td>
				<td width="25%">投保单</td>
				<td width="25%">保单</td>
				<td width="20%">客户类型</td>
				<td width="10%">客户姓名</td>
				<td width="10%">查询</td>
				</tr>
				<c:forEach items="${q2.rows }" var="row">
				<tr>
				<td width="10%">
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
					${q3.rows[0].c_name }
				</td>
				<td width="25%">${row.c_tbd }</td>
				<td width="25%">${row.c_bd }</td>
				<td width="20%">
					<sql:query var="a1" dataSource="${db_mssql }" sql="select c_no from t_customer where c_name='${param.c_name }' and c_no=${row.c_tbrnum } "></sql:query>
					<sql:query var="a2" dataSource="${db_mssql }" sql="select c_no from t_customer where c_name='${param.c_name }' and c_no=${row.c_bbrnum } "></sql:query>
					<c:if test="${not empty a1.rows }">投保人</c:if>
					<c:if test="${not empty a2.rows }">被保人</c:if>				 
				</td>
				<td width="10%">${param.c_name }</td>
				<td width="10%">
				<a href="../../../toModule.do?prefix=/life&page=/base/sxbd/query3.jsp?c_orgid=${param.c_orgid }&c_companyid=${row.c_companyid }&c_tbd=${row.c_tbd }">查询</a>
				</td>
				</tr>
				</c:forEach>
			</table>  
	</body>
</html:html> 