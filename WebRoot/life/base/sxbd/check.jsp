<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>  
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						Ͷ��������
					</div>
				</td>
			</tr>					
			<tr>
			<td width="20%">���չ�˾</td>
			<td width="30%">Ͷ������</td>
			<td width="10%">Ͷ����</td>
			<td width="10%">Ͷ������</td>
			<td width="10%">������</td>			
			<td width="20%"></td>	
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxbd 
				where c_orgid=${sessionScope.Staff.c_orgid } and c_jobnm='add' and c_flag='0' order by c_companyid "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td width="20%">
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			${q2.rows[0].c_name }
			</td>
			<td width="40%">${row.c_tbd }</td>
			<td width="10%">
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${row.c_tbrnum }"></sql:query>		
			${q3.rows[0].c_name }	
			</td>
			<td width="10%">${row.c_tbrq }</td>
			<td width="10%">
			<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${row.c_operator }'"></sql:query>		
			${q4.rows[0].c_name }
			</td>			
			<td width="20%" nowrap="nowrap">
			<html:form action="/sxbd" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="sxbddel" />
			<nested:nest property="sxbd">
			<nested:hidden property="c_companyid" value="${row.c_companyid }"></nested:hidden> 
			<nested:hidden property="c_tbd" value="${row.c_tbd }"></nested:hidden> 
			</nested:nest>
			<a href="../../../toModule.do?prefix=/life&page=/base/sxbd/check2.jsp?c_companyid=${row.c_companyid }&c_tbd=${row.c_tbd }">����</a>��
			<html:submit value="ɾ����"></html:submit>
			</html:form>			
			</td>	
			</c:forEach>			
		</table> 
</body>
</html:html>
