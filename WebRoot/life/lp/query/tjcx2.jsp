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
		<c:when test="${param.c_jobnm eq 'a' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxlp 
			where c_orgid=${param.c_orgid } and c_barq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_barq"></sql:query>
		</c:when>
		<c:when test="${param.c_jobnm eq 'b' }">
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxlp 
			where c_orgid=${param.c_orgid } and c_jarq between '${param.c_ksrq }' and '${param.c_jsrq }'
			order by c_companyid,c_jarq"></sql:query>
		</c:when> 
		</c:choose>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="20" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						ͳ�����ݲ�ѯ
					</div>
				</td>
			</tr>					
			<tr>
			<td>���չ�˾</td> 
			<td>������</td>
			<td>Ͷ��������</td> 
			<td>��������</td>
			<td>�᰸����</td>			 
			<td>����״̬</td>
			<td>��ѯ</td>
			</tr> 
			<c:forEach items="${q1.rows }" var="row">
			<tr>
			<td>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			${q2.rows[0].c_name }
			</td> 
			<td>${row.c_bd }</td>
			<td>${row.c_tbrname }</td>
			<td>${row.c_barq }</td>
			<td>${row.c_jarq }</td>			 
			<td>
				<c:choose> 
				<c:when test="${fn:trim(row.c_bdzt) eq '0' }">����״̬</c:when> 			
				<c:when test="${fn:trim(row.c_bdzt) eq 'zz' }">������ֹ</c:when>
				</c:choose>
			</td>
			<td>
			<A href="../../../toModule.do?prefix=/life&page=/lp/query/tjcx3.jsp?c_no=${row.c_no }">��ѯ</A>
			</td>
			</tr>
			</c:forEach>			 
		</table> 
</body>
</html:html>
