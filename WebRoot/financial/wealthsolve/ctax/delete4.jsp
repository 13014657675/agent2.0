<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>手续费率设置</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
    <script type='text/javascript' src='../../../dwr/util.js'> </script> 
    <script type='text/javascript' src='../../../dwr/interface/Product.js'> </script>
</head>
<body >  
		<html:form action="/wealthsolve" method="post">
		<html:hidden property="jobname" value="ctax"/>
		<nested:nest property="product">   
        <nested:hidden property="c_jobnm" value="del"></nested:hidden>	     
        <nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden>	     
		<table width="100%" border="1" cellspacing="0">
		<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool//images/112.gif" width="16" height="15" />
						收入税率删除
				</td>
		</tr> 
		<tr>
			<td align="right" width="50%" colspan="3">保险公司</td>
			<td width="50%" align="left" colspan="3">
					<sql:query var="q1"	sql="select * from t_company where c_type=3002 and c_no=${param.c_companyid }"	dataSource="${db_mssql}"></sql:query>
					${q1.rows[0].c_name }
					<nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>
				</td>
		</tr>
		<tr>
				<td align="right" colspan="3" width="50%">险种名称</td>
				<td align="left" colspan="3" width="50%"> 
					<sql:query var="q2"	sql="select * from t_product where c_no=${param.c_productid }"	dataSource="${db_mssql}"></sql:query>
					${q2.rows[0].c_name }
					<nested:hidden property="c_productid" value="${param.c_productid }"></nested:hidden>
				</td>
		</tr>  
		<tr>
				<td align="right" colspan="3" width="50%">依据日期类型</td>
				<td align="left" colspan="3" width="50%"> 
					<c:choose>
					<c:when test="${param.c_type eq 1}">签单日期</c:when>
					<c:when test="${param.c_type eq 2}">起保日期</c:when>
					</c:choose> 
					<nested:hidden property="c_type" value="${param.c_type }"></nested:hidden>
				</td>
		</tr> 
		<tr>
				<td align="right" colspan="3" width="50%">开始日期</td>
				<td align="left" colspan="3" width="50%"> 
					<nested:text property="c_ksrq" value="${param.c_ksrq }" readonly="true"></nested:text>
				</td>
		</tr> 
		<tr style="color: red">
			<td align="center" colspan="2" width="33%">使用性质</td>
			<td align="center" colspan="2" width="33%">收入税率</td>
			<td align="center" colspan="2" width="33%"></td>
		</tr>      
		<sql:query var="q3"	sql="select * from t_usage where c_system=11"	dataSource="${db_mssql}"></sql:query>
		<c:forEach items="${q3.rows }" var="row3">
		<tr>
			<!-- 性质id -->
			<nested:hidden property="c_ptype" value="${row3.c_no }"/>
			<sql:query var="q4"	sql="select * from t_ctax
				where c_orgid=${param.c_orgid } and c_companyid=${param.c_companyid } and c_productid=${param.c_productid } 
					and c_usageid=${row3.c_no }  and c_type=${param.c_type } and c_ksrq='${param.c_ksrq }'"	
				dataSource="${db_mssql}"></sql:query>
			<nested:hidden property="c_no" value="${q4.rows[0].c_no }"/>
			<td align="center" colspan="2">${row3.c_name }</td>
			<td align="center" colspan="2">
			<nested:text property="c_dec_in" value="${q4.rows[0].c_rate }" onchange="reg_num(this)"></nested:text>
			</td>
			<td align="center" colspan="2">
			 
			</td>
		</tr>    
		</c:forEach>
		
	</nested:nest>	
		<tr>
			<td  align="right" colspan="3">
				<html:submit value=" 确 定 "></html:submit> 
			</td>
			<td colspan="3">
				<html:reset value=" 取 消 "></html:reset>
			</td>
		</tr>
	</table>	
	</html:form> 
	</body> 
</html:html>
