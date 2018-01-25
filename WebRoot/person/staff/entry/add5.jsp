<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head> 
		<body>		 		
		<html:form  action="/staff" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="staff_add"/>
		<nested:nest property="staff">	
		<nested:hidden property="c_no" value="0"></nested:hidden> 
		<nested:hidden property="c_jobnm" value="add"></nested:hidden> 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="2" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							薪酬等级设置
						</div>
					</td>
				</tr>				
				<tr>
				<td width="48%"><div align="right">薪酬等级</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select  property="c_pclass" style="width: 120" >
					<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_pclass order by c_name"></sql:query>					
					<c:forEach items="${q1.rows }" var="row">
					<html:option value="${row.c_no }">${row.c_name }</html:option>
					</c:forEach> 
					</nested:select>
				</div>
				</td>
				</tr>  
				<tr>
				<td width="48%"><div align="right">入司状态</div></td>
				<td width="52%" >
				<div align="left">
					<nested:select  property="c_state" style="width: 120" >					 
					<html:option value="1">见习</html:option> 
					<html:option value="0">正式</html:option>					 					 
					</nested:select>
				</div>
				</td>
				</tr> 				 
			</nested:nest>
			<tr>
				<td colspan="2" align="center"><input type="submit" value=" 确 定 "></td>
				 
			</tr>		
			</table>  
		</html:form>	
</body>			 
</html:html>
