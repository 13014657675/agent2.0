<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<title>����ɾ��</title>
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
						����ɾ��
					</div>
				</td>
			</tr>				 		
			<tr>
				<td width="10%"><div align="center">����</div></td>
				<td width="10%"><div align="center">����</div></td>
				<td width="10%"><div align="center">���</div></td>
				<td width="10%"><div align="center">��������</div></td>
				<td width="10%"><div align="center">���ִ���</div></td>
				<td width="20%"><div align="center">����ȫ��</div></td>
				<td width="20%"><div align="center">���ּ��</div></td>
				<td width="10%"><div align="center">ɾ��</div></td>
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
				<html:form  action="/product" onsubmit="return check_form(this)">
				<html:hidden property="jobname" value="add_update_delete"/>
				<nested:nest property="product">	
				<nested:hidden property="c_jobnm" value="del"></nested:hidden>
				<nested:hidden property="c_code" value="${row.c_code }"></nested:hidden>   
				<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
				<html:submit value="ɾ ��"/>
				</nested:nest>			 
				</html:form> 				
				</div></td>
			</tr>		
			</c:forEach> 
		</table>	 
</body>
</html:html>
