<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>  
		<c:choose>
		<c:when test="${param.c_type eq 1 }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxbd 
				where c_orgid=${param.c_orgid } and c_companyid=${param.c_companyid } and c_tbd='${param.c_tbd }' and c_flag='0'"></sql:query>
		</c:when>
		<c:when test="${param.c_type eq 2 }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxbd 
				where c_orgid=${param.c_orgid } and c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_flag='0'"></sql:query>
		</c:when>
		</c:choose>
		<html:form action="/sxbd">
		<html:hidden property="jobname" value="sxbdback" />
		<nested:nest property="sxbd">  	
		<nested:hidden property="c_companyid" value="${q1.rows[0].c_companyid }"></nested:hidden>
		<nested:hidden property="c_tbd" value="${q1.rows[0].c_tbd }"></nested:hidden>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						����״̬�ָ�
					</div>
				</td>
			</tr>					
			<tr>
				<td width="50%" align="right">���չ�˾</td>
				<td>
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${q1.rows[0].c_companyid }"></sql:query>
					${q2.rows[0].c_name }
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">Ͷ������</td>
				<td>
					${q1.rows[0].c_tbd }
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right">������</td>
				<td>
					${q1.rows[0].c_bd }
				</td>
			</tr> 			
			<tr>
				<td width="50%" align="right">Ͷ����</td>
				<td>
					<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${q1.rows[0].c_tbrnum }"></sql:query>
					 ${q3.rows[0].c_name }
				</td>
			</tr>  
			<tr>
				<td width="50%" align="right">��ǰ״̬</td>
				<td>
					<c:choose> 
					<c:when test="${fn:trim(q1.rows[0].c_jobnm) eq '0' }">����״̬</c:when>
					<c:when test="${fn:trim(q1.rows[0].c_jobnm) eq '4' }">��ԥ���˱���������</c:when>
					<c:when test="${fn:trim(q1.rows[0].c_jobnm) eq '5' }">�����˱�</c:when> 					
					<c:when test="${fn:trim(q1.rows[0].c_jobnm) eq 'zz' }">������ֹ</c:when>
					</c:choose>
				</td>
			</tr>			 
			</nested:nest>
			<tr>
				<td width="50%" align="right">
				<input type="submit" value=" ȷ �� ">
				</td>
				<td width="50%" >
				<input type="reset" value=" �� �� ">
				</td>
			</tr> 
		</table>
</html:form> 
</body>
</html:html>
