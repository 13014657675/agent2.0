<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head>
<body >   
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						������ִ
					</div>
				</td>
			</tr>					
			<tr>
			<td width="20%">���չ�˾</td>
			<td width="30%">������</td>
			<td width="10%">Ͷ����</td>
			<td width="10%">�����˹���</td> 
			<td width="10%">����������</td> 
			<td width="20%"></td>	
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxbd 
				where c_orgid=${sessionScope.Staff.c_orgid } 
				and c_bd in (select c_bd from t_sxbdzt where c_companyid=t_sxbd.c_companyid and c_type=2 and c_flag='0') 
				and c_jobnm='0' and c_flag='0' order by c_companyid "></sql:query>
			<c:forEach items="${q1.rows }" var="row" varStatus="x">
			<tr>
			<td width="20%">
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_company where c_no=${row.c_companyid }"></sql:query>
			${q2.rows[0].c_name }
			</td>
			<td width="30%">			 
			${row.c_bd }
			</td>
			<td width="10%">
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${row.c_tbrnum }"></sql:query>		
			${q3.rows[0].c_name }	
			</td>
			<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${row.c_jobnumber }'"></sql:query>		
			<td width="10%">${q4.rows[0].c_jobnumber }</td> 
			<td width="10%">${q4.rows[0].c_name }</td> 
			<td width="20%" >	 
			<a href="../../../toModule.do?prefix=/life&page=/base/hz/add2.jsp?c_companyid=${row.c_companyid }&c_tbd=${row.c_tbd }&c_bd=${row.c_bd }">��ִ</a> 				 
			</td>	
			</tr>
			</c:forEach>	 	 				
		</table> 
</body>
</html:html>
