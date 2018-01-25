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
						    离司查询
						</div>
					</td>
				</tr>	
				<tr>
				<td align="center" >机构类型</td>
				<td align="center" >机构名称</td>
				<td align="center" >工号</td>
				<td align="center" >姓名</td>
				<td align="center" >业务政策</td>
				<td align="center" >推荐人工号</td> 
				<td align="center" >推荐人姓名</td>  
				<td align="center" >职位名称</td>   
				<td align="center" >离司日期</td>  
				<td align="center" >增员世袭人工号</td>  
				<td align="center" >增员世袭人姓名</td>  
				<td align="center" >客户继承人工号</td>  
				<td align="center" >客户继承人姓名</td>  
				</tr>				
				<c:choose>
				<c:when test="${param.c_type eq 1 }">
				<sql:query var="q1" sql="select * from t_agentset where c_jobnumber='${param.c_jobnumber }' and c_system=1 and c_flag='1' " dataSource="${db_mssql }"></sql:query>
				</c:when> 
				<c:when test="${param.c_type eq 2 }">
				<sql:query var="p1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${param.c_orgtypeid }"></sql:query> 
		 		<sql:query var="p2" dataSource="${db_mssql }" sql="select left(c_path,${p1.rows[0].c_order } * 2)+'%' c_path from t_organization where c_no=${param.c_orgid }"></sql:query> 
	  
				<sql:query var="q1" sql="select  * from t_agentset where c_orgid in (select c_no from t_organization where c_path like '${p2.rows[0].c_path }' and c_flag='0' )
				 	and c_system=1 and c_flag='1' order by c_jobnumber " dataSource="${db_mssql }"></sql:query> 
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
				<sql:query var="q7" dataSource="${db_mssql}" sql="select * from t_pzjdy where c_system=${row.c_system } and c_type=${row.c_type }"></sql:query>		
				<td align="center">${q7.rows[0].c_name }</td> 
				<td align="center">${q4.rows[0].c_quitdate }</td>
				<td align="center">${row.c_sxrgh }</td>
				<sql:query var="q8" dataSource="${db_mssql}" sql="select * from t_staff where c_jobnumber='${row.c_sxrgh }' "></sql:query>	
				<td align="center">${q8.rows[0].c_name }</td>
				<td align="center">${row.c_jcrgh }</td>
				<sql:query var="q9" dataSource="${db_mssql}" sql="select * from t_staff where c_jobnumber='${row.c_jcrgh }' "></sql:query>	
				<td align="center">${q9.rows[0].c_name }</td>
				</tr>
				</c:forEach> 
				 
				</table> 
			</body>			
</html:html>			