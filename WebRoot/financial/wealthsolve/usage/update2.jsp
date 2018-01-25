<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>		
	<body>		
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_usage where c_no = ${param.c_no } "></sql:query>
		<html:form  action="/wealthsolve" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="usage"/>
		<nested:nest property="product">	
		<nested:hidden property="c_jobnm" value="update"></nested:hidden>
		<nested:hidden property="c_no" value="${q1.rows[0].c_no}"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						ʹ�������޸�
					</div>
				</td>
			</tr> 	
			<tr>
				<td width="50%" align="right">ҵ������</td>
				<td>
					<sql:query var="a1"	sql="select * from t_policy where c_ptnature=3002 order by c_system "	dataSource="${db_mssql}"></sql:query>
					<nested:select property="c_system" value="${q1.rows[0].c_system }">
					<c:forEach items="${a1.rows }" var="row">						
					<html:option value="${row.c_system}">${row.c_name}</html:option>
					</c:forEach>		
					</nested:select>
				</td>
			</tr>		 
			<tr>
				<td width="48%"><div align="right">��Ŀ����</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_name" value="${q1.rows[0].c_name }" styleId="req" title="���Ʋ���Ϊ�� "></nested:text>
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
