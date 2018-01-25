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
						系数类型修改
					</div>
				</td>
			</tr>
			<tr>   
			<td width="33%"><div align="center">序号</div></td> 
			<td width="33%"><div align="center">类型</div></td> 
			<td width="33%"><div align="center">修改</div></td>
			</tr>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_convertT "></sql:query>
			<c:forEach items="${q2.rows }" var="row" varStatus="x">
			<html:form  action="/company" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="convertT"/>
			<nested:nest property="company">	
			<nested:hidden property="c_jobnm" value="update"></nested:hidden>
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>  
			<tr>   
			<td><div align="center">${x.index+1}</div></td> 
			<td><div align="center"><nested:text property="c_name" value="${row.c_name }" size="30"></nested:text></div></td>
			<td  valign="middle" align="center"> 				
			<html:submit value="修 改"/>
			</nested:nest>			 
			</html:form> 
			
			</c:forEach></table>
			</body> 
	
</html:html>
