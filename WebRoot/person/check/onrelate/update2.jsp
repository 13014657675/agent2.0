<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
		<body >		
		<html:form  action="/check" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="onrelate"/>
		<nested:nest property="check">	
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden> 	 
		<nested:hidden property="c_jobnm" value="update"></nested:hidden> 	 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="4" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							修改关联工号
						</div>
					</td>
				</tr>			
				<tr>
				<td align="center" width="25%">序号</td>
				<td align="center" width="25%">工号</td>
				<td align="center" width="25%">姓名</td>
				<td align="center" width="25%">考勤机编号</td>				
				</tr>
				<sql:query var="q1" dataSource="${db_mssql }" sql="select distinct c_jobnumber  from t_onrelate where c_orgid= ${param.c_orgid }"></sql:query>  
				<c:forEach items="${q1.rows }" varStatus="x" var="row">
				<tr>
				<td align="center" width="25%">${x.index+1 }</td>
				<td align="center" width="25%">${row.c_jobnumber }</td>
				<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber='${row.c_jobnumber }'"></sql:query>  
				<td align="center" width="25%">${q2.rows[0].c_name }</td>	
				<td align="center" width="25%">
				<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_onrelate where c_orgid=${param.c_orgid } and c_jobnumber='${row.c_jobnumber }' "></sql:query>
				<nested:hidden property="c_id" value="${q3.rows[0].c_no }"></nested:hidden>
				<nested:hidden property="c_jobnumber" value="${row.c_jobnumber }"></nested:hidden>
				<nested:text property="c_code" value="${q3.rows[0].c_code }" size="30"></nested:text>
				</td>				
				</tr>
				</c:forEach>				 	 
				<tr>
				<td> </td>		
				<td align="center"><input type="submit" value=" 确 定 "></td>
				<td align="center"><input type="reset" value=" 取 消 "></td>
				<td> </td>				
				</tr>
				</table>		
		 	</nested:nest></html:form>
			</body>  
</html:html>
