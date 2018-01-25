<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>佣金率设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
</head>
<body>
	<html:form action="/wealthsolve"   enctype="multipart/form-data" onsubmit="return check_form(this)" >
	<html:hidden property="jobname" value="cxdz_upload"/>
	<nested:nest property="cxdz"> 
	<nested:hidden property="c_orgid" value="${sessionScope.Staff.c_orgid }"></nested:hidden>
	<nested:hidden property="c_jobnm" value="add"></nested:hidden>   
	<table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						文件上传
				</td>
		</tr> 								 
		<tr>
			  <td align="right" width="50%">保险公司</td>
			  <td width="57%" align="left">
				<sql:query var="q1"	sql="select * from t_company where c_type=3002"	dataSource="${db_mssql}"></sql:query>
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
		<td align="right">依据日期类型</td><td >
		<nested:select property="c_type">
		<html:option value="1">签单日期</html:option>
		<html:option value="2">起保日期</html:option>
		</nested:select>
		</td>
		</tr>
		<tr>	
		<td align="right">年</td><td >
		<nested:text property="c_year" value="" size="4" maxlength="4" styleId="req" title="年必须填写" onchange="reg_num(this)"></nested:text>
		</td></tr>	
		<tr>	
		<td align="right">月</td><td >
		<nested:select property="c_month">
		<c:forEach begin="1" end="12" var="row">
		<html:option value="${row }">第${row }月</html:option>
		</c:forEach>
		</nested:select>
		</td></tr>	
		<tr>	
		<td align="right">文件</td><td >
		<nested:file property="file" styleId="req" title="文件必须填写"></nested:file>	 
		<a href="../../../download/wealthsolve/cxdz-modle.xls" style="color: red">模板下载</a> 
		</td></tr>		
		<tr>
		<td align="right"><input type="submit" value="确 定"></td>
		<td ><input type="reset" value="重 置"> </td></tr>
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
				var c_year=document.getElementsByName("cxdz.c_year")[0];
				c_year.value=formatStr;
			}
			setyear()			
		</script>	