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
						报案修改
					</div>
				</td>
			</tr>
			<tr>
				<td width="50%" align="right">
					保险公司
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
					保单号
				</td>
				<td > 
					<nested:text property="c_bd" value="${q1.rows[0].c_bd }" styleId="req" title="保单号必须填写"  size="40" readonly="true"></nested:text>					 
				</td>
			</tr>
			<tr>
				<td   align="right">
					投保人姓名
				</td>
				<td  > 
					<nested:text property="c_tbrname" value="${q1.rows[0].c_tbrname }" styleId="req" title="投保人姓名必须填写" readonly="true"></nested:text> 
				</td>
			</tr>	
			<tr>
				<td   align="right">
					报案时间
				</td>
				<td > 
					<nested:text property="c_barq" value="${q1.rows[0].c_barq }" maxlength="8" styleId="req" title="报案时间必须填写"></nested:text> 
				</td>
			</tr>	
				<tr>
				<td   align="right" >
					报案说明
				</td>
				<td  > 
					<nested:textarea property="c_basm" value="${q1.rows[0].c_basm }" styleId="req" title="报案说明必须填写" cols="100" rows="5"></nested:textarea> 
				</td>
			</tr>				 			
			</nested:nest>			
			<tr>
				<td align="right" >					
					<html:submit value=" 确 定 " />
				</td>
				<td >
					<html:reset  value=" 取 消 " />
				</td>
			</tr>
		</table>
	</html:form>
</body>
</html:html>

