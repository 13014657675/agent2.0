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
							�ͻ����
						</div>
					</td>
				</tr>		
			 	<tr>
			 	<td rowspan="2" width="20%">
			 	������<nested:text property="c_name" value="" styleId="req" title="����������д"></nested:text>
			 	</td>
			 	<td>֤�����ͣ�
			 	<sql:query var="query1"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14"></sql:query> 
			 	<nested:select property="c_cardtype">
			 	<c:forEach var="row" items="${query1.rows}" >		
					<html:option value="${row.c_code }">${row.c_name }</html:option>
				</c:forEach>
			 	</nested:select></td>
			 	<td colspan="2">
			 	֤�����룺<nested:text property="c_cardnum" value="" size="40" styleId="req" title="֤�����������д"></nested:text>
			 	</td>
			 	<td>��Ч������<nested:text property="c_cardperiod" value="" maxlength="8"></nested:text> </td>
			 	</tr>		
			 	<tr>
			 	<td width="20%">
			 	������<nested:text property="c_nation" value="�й�"></nested:text>
			 	</td>
			 	<td width="20%"><c:set property="c_sex" value="1" target="${customerForm.customer }"></c:set>
			 	�Ա�<nested:radio property="c_sex" value="1"></nested:radio>��
			 		 <nested:radio property="c_sex" value="2"></nested:radio>Ů
			 	</td>
			 	<td width="20%">
			 	�������ڣ�<nested:text property="c_birthy" size="4" value="" onchange="reg_num(this)"></nested:text>��
			 	<nested:text property="c_birthm" size="2" value="" onchange="reg_num(this)"></nested:text>��
			 	<nested:text property="c_birthd" size="2" value="" onchange="reg_num(this)"></nested:text>��
			 	</td>
			 	<td width="20%"><c:set property="c_marriage" value="0" target="${customerForm.customer }"></c:set>
			 	����״����<nested:radio property="c_marriage" value="0"></nested:radio>����
			 			<nested:radio property="c_marriage" value="1"></nested:radio>�ѻ�
			 	</td>
			 	</tr>				 		
			 	<tr>
			 	<td colspan="3">��ס����ַ��<nested:text property="c_hddr" value="" size="60"></nested:text></td>
			 	<td >�̶��绰��<nested:text property="c_phone" value=""></nested:text> </td>
			 	<td >סַ�ʱࣺ<nested:text property="c_hzip" value=""></nested:text> </td>
			 	</tr>
			 	<tr>
			 	<td>ѧ����
			 	<sql:query var="query2"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=13"></sql:query> 
			 	<nested:select property="c_education">
			 		<c:forEach var="row2" items="${query2.rows}" >		
							<html:option value="${row2.c_code }">${row2.c_name }</html:option>
						</c:forEach>
			 	</nested:select> </td>
			 	<td colspan="2">			 	
			 	�����ʼ���ַ��<nested:text property="c_email" value="" size="40"></nested:text>
			 	</td>
			 	<td>�ƶ��绰��<nested:text property="c_mobile" value=""></nested:text> </td>
			 	<td></td>
			 	</tr>
			 	<tr>
			 	<td colspan="3">������λ/ѧУ���ƣ�<nested:text property="c_company" value="" size="60"></nested:text> </td>
			 	<td>��λ�ʱࣺ<nested:text property="c_czip" value=""></nested:text></td>
			 	<td></td>
			 	</tr>
			 	<tr>
			 	<td colspan="3">������λ/ѧУ��ַ��<nested:text property="c_cddr" value="" size="60"></nested:text> </td>
			 	<td>ְ��<nested:text property="c_post" value=""></nested:text></td>
			 	<td>ְҵ���룺<nested:text property="c_postcode" value=""></nested:text></td>
			 	</tr>
				</nested:nest>
			 	<tr>
			 		<td></td>
					<td align="center"><input type="submit" value=" ȷ �� "></td>
					<td></td>
					<td align="center"><input type="reset" value=" �� �� "></td>
					<td></td>
				</tr>			 
			</table>	
			
		</html:form>	
	</body>
</html:html>
