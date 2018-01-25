<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">		 
</head>		
	<sql:query var="q1" dataSource="${db_mssql }" sql="select  c_jobnumber,c_name,c_orgid,c_quitdate from t_staff 
		where c_orgid=${param.c_orgid } and c_quitdate is null 
		and c_jobnumber not in ( select c_jobnumber from t_role where c_sys=3 and c_role=301 ) order by c_jobnumber "></sql:query> 
	<body>	 		
			<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="13" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						预授权设置
					</div>
				</td>
			</tr> 					 
			<tr>
				<td align="center" width="16%">机构类型</td>
				<td align="center" width="16%">机构名称</td>
				<td align="center" width="16%">工号</td>
				<td align="center" width="16%">姓名</td>
				<td align="center" width="16%">预授权金额</td>
				<td align="center" width="16%">操作</td> 
			</tr> 
			<c:forEach items="${q1.rows }" var="row">			 
			<sql:query var="q2"  dataSource="${db_mssql}" sql="select * from t_organization where c_no =${row.c_orgid } "></sql:query>
			<sql:query var="q3"  dataSource="${db_mssql}" sql="select * from t_orgtype where c_no =${q2.rows[0].c_orgtypeid } "></sql:query>
			<sql:query var="q4"  dataSource="${db_mssql}" sql="select * from t_grant where c_sys=3 and c_jobnumber ='${row.c_jobnumber }' "></sql:query>
			<tr>
				<td align="center">${q3.rows[0].c_name }</td>
				<td align="center">${q2.rows[0].c_name }</td>
				<td align="center">${row.c_jobnumber }</td>
				<td align="center">${row.c_name }</td>  					
				<html:form  action="/signed" >
				<html:hidden property="jobname" value="grant_add_update"/>
				<nested:nest property="role">	
				<nested:hidden property="c_sys" value="3"></nested:hidden>
				<nested:hidden property="c_jobnumber" value="${row.c_jobnumber }"></nested:hidden>
				<td width="16%"><div align="center">
					<c:if test="${not empty q4.rows[0].c_money }">
						<nested:text property="c_money" value="${q4.rows[0].c_money}" size="8"></nested:text>						
						<nested:hidden property="c_jobnm" value="update"></nested:hidden> 
						<nested:hidden property="c_no" value="${q4.rows[0].c_no }"></nested:hidden> 	
					</c:if>
					<c:if test="${empty q4.rows[0].c_money }">
						<nested:text property="c_money" value="0.0" size="8"></nested:text>		
						<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
						<nested:hidden property="c_no" value="1"></nested:hidden> 	
					</c:if>
				</div></td> 	  
				</nested:nest>
				<td  align="center" width="16%">
				 	 <input type="submit" value=" 确定 "> 
				</html:form>  
			</tr>  
			</c:forEach>				 
			</table>					
	</body> 
</html:html>
