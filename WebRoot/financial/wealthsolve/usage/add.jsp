<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>		
	<body>		
		<html:form  action="/wealthsolve" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="usage"/>
		<nested:nest property="product">	
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<nested:hidden property="c_no" value="1"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						使用性质添加
					</div>
				</td>
			</tr> 	 
			<tr>
				<td width="50%" align="right">业务政策</td>
				<td>
					<sql:query var="a1"	sql="select * from t_policy where c_ptnature=3002 order by c_system "	dataSource="${db_mssql}"></sql:query>
					<nested:select property="c_system">
					<c:forEach items="${a1.rows }" var="row">						
					<option value="${row.c_system}">${row.c_name}</option> 
					</c:forEach>		
					</nested:select>
				</td>
			</tr>	
			<tr>
				<td width="48%"><div align="right">项目名称</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_name" value="" styleId="req" title="名称不能为空 ">
					</nested:text>
				</div>
				</td>
			</tr> 
			</nested:nest>		
			<tr>
				<td width="48%" align="right"><html:submit value="确 定"/></td>
				<td width="52%" colspan="2">
					<html:reset  value="取 消" />
				</td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 
</html:html>
