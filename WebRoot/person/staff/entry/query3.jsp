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
					<td height="33" colspan="20" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							员工查询 
						</div>
					</td>
				</tr>	
				<tr> 
				<td align="center" width="10%">机构名称</td>
				<td align="center" width="10%">工号</td>
				<td align="center" width="10%">姓名</td>
				<td align="center" width="15%">证件类型</td>
				<td align="center" width="20%">证件号码</td> 
				<td align="center" width="15%">代理人资格证号</td>
				<td align="center" width="20%">手机号码</td> 
				<td align="center" width="15%">入司时间</td> 
				<td align="center" width="15%">离司时间</td> 
				<td align="center" width="10%">查询</td>
				</tr>				
				<c:choose>
				<c:when test="${param.c_type eq 1 }">
				<sql:query var="q1" sql="select * from t_staff where c_jobnumber='${param.c_jobnumber }'" dataSource="${db_mssql }"></sql:query>
				</c:when> 
				<c:when test="${param.c_type eq 2 }"> 
		 		<sql:query var="q1" sql="select  * from t_staff where c_orgid=${param.c_orgid } order by c_orgid,c_jobnumber" dataSource="${db_mssql }"></sql:query> 				  	  
				</c:when>					 		
				</c:choose>					
				<c:forEach items="${q1.rows }" var="row">
				<tr>
				<sql:query var="q2"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${row.c_orgid } "></sql:query>  
				<td align="center">${q2.rows[0].c_name }</td>
				<td align="center">${row.c_jobnumber }</td>
				<td align="center">${row.c_name }</td>
				<td align="center">
				<c:if test="${not empty row.c_certificatetype }">
				<sql:query var="q4"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14 and c_code=${row.c_certificatetype }"></sql:query>
				${q4.rows[0].c_name }
				</c:if>			
				</td>
				<td align="center">'${row.c_certificate }</td>
				<td align="center">'${row.c_qualificate } </td>
				<td align="center">${row.c_telephone} [${row.c_mobilephone}] </td> 				
				<td align="center">${row.c_datime }</td>
				<td align="center">${row.c_quitdate }</td>
				<td align="center">
				 		<A href="../../../toModule.do?prefix=/person&page=/staff/entry/query4.jsp?c_orgid=${row.c_orgid }&c_jobnumber=${row.c_jobnumber }">查询</A>
				</td>
				</tr>
				</c:forEach> 
				 
				</table> 
			</body>			
</html:html>			