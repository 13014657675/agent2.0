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
	<html:hidden property="jobname" value="sxlpja" />		
	<nested:nest property="sxbd"> 
	<nested:hidden property="c_orgid" value="${param.c_orgid }"/> 
	<nested:hidden property="c_jobnm" value="update"/>
		<table width="100%" border="1" cellspacing="0" id="table">
			<tr >
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">						
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						数据查询
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
					<nested:hidden property="c_bd" value="${q1.rows[0].c_bd }"></nested:hidden>
					${q1.rows[0].c_bd }				 
				</td>
			</tr>
			<tr>
				<td   align="right">
					投保人姓名
				</td>
				<td  > 
					${q1.rows[0].c_tbrname }
				</td>
			</tr>	
			<tr>
				<td   align="right">
					报案时间
				</td>
				<td > 
					${q1.rows[0].c_barq }
				</td>
			</tr>	
				<tr>
				<td   align="right" >
					报案说明
				</td>
				<td  > 
					<textarea cols="100" rows="5" readonly="readonly">${q1.rows[0].c_basm }</textarea>
				</td>
			</tr>			
			<tr>
				<td   align="right">
					结案时间
				</td>
				<td > 
					<nested:text property="c_jarq" value="${q1.rows[0].c_jarq }" maxlength="8" styleId="req" title="结案时间必须填写" ></nested:text> 
				</td>
			</tr>	
			<tr>
				<td   align="right" >
					结案说明
				</td>
				<td  > 
					<nested:textarea property="c_jasm" value="${q1.rows[0].c_jasm }" styleId="req" title="结案说明必须填写" cols="100" rows="5" ></nested:textarea> 
				</td>
			</tr>
			<tr>
				<td   align="right">
					结案结果
				</td>
				<td > 
					<nested:select property="c_jajg" value="${q1.rows[0].c_jajg }">
					<html:option value="1">理赔</html:option>
					<html:option value="2">拒赔</html:option>
					</nested:select>
				</td>
			</tr>	
			<tr>
				<td   align="right">
					赔付金额
				</td>
				<td > 
					<nested:text property="c_je" value="${q1.rows[0].c_je }" onchange="reg_num(this)" maxlength="8" styleId="req" title="金额必须填写" ></nested:text>  
				</td>
			</tr>		
			<tr>
				<td   align="right">
					保单状态
				</td>
				<td > 
					<nested:select property="c_bdzt" value="${fn:trim(q1.rows[0].c_bdzt) }">
					<html:option value="zz">保单终止</html:option>
					<html:option value="0">正常</html:option>
					</nested:select>
				</td>
			</tr>				 			
			</nested:nest>	 
		</table>
	</html:form>
</body>
</html:html>

