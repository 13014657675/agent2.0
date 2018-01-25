<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">

<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
		<body >		
		<html:form  action="/check" onsubmit="return check_form(this)" enctype="multipart/form-data" >
		<html:hidden property="jobname" value="onimport"/>
		<nested:nest property="check">	   
		<nested:hidden property="c_jobnm" value="import"></nested:hidden>	
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="4" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							考勤记录导入
						</div>
					</td>
				</tr>			
				<tr>
				<td align="right" width="50%">机构名称</td>
				<td> 
				<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization 
					where c_no in (select c_orgid from t_postset where c_jobnumber = '${sessionScope.c_jobnumber }' )"></sql:query>
				<nested:select property="c_orgid" >
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name } </option>
					</c:forEach>
				</nested:select>
				</td>				
				</tr>	
				<tr>
				<td align="right" width="50%">年</td>
				<td> 
				<nested:text property="c_year" value="2012" styleId="req" title="年必须填写" maxlength="4"></nested:text>
				</td>				
				</tr>	
				<tr>
				<td align="right" width="50%">月</td>
				<td> 
				<nested:select property="c_month">
				<c:forEach begin="1" end="12" var="x">
				<html:option value="${x }">${x }</html:option>
				</c:forEach> 
				</nested:select>
				</td>				
				</tr>						 				
				<tr> 
				<td align="right">文件名</td>
				<td align="left"><nested:file property="file" value=""></nested:file> 								
				</td>  
				</tr>	 	 
				<tr> 
				<td align="right"><input type="submit" value=" 确 定 "></td>
				<td align="left">  <input type="reset" value=" 取 消 "></td> 
				</tr>
				</table>		
		 	</nested:nest></html:form> 
		 	<ul>
		 	<li><a href="../../../download/onduty/duty-28.xls" style="color: red">一个月28天模板下载</a></li>
		 	<li><a href="../../../download/onduty/duty-29.xls" style="color: red">一个月29天模板下载</a></li>
		 	<li><a href="../../../download/onduty/duty-30.xls" style="color: red">一个月30天模板下载</a></li>
		 	<li><a href="../../../download/onduty/duty-31.xls" style="color: red">一个月31天模板下载</a></li>
		 	</ul>		 	
			</body>  
</html:html>
