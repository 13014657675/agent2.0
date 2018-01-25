<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>
<body>	 
	<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_sxlp where c_no=${param.c_no } "></sql:query>
	<html:form action="/sxbd" onsubmit="return check_form(this)">
	<html:hidden property="jobname" value="sxlpba" />		
	<nested:nest property="sxbd"> 
	<nested:hidden property="c_orgid" value="${sessionScope.Staff.c_orgid }"/>
	<nested:hidden property="c_no" value="${q1.rows[0].c_no }" />
	<nested:hidden property="c_jobnm" value="update"/>
		<table width="100%" border="1" cellspacing="0" id="table">
			<tr >
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">						
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						�����޸�
					</div>
				</td>
			</tr>
			<tr>
				<td width="50%" align="right">
					���չ�˾
				</td>
				<td> 
					<nested:select property="c_companyid" value="${q1.rows[0].c_companyid }">
					<sql:query var="query"  sql="select * from t_company where c_type=3001" dataSource="${db_mssql}"></sql:query>
					<c:forEach var="row" items="${query.rows}">
					<html:option value="${row.c_no}">${row.c_fullname}</html:option>
					</c:forEach>	
					</nested:select> 
				</td>
			</tr>
			<tr>
				<td   align="right">
					������
				</td>
				<td > 
					<nested:text property="c_bd" value="${q1.rows[0].c_bd }" styleId="req" title="�����ű�����д"  size="40" readonly="true"></nested:text>					 
				</td>
			</tr>
			<tr>
				<td   align="right">
					Ͷ��������
				</td>
				<td  > 
					<nested:text property="c_tbrname" value="${q1.rows[0].c_tbrname }" styleId="req" title="Ͷ��������������д" readonly="true"></nested:text> 
				</td>
			</tr>	
			<tr>
				<td   align="right">
					����ʱ��
				</td>
				<td > 
					<nested:text property="c_barq" value="${q1.rows[0].c_barq }" maxlength="8" styleId="req" title="����ʱ�������д"></nested:text> 
				</td>
			</tr>	
				<tr>
				<td   align="right" >
					����˵��
				</td>
				<td  > 
					<nested:textarea property="c_basm" value="${q1.rows[0].c_basm }" styleId="req" title="����˵��������д" cols="100" rows="5"></nested:textarea> 
				</td>
			</tr>				 			
			</nested:nest>			
			<tr>
				<td align="right" >					
					<html:submit value=" ȷ �� " />
				</td>
				<td >
					<html:reset  value=" ȡ �� " />
				</td>
			</tr>
		</table>
	</html:form>
</body>
</html:html>

