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
						������Ŀ�޸�
					</div>
				</td>
			</tr>
			<tr>
			<td width="20%"><div align="center">���</div></td> 
			<td width="20%"><div align="center">����</div></td>
			<td width="20%"><div align="center">����</div></td>
			<td width="20%"><div align="center">���</div></td> 
			<td width="20%"><div align="center">�޸�</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql=" select * from t_ontype order by c_state,c_code"></sql:query>
			<c:forEach items="${q1.rows }" var="row" varStatus="x">
			<tr>
			<td><div align="center">${x.index+1}</div></td> 				
			<html:form  action="/check" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="ontype"/>
			<nested:nest property="check">	
			<nested:hidden property="c_jobnm" value="update"></nested:hidden> 		 	 
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<td><div align="center"><nested:text property="c_name" value="${row.c_name }"></nested:text>
			</div></td>			
			<td><div align="center"><nested:text property="c_code" size="3" value="${row.c_code }" maxlength="1"></nested:text>
			</div></td>		
			<td><div align="center">
				<nested:select property="c_state"  value="${row.c_state }">
					<html:option value="0">����״̬</html:option>
					<html:option value="1">�ۿ�״̬</html:option>
					</nested:select>			
			</div></td>	
			<td   valign="middle" align="center"> 
			<html:submit value="�� ��"/>
			</td>
			</nested:nest>			 
			</html:form> 
			</tr>
			</c:forEach></table>
			</body> 
	
</html:html>
