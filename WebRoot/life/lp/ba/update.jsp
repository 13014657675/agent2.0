<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>
<body>	  
	<form action="../../../toModule.do?prefix=/life&page=/lp/ba/update2.jsp" method="post">
	<input type="hidden" name="c_orgid" value="${sessionScope.Staff.c_orgid }">
		<table width="100%" border="1" cellspacing="0" id="table">
			<tr >
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">						
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						报案修改
					</div>
				</td>
			</tr>
			<tr>
				<td width="50%"   align="right" >
					保险公司
				</td>
				<td > 
					<select name="c_companyid"  >
					<sql:query var="query"  sql="select * from t_company where c_type=3001" dataSource="${db_mssql}"></sql:query>
					<c:forEach var="row" items="${query.rows}">
					<option value="${row.c_no}">${row.c_fullname}</option>
					</c:forEach>	
					</select> 
				</td>
			</tr>			  			 		
			<tr>
				<td align="right"  >					
					<html:submit value=" 下一步 " />
				</td>
				<td  >
					 
				</td>
			</tr>
		</table> 
		</form>
</body>
</html:html>

