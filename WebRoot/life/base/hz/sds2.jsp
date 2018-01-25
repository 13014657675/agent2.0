<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>
<sql:update dataSource="${db_mssql }" sql="exec p_sxhzsds  ${param.c_orgid },'${param.c_date }',${param.c_companyid },'${sessionScope.Staff.c_jobnumber }','${sessionScope.Staff.c_ip }'"></sql:update>
<form action="../../../toModule.do?prefix=/life&page=/base/hz/sds3.jsp"  method="post" onsubmit="return check_form(this)">   
<input type="hidden" name="c_orgid" value="${param.c_orgid }">
<input type="hidden" name="c_companyid" value="${param.c_companyid }">
<input type="hidden" name="c_date" value="${param.c_date }">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						回执送达书打印
					</div>
				</td>
			</tr>					
			<tr>
			<td align="right" width="50%">当日次数</td>
			<td  align="left">
			<select style="width: 120" name="c_times">
			<sql:query var="query"  sql="select distinct c_times from t_sxhzsds where c_orgid=${param.c_orgid } and c_date='${param.c_date }' and c_companyid=${param.c_companyid } " dataSource="${db_mssql}"></sql:query>
			<c:forEach var="row" items="${query.rows}" >					
				<option  value="${row.c_times}"  >${row.c_times}</option>					
			</c:forEach>
			</select>
			</td>
			</tr>				 
			<tr>				
				<td align="right">
				<input type="submit" value=" 下一步 ">
				</td>			
				<td> 
				</td>			
			</tr>
		</table>
</form> 
</body>
</html:html>
