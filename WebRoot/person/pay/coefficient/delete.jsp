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
				<td height="33" colspan="7" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						н��ϵ��ɾ��
					</div>
				</td>
			</tr>
			<tr> 
			<td width="15%"><div align="center">����ϵ������</div></td>
			<td width="15%"><div align="center">��Ӧָ������</div></td>
			<td width="15%"><div align="center">��������</div></td>
			<td width="15%"><div align="center">������Ч��</div></td>
			<td width="15%"><div align="center">����������</div></td>
			<td width="15%"><div align="center">������</div></td>
			<td width="15%"><div align="center">ɾ��</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_pcoefficient order by c_no "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr> 
			<td width="15%"><div align="center">${row.c_var }</div></td>			
			<td width="15%"><div align="center">${row.c_name }</div></td>	
			<td width="15%"><div align="center">
			<c:choose>
			<c:when test="${row.c_input eq 11}">�ֶ�����ָ��</c:when> 
			<c:when test="${row.c_input eq 21}">ϵͳ��ȡָ��</c:when>
			</c:choose>			
			</div></td>			
			<td width="15%"><div align="center">
			<c:choose>
			<c:when test="${row.c_period eq 1}">�¶�</c:when>
			<c:when test="${row.c_period eq 3}">����</c:when>
			<c:when test="${row.c_period eq 12}">���</c:when>
			</c:choose>
			</div></td>
			<td width="15%"><div align="center">
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from vb_processor where c_o=${row.c_o } "></sql:query>
			<c:if test="${not empty q2.rows }">
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from tb_projectclass where c_no=${q2.rows[0].c_projectclass } "></sql:query>
			</c:if>			
			 ${q3.rows[0].c_name }
			</div></td>
			<td width="15%"><div align="center"> 
			 ${q2.rows[0].c_name }
			</div></td>
			<td width="15%"  valign="middle" align="center"> 		
			<html:form  action="/pay" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="pcoefficient"/>
			<nested:nest property="pay">	
			<nested:hidden property="c_jobnm" value="del"></nested:hidden>
			<nested:hidden property="c_var" value="${row.c_var }"></nested:hidden>
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<html:submit value=" ɾ �� " />
			</nested:nest>			 
			</html:form> 
			</td></tr>
			</c:forEach></table>
			</body> 
	
</html:html>
