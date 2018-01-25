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
							恢复工号
						</div>
					</td>
				</tr>	
				<tr>
				<td align="center" width="10%">机构类型</td>
				<td align="center" width="10%">机构名称</td>
				<td align="center" width="10%">政策体系</td>
				<td align="center" width="10%">工号</td>
				<td align="center" width="10%">姓名</td>
				<td align="center" width="15%">证件类型</td>
				<td align="center" width="20%">证件号码</td> 
				<td align="center" width="15%">入司时间</td> 
				<td align="center" width="15%">离司时间</td> 
				<td align="center" width="10%">恢复</td>
				</tr>				
				<sql:query var="q1" sql="select * from t_staff a,t_agentset b where a.c_jobnumber='${param.c_jobnumber }' 
					and a.c_orgid in (
						select c_no from  t_organization where c_deptid in (
							select c_no from t_dept  where c_ptnature=3001 and c_system=2 )
						union
						select c_no from  t_organization where c_parent in (
							select c_no from  t_organization where c_deptid in (
								select c_no from t_dept  where c_ptnature=3001 and c_system=2 )))
					and a.c_jobnumber=b.c_jobnumber and b.c_flag='1'  " dataSource="${db_mssql }"></sql:query> 		
				<c:forEach items="${q1.rows }" var="row">
				<tr>
				<sql:query var="q2"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${row.c_orgid }"></sql:query>
				<sql:query var="q3"  dataSource="${db_mssql}" sql="select * from t_orgtype where c_no=${q2.rows[0].c_orgtypeid } "></sql:query>
				<td align="center">${q3.rows[0].c_name }</td>
				<td align="center">${q2.rows[0].c_name }</td>
				<td align="center">
				<sql:query var="tx" sql="select * from t_policy where c_system=${row.c_system }" dataSource="${db_mssql }"></sql:query> 	
				${tx.rows[0].c_name }
				</td>
				<td align="center">${row.c_jobnumber }</td>
				<td align="center">${row.c_name }</td>
				<td align="center">
				<sql:query var="q4"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14 and c_code=${row.c_certificatetype }"></sql:query>
				${q4.rows[0].c_name }
				</td>
				<td align="center">${row.c_certificate }</td>
				<td align="center">${row.c_datime }</td>
				<td align="center">${row.c_quitdate }</td>
				<td align="center">
				 		<A href="../../../toModule.do?prefix=/life&page=/channel/entry/init3.jsp?c_orgid=${row.c_orgid }&c_jobnumber=${row.c_jobnumber }">恢复</A>
				</td>
				</tr>
				</c:forEach> 
				 
				</table> 
			</body>			
</html:html>			