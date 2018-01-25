<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>佣金率设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
</head>
<body > 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						佣金率复核
				</td>
			</tr> 					
			<tr>
				<td align="center">保险公司</td>
				<td align="center">险种</td>
				<td align="center">业务政策</td>
				<td align="center">佣金项目名称</td>
				<td align="center">保单年度</td>
				<td align="center">复核</td>
			</tr> 		 
			 <sql:query var="q1" dataSource="${db_mssql }" 
			 		sql="select a.c_companyid,a.c_productid,a.c_system,a.c_exptypeid,a.c_bdnd,b.c_name,c.c_code,c.c_fullname from t_expsrate a,t_company b,t_product c
			 	 where a.c_companyid=b.c_no and a.c_companyid=c.c_companyid and a.c_productid=c.c_no and a.c_jobnm <> '0'   
			 	 group by a.c_companyid,a.c_productid,a.c_system,a.c_exptypeid,a.c_bdnd,b.c_name,c.c_code,c.c_fullname"></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			 <tr>
				<td align="center">${row.c_name }</td>
				<td align="center">${fn:trim(row.c_fullname) }[${row.c_code }]</td>				
				<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_policy where c_system=${row.c_system }"></sql:query>
				<td align="center">${q2.rows[0].c_name }</td>
				<td align="center">					
					<c:choose>
		            <c:when test="${row.c_exptypeid eq 0}">
		             	佣金率 
		            </c:when>
		            <c:otherwise>
		            <sql:query var="exptypeid" dataSource="${db_mssql }" sql="select * from t_exptype where c_no=${row.c_exptypeid }"></sql:query>
		            ${exptypeid.rows[0].c_name }          
		            </c:otherwise>
		            </c:choose>  
				</td>
				<td align="center">${row.c_bdnd }</td>
				<td align="center"><A href="../../../toModule.do?prefix=/financial&page=/lifesolve/expsrate/check2.jsp?c_companyid=${row.c_companyid }&c_productid=${row.c_productid }&c_bdnd=${row.c_bdnd }&c_system=${row.c_system }&c_exptypeid=${row.c_exptypeid }">复核</A></td>
			</tr> 	
			</c:forEach>
		</table>
		
	</body> 
</html:html>
