<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true">  
<head>
	<html:base/>
	<script src="/tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>
	<html:form  action="/company" onsubmit="return check_form(this)">
	<html:hidden property="jobname" value="occupation"/>
	<nested:nest property="company">	
	<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
	<nested:hidden property="c_companyid" value="${param.company }"></nested:hidden>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						职业代码添加
					</div>
				</td>
			</tr>
			<tr>
			<td width="50%" align="right">保险公司</td>
			<td>
				 <sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_company where c_no=${param.company }"></sql:query> 
				 ${q1.rows[0].c_fullname }
			</td> 
			</tr>
			</table>
			<table width="100%" border="1" cellspacing="0">
			<tr>
			<td align="center" width="33%">序号</td>
			<td align="center" width="33%">职业代码</td>
			<td align="center" width="33%">工作性质</td>
			</tr>			
			<c:forEach begin="1" end="60" varStatus="x">
			<tr>
			<td align="center" width="33%"><nested:hidden property="c_no" value="${x.index }"></nested:hidden>${x.index } </td>
			<td align="center" width="33%"><nested:text property="c_code" value=""></nested:text> </td>
			<td align="center" width="33%"><nested:text property="c_name" value="" size="50"></nested:text></td>
			</tr>		
			</c:forEach>			
			</nested:nest>
			<tr>
				<td align="center" colspan="3"><html:submit value=" 确 定 "/></td>
				 
			</tr>		 	
		</table>
</html:form>
</body>
</html:html>
