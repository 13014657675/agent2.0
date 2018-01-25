<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>佣金率设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
	<script type="text/javascript">
	function PrintTable(id)
	{
		var str1= window.document.body.innerHTML;
		id.deleteRow(0)
		id.deleteRow(id.rows.length-1)		
		var str2='<table width="100%" >'+id.innerHTML+'</table>';
	    window.document.body.innerHTML =str2;
	  	window.print();
	   	window.document.body.innerHTML = str1;
	}
	</script>
</head>
<body> 
	<logic:equal value="1" parameter="c_sjlx">
	 <table width="100%" border="1" cellspacing="0" align="center" id="tb">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						 首期对账
				</td>
			</tr> 
		<tr> 
		<tr>
		<td width="35%">保单</td>
		<td width="25%">错误类型</td>
		<td width="20%">系数数据</td> 
		<td width="20%">保险公司数据</td> 
		</tr>		
		<sql:query var="q1" dataSource="${db_mssql }" 
			sql="exec p_sxdz_bg ${param.c_orgid },${param.c_sjlx },${param.c_companyid },${param.c_year },${param.c_month } "></sql:query> 
		<c:forEach items="${q1.rows }" var="row">
		<tr>
		<td>${row.c_bd }</td>
		<td>${row.c_type }</td>
		<td>${row.c_x_xt }</td>
		<td>${row.c_x_gs }</td>
		</tr>
		</c:forEach>
		<tr>				
			<td align="center" colspan="4">
			<input type="submit" value=" 打 印 " onclick="PrintTable(tb)">
			</td>	 		 
		</tr>
		</table>	
		</logic:equal>
	<logic:equal value="2" parameter="c_sjlx">
	 <table width="100%" border="1" cellspacing="0" align="center" id="tb">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						 续期对账
				</td>
			</tr> 
		<tr> 
		<tr>
		<td width="35%">保单</td>
		<td width="35%">保单年度</td>
		<td width="25%">错误类型</td>
		<td width="20%">系数数据</td> 
		<td width="20%">保险公司数据</td> 
		</tr>		
		<sql:query var="q1" dataSource="${db_mssql }" 
			sql="exec p_sxdz_bg ${param.c_orgid },${param.c_sjlx },${param.c_companyid },${param.c_year },${param.c_month } "></sql:query> 
		<c:forEach items="${q1.rows }" var="row">
		<tr>
		<td>${row.c_bd }</td>
		<td>${row.c_bdnd }</td>
		<td>${row.c_type }</td>
		<td>${row.c_x_xt }</td>
		<td>${row.c_x_gs }</td>
		</tr>
		</c:forEach>
		<tr>				
			<td align="center" colspan="4">
			<input type="submit" value=" 打 印 " onclick="PrintTable(tb)">
			</td>	 		 
		</tr>
		</table>	
		</logic:equal>
</body>
</html:html>
