<%@ page language="java" pageEncoding="gbk"%>
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
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						签报签批
					</div>
				</td>
			</tr> 			
			<tr>
				<td align="center" width="20%">签报号</td>
				<td align="center" width="20%">类型</td>	
				<td align="center" width="20%">申请日期</td>					 
				<td align="center" width="20%">申请人</td>  
				<td align="center" width="20%">操作</td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select  a.c_no,a.c_type,a.c_apply,a.c_cost  from t_signed a ,t_sprocess b 
				where a.c_jobnm ='add' and b.c_sys=3 and a.c_no=b.c_sid and b.c_flag='0' and b.c_receive='${sessionScope.c_jobnumber }'  "></sql:query>	
			<c:forEach items="${q1.rows }" var="row">
			<tr>
				<td align="center" width="20%">${row.c_no }</td>  
				<td align="center" width="20%">
				<c:choose>
				<c:when test="${row.c_type eq 31 }">项目签报</c:when>
				<c:when test="${row.c_type eq 32 }">费用签报</c:when>
				</c:choose>				
				</td>  
				<td align="center" width="20%">${row.c_apply }</td>   
				<sql:query var="q2" dataSource="${db_mssql }" sql="select b.c_name from t_sprocess a,t_staff b where a.c_send=b.c_jobnumber 
					and  a.c_sys=3 and a.c_sid=${row.c_no } order by a.c_no"></sql:query>
				<td align="center" width="20%">${q2.rows[0].c_name }</td>  
				<td align="center" width="20%"><a  href="../../../toModule.do?prefix=/oa&page=/signed/process/return2.jsp?c_no=${row.c_no }">签批</a></td>
			</tr>
			</c:forEach>					
		</table>		
	</body> 
</html:html>
