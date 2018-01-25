<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>系数删除</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
</head>		
<body  >
		<form action="../../../toModule.do?prefix=/system&page=/company/convert/delete2.jsp" method="post">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						系数删除
				</td>
			</tr>
		</table> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
			  <td align="right" width="50%">保险公司</td>
				<td width="57%" align="left">
					 <select name="c_companyid" id="c_companyid" onchange="set();">
						<sql:query var="q1"	sql="select * from t_company where c_type =3001"	dataSource="${db_mssql}"></sql:query>
						<c:forEach var="row" items="${q1.rows}">
							<option value="${row.c_no}">
								${row.c_name}
							</option>
						</c:forEach>
					 </select>	
				</td>
			</tr>			  
			<tr>
				<td align="right">
					<input type="submit" value="确 定"/>
				</td>
				<td align="left">
					<input type="reset" value="取 消"/>
				</td>
			</tr>		 
		</table>
	</form>	
	</body>
</html:html> 