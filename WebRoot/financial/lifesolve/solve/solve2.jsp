<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>佣金率设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script> 
	<script type="text/javascript">
	function js_select(all)
	{ 
		var c_no=document.getElementsByName("sxdz.c_no");
		for (var i=0;i<c_no.length;i++) 
		{   var e=c_no[i]; 
			e.checked=all.checked; 
		}
	}
	</script>
</head>
<body> 
	<logic:equal value="1" parameter="c_sjlx">
	<sql:query var="q1" dataSource="${db_mssql }" 
	sql="select * from t_sxdz where c_orgid=${param.c_orgid } and c_year=${param.c_year } and c_month=${param.c_month } and c_companyid=${param.c_companyid } and c_jobnm='0'"></sql:query>
	 <table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="8" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						 首期结算
				</td>
			</tr> 
		<tr> 
		<tr>
		<td width="25%">保单</td>
		<td width="10%">投保人姓名</td>
		<td width="10%">被保人姓名</td>
		<td width="10%">承保日期</td>
		<td width="10%">保险费</td>
		<td width="10%">手续费</td>
		<td width="10%">对账月份</td>
		<td width="15%">标记</td>
		</tr>
		<html:form action="/lifesolve"  onsubmit="return check_form(this)" >
		<html:hidden property="jobname" value="sxdz_js"/>
		<nested:nest property="sxdz"> 
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>
		<nested:hidden property="c_sjlx" value="1"></nested:hidden>  
		<nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>  
		<nested:hidden property="c_year" value="${param.c_year }"></nested:hidden>  
		<nested:hidden property="c_month" value="${param.c_month }"></nested:hidden>  
		<c:forEach items="${q1.rows }" var="row" varStatus="x">
		<tr>
		<td>
		${row.c_bd }
		<nested:hidden property="c_bd" value="${row.c_bd }"></nested:hidden>  
		<nested:hidden property="c_bdnd" value="1"></nested:hidden>  
		</td>
		<td>${row.c_tbrname }</td>
		<td>${row.c_bbrname }</td>
		<td>${row.c_cbrq }</td>
		<td>${row.c_bxf }</td>
		<td>${row.c_sxf }</td>
		<td>${row.c_year }年${row.c_month }月</td>
		<td>
		<c:choose>
		<c:when test="${fn:trim(row.c_jobnm) eq '0'}">
		<nested:checkbox property="c_no" value="${x.index }"></nested:checkbox>
		</c:when>
		<c:when test="${fn:trim(row.c_jobnm) ne '0'}"><font color="red">异常</font></c:when>
		</c:choose>
		</td>
		</tr>
		</c:forEach>
		<tr>
		<td colspan="7" align="center">				
		<input type="submit" value=" 结 算 ">
		</nested:nest></html:form>
		
		<tr>	
		<td>&nbsp;<input type="checkbox" value="1" onclick="js_select(this)">全选</td>
		</tr>
		</table>   
		</logic:equal>
	<logic:equal value="2" parameter="c_sjlx">
	<sql:query var="q1" dataSource="${db_mssql }" 
	sql="select * from t_sxdz_xq where c_orgid=${param.c_orgid } and c_year=${param.c_year } and c_month=${param.c_month } and c_companyid=${param.c_companyid } and c_jobnm='0'"></sql:query>
	 <table width="100%" border="1" cellspacing="0" align="center">
		<tr>
				<td height="33" colspan="8" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						 首期结算
				</td>
			</tr> 
		<tr> 
		<tr>
		<td width="25%">保单</td>
		<td width="15%">保单年度</td>
		<td width="15%">保险费</td>
		<td width="15%">手续费</td>
		<td width="15%">对账月份</td>
		<td width="15%">标记</td>
		</tr>
		<html:form action="/lifesolve"  onsubmit="return check_form(this)" >
		<html:hidden property="jobname" value="sxdz_js"/>
		<nested:nest property="sxdz"> 
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>
		<nested:hidden property="c_sjlx" value="2"></nested:hidden>  
		<nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>  
		<nested:hidden property="c_year" value="${param.c_year }"></nested:hidden>  
		<nested:hidden property="c_month" value="${param.c_month }"></nested:hidden>  
		<c:forEach items="${q1.rows }" var="row" varStatus="x">
		<tr>
		<td>
		${row.c_bd }
		<nested:hidden property="c_bd" value="${row.c_bd }"></nested:hidden>  
		<nested:hidden property="c_bdnd" value="${row.c_bdnd }"></nested:hidden>  
		</td>
		<td>${row.c_bdnd }</td> 
		<td>${row.c_bxf }</td>
		<td>${row.c_sxf }</td>
		<td>${row.c_year }年${row.c_month }月</td>
		<td>
		<c:choose>
		<c:when test="${fn:trim(row.c_jobnm) eq '0'}">
		<nested:checkbox property="c_no" value="${x.index }"></nested:checkbox>
		</c:when>
		<c:when test="${fn:trim(row.c_jobnm) ne '0'}"><font color="red">异常</font></c:when>
		</c:choose>
		</td>
		</tr>
		</c:forEach>
		<tr>
		<td colspan="5" align="center">				
		<input type="submit" value=" 结 算 ">
		</nested:nest></html:form>
	 
		<tr>	
		<td>&nbsp;<input type="checkbox" value="1" onclick="js_select(this)">全选</td>
		</tr>
		</table>   
		</logic:equal>
</body>
</html:html>
