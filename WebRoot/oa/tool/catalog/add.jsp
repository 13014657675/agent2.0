<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>		
	<body>		
		<html:form  action="/tool" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="catalog_add_delete"/>
		<nested:nest property="file">	
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<nested:hidden property="c_sys" value="2"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						����Ŀ¼���
					</div>
				</td>
			</tr> 		
			<tr>
				<td width="48%"><div align="right">Ŀ¼��</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_name" value="" size="30" styleId="req" title="Ŀ¼������Ϊ�� "></nested:text>
				</div>
				</td>
			</tr> 
			</nested:nest>		
			<tr>
				<td width="48%" align="right"><html:submit value="ȷ ��"/></td>
				<td width="52%" colspan="2">
					<html:reset  value="ȡ ��" />
				</td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 
</html:html>
