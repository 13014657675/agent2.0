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
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						处理器类型修改
					</div>
				</td>
			</tr>
			<tr>   
			<td width="50%"><div align="center">类型名称</div></td> 
			<td width="50%"><div align="center">修改</div></td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from tb_projectclass "></sql:query>
			<c:forEach items="${q2.rows }" var="row">
			<html:form  action="/project" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="projectclass"/>
			<nested:nest property="processor">	
			<tr>   
			<td><div align="center">
			<nested:text property="c_name" value="${row.c_name }" size="30"></nested:text>
			</div></td> 
			<td width="33%" valign="middle" align="center"> 					
			<nested:hidden property="c_jobnm" value="update"></nested:hidden>			
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<html:submit value="修 改"/>			
			</td></tr>
			</nested:nest>			 
			</html:form> 
			</c:forEach></table>
			</body> 
	
</html:html>
