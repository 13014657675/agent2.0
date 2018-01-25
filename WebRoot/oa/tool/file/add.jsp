<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	 
</head>		
	<body> 
		<html:form  action="/tool" onsubmit="return check_form(this)" enctype="multipart/form-data" >
		<html:hidden property="jobname" value="tool_add"/>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="15" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						工具添加
					</div>
				</td>
			</tr>		 
			<nested:nest property="file">	
			<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
			<nested:hidden property="c_sys" value="2"></nested:hidden>  
			<nested:hidden property="c_flag" value="0"></nested:hidden>  
			<tr>
				<td width="50%" align="right">目录名</td>
				<td width="50%" >
				<div >
					<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_catalog where c_sys = 2 "></sql:query>
					<nested:select property="c_catalogid">
					<c:forEach items="${q3.rows }" var="row">
					<html:option value="${row.c_no }">${row.c_name }</html:option>
					</c:forEach>
					</nested:select>
				</div>
				</td>					
			</tr> 		
			<tr>
			<td width="50%"><div align="right">文件名称</div></td>
				<td width="50%" >				
					<nested:text property="c_name" value="" styleId="req" title="文件名称必须填写" size="40"></nested:text>
				</td>			
			</tr>
			<td width="50%"><div align="right">上挂文件</div></td>
				<td width="50%" >				
					<nested:file property="file"></nested:file> 
				</td>			
			
			</nested:nest>			
			<tr>
				<td width="50%"  align="right"><html:submit value="确 定"/></td>
				<td width="50%"  >
					<html:reset  value="取 消" />
				</td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 
</html:html>
