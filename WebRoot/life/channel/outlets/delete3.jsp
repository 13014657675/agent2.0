<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head> 
		<body>		  
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
				<td align="center" width="16%">��������</td>
				<td align="center" width="16%">��������</td>
				<td align="center" width="16%">��������</td>
				<td align="center" width="16%">�������</td>
				<td align="center" width="15%">��������</td>
				<td align="center" width="16%">ɾ��</td>
				</tr>				
				<sql:query var="q1"  dataSource="${db_mssql}" sql="select * from t_bankoutlets where c_orgid=${param.c_orgid }"></sql:query>	
				<c:forEach items="${q1.rows }" var="row">
				<tr>
				<sql:query var="q2"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${row.c_orgid }"></sql:query>
				<sql:query var="q3"  dataSource="${db_mssql}" sql="select * from t_orgtype where c_no =${q2.rows[0].c_orgtypeid } "></sql:query>
				<td align="center">${q3.rows[0].c_name }</td>
				<td align="center">${q2.rows[0].c_name }</td>
				<td align="center">
				<sql:query var="q4"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=15 and c_code=${row.c_bank }"></sql:query>
				${q4.rows[0].c_name }
				</td>				  
				<td align="center">${row.c_code }</td>
				<td align="center">${row.c_name }</td>
				<td align="center">
				 		<html:form  action="/channel" onsubmit="return check_form(this)">
						<html:hidden property="jobname" value="outlets"/>
						<nested:nest property="bankoutlets">	 
						<nested:hidden property="c_jobnm" value="del"></nested:hidden> 
						<nested:hidden property="c_no"    value="${row.c_no }"></nested:hidden>  
						<input type="submit" value=" ɾ�� ">
						</nested:nest>
						</html:form>
				</td>
				</tr>
				</c:forEach> 
				 
				</table> 
			</body>			
</html:html>			