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
						设置最终处理器
					</div>
				</td>
			</tr>
			<tr>   
			<td width="50%"><div align="center">最终处理器</div></td> 
			<td width="50%"><div align="center">设置</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from tb_projectclass where c_no=${param.c_projectclass } "></sql:query>		 
			<html:form  action="/project" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="projectclass"/>
			<nested:nest property="processor">	
			<tr>   
			<td><div align="center">
			<nested:select property="c_o" value="${q1.rows[0].c_o }">
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from vb_processor where c_projectclass=${param.c_projectclass } "></sql:query>	
			<c:forEach items="${q2.rows }" var="row">
			<html:option value="${row.c_o }">${row.c_name }</html:option>
			</c:forEach>
			</nested:select>
			</div></td> 
			<td width="33%" valign="middle" align="center"> 					
			<nested:hidden property="c_jobnm" value="set"></nested:hidden>			
			<nested:hidden property="c_no" value="${param.c_projectclass }"></nested:hidden>   
			<html:submit value=" 确 定 "/>
			</td></tr>
			</nested:nest>			 
			</html:form> 
			
			</table>
			</body> 
	
</html:html>
