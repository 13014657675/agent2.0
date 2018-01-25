<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
		<body  > 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="10" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							离司操作
						</div>
					</td>
				</tr>			
				<tr>
				<td align="center" width="16%">机构类型</td>
				<td align="center" width="16%">机构名称</td> 
				<td align="center" width="16%">工号</td> 
				<td align="center" width="16%">姓名</td> 
				<td align="center" width="16%">离司日期</td> 
				<td align="center" width="16%">状态</td>
				</tr>					
				<c:choose>
				<c:when test="${param.c_type eq 1 }">
				<sql:query var="q1" dataSource="${db_mssql }" sql="select  c_jobnumber,c_name,c_orgid,c_quitdate from t_staff 
					where c_jobnumber='${param.c_jobnumber }' "></sql:query> 
				</c:when>				
				<c:when test="${param.c_type eq 2 }">
				<sql:query var="q1" dataSource="${db_mssql }" sql="select  c_jobnumber,c_name,c_orgid,c_quitdate from t_staff 
					where c_orgid=${param.c_orgid } order by c_quitdate,c_jobnumber "></sql:query> 
				</c:when>
				</c:choose>
				<c:forEach items="${q1.rows }" var="row">
				<tr>
				<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${row.c_orgid } "></sql:query> 
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no=${q2.rows[0].c_orgtypeid } "></sql:query> 
				<td align="center" width="16%">					
					${q3.rows[0].c_name }
				</td>
				<td align="center" width="16%"> 
					${q2.rows[0].c_name }
				</td>
				<td align="center" width="16%">${row.c_jobnumber }</td> 
				<td align="center" width="16%">					 
					${row.c_name }
				</td> 
				<td align="center" width="16%"> 
					${row.c_quitdate }
				</td>
				<td align="center" width="16%">
				 <c:choose>
				 <c:when test="${empty row.c_quitdate }">
				 <html:form  action="/staff" onsubmit="return check_form(this)">
					<html:hidden property="jobname" value="quit"/>
					<nested:nest property="staff">	 
					<nested:hidden property="c_jobnumber" value="${row.c_jobnumber }"> </nested:hidden>
					</nested:nest>
					<html:submit value=" 离 司 "></html:submit>
					</html:form>
				 </c:when>
				 <c:when test="${not empty row.c_quitdate }">
				 离职
				 </c:when>
				 </c:choose>
				</td>		
				</tr>	
				</c:forEach>			 
				</table>		 
			</body>  
</html:html>
