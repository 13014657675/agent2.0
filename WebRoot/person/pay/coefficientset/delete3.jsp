<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head>		
	<body>		
	    <sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_pcoefficient where c_no =${param.c_pcoefficient }"></sql:query> 
	    <sql:query var="q3" dataSource="${db_mssql }" sql="select * from t_pcoefficientset 
			where c_orgid=${param.c_orgid } and c_pcoefficient=${param.c_pcoefficient } and c_year=${param.c_year } and c_number=${param.c_number } order by c_jobnumber "></sql:query>
		<html:form  action="/pay" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="pcoefficientset"/>
		<nested:nest property="pay">	 
		<nested:hidden property="c_jobnm" value="del"></nested:hidden> 
		<nested:hidden property="c_orgid" value="${param.c_orgid }"></nested:hidden> 
		<nested:hidden property="c_pcoefficient" value="${param.c_pcoefficient }"></nested:hidden> 		
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="30" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						薪酬系数值删除
					</div>
				</td>
			</tr> 			
			<tr> 
				<td align="center" > ${q1.rows[0].c_name }
				<td align="center" > ${q1.rows[0].c_var }
				<td align="center" > 有效期 
				<td align="center" >
				<c:choose>
				<c:when test="${param.c_period eq 1}">
				<nested:text property="c_year" value="${param.c_year }" size="4"></nested:text>年
				第<nested:select property="c_number" value="${param.c_number }">
				<c:forEach begin="1" end="12" var="x1">
				<html:option value="${x1 }">${x1 }</html:option>
				</c:forEach>
				</nested:select>月
				</c:when>
				<c:when test="${param.c_period eq 3}">
				<nested:text property="c_year" value="${param.c_year }" size="4"></nested:text>年
				第<nested:select property="c_number" value="${param.c_number }">
				<c:forEach begin="1" end="4" var="x1">
				<html:option value="${x1 }">${x1 }</html:option>
				</c:forEach>
				</nested:select>季
				</c:when>
				<c:when test="${param.c_period eq 12}">
				<nested:text property="c_year" value="${param.c_year }" size="4"></nested:text>年
				<nested:hidden property="c_number" value="${param.c_number }" ></nested:hidden>
				</c:when> 
				</c:choose>				
				</td>  
			</tr>  
			
			<c:forEach items="${q3.rows }" var="row3">
			<sql:query var="q4" dataSource="${db_mssql }" sql="select * from t_organization where c_no =${param.c_orgid }"></sql:query>
			<sql:query var="q5" dataSource="${db_mssql }" sql="select * from t_staff where c_jobnumber ='${row3.c_jobnumber }' "></sql:query>
			<tr> 
				<nested:hidden property="c_no" value="${row3.c_no }" ></nested:hidden>
				<td align="center" width="25%">${q4.rows[0].c_name }</td> 
				<td align="center" width="25%">
				${row3.c_jobnumber }
				<nested:hidden property="c_jobnumber" value="${row3.c_jobnumber }" ></nested:hidden>
				</td> 		
				<td align="center" width="25%">${q5.rows[0].c_name }</td> 			 
				<td align="center" width="25%"> 
				<nested:text property="c_value" value="${row3.c_value }" ></nested:text>
				</td> 
			</tr> 
			</c:forEach>  		
			</nested:nest>		
			<tr>
				<td colspan="2" align="right"><html:submit value=" 确 定 "/></td> 
				<td colspan="2" align="left"><html:reset value=" 取 消 "/></td> 
			</tr>		
		</table>	
	</html:form> 
	</body> 	 
</html:html>
