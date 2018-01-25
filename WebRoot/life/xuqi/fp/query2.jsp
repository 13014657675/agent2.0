<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>  
		<html:form action="/sxbd" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="sxbdxuqi" />
		<nested:nest property="sxbd">  			
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>
		<nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>
		<nested:hidden property="c_bd" value="${param.c_bd }"></nested:hidden>
		<nested:hidden property="c_bdnd" value="${param.c_bdnd }"></nested:hidden>
		<nested:hidden property="c_jobnm" value="update"></nested:hidden>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						续期发票查询
					</div>
				</td>
			</tr>					
			<tr>
				<td width="50%" align="right" colspan="3">保险公司</td>
				<td colspan="3">
					<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_company where c_no=${param.c_companyid }"></sql:query>
					${q1.rows[0].c_name }
				</td>
			</tr> 
			<tr>
				<td width="50%" align="right" colspan="3">保单号</td>
				<td colspan="3">
					 ${param.c_bd }
				</td>
			</tr> 
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_sxbd 
				where c_orgid=${param.c_orgid } and c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_jobnm='0' and c_flag='0'"></sql:query>
			<tr>
				<td width="50%" align="right" colspan="3">投保人姓名</td>
				<td colspan="3">
					<sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_customer where c_no=${q2.rows[0].c_tbrnum }"></sql:query>					 
					<nested:text property="c_tbrname" value="${q3.rows[0].c_name }" styleId="req" title="投保人姓名必须填写"></nested:text>
				</td>
			</tr>  	
			<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_sxtb_xq 
				where c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_bdnd=${param.c_bdnd } "></sql:query>
			<tr>
				<td width="50%" align="right" colspan="3">发票号码</td>
				<td colspan="3">
					 <nested:text property="c_code" value="${q4.rows[0].c_code }" styleId="req" title="发票号码必须填写" size="40"></nested:text>
				</td>
			</tr> 	
			<tr>
				<td width="50%" align="right" colspan="3">实缴日期</td>
				<td colspan="3">
					 <nested:text property="c_fprq" value="${q4.rows[0].c_fprq }" styleId="req" title="实缴日期必须填写" maxlength="8"></nested:text>
				</td>
			</tr> 			
			<tr>
			<td width="10%">保单年度</td>
			<td colspan="2" width="35%">险种</td>
			<td width="15%">应缴保费</td>
			<td width="15%">应缴日期</td>
			<td width="20%">实缴保费</td> 
			</tr>			
			<c:forEach items="${q4.rows }" var="row">
			<tr>
			<td >
			 	${param.c_bdnd }
			</td>
			<td colspan="2">
				<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_product where c_no=${row.c_productid }"></sql:query>
				${q5.rows[0].c_fullname }${q5.rows[0].c_code }
			</td>
			<td>
			<sql:query var="q6" dataSource="${db_mssql }" sql="select * from t_sxtb
				where c_companyid=${param.c_companyid } and c_bd='${param.c_bd }' and c_productid=${row.c_productid } "></sql:query>
			${q6.rows[0].c_bxf }
			</td>
			<td>
			<sql:query var="q7" dataSource="${db_mssql }" sql="select convert(char(8),dateadd(year, ${param.c_bdnd-1}, c_date),112) c_date from t_sxbdzt 
				where c_companyid=${row.c_companyid} and c_bd='${row.c_bd }' and c_type=1 "></sql:query>		
			${q7.rows[0].c_date }				
			</td>
			<td>
			<nested:hidden property="c_id" value="${row.c_no }"></nested:hidden>
			<nested:hidden property="c_productid" value="${row.c_productid }"></nested:hidden>
			<nested:text property="c_bxf" value="${row.c_bxf }" onchange="reg_num(this)"></nested:text>
			</td> 
			</tr>
			</c:forEach>
			</nested:nest>			 
		</table>
</html:form> 
</body>
</html:html>
