<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<title>�����޸�</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head> 
<body>
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_product 
				where c_companyid=${param.c_companyid }"></sql:query>		
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						�����޸�
					</div>
				</td>
			</tr>				 		
			<tr>
				<td width="10%"><div align="center">����</div></td>
				<td width="10%"><div align="center">����</div></td>
				<td width="10%"><div align="center">���</div></td>
				<td width="10%"><div align="center">��������</div></td>
				<td width="10%"><div align="center">���ִ���</div></td>
				<td width="25%"><div align="center">����ȫ��</div></td>
				<td width="15%"><div align="center">���ּ��</div></td>
				<td width="10%"><div align="center">�޸�</div></td>
			</tr>		
			<c:forEach items="${q1.rows }" var="row">
		 	<tr>
				<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_namecode where  c_code=${row.c_ptnature }"></sql:query>	
				<td ><div align="center">${q2.rows[0].c_name }
				</div></td>
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_ptclass where c_no=${row.c_ptclassid }"></sql:query>	
				<td ><div align="center">${q3.rows[0].c_name }
				</div></td>
				<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_pttype where  c_no=${row.c_pttypeid }"></sql:query>	
				<td ><div align="center">${q4.rows[0].c_name }
				</div></td>
				<td ><div align="center">
				<c:choose>
				<c:when test="${row.c_type eq 1 }"> ����</c:when>
				<c:when test="${row.c_type eq 2 }"> ������</c:when>
				</c:choose>
				</div></td>
				<td ><div align="center">${row.c_code }</div></td>
				<td ><div align="center">${row.c_fullname }</div></td>
				<td ><div align="center">${row.c_name }</div></td>
				<td ><div align="center">
				<a href="../../../toModule.do?prefix=/system&page=/product/product/update3.jsp?c_no=${row.c_no }">�޸�</a>				
				</div></td>
			</tr>		
			</c:forEach> 
		</table>	 
</body>
</html:html>
