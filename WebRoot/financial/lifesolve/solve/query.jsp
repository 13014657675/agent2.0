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
	<form action="../../../toModule.do?prefix=/financial&page=/lifesolve/solve/query2.jsp" method="post" onsubmit="return check_form(this)">	
	<input type="hidden" name="c_orgid" value="${sessionScope.Staff.c_orgid }">
	<table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						结算查询
				</td>
			</tr> 
		<tr>
		<td align="right" width="50%" rowspan="2">类型</td><td >
		<input type="radio" name="c_sjlx" value="1" checked="checked">首期		  
		</td></tr>
		<tr>
		<td >
		<input type="radio" name="c_sjlx" value="2" >续期		 	 
		</td>
		</tr>					 
		<tr>
			  <td align="right" width="50%">保险公司</td>
			  <td width="57%" align="left">
				<sql:query var="q1"	sql="select * from t_company where c_type=3001"	dataSource="${db_mssql}"></sql:query>
					 <select name="c_companyid">
						<c:forEach var="row" items="${q1.rows}">
							<option value="${row.c_no}">
								${row.c_name}
							</option>
						</c:forEach>
					</select>
				</td>
		</tr>	
		<tr>	
		<td align="right">年</td><td >
		<input name="c_year" value="" size="4" maxlength="4" id="req" title="年必须填写" onchange="reg_num(this)"> 
		</td></tr>	
		<tr>	
		<td align="right">月</td><td >
		<select name="c_month">
		<c:forEach begin="1" end="12" var="row">
		<option value="${row }">第${row }月</option>
		</c:forEach>
		</select> 
		</td></tr>		
		<tr>	 
		<td align="right"><input type="submit" value="确 定"></td>
		<td ><input type="reset" value="重 置"> </td></tr>
		</table>  
	</form>	
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
				var c_year=document.getElementsByName("c_year")[0];
				c_year.value=formatStr;
			}
			setyear()			
		</script>	