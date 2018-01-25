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
							转正操作
						</div>
					</td>
				</tr>	
				<tr>
				<td align="center" width="20%">机构类型</td>
				<td align="center" width="20%">机构名称</td>
				<td align="center" width="20%">工号</td>
				<td align="center" width="20%">姓名</td>  
				<td align="center" width="20%">状态</td>
				</tr>
				<c:choose>
				<c:when test="${param.c_type eq 1 }">
				<sql:query var="q1" dataSource="${db_mssql }" sql="select  c_jobnumber,c_name,c_orgid,c_quitdate from t_staff 
					where c_jobnumber='${param.c_jobnumber }' and c_quitdate is null "></sql:query> 
				</c:when>				
				<c:when test="${param.c_type eq 2 }">
				<sql:query var="q1" dataSource="${db_mssql }" sql="select  c_jobnumber,c_name,c_orgid,c_quitdate from t_staff 
					where c_orgid=${param.c_orgid } and c_quitdate is null order by c_jobnumber "></sql:query> 
				</c:when>
				</c:choose>	
				<c:forEach items="${q1.rows }" var="row">
				<tr>
				<sql:query var="q2"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${row.c_orgid } "></sql:query>
				<sql:query var="q3"  dataSource="${db_mssql}" sql="select * from t_orgtype where c_no =${q2.rows[0].c_orgtypeid } "></sql:query>
				<td align="center">${q3.rows[0].c_name }</td>
				<td align="center">${q2.rows[0].c_name }</td>
				<td align="center">${row.c_jobnumber }</td>
				<td align="center">${row.c_name }</td>  
				<td align="center">
				<sql:query var="q4"  dataSource="${db_mssql}" sql="select * from t_payset where c_jobnumber='${row.c_jobnumber }'"></sql:query>
				<c:choose>
				<c:when test="${q4.rows[0].c_state eq 0 }">正式</c:when>
				<c:when test="${q4.rows[0].c_state eq 1 }">
				<html:form  action="/staff" onsubmit="return check_form(this)">
				<html:hidden property="jobname" value="stateset"/>
				<nested:nest property="staff">	
				<nested:hidden property="c_no" value="${q4.rows[0].c_no }"></nested:hidden> 
				<nested:hidden property="c_jobnumber" value="${row.c_jobnumber }"></nested:hidden> 
				<nested:hidden property="c_jobnm" value="state"></nested:hidden> 
				<nested:hidden property="c_state" value="0"></nested:hidden> 
				</nested:nest>
				<html:submit value=" 转 正 "></html:submit>
				</html:form>
				</c:when>				
				</c:choose> 				 		
				</td>
				</tr>
				</c:forEach> 
				 
				</table> 
			</body>			 
</html:html>
