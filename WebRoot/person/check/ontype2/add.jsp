<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
	
</head>		
	<body>		
		<html:form  action="/check" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="ontype2"/>
		<nested:nest property="check">	
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 		 
		<nested:hidden property="c_no" value="1"></nested:hidden> 		
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						����������Ŀ���
					</div>
				</td>
			</tr> 	
			<tr>	
			<td width="48%"><div align="right">��������</div></td>
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization 
					where c_no in (select c_orgid from t_postset where c_jobnumber = '${sessionScope.c_jobnumber }' )"></sql:query>
			<td width="52%" >	<nested:select property="c_orgid" styleId="c_orgid" >
					<c:forEach items="${q1.rows }" var="row">
					<html:option value="${row.c_no }">${row.c_name } </html:option>
					</c:forEach>
				</nested:select>
			</td></tr>	
			<tr>
				<td width="48%"><div align="right">��Ŀ����</div></td>
				<td width="52%" >
				<div align="left">
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_ontype where c_state =1 "></sql:query>
					<nested:select property="c_ontype" >
					<c:forEach items="${q2.rows }" var="row">
					<html:option value="${row.c_no }">${row.c_name }</html:option>
					</c:forEach>
					</nested:select>
				</div>
				</td>
			</tr> 			 
			<tr>
				<td width="48%"><div align="right">�ۿ�����</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select property="c_type"  >
					<html:option value="1">һ��</html:option>
					<html:option value="2">һ��</html:option>
					</nested:select>
				</div>
				</td>
			</tr> 
			<tr>
				<td width="48%"><div align="right">�ۿ���</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_deducted" value=""   styleId="req" title="�ۿ����Ϊ�� " ></nested:text>
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
