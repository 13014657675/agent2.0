<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<title>���չ�˾����</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head> 
<body>
<html:form  action="/company" onsubmit="return check_form(this)">
<html:hidden property="jobname" value="add_update_delete"/>
	<nested:nest property="company">	
	<nested:hidden property="c_no" value="0"></nested:hidden> 
	<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						���չ�˾���
					</div>
				</td>
			</tr>	 
			<tr>
				<td width="48%"><div align="right">����</div></td>
				<td width="52%" >
				<div align="left">
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_namecode where c_type =30"></sql:query>				
				<nested:select property="c_type" >
				<c:forEach items="${q1.rows }" var="row">
				<html:option value="${row.c_code }">${row.c_name }</html:option>
				</c:forEach>
				</nested:select>
				</div>
				</td>
			</tr>		
			<tr>
				<td width="48%"><div align="right">ȫ��</div></td>
				<td width="52%" >
				<div align="left">
				<nested:text property="c_fullname" value="" size="30" styleId="req" title="ȫ�Ʊ�����д"></nested:text>
				</div>
				</td>
			</tr>
			<tr>
				<td width="48%"><div align="right">���</div></td>
				<td width="52%" >
				<div align="left">
				<nested:text property="c_name" value="" styleId="req" title="��Ʊ�����д"></nested:text>
				</div>
				</td>
			</tr>				
			<tr>
				<td width="48%"><div align="right">�ʱ�:</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_zipcode" value=""></nested:text>
				</div>
				</td>
			</tr>
				<tr>
				<td width="48%"><div align="right">��ϵ�绰</div></td>
				<td width="52%" >
					<div align="left">
						<nested:text property="c_phone" value=""></nested:text>
					</div>
				</td>
			</tr>
			<tr>
				<td width="48%"><div align="right">��ַ</div></td>
				<td width="52%">
				<div align="left">
					<nested:textarea property="c_addr" value="" cols="80" rows="3"></nested:textarea>
				</div>
				</td>
			</tr>	
			<tr>
				<td width="48%"><div align="right">Ͷ��������</div></td>
				<td width="52%" >
				<div align="left">
				<nested:text property="c_tbdl" value="" size="5" styleId="req" title="Ͷ�������ȱ�����д"></nested:text>
				</div>
				</td>
			</tr>
			<tr>
				<td width="48%"><div align="right">��������</div></td>
				<td width="52%" >
				<div align="left">
				<nested:text property="c_bdl" value="" size="5" styleId="req" title="�������ȱ�����д"></nested:text>
				</div>
				</td>
			</tr>				 	
			</nested:nest>	
			<tr>
				<td width="48%"><div align="right"><html:submit value="ȷ ��"/></div></td>
				<td width="52%" >
				<div align="left">
					<html:reset  value="ȡ ��" />
				</div>
				</td> 
			</tr>
		</table>	
</html:form>
</body>
</html:html>
