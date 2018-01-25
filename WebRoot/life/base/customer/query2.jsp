<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">  
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head>
<body> 	
		<sql:query var="q1" dataSource="${db_mssql }" 
			sql="select * from t_customer where c_cardtype='${param.c_cardtype }' and c_cardnum='${param.c_cardnum }'"></sql:query>
		<html:form action="/customer" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="add_update" />
		<nested:nest property="customer">
		<nested:hidden property="c_jobnm" value="update"></nested:hidden> 
		<nested:hidden property="c_no" value="${q1.rows[0].c_no }"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="8" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							客户查询
						</div>
					</td>
				</tr>		
			 	<tr>
			 	<td rowspan="2" width="20%">
			 	姓名：<nested:text property="c_name" value="${q1.rows[0].c_name }" styleId="req" title="姓名必须填写"></nested:text>
			 	</td>
			 	<td>证件类型：
			 	<sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query> 
			 	<nested:select property="c_cardtype" value="${q1.rows[0].c_cardtype }">
			 	<c:forEach var="row" items="${query1.rows}" >		
					<html:option value="${row.c_code }">${row.c_name }</html:option>
				</c:forEach>
			 	</nested:select></td>
			 	<td colspan="2">
			 	证件号码：<nested:text property="c_cardnum" value="${q1.rows[0].c_cardnum }" size="40" styleId="req" title="证件号码必须填写"></nested:text>
			 	</td>
			 	<td>有效期至：<nested:text property="c_cardperiod" value="${q1.rows[0].c_cardperiod }" maxlength="8"></nested:text> </td>
			 	</tr>		
			 	<tr>
			 	<td width="20%">
			 	国籍：<nested:text property="c_nation" value="${q1.rows[0].c_nation }"></nested:text>
			 	</td>
			 	<td width="20%"><c:set property="c_sex" value="${q1.rows[0].c_sex }" target="${customerForm.customer }"></c:set>
			 	性别：<nested:radio property="c_sex" value="1"></nested:radio>男
			 		 <nested:radio property="c_sex" value="2"></nested:radio>女
			 	</td>
			 	<td width="20%">
			 	出生日期：<nested:text property="c_birthy" size="4" value="${q1.rows[0].c_birthy }" onchange="reg_num(this)"></nested:text>年
			 	<nested:text property="c_birthm" size="2" value="${q1.rows[0].c_birthm }" onchange="reg_num(this)"></nested:text>月
			 	<nested:text property="c_birthd" size="2" value="${q1.rows[0].c_birthd }" onchange="reg_num(this)"></nested:text>日
			 	</td>
			 	<td width="20%"><c:set property="c_marriage" value="${q1.rows[0].c_marriage }" target="${customerForm.customer }"></c:set>
			 	婚姻状况：<nested:radio property="c_marriage" value="0"></nested:radio>单身
			 			<nested:radio property="c_marriage" value="1"></nested:radio>已婚
			 	</td>
			 	</tr>				 		
			 	<tr>
			 	<td colspan="3">现住所地址：<nested:text property="c_hddr" value="${q1.rows[0].c_hddr }" size="60"></nested:text></td>
			 	<td >固定电话：<nested:text property="c_phone" value="${q1.rows[0].c_phone }"></nested:text> </td>
			 	<td >住址邮编：<nested:text property="c_hzip" value="${q1.rows[0].c_hzip }"></nested:text> </td>
			 	</tr>
			 	<tr>
			 	<td>学历：
			 	<sql:query var="query2"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=13"></sql:query> 
			 	<nested:select property="c_education" value="${q1.rows[0].c_education }">
			 		<c:forEach var="row2" items="${query2.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
			 	</nested:select> </td>
			 	<td colspan="2">			 	
			 	电子邮件地址：<nested:text property="c_email" value="${q1.rows[0].c_email }" size="40"></nested:text>
			 	</td>
			 	<td>移动电话：<nested:text property="c_mobile" value="${q1.rows[0].c_mobile }"></nested:text> </td>
			 	<td></td>
			 	</tr>
			 	<tr>
			 	<td colspan="3">工作单位/学校名称：<nested:text property="c_company" value="${q1.rows[0].c_company }" size="60"></nested:text> </td>
			 	<td>单位邮编：<nested:text property="c_czip" value="${q1.rows[0].c_czip }"></nested:text></td>
			 	<td></td>
			 	</tr>
			 	<tr>
			 	<td colspan="3">工作单位/学校地址：<nested:text property="c_cddr" value="${q1.rows[0].c_cddr }" size="60"></nested:text> </td>
			 	<td>职务：<nested:text property="c_post" value="${q1.rows[0].c_post }"></nested:text></td>
			 	<td>职业代码：<nested:text property="c_postcode" value="${q1.rows[0].c_postcode }"></nested:text></td>
			 	</tr>
				</nested:nest> 		 
			</table>				
		</html:form>	
	</body>
</html:html>
