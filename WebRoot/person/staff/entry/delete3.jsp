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
							��˾����ɾ��
						</div>
					</td>
				</tr>	
				<tr> 
				<td align="center" width="10%">��������</td>
				<td align="center" width="10%">����</td>
				<td align="center" width="10%">����</td>
				<td align="center" width="15%">֤������</td>
				<td align="center" width="20%">֤������</td> 
				<td align="center" width="15%">��˾ʱ��</td> 
				<td align="center" width="10%">ɾ��</td>
				</tr>
				<c:choose>
				<c:when test="${param.c_type eq 1 }">
				<sql:query var="q1" sql="select * from t_staff where c_jobnumber='${param.c_jobnumber }' and c_quitdate is null " dataSource="${db_mssql }"></sql:query>
				</c:when> 
				<c:when test="${param.c_type eq 2 }">
				<sql:query var="q1" sql="select  * from t_staff where c_orgid=${param.c_orgid } and c_quitdate is null order by c_jobnumber " dataSource="${db_mssql }"></sql:query> 
				</c:when>	 		
				</c:choose>				
				<c:forEach items="${q1.rows }" var="row">
				<tr>
				<sql:query var="q2"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${row.c_orgid } "></sql:query> 
				<td align="center">${q2.rows[0].c_name }</td>
				<td align="center">${row.c_jobnumber }</td>
				<td align="center">${row.c_name }</td>
				<td align="center">
				<sql:query var="q4"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14 and c_code=${row.c_certificatetype }"></sql:query>
				${q4.rows[0].c_name }
				</td>
				<td align="center">${row.c_certificate }</td> 
				<td align="center">${row.c_datime }</td> 
				<td align="center">
				<html:form  action="/staff" onsubmit="return check_form(this)">
				<html:hidden property="jobname" value="staff_delete"/>
				<nested:nest property="staff">	
				<nested:hidden property="c_jobnumber" value="${row.c_jobnumber }"></nested:hidden> 				
				</nested:nest>
				<html:submit value="ɾ ��"></html:submit>
				</html:form>				
				</td>
				</tr>
				</c:forEach> 
				 
				</table> 
				
				<ul>
				<li>�Ѿ���˾�Ĵ����ˣ�����ϵͳ������������ɾ����������˾���ϡ�</li>
				</ul>
			</body>			 
</html:html>
