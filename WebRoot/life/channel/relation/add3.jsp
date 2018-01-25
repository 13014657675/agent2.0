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
							血缘关系添加
						</div>
					</td>
				</tr>	
				<tr>
				<td align="center" width="20%">机构类型</td>
				<td align="center" width="20%">机构名称</td>
				<td align="center" width="20%">工号</td>
				<td align="center" width="20%">姓名</td> 
				<td align="center" width="20%">添加</td>
				</tr>				
				<c:choose>
				<c:when test="${param.c_type eq 1 }">
				<sql:query var="q1" sql="select * from t_staff where c_jobnumber='${param.c_jobnumber }' 
				and c_orgid in (
						select c_no from  t_organization where c_deptid in (
							select c_no from t_dept  where c_ptnature=3001 and c_system=2 )
						union
						select c_no from  t_organization where c_parent in (
							select c_no from  t_organization where c_deptid in (
								select c_no from t_dept  where c_ptnature=3001 and c_system=2 )))
				and c_quitdate is null " dataSource="${db_mssql }"></sql:query>
				</c:when> 
				<c:when test="${param.c_type eq 2 }">
				<sql:query var="q1" sql="select  * from t_staff where c_orgid=${param.c_orgid } and c_quitdate is null order by c_jobnumber" dataSource="${db_mssql }"></sql:query> 
				</c:when>					 			
				</c:choose>					
				<c:forEach items="${q1.rows }" var="row">
				<sql:query var="x1" sql="select  * from t_agentset where c_system=2 and c_jobnumber='${row.c_jobnumber }' and c_flag='0'" dataSource="${db_mssql }"></sql:query> 
				<c:if test="${empty x1.rows }">
				<tr>
				<sql:query var="q2"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${row.c_orgid }"></sql:query>
				<sql:query var="q3"  dataSource="${db_mssql}" sql="select * from t_orgtype where c_no =${q2.rows[0].c_orgtypeid } "></sql:query>
				<td align="center">${q3.rows[0].c_name }</td>
				<td align="center">${q2.rows[0].c_name }</td>
				<td align="center">${row.c_jobnumber }</td>
				<td align="center">${row.c_name }</td>				 
				<td align="center">
				 		<A href="../../../toModule.do?prefix=/life&page=/channel/relation/add4.jsp?c_orgid=${row.c_orgid }&c_jobnumber=${row.c_jobnumber }">添加</A>
				</td>
				</tr>
				</c:if>
				</c:forEach> 
				 
				</table> 
			</body>			
</html:html>			