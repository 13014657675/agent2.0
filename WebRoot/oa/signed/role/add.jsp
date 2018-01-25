<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>		
	<body>		
		<html:form  action="/file" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="role_add_delete"/>
		<nested:nest property="role">	
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<nested:hidden property="c_sys" value="3"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						角色添加
					</div>
				</td>
			</tr> 		
			<tr>
				<td width="48%"><div align="right">角色</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select property="c_role">
					<html:option value="301">审批人</html:option>
					<%--  
					<html:option value="302">财务负责人</html:option>
					<html:option value="303">分管总</html:option>
					--%>
					</nested:select>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">工号</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_jobnumber" value="" styleId="req" title="工号不能为空 "></nested:text>
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
	
	<ul>
	<li>请输入省公司工号</li>
	</ul>
	</body> 
</html:html>
