<%@ page language="java" pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	 
</head>		
	<body >		
		<form action="../../../toModule.do?prefix=/oa&page=/shop/goods/query2.jsp" method="post">
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						��Ʒ��ѯ
					</div>
				</td>
			</tr> 		
			<tr>
				<td width="48%"><div align="right">���� </div></td>
				<td width="52%" >
				<div align="left">
					<sql:query var="q1" dataSource="${db_mssql }" sql="select * from t_organization where c_no in 
						( select c_orgid from t_postset where c_jobnumber='${sessionScope.c_jobnumber }' ) "></sql:query>
					<select name="c_orgid" id="c_orgid" onchange="set()">
					<c:forEach items="${q1.rows }" var="row">
					<option value="${row.c_no }">${row.c_name }</option>
					</c:forEach>
					</select>
				</div>
				</td>
			</tr> 	
			<tr>
				<td width="48%"><div align="right">�ⷿ��</div></td>
				<td width="52%" >
				<div align="left">
					<select name="c_libraryid" id="c_libraryid">
						<option value="1">�ʲ�����</option>
						<option value="2">�칫��Ʒ</option>
						<option value="3">��ͨ��֤</option>
					</select> 
				</div>
				</td>
			</tr> 		 
			<tr>
				<td width="48%" align="right"><html:submit value=" ȷ �� "/></td>
				<td width="52%" colspan="2">
					<html:reset  value=" ȡ �� " />
				</td> 
			</tr>		
		</table>	 
		</form> 
	</body> 
</html:html>
