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
				<td height="33" colspan="5" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						��Ʒɾ��
					</div>
				</td>
			</tr>
			<tr>   
			<td width="40%"><div align="center">������</div></td> 
			<td width="40%"><div align="center">��Ʒ��</div></td> 
			<td width="20%"><div align="center">ɾ��</div></td>
			</tr>
			<sql:query var="q1" dataSource="${db_mssql }" sql=" select *  from t_goods 
				where c_orgid=${param.c_orgid } and c_libraryid=${param.c_libraryid } order by c_goodstypeid  "></sql:query>
			<c:forEach items="${q1.rows }" var="row">
			<tr>  
			<sql:query var="q2" dataSource="${db_mssql }" sql=" select *  from t_goodstype 
				where c_no=${row.c_goodstypeid }  "></sql:query>
			<td><div align="center">${q2.rows[0].c_name }</div></td>  		
			<td><div align="center">${row.c_name }</div></td>  		 	
			<td   valign="middle" align="center"> 		
			<html:form  action="/shop" onsubmit="return check_form(this)">
			<html:hidden property="jobname" value="goods"/>
			<nested:nest property="library">	
			<nested:hidden property="c_jobnm" value="del"></nested:hidden> 			 
			<nested:hidden property="c_no" value="${row.c_no }"></nested:hidden>   
			<html:submit value="ɾ ��"/>
			</nested:nest>			 
			</html:form> 
			</td></tr>
			</c:forEach></table>
			</body> 	
</html:html>
