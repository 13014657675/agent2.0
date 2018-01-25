<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%>
<html:html lang="true"> 
<head>
	<html:base/>
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head> 
	<body>
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="6" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						机构考勤项目修改
					</div>
				</td>
			</tr>
			<tr>
			<td width="16%"><div align="center">序号</div></td> 
			<td width="16%"><div align="center">名称</div></td>
			<td width="16%"><div align="center">代码</div></td>
			<td width="16%"><div align="center">扣款类型</div></td> 
			<td width="16%"><div align="center">扣款金额</div></td> 
			<td width="16%"><div align="center">修改</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql=" select * from t_ontype2 where c_orgid=${param.c_orgid } order by c_type"></sql:query>
			<c:forEach items="${q1.rows }" var="row" varStatus="x">
			<sql:query var="q2" dataSource="${db_mssql }" sql=" select * from t_ontype where c_no=${row.c_ontype } "></sql:query>
			<html:form  action="/check" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="ontype2"/>
			<nested:nest property="check">	
			<tr>
			<td><div align="center">${x.index+1}</div></td> 
			<td><div align="center">${q2.rows[0].c_name }</div></td>			
			<td><div align="center">${q2.rows[0].c_code }</div></td>	
			<td><div align="center">
			<nested:select property="c_type" value="${row.c_type }">
			<html:option value="1">一次</html:option>
			<html:option value="2">一天</html:option>
			</nested:select>			 
			</div></td>				 
			<td><div align="center">
			<nested:text property="c_deducted" value="${row.c_deducted }"></nested:text>
			</div></td>	
			<td   valign="middle" align="center"> 					
			<nested:hidden property="c_jobnm" value="update"></nested:hidden> 		  
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<html:submit value="修 改"/>
			</nested:nest>			 
			</html:form> 
			
			</c:forEach></table>
			</body> 
	
</html:html>
