<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true"> 
<head>
	<html:base/>
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
	<body>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						������Ŀɾ��
					</div>
				</td>
			</tr>
			<tr>
			<td width="20%"><div align="center">���</div></td> 
			<td width="20%"><div align="center">����</div></td>
			<td width="20%"><div align="center">����</div></td>
			<td width="20%"><div align="center">���</div></td> 
			<td width="20%"><div align="center">ɾ��</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql=" select * from t_ontype order by c_state,c_code"></sql:query>
			<c:forEach items="${q1.rows }" var="row" varStatus="x">
			<tr>
			<td><div align="center">${x.index+1}</div></td> 
			<td><div align="center">${row.c_name }</div></td>			
			<td><div align="center">${row.c_code }</div></td>	
			<td><div align="center">
			<c:choose>
			<c:when test="${row.c_state eq 0 }">����״̬</c:when>
			<c:when test="${row.c_state eq 1 }">�ۿ�״̬</c:when>
			</c:choose>
			</div></td>				 
			<td   valign="middle" align="center"> 		
			<html:form  action="/check" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="ontype"/>
			<nested:nest property="check">	
			<nested:hidden property="c_jobnm" value="del"></nested:hidden> 		 
			<nested:hidden property="c_code" value="${row.c_code }"></nested:hidden>	 
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<html:submit value="ɾ ��"/>
			</nested:nest>			 
			</html:form> 
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
