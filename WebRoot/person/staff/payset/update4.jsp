<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head> 
		<body>		 	
		<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_payset where c_jobnumber='${param.c_jobnumber }'"></sql:query>				
		<html:form  action="/staff" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="payset"/>
		<nested:nest property="staff">	
		<nested:hidden property="c_no" value="${q1.rows[0].c_no }"></nested:hidden> 
		<nested:hidden property="c_jobnumber" value="${param.c_jobnumber }"></nested:hidden> 
		<nested:hidden property="c_jobnm" value="pclass"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="2" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							薪酬等级调整
						</div>
					</td>
				</tr>				
				<tr>
				<td width="48%"><div align="right">薪酬等级</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select  property="c_pclass" style="width: 120" value="${q1.rows[0].c_pclass }">
					<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_pclass order by c_name"></sql:query>					
					<c:forEach items="${q2.rows }" var="row">
					<html:option value="${row.c_no }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
				</div>
				</td>
				</tr>				 		 
			</nested:nest>
			<tr>
				<td   align="right"><input type="submit" value=" 确 定 "></td>
				<td   align="left"><input type="reset" value=" 取 消 "></td> 
			</tr>		
			</table>  
		</html:form>	
</body>			 
</html:html>
