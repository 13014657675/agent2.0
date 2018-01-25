<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<title>���չ�˾��ѯ</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head> 
<body>
<html:form  action="/company" >
<html:hidden property="jobname" value="add_update_delete"/>
	<nested:nest property="company">	
		<sql:query var="q1" dataSource="${db_mssql }" sql="select a.*,b.c_name type from t_company a,t_namecode b 
				where b.c_type=30 and a.c_type=b.c_code and a.c_no=${param.c_no }"></sql:query>		
		<nested:hidden property="c_no" value="${q1.rows[0].c_no }"></nested:hidden>   
		<nested:hidden property="c_jobnm" value="update"></nested:hidden>   
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						���չ�˾��ѯ
					</div>
				</td>
			</tr>				 		
			<tr>
				<td width="48%"><div align="right">����</div></td>
				<td width="52%" >
				<div align="left">
				<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_namecode where c_type =30"></sql:query>				
				<nested:select property="c_type" value="${q1.rows[0].c_type }">
				<c:forEach items="${q2.rows }" var="row">
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
				<nested:text property="c_fullname" value="${q1.rows[0].c_fullname }" size="30" styleId="req" title="ȫ�Ʊ�����д"></nested:text>
				</div>
				</td>
			</tr>
			<tr>
				<td width="48%"><div align="right">���</div></td>
				<td width="52%" >
				<div align="left">
				<nested:text property="c_name" value="${q1.rows[0].c_name }" styleId="req" title="��Ʊ�����д"></nested:text>
				</div>
				</td>
			</tr>				
			<tr>
				<td width="48%"><div align="right">�ʱ�:</div></td>
				<td width="52%" >
				<div align="left">
					<nested:text property="c_zipcode" value="${q1.rows[0].c_zipcode }"></nested:text>
				</div>
				</td>
			</tr>
				<tr>
				<td width="48%"><div align="right">��ϵ�绰</div></td>
				<td width="52%" >
					<div align="left">
						<nested:text property="c_phone" value="${q1.rows[0].c_phone }"></nested:text>
					</div>
				</td>
			</tr>
			<tr>
				<td width="48%"><div align="right">��ַ</div></td>
				<td width="52%">
				<div align="left">
					<nested:textarea property="c_addr" value="${q1.rows[0].c_addr }" cols="80" rows="3"></nested:textarea>
				</div>
				</td>
			</tr>
			<tr>
				<td width="48%"><div align="right">Ͷ��������</div></td>
				<td width="52%" >
				<div align="left">
				<nested:text property="c_tbdl" value="${q1.rows[0].c_tbdl }" size="5" styleId="req" title="Ͷ�������ȱ�����д"></nested:text>
				</div>
				</td>
			</tr>
			<tr>
				<td width="48%"><div align="right">��������</div></td>
				<td width="52%" >
				<div align="left">
				<nested:text property="c_bdl" value="${q1.rows[0].c_bdl }" size="5" styleId="req" title="�������ȱ�����д"></nested:text>
				</div>
				</td>
			</tr>					 
			</nested:nest>	
			 
		</table>	
</html:form>
</body>
</html:html>
