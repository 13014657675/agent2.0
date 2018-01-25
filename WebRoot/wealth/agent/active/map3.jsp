<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head> <body>		  
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="30" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							架构查询
						</div>
					</td>
				</tr>	
				<tr>
				<td align="center" >上级机构</td>
				<td align="center" >机构名称</td>
				<td align="center" >工号</td>
				<td align="center" >姓名</td>
				<td align="center" >业务政策</td>
				<td align="center" >入司日期</td>
				<td align="center" >银行名称</td> 
			 	<td align="center" >银行帐号</td>
				<td align="center" >推荐人工号</td> 
				<td align="center" >推荐人姓名</td>   
				<td align="center" >职级名称</td>
				<td align="center" >开始日期</td>
				<td align="center" >上级主管</td>				
				</tr>		
				<sql:query var="p1" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${param.c_orgtypeid }"></sql:query> 
		 		<sql:query var="p2" dataSource="${db_mssql }" sql="select left(c_path,${p1.rows[0].c_order } * 2)+'%' c_path from t_organization where c_no=${param.c_orgid }"></sql:query> 
	  
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_agentset where c_orgid in (select c_no from t_organization where c_path like '${p2.rows[0].c_path }' and c_flag='0' ) 
					and c_system=11 and c_flag='0' order by c_orgid,c_system,c_type"></sql:query>
				<c:forEach items="${q1.rows }" var="row">
				<tr>
				<sql:query var="a1"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${row.c_orgid }"></sql:query>
				<sql:query var="parent" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${a1.rows[0].c_parent } "></sql:query>
				<sql:query var="a2"  dataSource="${db_mssql}" sql="select * from t_orgtype where c_no =${a1.rows[0].c_orgtypeid } "></sql:query>
				<td align="center" >${parent.rows[0].c_name }</td>
				<td align="center" >${a1.rows[0].c_name }</td>
				<td align="center" >${row.c_jobnumber }</td>
				<sql:query var="a3"  dataSource="${db_mssql}" sql="select * from t_staff where c_jobnumber='${row.c_jobnumber }'"></sql:query>
				<td align="center" >${a3.rows[0].c_name }</td>
				<sql:query var="a4"  dataSource="${db_mssql}" sql="select * from t_policy where c_system=${row.c_system }"></sql:query>
				<td align="center" >${a4.rows[0].c_name }</td>
				<sql:query var="a5"  dataSource="${db_mssql}" sql="select convert(char(8),c_datime,112) c_datime from t_staff where c_jobnumber='${row.c_jobnumber }'"></sql:query>
				<td align="center" >${a5.rows[0].c_datime }</td>
				<td align="center" >
				<sql:query var="bank"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=15 and c_code=${a3.rows[0].c_bank } "></sql:query> 
				${bank.rows[0].c_name }
				</td>
				<td align="center" >'${a3.rows[0].c_bankcode }</td>
				<td align="center" >${row.c_tjrgh }</td> 
				<sql:query var="a6"  dataSource="${db_mssql}" sql="select * from t_staff where c_jobnumber='${row.c_tjrgh }'"></sql:query>
				<td align="center" >${a6.rows[0].c_name }</td>   
				<sql:query var="a7"  dataSource="${db_mssql}" sql="select * from t_pzjdy where c_system=${row.c_system } and c_type=${row.c_type }"></sql:query>
				<td align="center" >${a7.rows[0].c_name }</td>
				<sql:query var="a8"  dataSource="${db_mssql}" sql="select * from t_agentls where c_system=${row.c_system } and c_jobnumber='${row.c_jobnumber }' and c_flag='0' "></sql:query>
				<td align="center" >${a8.rows[0].c_ksrq }</td>
				<td align="center" >${a8.rows[0].c_director }</td>				
				</tr>
				</c:forEach>				 
				</table> 
			</body>			
</html:html>			