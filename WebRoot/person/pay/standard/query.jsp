<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>		
	<body>		
		<html:form  action="/pay" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="pstandard"/>
		<nested:nest property="pay">	 
		<nested:hidden property="c_jobnm" value="update"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="30" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						薪酬标准查询
					</div>
				</td>
			</tr> 	
			<tr> 
				<td align="center">薪酬等级</td>
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_pproject where c_type=1 order by c_no"></sql:query>
				<c:forEach items="${q1.rows }" var="row">
				<td align="center">${row.c_name }</td>
				</c:forEach>
			</tr>  
			<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_pclass order by c_pcategory,c_name"></sql:query>
			<c:forEach items="${q3.rows }" var="row3">
			<tr> 
				<td align="center">${row3.c_name }</td> 
				<c:forEach items="${q1.rows }" var="row4">
				<td align="center">
				<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_pstandard where c_pclass=${row3.c_no } and c_pproject=${row4.c_no } "></sql:query>
				<nested:hidden property="c_no" value="${q5.rows[0].c_no }"></nested:hidden>
				<nested:hidden property="c_pclass" value="${row3.c_no }"></nested:hidden>
				<nested:hidden property="c_pproject" value="${row4.c_no }"></nested:hidden>
				${q5.rows[0].c_base }
				</td>
				</c:forEach>
			</tr> 
			</c:forEach>  		
			</nested:nest>	 
		</table>	
	</html:form> 
	</body> 	 
</html:html>
