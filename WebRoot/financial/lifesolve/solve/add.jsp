<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>Ӷ��������</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
</head>
<body>
	<html:form action="/lifesolve"   enctype="multipart/form-data" onsubmit="return check_form(this)" >
	<html:hidden property="jobname" value="sxdz_upload"/>
	<nested:nest property="sxdz"> 
	<nested:hidden property="c_orgid" value="${sessionScope.Staff.c_orgid }"></nested:hidden>
	<nested:hidden property="c_jobnm" value="add"></nested:hidden>  
	<c:set property="c_sjlx" value="1"  target="${lifesolveForm.sxdz}"></c:set>
	<table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						�ļ��ϴ�
				</td>
			</tr> 
		<tr>
		<td align="right" width="50%" rowspan="2">����</td><td >
		<nested:radio property="c_sjlx" value="1"></nested:radio>����		 
		<a href="../../../download/lifesolve/sxdz-modle1.xls" style="color: red">ģ������</a> 
		</td></tr>
		<tr>
		<td >
		<nested:radio property="c_sjlx" value="2"></nested:radio>����		 	
		<a href="../../../download/lifesolve/sxdz-modle2.xls" style="color: red">ģ������</a> 
		</td></tr>					 
		<tr>
			  <td align="right" width="50%">���չ�˾</td>
			  <td width="57%" align="left">
				<sql:query var="q1"	sql="select * from t_company where c_type=3001"	dataSource="${db_mssql}"></sql:query>
					 <nested:select property="c_companyid">
						<c:forEach var="row" items="${q1.rows}">
							<html:option value="${row.c_no}">
								${row.c_name}
							</html:option>
						</c:forEach>
					</nested:select> 
				</td>
		</tr>	
		<tr>	
		<td align="right">��</td><td >
		<nested:text property="c_year" value="" size="4" maxlength="4" styleId="req" title="�������д" onchange="reg_num(this)"></nested:text>
		</td></tr>	
		<tr>	
		<td align="right">��</td><td >
		<nested:select property="c_month">
		<c:forEach begin="1" end="12" var="row">
		<html:option value="${row }">��${row }��</html:option>
		</c:forEach>
		</nested:select>
		</td></tr>	
		<tr>	
		<td align="right">�ļ�</td><td >
		<nested:file property="file" styleId="req" title="�ļ�������д"></nested:file>	 
		</td></tr>		
		<tr>
		<td align="right"><input type="submit" value="ȷ ��"></td>
		<td ><input type="reset" value="�� ��"> </td></tr>
		</table>
	</nested:nest>		
	</html:form>	
</body>
</html:html>
<script type="text/javascript">	
			function setyear()
			{			
				var myDate = new Date();
				var formatStr="yyyy"
				Y=myDate.getFullYear();
				formatStr=formatStr.replace("yyyy",String(Y));   
				//M=myDate.getMonth()+1
				//formatStr=formatStr.replace("MM",M>9?String(M):'0'+String(M));   
				//D=myDate.getDate()
				//formatStr=formatStr.replace("dd",D>9?String(D):'0'+String(D));   		 		
				var c_year=document.getElementsByName("sxdz.c_year")[0];
				c_year.value=formatStr;
			}
			setyear()			
		</script>	