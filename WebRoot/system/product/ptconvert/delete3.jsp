<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>系数删除</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
<body >
	<html:form action="/product" method="post">
	 <html:hidden property="jobname" value="ptconvert"/>	   	
		<nested:nest property="product">
		<nested:hidden property="c_jobnm" value="del"></nested:hidden>        
        <nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>       
        <nested:hidden property="c_productid" value="${param.c_productid }"></nested:hidden>      
		<nested:hidden property="c_convertT" value="${param.c_convertT }"></nested:hidden>      
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
					系数删除
				</td>
			</tr>	
			<tr>
				<td align="right" width="50%">
					保险公司
				</td>
				<td align="left" > 
					<sql:query var="q1"	sql="select * from t_company where c_no=${param.c_companyid } "	dataSource="${db_mssql}"></sql:query>
						${q1.rows[0].c_name }
				</td>
			</tr> 		
			<tr>
				<td align="right" width="50%">
					险种名称
				</td>
				<td align="left" > 
					<sql:query var="q2"	sql="select * from t_product where c_no=${param.c_productid } "	dataSource="${db_mssql}"></sql:query>
						${q2.rows[0].c_fullname }	
				</td>
			</tr> 					 	
			<tr>
				<td align="right" width="50%">
					系数类型
				</td>
				<td align="left" > 
					<sql:query var="q4"	sql="select * from t_convertT where c_no=${param.c_convertT } "	dataSource="${db_mssql}"></sql:query>
						${q4.rows[0].c_name }
				</td>
			</tr> 					  			
	</table>
	<table width="100%" border="1" cellspacing="0"> 
	<tr>
				<td align="center" width="50%">
					缴费期限
				</td>
				<td align="center">
					系数
				</td> 
			</tr>
			<sql:query var="q4" sql="select * from t_ptconvert where c_companyid=${param.c_companyid } and c_productid=${param.c_productid }  and c_convertT=${param.c_convertT } order by c_jfqx " dataSource="${db_mssql}"></sql:query>
			<c:forEach items="${q4.rows }" var="row">
			<tr>
				<td align="center">
					<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>
					<nested:hidden property="c_jfqx" value="${row.c_jfqx }"></nested:hidden> 
					${row.c_jfqx }
				</td>
				<td align="center">
					<nested:text property="c_dec" value="${row.c_dec }"   onkeyup="return reg_num(this)"></nested:text>
				</td> 
			</tr>
			</c:forEach> 
		<tr>
			<td colspan="3" align="center">
				<html:submit value="确 定"></html:submit> 
			</td>
		</tr> 
	</table>
	</nested:nest>
	</html:form> 
	</body>
</html:html>
