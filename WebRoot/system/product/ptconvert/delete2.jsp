<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>系数删除</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
<body >	  
		<table width="100%" border="1" cellspacing="0">		
			<tr>
				<td height="33" colspan="8" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						系数删除
				</td>
			</tr>	
			<tr>  
				<td align="center" width="50%">
					系数类型
				</td>				 			 
				<td align="center"width="50%">
				    查询
				</td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select c_convertT from t_ptconvert 
				where c_companyid=${param.c_companyid } and c_productid=${param.c_productid } 
				group by c_convertT "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr> 
				<td align="center" width="15%">
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_convertT where c_no=${row.c_convertT }"></sql:query>
					${q2.rows[0].c_name }
				</td> 				 				 
				<td align="center">
				<a href="../../../toModule.do?prefix=/system&page=/product/ptconvert/delete3.jsp?c_companyid=${param.c_companyid }&c_productid=${param.c_productid }&c_convertT=${row.c_convertT }">删除</a>   
				</td>
			</tr>
			</c:forEach>						
		</table> 
	</body>
</html:html>
