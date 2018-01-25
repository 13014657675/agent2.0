<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:base/>
<head>
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css"> 
</head>
<body>
	<sql:query var="a1" dataSource="${db_mssql }" sql="select * from t_staff where c_orgid=${param.c_orgid } and c_jobnumber='${param.c_jobnumber }'"></sql:query>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" id="dy1"  >
			<tr>
				<td height="33" colspan="10" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						生成工号
					</div>
				</td>
			</tr>			
			<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization where c_no=${param.c_orgid}"></sql:query>
			<sql:query var="q2" dataSource="${db_mssql }" sql="select * from t_orgtype where c_no = ${q1.rows[0].c_orgtypeid }"></sql:query>
				<tr>
				<td width="50%" align="right">所属机构类型</td>
				<td width="50%">${q2.rows[0].c_name}</td>
				</tr>
				<tr>
				<td width="50%" align="right">所属机构名称</td>
				<td width="50%">${q1.rows[0].c_name}</td>
			 	</tr>			
				<tr>
				<td width="25%" align="right">姓名</td>
				<td width="25%">${a1.rows[0].c_name}</td>
				</tr>
				<tr>
				<td width="25%" align="right">工号</td>
				<td width="25%">${a1.rows[0].c_jobnumber}</td>
			 	</tr>
			 	<sql:query var="q3"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14 and c_code=${a1.rows[0].c_certificatetype}"></sql:query>
			 	<tr>
				<td width="25%" align="right">证件类型</td>
				<td width="25%">${q3.rows[0].c_name}</td>
				</tr>
				<tr>
				<td width="25%" align="right">证件号码</td>
				<td width="25%">${a1.rows[0].c_certificate}</td>
			 	</tr>			 
	</table>   
</body> 

