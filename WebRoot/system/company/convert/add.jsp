<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>�۱�ϵ�����</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
</head>
<body  >
		<form action="../../../toModule.do?prefix=/system&page=/company/convert/add2.jsp" method="post" onsubmit="return check_form(this)">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						ϵ�����
				</td>
			</tr>
		</table> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
			  <td align="right" width="50%">���չ�˾</td>
				<td width="57%" align="left">
					 <select name="c_companyid" id="c_companyid" >
						<sql:query var="q1"	sql="select * from t_company where c_type =3001 order by c_no"	dataSource="${db_mssql}"></sql:query>
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
					ϵ������
				</td>
				<td align="left"> 							
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_convertT"></sql:query>			
					<select name=c_convertT id="c_convertT">
					<c:forEach items="${q2.rows }" var="row">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach> 
					</select>
				</td>
			</tr>		 
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="��һ��">
				</td>				
			</tr>
		</table>
	</form>	
	</body>
</html:html>
