<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true"> 
<head>
	<html:base/>
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
	<body>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="5" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						薪酬类别修改
					</div>
				</td>
			</tr>
			<tr> 
			<td width="50%"><div align="center">类别名称</div></td>
			<td width="50%"><div align="center">修改</div></td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_pcategory order by c_name "></sql:query>
			<c:forEach items="${q2.rows }" var="row">
			<tr> 
			<html:form  action="/pay" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="pcategory"/>
			<nested:nest property="pay">	
			<td><div align="center">
			<nested:text property="c_name" value="${row.c_name }"></nested:text>
			</div></td>			
			<td   valign="middle" align="center"> 					
			<nested:hidden property="c_jobnm" value="update"></nested:hidden>
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<html:submit value="修 改"/>
			</nested:nest>			 
			</html:form> 
			</tr>
			</c:forEach></table>
			</body> 
	
</html:html>
