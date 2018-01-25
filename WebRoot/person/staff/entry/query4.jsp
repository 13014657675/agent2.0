<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head> 
		<body>		 				 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="2" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							员工查询
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
			 	<sql:query var="q3"  dataSource="${db_mssql}" sql="select * from t_staff where c_jobnumber='${param.c_jobnumber }'"></sql:query>
				<tr>
				<td width="25%" align="right">姓名</td>
				<td width="25%">${q3.rows[0].c_name}</td>
				</tr>
				<tr>
				<td width="25%" align="right">工号</td>
				<td width="25%">${param.c_jobnumber}</td>
			 	</tr>
			 	<sql:query var="q4"  dataSource="${db_mssql}" sql="select * from t_namecode where c_type=14 and c_code=${q3.rows[0].c_certificatetype}"></sql:query>
			 	<tr>
				<td width="25%" align="right">证件类型</td>
				<td width="25%">${q4.rows[0].c_name}</td>
				</tr>
				<tr>
				<td width="25%" align="right">证件号码</td>
				<td width="25%">${q3.rows[0].c_certificate}</td>
			 	</tr>
			 	<sql:query var="q5"  dataSource="${db_mssql}" sql="select * from t_post 
			 		where c_type=1 and c_no in ( select c_postid from t_postset where c_jobnumber='${param.c_jobnumber}' ) "></sql:query>
			 	<tr>
				<td width="50%" align="right">职位名称</td>
				<td width="50%">
					<c:forEach items="${q5.rows }" var="row">
					${row.c_name}&nbsp;&nbsp;
					</c:forEach>
				</td> 
			 	</tr>
			 	<sql:query var="q6"  dataSource="${db_mssql}" sql="select * from t_post 
			 		where c_type=2 and  c_no in ( select c_postid from t_postset where c_jobnumber='${param.c_jobnumber}' ) "></sql:query>
			 	<tr>
				<td width="50%" align="right">岗位名称</td>
				<td width="50%">
					<c:forEach items="${q6.rows }" var="row">
					${row.c_name}&nbsp;&nbsp;
					</c:forEach>
				</td> 
			 	</tr>
			 	<sql:query var="q7"  dataSource="${db_mssql}" sql="select * from t_payset where c_jobnumber='${param.c_jobnumber}' "></sql:query>
			 	<c:if test="${not empty q7.rows[0]}">
			 	<sql:query var="q8"  dataSource="${db_mssql}" sql="select * from t_pclass where c_no=${q7.rows[0].c_pclass }"></sql:query>
			 	<tr>
				<td width="25%" align="right">薪酬等级名称</td>
				<td width="50%">${q8.rows[0].c_name}</td> 
			 	</tr>
			 	</c:if>			 	
			 	<tr>
				<td width="50%" align="right">入司状态</td>
				<td width="50%">
				<c:choose>
				<c:when test="${q7.rows[0].c_state eq 0}">正式</c:when>
				<c:when test="${q7.rows[0].c_state eq 1}">见习</c:when>
				</c:choose>
				</td> 
			 	</tr>
			</table>   
</body>			 
</html:html>
