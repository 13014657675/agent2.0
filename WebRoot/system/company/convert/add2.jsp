<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp" %> 
<html:html lang="true">
<head>
	<html:base /> 
	<title>�������</title>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script src="../../../tool/js/pub.js"></script>
<body >
	<html:form action="/company" method="post">
	 <html:hidden property="jobname" value="convert"/>	   	
		<nested:nest property="company">
		<nested:hidden property="c_jobnm" value="add"></nested:hidden>		      
        <nested:hidden property="c_companyid" value="${param.c_companyid }"></nested:hidden>       
		<nested:hidden property="c_convertT" value="${param.c_convertT }"></nested:hidden>      
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif" align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
					ϵ�����
				</td>
			</tr>	
			<tr>
				<td align="right" width="50%">
					���չ�˾
				</td>
				<td align="left" > 
					<sql:query var="q1"	sql="select * from t_company where c_no=${param.c_companyid } "	dataSource="${db_mssql}"></sql:query>
						${q1.rows[0].c_name }
				</td>
			</tr>  			
			<tr>
				<td align="right" width="50%">
					ϵ������
				</td>
				<td align="left" > 
					<sql:query var="q3"	sql="select * from t_convertT where c_no=${param.c_convertT } "	dataSource="${db_mssql}"></sql:query>
						${q3.rows[0].c_name }
				</td>
			</tr> 				  			
	</table>
	<table width="100%" border="1" cellspacing="0"> 
			<tr>
				<td align="center" width="50%">
					�ɷ�����
				</td>
				<td align="center">
					ϵ��
				</td> 
			</tr> 
			<c:forEach begin="1" end="20" var="c">
			<tr>
				<td align="center">
					<nested:hidden property="c_no" value="0"></nested:hidden>
					<nested:hidden property="c_jfqx" value="${c }"></nested:hidden> 
					${c }
				</td>
				<td align="center">
					<nested:text property="c_dec" value="0"   onkeyup="return reg_num(this)"></nested:text>
				</td> 
			</tr>
			</c:forEach>  
		<tr>
			<td colspan="3" align="center">
				<html:submit value=" ȷ �� "></html:submit> 
			</td>
		</tr> 
	</table>
	</nested:nest>
	</html:form> 
	</body>
</html:html>
