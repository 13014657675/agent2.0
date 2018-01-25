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
							血缘关系修改
						</div>
					</td>
				</tr>	
				<tr>
				<td align="center" width="12%">机构类型</td>
				<td align="center" width="12%">机构名称</td>
				<td align="center" width="12%">工号</td>
				<td align="center" width="12%">姓名</td>
				<td align="center" width="12%">业务政策</td>
				<td align="center" width="12%">推荐人工号</td> 
				<td align="center" width="12%">推荐人姓名</td>  
				<td align="center" width="12%">修改</td>
				</tr>				
				<c:choose>
				<c:when test="${param.c_type eq 1 }">
				<sql:query var="q1" sql="select * from t_agentset where c_jobnumber='${param.c_jobnumber }' and c_system=2 and c_flag='0' " dataSource="${db_mssql }"></sql:query>
				</c:when> 
				<c:when test="${param.c_type eq 2 }">
				<sql:query var="q1" sql="select  * from t_agentset where c_orgid=${param.c_orgid } and c_system=2 and c_flag='0' order by c_jobnumber " dataSource="${db_mssql }"></sql:query> 
				</c:when>					 			
				</c:choose>					
				<c:forEach items="${q1.rows }" var="row">
				<tr>
				<sql:query var="q2"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${row.c_orgid }"></sql:query>
				<sql:query var="q3"  dataSource="${db_mssql}" sql="select * from t_orgtype where c_no =${q2.rows[0].c_orgtypeid } "></sql:query>
				<td align="center">${q3.rows[0].c_name }</td>
				<td align="center">${q2.rows[0].c_name }</td>
				<td align="center">${row.c_jobnumber }</td>
				<sql:query var="q4" dataSource="${db_mssql}" sql="select * from t_staff where c_jobnumber='${row.c_jobnumber }' "></sql:query>	
				<td align="center">${q4.rows[0].c_name }</td>				
				<sql:query var="q5" dataSource="${db_mssql}" sql="select * from t_policy where c_system=${row.c_system }"></sql:query>
				<td align="center">${q5.rows[0].c_name }</td>
				<td align="center">${row.c_tjrgh }</td>				
				<sql:query var="q6" dataSource="${db_mssql}" sql="select * from t_staff where c_jobnumber='${row.c_tjrgh }' "></sql:query>		
				<td align="center">${q6.rows[0].c_name }</td> 
				<td align="center">
				 		<A href="../../../toModule.do?prefix=/life&page=/channel/relation/update4.jsp?c_orgid=${row.c_orgid }&c_jobnumber=${row.c_jobnumber }&c_system=${row.c_system }">修改</A>
				</td>
				</tr>
				</c:forEach> 
				 
				</table> 
			</body>			
</html:html>			