<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">  
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head>
<body> 	
		<html:form action="/customer" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="add_update" />
		<nested:nest property="customer">
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="8" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							客户添加
						</div>
					</td>
				</tr>		
			 	<tr>
			 	<td rowspan="2" width="20%">
			 	姓名：<nested:text property="c_name" value="" styleId="req" title="姓名必须填写"></nested:text>
			 	</td>
			 	<td>证件类型：
			 	<sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query> 
			 	<nested:select property="c_cardtype">
			 	<c:forEach var="row" items="${query1.rows}" >		
					<html:option value="${row.c_code }">${row.c_name }</html:option>
				</c:forEach>
			 	</nested:select></td>
			 	<td colspan="2">
			 	证件号码：<nested:text property="c_cardnum" value="" size="40" styleId="req" title="证件号码必须填写"></nested:text>
			 	</td>
			 	<td>有效期至：<nested:text property="c_cardperiod" value="" maxlength="8"></nested:text> </td>
			 	</tr>		
			 	<tr>
			 	<td width="20%">
			 	国籍：<nested:text property="c_nation" value="中国"></nested:text>
			 	</td>
			 	<td width="20%"><c:set property="c_sex" value="1" target="${customerForm.customer }"></c:set>
			 	性别：<nested:radio property="c_sex" value="1"></nested:radio>男
			 		 <nested:radio property="c_sex" value="2"></nested:radio>女
			 	</td>
			 	<td width="20%">
			 	出生日期：<nested:text property="c_birthy" size="4" value="" onchange="reg_num(this)"></nested:text>年
			 	<nested:text property="c_birthm" size="2" value="" onchange="reg_num(this)"></nested:text>月
			 	<nested:text property="c_birthd" size="2" value="" onchange="reg_num(this)"></nested:text>日
			 	</td>
			 	<td width="20%"><c:set property="c_marriage" value="0" target="${customerForm.customer }"></c:set>
			 	婚姻状况：<nested:radio property="c_marriage" value="0"></nested:radio>单身
			 			<nested:radio property="c_marriage" value="1"></nested:radio>已婚
			 	</td>
			 	</tr>				 		
			 	<tr>
			 	<td colspan="3">现住所地址：<nested:text property="c_hddr" value="" size="60"></nested:text></td>
			 	<td >固定电话：<nested:text property="c_phone" value=""></nested:text> </td>
			 	<td >住址邮编：<nested:text property="c_hzip" value=""></nested:text> </td>
			 	</tr>
			 	<tr>
			 	<td>学历：
			 	<sql:query var="query2"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=13"></sql:query> 
			 	<nested:select property="c_education">
			 		<c:forEach var="row2" items="${query2.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
			 	</nested:select> </td>
			 	<td colspan="2">			 	
			 	电子邮件地址：<nested:text property="c_email" value="" size="40"></nested:text>
			 	</td>
			 	<td>移动电话：<nested:text property="c_mobile" value=""></nested:text> </td>
			 	<td></td>
			 	</tr>
			 	<tr>
			 	<td colspan="3">工作单位/学校名称：<nested:text property="c_company" value="" size="60"></nested:text> </td>
			 	<td>单位邮编：<nested:text property="c_czip" value=""></nested:text></td>
			 	<td></td>
			 	</tr>
			 	<tr>
			 	<td colspan="3">工作单位/学校地址：<nested:text property="c_cddr" value="" size="60"></nested:text> </td>
			 	<td>职务：<nested:text property="c_post" value=""></nested:text></td>
			 	<td>职业代码：<nested:text property="c_postcode" value=""></nested:text></td>
			 	</tr>
				</nested:nest>
			 	<tr>
			 		<td></td>
					<td align="center"><input type="submit" value=" 确 定 "></td>
					<td></td>
					<td align="center"><input type="reset" value=" 重 置 "></td>
					<td></td>
				</tr>			 
			</table>	
			
		</html:form>	
	</body>
</html:html>
