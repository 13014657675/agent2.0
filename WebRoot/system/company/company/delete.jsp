<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true">  
<head>
	<html:base/>
	<script src="/tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						���չ�˾ɾ��
					</div>
				</td>
			</tr>
			<tr>
			<td width="33%"><div align="center">����</div></td> 
			<td width="33%"><div align="center">��˾����</div></td> 
			<td width="33%"><div align="center">ɾ��</div></td>
			</tr> 
			<sql:query var="q1" dataSource="${db_mssql }" sql="select a.*,b.c_name type from t_company a,t_namecode b 
				where b.c_type=30 and a.c_type=b.c_code order by a.c_type "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td><div align="center">${row.type}</div></td> 
			<td><div align="center">${row.c_fullname}</div></td>
			<td><div align="center">
			 	<html:form  action="/company" >
				<html:hidden property="jobname" value="add_update_delete"/>
				<nested:nest property="company">	
				<nested:hidden property="c_jobnm" value="del"></nested:hidden>
			 	<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>
			 	<nested:hidden property="c_name" value="${row.c_name }"></nested:hidden>
			 	</nested:nest>
			 	<html:submit value="ɾ��"/>
			 	</html:form>
			</div></td> 
			</tr>	
			</c:forEach>		 	
		</table>
</body>
</html:html>
